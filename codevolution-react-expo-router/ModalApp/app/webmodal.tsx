import { Pressable, StyleSheet, Text } from "react-native";
import React from "react";
import Animated, {
  FadeIn,
  SlideInDown,
  SlideInUp,
} from "react-native-reanimated";
import { Link } from "expo-router";

export default function Modal() {
  return (
    <Animated.View
      entering={FadeIn}
      style={{
        flex: 1,
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#00000040",
      }}
    >
      <Link dismissTo href={"/"} asChild>
        <Pressable style={StyleSheet.absoluteFill} />
      </Link>
      <Animated.View
        entering={SlideInDown}
        style={{
          width: "90%",
          height: "80%",
          alignItems: "center",
          justifyContent: "center",
          backgroundColor: "white",
        }}
      >
        <Text style={{ fontWeight: "bold", marginBottom: 10 }}>
          Modal Screen
        </Text>
        <Link dismissTo href={"/"}>
          <Text>Go Back</Text>
        </Link>
      </Animated.View>
    </Animated.View>
  );
}

const styles = StyleSheet.create({});
