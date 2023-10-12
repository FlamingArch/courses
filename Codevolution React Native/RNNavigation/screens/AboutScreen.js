import React, { Component, useLayoutEffect } from "react";
import { Text, StyleSheet, View, Button } from "react-native";

export default function AboutScreen({ navigation, route }) {
  const { name } = route.params;

  useLayoutEffect(() => {
    navigation.setOptions({
      title: "About " + name,
    });
  }, [navigation, name]);

  return (
    <View style={styles.container}>
      <Text style={styles.text}> About {name} </Text>
      <Button
        title="Go back to Home"
        onPress={() => navigation.navigate("Home")}
      />
      <Button
        title="Update the name"
        onPress={() => navigation.setParams({ name: "React Native" })}
      />
      <Button
        title="Go Back with Data"
        onPress={() =>
          navigation.navigate("Home", { result: "Data from about" })
        }
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
  },
  text: {
    fontSize: 24,
    fontWeight: "bold",
    marginBottom: 16,
  },
});
