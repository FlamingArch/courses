import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { request } from "../utils/axios-utls";

const fetchSuperHeroes = () => {
  return request({ url: "/superheroes" });
};

const addSuperHero = (hero) => {
  return request({ url: "/superheroes", method: "POST", data: hero });
};

export const useSuperHeroesData = (onSuccess, onError) => {
  return useQuery(["super-heroes"], fetchSuperHeroes, {
    onSuccess,
    onError,
    // select: (data) => {
    //   const superHeroNames = data.data.map((hero) => hero.name);
    //   return superHeroNames;
    // },
  });
};

export const useAddSuperHeroData = () => {
  const queryClient = useQueryClient();
  return useMutation(addSuperHero, {
    // onSuccess: (data) => {
    //   // queryClient.invalidateQueries("super-heroes");
    //   queryClient.setQueryData(["super-heroes"], (oldQueryData) => {
    //     return {
    //       ...oldQueryData,
    //       data: [...oldQueryData.data, data.data],
    //     };
    //   });
    // },
    // Optimistic updates:
    onMutate: async (newHero) => {
      await queryClient.cancelQueries(["super-heroes"]);
      const previousHeroes = queryClient.getQueryData(["super-heroes"]);
      queryClient.setQueryData(["super-heroes"], (oldQueryData) => {
        return {
          ...oldQueryData,
          data: [
            ...oldQueryData.data,
            { id: oldQueryData.data.length + 1, ...newHero },
          ],
        };
      });
      return { previousHeroes };
    },
    onError: (_error, _hero, context) => {
      queryClient.setQueryData(["super-heroes"], context.previousHeroes);
    },
    onSettled: () => {
      queryClient.invalidateQueries(["super-heroes"]);
    },
  });
};

// onMutate is called before the mutation function is fired, and receives the same function the mutation function receives
