import Link from "next/link";

export default function ({ productId = 100 }) {
  return (
    <>
      <Link href="/">Home</Link>
      <Link href="/product/1">
        <h2>Product 1</h2>
      </Link>
      <Link href="/product/2">
        <h2>Product 2</h2>
      </Link>
      <Link href="/product/3" replace>
        <h2>Product 3</h2>
      </Link>
      <Link href={`/product/${productId}`}>
        <h2>Product {productId}</h2>
      </Link>
    </>
  );
}
