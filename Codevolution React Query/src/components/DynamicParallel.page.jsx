import { useQueries } from "@tanstack/react-query";
import axios from "axios";

const fetchSuperHero = (heroId) => {
  return axios.get(`http://localhost:4000/superheroes/${heroId}`);
};

export const DynamicParallelPage = ({ heroIds }) => {
  const queryResults = useQueries({
    queries: heroIds.map((id) => {
      return {
        queryKey: ["super-hero", id],
        queryFn: () => fetchSuperHero(id),
      };
    }),
  });

  console.log(queryResults);

  return (
    <div style={{ padding: "0 1rem" }}>
      <h2>Dynamic Parallel</h2>
      {queryResults.map((result) => {
        return (
          <div>
            {result?.data?.data.id}. {result?.data?.data.name}
          </div>
        );
      })}
    </div>
  );
};
