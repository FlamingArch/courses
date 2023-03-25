import { useQuery } from "@tanstack/react-query";
import axios from "axios";

const fetchUserByEmail = (email) => {
  return axios.get(`http://localhost:4000/users/${email}`);
};

const fetchCourses = (channelId) => {
  return axios.get(`http://localhost:4000/channels/${channelId}`);
};

export const DependentQueriesPage = ({ email }) => {
  const { data: user } = useQuery(["user", email], () =>
    fetchUserByEmail(email)
  );
  const channelId = user?.data.channelId;

  const { data: channel } = useQuery(
    ["courses", channelId],
    () => fetchCourses(channelId),
    {
      enabled: !!channelId,
    }
  );

  return (
    <div style={{ padding: "0 1rem" }}>
      <h2>Dependent Queries</h2>
      <h3>Details</h3>
      <p>
        <span style={{ fontWeight: "bold" }}>{user?.data?.channelId}</span> -{" "}
        <span style={{ fontStyle: "italic" }}>{user?.data?.id}</span>
      </p>
      <h3>Courses</h3>
      {channel?.data?.courses.map((course) => (
        <div>
          🔥 <a href="/">{course}</a>
        </div>
      ))}
    </div>
  );
};
