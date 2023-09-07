import {
  FlatList,
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from "react-native";
import pokemonList from "./data.json";

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      {/* <ScrollView style={styles.scrollView}>
        {pokemonList.map((pokemon) => {
          console.log(pokemon.id);
          return (
            <View id={pokemon.id} style={styles.card}>
              <Text style={styles.cardText}>{pokemon.type}</Text>
              <Text style={styles.cardText}>{pokemon.name}</Text>
            </View>
          );
        })}
      </ScrollView> */}
      {/* SLOW AF */}
      <FlatList //Lazy loading
        style={styles.scrollView}
        data={pokemonList}
        horizontal={false}
        ItemSeparatorComponent={<View style={{ height: 16 }} />}
        keyExtractor={(item, index) => item.id.toString()}
        ListEmptyComponent={<Text>No Component Found</Text>}
        ListHeaderComponent={
          <Text style={styles.headerText}>Pokemon List</Text>
        }
        ListFooterComponent={<Text style={styles.footerText}>End of List</Text>}
        renderItem={({ item }) => {
          console.log(item.id);
          return (
            <View id={item.id} style={styles.card}>
              <Text style={styles.cardText}>{item.type}</Text>
              <Text style={styles.cardText}>{item.name}</Text>
            </View>
          );
        }}
      />
      {/* LAZY LOADING */}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#f5f5f5",
    paddingTop: StatusBar.currentHeight,
  },
  scrollView: { paddingHorizontal: 16 },
  card: {
    backgroundColor: "#fff",
    padding: 16,
    borderRadius: 8,
    borderWidth: 1,
    // marginBottom: 10,
  },
  cardText: { fontSize: 30 },
  headerText: { fontSize: 24, textAlign: "center", marginBottom: 12 },
  footerText: { fontSize: 24, textAlign: "center", marginTop: 12 },
});
