import { useState } from "react";
import { View } from "react-native";
import { Text } from "react-native";
import { Image } from "react-native";
import { Button } from "react-native";
import { Platform } from "react-native";
import { TextInput } from "react-native";
import { StyleSheet } from "react-native";
import { KeyboardAvoidingView } from "react-native";

export default function App() {
  const [userName, setUserName] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState({});

  const validateForm = () => {
    let errors = {};

    if (!userName) errors.userName = "Username is required";
    if (!password) errors.password = "Password is required";

    setErrors(errors);

    return Object.keys(errors).length === 0;
  };

  const handleSubmit = () => {
    if (validateForm()) {
      console.log("Submitted", userName, password);
      setUserName("");
      setPassword("");
      setErrors({});
    }
  };

  return (
    <KeyboardAvoidingView
      behavior="padding"
      style={styles.container}
      keyboardVerticalOffset={Platform.OS === "ios" ? 100 : 0}
    >
      <View style={styles.form}>
        <Image
          style={styles.image}
          source={require("./assets/adaptive-icon.png")}
        />
        <Text style={styles.label}>Username</Text>
        <TextInput
          value={userName}
          onChangeText={setUserName}
          style={styles.input}
          placeholder="Enter your Username"
        />
        {errors.userName && (
          <Text style={styles.errorText}>{errors.userName}</Text>
        )}
        <Text style={styles.label}>Password</Text>
        <TextInput
          value={password}
          onChangeText={setPassword}
          style={styles.input}
          placeholder="Enter your Password"
        />
        {errors.password && (
          <Text style={styles.errorText}>{errors.password}</Text>
        )}
        <Button title="Login" onPress={handleSubmit} />
      </View>
    </KeyboardAvoidingView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    paddingHorizontal: 20,
    backgroundColor: "#f5f5f5",
  },
  form: {
    backgroundColor: "white",
    padding: 20,
    borderRadius: 10,
    shadowColor: "black",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 4,
    elevation: 5, // Android
  },
  label: {
    fontSize: 16,
    marginBottom: 5,
    fontWeight: "bold",
  },
  input: {
    height: 40,
    borderBlockColor: " #ddd",
    borderWidth: 1,
    marginBottom: 15,
    padding: 10,
    borderRadius: 5,
  },
  image: {
    width: 200,
    height: 400,
    alignSelf: "center",
    marginBottom: 20,
  },
  errorText: { color: "red", marginBottom: 10 },
});
