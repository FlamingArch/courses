import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { Slot } from "expo-router";

export default function ProductsLayout() {
  return (
    <View style={styles.container}>
      <Slot />
      <View style={styles.discountedProducts}>
        <Text>Discounted Products</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  discountedProducts: {
    backgroundColor: "orange",
    padding: 20,
    width: "100%",
  },
});
