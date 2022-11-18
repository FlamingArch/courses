export default function UserList({ user }) {
  return (
    <>
      <div>{user.name}</div>
      <div>{user.email}</div>
    </>
  );
}
