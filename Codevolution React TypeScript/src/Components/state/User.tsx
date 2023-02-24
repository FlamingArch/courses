import { useState } from "react";

type AuthUser = {
  name: string;
  email: string;
};

export const LoggedIn = () => {
  const [user, setUser] = useState<null | AuthUser>(null);
  // const [user, setUser] = useState<AuthUser>({} as AuthUser); // Type Assertion

  const handleLogin = () => {
    setUser({ name: "Harsh", email: "vishwas@example.com" });
  };
  const handleLogout = () => {
    setUser(null);
  };
  return (
    <div>
      <button onClick={handleLogin}>Login</button>
      <button onClick={handleLogout}>Logout</button>
      <div>User name is {user?.name}</div>
      <div>User email is {user?.email}</div>
      {/* <div>User name is {User.name}</div>
      <div>User email is {user.email}</div> */}
      {/* Type Assertion removes need for optional chaining */}
    </div>
  );
};
