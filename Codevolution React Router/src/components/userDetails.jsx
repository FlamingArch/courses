import { useParams } from "react-router-dom";

export default function UserDetails() {
  const params = useParams();
  const userId = params.userId;
  return <div>Details about User {userId}</div>;
}
