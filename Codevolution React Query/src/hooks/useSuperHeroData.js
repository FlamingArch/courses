import { useQuery } from "@tanstack/react-query";
import axios from "axios";

const fetchSuperHero = ({ queryKey }) => {
  return axios.get(`http://localhost:4000/superheroes/${queryKey[1]}`);
};

export const useSuperHeroData = (heroId) => {
  return useQuery(["super-hero", heroId], fetchSuperHero);
};
