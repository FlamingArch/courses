import { useQuery } from "@tanstack/react-query";
import axios from "axios";
import React from "react";

const fetchSuperHeroes = () => {
  return axios.get("http://localhost:4000/superheroes");
};

const fetchFriends = () => {
  return axios.get("http://localhost:4000/friends");
};

export const ParallelQueriesPage = () => {
  const {
    data: superHeroes,
    isLoading: isSuperHeroesLoading,
    isError: isSuperHeroesError,
    error: superHeroesError,
  } = useQuery(["super-heroes"], fetchSuperHeroes);
  const {
    data: friends,
    isLoading: isFriendsLoading,
    isError: isFriendsError,
    error: friendsError,
  } = useQuery(["friends"], fetchFriends);

  if (isFriendsLoading || isSuperHeroesLoading) {
    return <h2>Loading...</h2>;
  }

  if (isFriendsError) {
    return <h2>{friendsError.message}</h2>;
  }

  if (isSuperHeroesError) {
    return <h2>{friendsError.message}</h2>;
  }

  return (
    <div style={{ padding: "0px 1rem" }}>
      <h2>Parallel</h2>
      <h3>Super Heroes</h3>
      {superHeroes.data.map((hero) => (
        <p>
          {hero.id}. {hero.name}
        </p>
      ))}
      <h3>Friends</h3>
      {friends.data.map((friend) => (
        <p>
          {friend.id}. {friend.name}
        </p>
      ))}
    </div>
  );
};
