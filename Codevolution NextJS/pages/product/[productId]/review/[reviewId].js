import { useRouter } from "next/router";

export default function () {
  const router = useRouter();
  const { productId, reviewId } = router.query;

  return (
    <h1>
      Review {reviewId} about Product {productId}
    </h1>
  );
}
