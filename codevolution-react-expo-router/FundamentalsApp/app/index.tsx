import { Text, View } from "react-native";
import { Link } from "expo-router";

export default function Index() {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        gap: 20,
      }}
    >
      <Text>Home Page</Text>
      <Link href={"/about"}>About</Link>
      <Link href={"/profile"}>Profile</Link>
      <Link href={"/products"}>Products</Link>
    </View>
  );
}
