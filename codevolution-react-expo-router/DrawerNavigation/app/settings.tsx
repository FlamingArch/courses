import { StyleSheet, Text, View } from "react-native";
import React from "react";

export default function Settings() {
  return (
    <View style={styles.container}>
      <Text>Settings Page</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
});
