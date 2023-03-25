import { useState } from "react";
import { QueryClientProvider, QueryClient } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import "./App.css";
import { Link, Routes, Route, BrowserRouter as Router } from "react-router-dom";
import { SuperheroesPage } from "./components/Superheroes.page";
import { RQSuperHeroesPage } from "./components/RQSuperHeroes.page";
import { HomePage } from "./components/Home.page";
import { RQSuperHeroPage } from "./components/RQSuperHero.page";
import { ParallelQueriesPage } from "./components/ParallelQueries.page";
import { DynamicParallelPage } from "./components/DynamicParallel.page";
import { DependentQueriesPage } from "./components/DependentQueries.page";
import { PaginatedQueriesPage } from "./components/PaginatedQueries.page";
import { InfiniteQueryPage } from "./components/InfiniteQuery.page";

const queryClient = new QueryClient();

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <Router>
        <header>
          <h2>React Query</h2>
          <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/super-heroes">Traditional</Link>
              </li>
              <li>
                <Link to="/rq-super-heroes">Query</Link>
              </li>
              <li>
                <Link to="/rq-parallel">Parallel</Link>
              </li>
              <li>
                <Link to="/rq-dynamic-parallel">Dynamic</Link>
              </li>
              <li>
                <Link to="/rq-dependent">Dependent</Link>
              </li>
              <li>
                <Link to="/rq-paginated">Paginated</Link>
              </li>
              <li>
                <Link to="/rq-infinite">Infinite</Link>
              </li>
            </ul>
          </nav>
        </header>
        <Routes>
          <Route
            path="/rq-dynamic-parallel"
            element={<DynamicParallelPage heroIds={[1, 3]} />}
          />
          <Route
            path="/rq-dependent"
            element={<DependentQueriesPage email="vishwas@example.com" />}
          />
          <Route path="/rq-parallel" element={<ParallelQueriesPage />} />
          <Route path="/rq-paginated" element={<PaginatedQueriesPage />} />
          <Route path="/rq-infinite" element={<InfiniteQueryPage />} />
          <Route
            path="/rq-super-heroes/:heroId"
            element={<RQSuperHeroPage />}
          />
          <Route path="/" element={<HomePage />} />
          <Route path="/super-heroes" element={<SuperheroesPage />} />
          <Route path="/rq-super-heroes" element={<RQSuperHeroesPage />} />
        </Routes>
      </Router>
      <ReactQueryDevtools initialIsOpen={false} position="bottom-right" />
    </QueryClientProvider>
  );
}

export default App;
