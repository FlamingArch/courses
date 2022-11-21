import { useNavigate } from "react-router-dom";

export default function OrderSummary() {
  const navigate = useNavigate();
  return (
    <>
      <button onClick={() => navigate(-1)}>Go Back</button>
      <div>Order Confirmed</div>
    </>
  );
}
