import { useState } from "react";
import {
  StatusBar,
  StyleSheet,
  Text,
  SafeAreaView,
  TextInput,
  Switch,
  View,
} from "react-native";

export default function App() {
  const [name, setName] = useState("");
  const [isDarkMode, setIsDarkMode] = useState(false);

  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.text}>My name is {name}</Text>
      <TextInput
        style={styles.input}
        value={name}
        onChangeText={setName}
        placeholder="Name"
        secureTextEntry={false} // For Passwords
        keyboardType="default"
        autoCorrect={false} // For usernames, etc
        autoCapitalize="none" // For usernames, etc
      />
      <TextInput
        style={[styles.input, styles.multilineText]}
        placeholder="Password"
        multiline
      />
      <View style={styles.switchContainer}>
        <Text style={styles.text}>Dark Mode</Text>
        <Switch
          value={isDarkMode}
          onValueChange={() => setIsDarkMode((prev) => !prev)}
          trackColor={{ false: "#767577", true: "lightblue" }}
          thumbColor="#f4f3f4"
        />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    paddingTop: StatusBar.currentHeight,
  },
  input: {
    height: 40,
    margin: 12,
    padding: 10,
    borderWidth: 1,
    borderRadius: 12,
    borderColor: "#ccc",
  },
  text: {
    fontSize: 17,
    padding: 10,
  },
  multilineText: {
    minHeight: 100,
    textAlignVertical: "top", // For Android, as multiline text is not vertically aligned by default, and instead starts from the centre
  },
  switchContainer: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingHorizontal: 10,
  },
});
