import { Pressable, StyleSheet, Text, View } from "react-native";
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
      <Link href={"/profile/vishwas"}>Profile - Vishwas</Link>
      <Link href={"/products"}>Products</Link>
      <Link href={"/login"}>Login</Link>
      <Link href={"/missing-route"}>Missing Route</Link>

      <Link href={"/products/best-sellers/playstation"} asChild>
        <Pressable style={styles.button}>
          <Text style={styles.text}>PlayStation</Text>
        </Pressable>
      </Link>
    </View>
  );
}

const styles = StyleSheet.create({
  button: {
    backgroundColor: "#0ea5e9",
    padding: 12,
    borderRadius: 6,
  },
  text: {
    color: "#fff",
    fontSize: 16,
    fontWeight: "bold",
  },
});
