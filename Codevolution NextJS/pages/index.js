import Link from "next/link";
import { useRouter } from "next/router";

function Home() {
  const router = useRouter();

  const handleClick = (e) => {
    console.log("Placing your order.");
    // router.push("/product");
    router.replace("/product");
  };

  return (
    <div>
      <h1>Home Page</h1>
      <Link href="/blog">Blog</Link>
      <Link href="/product">Product</Link>
      <button onClick={handleClick}>Place Order</button>
    </div>
  );
}

export default Home;
