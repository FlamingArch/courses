// import { useQuery } from "@tanstack/react-query";
// import axios from "axios";
import {
  useAddSuperHeroData,
  useSuperHeroesData,
} from "../hooks/useSuperHeroesData";
import { Link } from "react-router-dom";
import { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faCancel,
  faClose,
  faPlus,
  faRefresh,
} from "@fortawesome/free-solid-svg-icons";

// const fetchSuperHeroes = () => {
//   return axios.get("http://localhost:4000/superheroes");
// };

export const RQSuperHeroesPage = () => {
  const [name, setName] = useState("");
  const [alterEgo, setAlterEgo] = useState("");
  const [dialogVisible, setDialogVisible] = useState(false);

  const onSuccess = (data) => {
    console.log("Perform side effect after data fetching", data);
  };

  const onError = (error) => {
    console.log("Perform side effect after encountering error", error);
  };

  // const { data, isLoading, isError, error, isFetching, refetch } = useQuery(
  //   ["super-heroes"],
  //   fetchSuperHeroes,
  //   {
  //     // cacheTime: 5000, // Amount to wait before invalidating cache (default: 5min)
  //     // staleTime: 30000, // Amount to wait before fetching new data (default: 0)
  //     // refetchOnMount: "always", // true, false or "always" (irrespective of query data being stale)
  //     // refetchOnWindowFocus: true, // true, false or "always" (irrespective of query data being stale)
  //     // refetchInterval: 1000, // Automatically fetch new data duration (default: 0)
  //     // refetchIntervalInBackground: false,
  //     // enabled: false, // Disable fetching of data on mount
  //     onSuccess,
  //     onError,
  //     select: (data) => {
  //       const superHeroNames = data.data.map((hero) => hero.name);
  //       return superHeroNames;
  //     },
  //   }
  // );
  const { data, isLoading, isError, error, isFetching, refetch } =
    useSuperHeroesData(onSuccess, onError);

  const { mutate: addHero } = useAddSuperHeroData();

  const handleAddSuperHeroClick = () => {
    console.log({ name, alterEgo });
    const hero = { name, alterEgo };
    addHero(hero);
    setDialogVisible(false);
    setName("");
    setAlterEgo("");
  };

  console.log({ isLoading, isFetching });

  if (isLoading || isFetching) {
    return (
      <>
        <h2>Loading...</h2>
        <button onClick={refetch}>Fetch Heroes</button>
      </>
    );
  }

  if (isError) {
    return <h2>{error.message}</h2>;
  }

  return (
    <div
      style={{
        padding: "0px 1rem",
      }}
    >
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          margin: 0,
        }}
      >
        <h2>Super Heroes Page</h2>
        <div style={{ display: "flex" }}>
          <button onClick={refetch}>
            <FontAwesomeIcon icon={faRefresh} />
            <div className="hidden-mobile">Fetch Heroes</div>
          </button>
          <button
            onClick={() => {
              setDialogVisible(true);
            }}
            style={{ background: "#646cff", marginLeft: "1rem" }}
          >
            <FontAwesomeIcon icon={faPlus} />{" "}
            <span className="hidden-mobile">New Hero</span>
          </button>
        </div>
      </div>
      {dialogVisible && (
        <div className="dialog">
          <div style={{ display: "flex", justifyContent: "space-between" }}>
            <button
              style={{ color: "red", background: "transparent" }}
              onClick={() => setDialogVisible(false)}
            >
              <FontAwesomeIcon icon={faClose} />
            </button>
            <button
              onClick={handleAddSuperHeroClick}
              style={{ color: "#646cff", background: "transparent" }}
            >
              <FontAwesomeIcon icon={faPlus} /> Add Hero
            </button>
          </div>
          <h2>Add New Hero</h2>
          <input
            type="text"
            placeholder="Name"
            value={name}
            onChange={(e) => {
              setName(e.target.value);
            }}
          />
          <input
            type="text"
            placeholder="Alter Ego"
            value={alterEgo}
            onChange={(e) => {
              setAlterEgo(e.target.value);
            }}
          />
        </div>
      )}
      <div
        style={{
          display: "flex",
          flexDirection: "column",
        }}
      >
        {data?.data.map((hero) => {
          return (
            <div key={hero.name}>
              <Link to={`/rq-super-heroes/${hero.id}`}>{hero.name}</Link>
            </div>
          );
        })}
      </div>
      {/* {data.map((heroName) => {
        return <div key={heroName}>{heroName}</div>;
      })} */}
    </div>
  );
};

// If data is cached, the query will fetch and compare the new data with the cached data and trigger re render only if the data has changed.
// Cache Time invalidates the data after certain time, so that a re render is triggered even if data is not changed.
// Stale time refers to the time new data is not fetched. It is useful if the user can wait for a few seconds to get the latest data. 0 by default, if set to, say 5s, no fetch requests will be made for 5 seconds after the first fetch request is made.
