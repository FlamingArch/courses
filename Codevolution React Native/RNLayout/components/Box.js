import { View, Text, StyleSheet } from "react-native";

export default function Box({ children, style }) {
  return (
    <View style={[styles.box, style]}>
      <Text style={styles.text}>{children}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  box: {
    backgroundColor: "red",
    padding: 20,
  },
  text: {
    fontSize: 20,
    fontWeight: "bold",
    textAlign: "center",
    color: "white",
  },
});
