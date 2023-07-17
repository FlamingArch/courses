import { View, Text } from "react-native";

export default function App() {
  return (
    <View style={{ backgroundColor: "plum", flex: 1 }}>
      <View
        style={{
          backgroundColor: "lightblue",
          width: 200,
          height: 200,
          padding: 20,
        }}
      />
      <View
        style={{
          backgroundColor: "lightgreen",
          width: 200,
          height: 200,
          padding: 20,
        }}
      />
      <Text style={{ color: "white", margin: 20 }}>Hello, World!</Text>
    </View>
  );
}
