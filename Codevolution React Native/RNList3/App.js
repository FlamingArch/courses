import {
  SafeAreaView,
  SectionList,
  StatusBar,
  StyleSheet,
  Text,
  View,
} from "react-native";
import groupedPokemonList from "./grouped-data.json";

export default function App() {
  return (
    <SafeAreaView style={styles.container}>
      <SectionList
        style={styles.scrollView}
        sections={groupedPokemonList}
        SectionSeparatorComponent={() => <View style={{ height: 16 }} />}
        ItemSeparatorComponent={() => <View style={{ height: 16 }} />}
        renderSectionHeader={({ section }) => (
          <Text style={styles.sectionHeaderText}>{section.type}</Text>
        )}
        renderItem={(data) => {
          return (
            <View style={styles.card}>
              <Text style={styles.cardText}>{data.item}</Text>
            </View>
          );
        }}
      />
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
  sectionHeaderText: {},
});
