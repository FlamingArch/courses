import { router, Stack } from "expo-router";
import { Pressable, Text, Image } from "react-native";

function LogoTitle() {
  return (
    <Image
      style={{ width: 30, height: 30 }}
      source={{ uri: "https://reactnative.dev/img/tiny_logo.png" }}
    />
  );
}

export default function RootLayout() {
  return (
    <Stack
      screenOptions={{
        headerStyle: {
          backgroundColor: "#6A51AE",
          // backgroundColor: "#3F4882",
        },
        headerTintColor: "#FFF",
        headerTitleStyle: {
          fontWeight: "bold",
        },
        // headerLeft: () => (
        //   <Pressable
        //     style={{
        //       backgroundColor: "#3f488244",
        //       borderRadius: 6,
        //       padding: 8,
        //     }}
        //     onPress={() => router.back()}
        //   >
        //     <Text style={{ color: "#fff", fontSize: 16 }}>Back</Text>
        //   </Pressable>
        // ),
        headerRight: () => (
          <Pressable onPress={() => alert("Menu button pressed!")}>
            <Text style={{ color: "#fff", fontSize: 16 }}>Menu</Text>
          </Pressable>
        ),
        headerTitle: (props) => <LogoTitle />,
        headerShadowVisible: false,
      }}
    >
      <Stack.Screen
        name="index"
        options={{ title: "Home", headerLeft: () => null }}
      />
      <Stack.Screen name="about" options={{ title: "About" }} />
    </Stack>
  );
}
