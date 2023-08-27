import { StyleSheet, View } from "react-native";
import Box from "./components/Box";

export default function App() {
  return (
    // <View style={{ backgroundColor: "plum", flex: 1 }}></View>
    <View style={styles.container}>
      <Box style={{ backgroundColor: "#8e9b00" }}>Box 1</Box>
      <Box style={{ backgroundColor: "#b65d1f" }}>Box 2</Box>
      <Box style={{ backgroundColor: "#1c4c56" }}>Box 3</Box>
      <Box style={{ backgroundColor: "#ab9156" }}>Box 4</Box>
      <Box style={{ backgroundColor: "#6b0803" }}>Box 5</Box>
      <Box style={{ backgroundColor: "#1c4c56" }}>Box 6</Box>
      <Box style={{ backgroundColor: "#b95f21" }}>Box 7 </Box>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    // flexDirection: "row",
    // justifyContent: "space-evenly",
    // alignItems: "flex-start",
    // flexWrap: "wrap",
    // alignContent: "space-around",
    // rowGap: 20,
    // columnGap: 40,
    // gap: 40,
    // height: 300,
    // width: 300,
    flex: 1,
    marginTop: 64,
    borderWidth: 6,
    borderColor: "red",
  },
});

/*flex: 1; alignSelf: "center"*/
/*flex: 3; alignSelf: "stretch"*/

// flexBasis: 140, flex: 1
// height: 140

// flexShrink: 1
// flexShrink: 2
// flexGrow: 1
// flexGrow: 3

// top: 75, left: 75
// top: 95,
// left: 95,
// position: "absolute",
