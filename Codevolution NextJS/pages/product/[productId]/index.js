import { useRouter } from "next/router";

export default function () {
  const router = useRouter();
  const { productId } = router.query;

  return <h1>Details about Product {productId}</h1>;
}
