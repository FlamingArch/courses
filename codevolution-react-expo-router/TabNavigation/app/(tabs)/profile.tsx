import { StyleSheet, Text, View } from "react-native";
import React from "react";

export default function Profile() {
  return (
    <View style={styles.container}>
      <Text>Create your own recipes</Text>
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
