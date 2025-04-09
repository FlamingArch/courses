import { Button, StyleSheet, Text, View } from "react-native";
import React from "react";
import { Link, router } from "expo-router";

export default function Login() {
  return (
    <View style={styles.container}>
      <Text>Login</Text>
      <Button title="Back" onPress={() => router.back()} />
      <Link href="./register">Register</Link>
      {/* <Button title="Login" onPress={() => router.push("/profile")} /> */}
      <Button title="Login" onPress={() => router.replace("/profile")} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
});
