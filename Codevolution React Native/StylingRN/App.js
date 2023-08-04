import { StyleSheet, Text, View } from "react-native";

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.darkMode}>
        <Text style={styles.darkModeText}>
          Styles Inheritance is <Text style={styles.boldText}>not present</Text>{" "}
          in React Native,{" "}
          <Text style={styles.boldText}>except in Text subtrees</Text>
        </Text>
      </View>
      <Text style={styles.title}>Stylesheet API</Text>
      <View style={[styles.box, styles.lightBlueBox]}>
        <Text style={styles.lightBlueBoxText}>Lightblue Box</Text>
      </View>
      <View style={[styles.box, styles.lightGreenBox]}>
        <Text>Lightgreen Box</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: "plum", padding: 60 },
  darkMode: {
    backgroundColor: "black",
  },
  darkModeText: {
    color: "white",
  },
  boldText: {
    fontWeight: "bold",
  },
  title: {},
  box: {
    width: 200,
    height: 200,
    padding: 10,
  },
  lightBlueBox: {
    backgroundColor: "lightblue",
    borderColor: "red",
    borderWidth: 2,
    marginBottom: 20,
    shadowColor: "red",
    shadowOffset: {
      width: 20, // Only iOS, use elevation in Android
      height: 20, // Only iOS, use elevation in Android
    },
    shadowOpacity: 0.2, // Only iOS, use elevation in Android
    shadowRadius: 40, // Only iOS, use elevation in Android
    elevation: 40, // Only for Android, use Shadow in iOS
  },
  lightGreenBox: {
    backgroundColor: "lightgreen",
  },
  lightBlueBoxText: {
    borderRadius: 8, // Only Android for <Text/>
    backgroundColor: "red",
    paddingHorizontal: 6,
    paddingVertical: 4,
    color: "white",
  },
});
