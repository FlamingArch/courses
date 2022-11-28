import { Link, Outlet, useSearchParams } from "react-router-dom";

export default function Users() {
  const [searchParams, setSearchParams] = useSearchParams();
  const showActiveUsers = searchParams.get(`filter`) === `active`;

  return (
    <div>
      <Link to="/users/1">
        <h1>User 1</h1>
      </Link>
      <Link to="/users/2">
        <h1>User 2</h1>
      </Link>
      <Link to="/users/3">
        <h1>User 3</h1>
      </Link>
      <Outlet />
      <button onClick={() => setSearchParams({ filter: `active` })}>
        Active Users
      </button>
      <button onClick={() => setSearchParams({})}>Reset Filter</button>
      {showActiveUsers ? (
        <h2>Showing Active Users</h2>
      ) : (
        <h2>Showing all users</h2>
      )}
    </div>
  );
}
