import { Drawer } from "expo-router/drawer";
import { GestureHandlerRootView } from "react-native-gesture-handler";
import FontAwesome from "@expo/vector-icons/FontAwesome";

export default function RootLayout() {
  return (
    <GestureHandlerRootView style={{ flex: 1 }}>
      <Drawer
        screenOptions={{
          headerStyle: { backgroundColor: "#FFF" },
          headerTintColor: "#8b5cf6",
          drawerStyle: {
            backgroundColor: "#FFF",
            width: 300,
          },
          drawerActiveTintColor: "#8b5cf6",
          drawerInactiveTintColor: "#64748b",
        }}
      >
        <Drawer.Screen
          name="index"
          options={{
            title: "Home Title",
            drawerLabel: "Home Label",
            drawerIcon: ({ color }) => (
              <FontAwesome color={color} size={24} name="home" />
            ),
          }}
        />
        <Drawer.Screen
          name="dashboard"
          options={{
            title: "Dashboard Title",
            drawerLabel: "Dashboard Label",
            drawerIcon: ({ color }) => (
              <FontAwesome color={color} size={24} name="dashboard" />
            ),
          }}
        />
        <Drawer.Screen
          name="settings"
          options={{
            title: "Settings Title",
            drawerLabel: "Settings Label",
            drawerIcon: ({ color }) => (
              <FontAwesome color={color} size={24} name="gear" />
            ),
          }}
        />
      </Drawer>
    </GestureHandlerRootView>
  );
}
