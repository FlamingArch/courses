import * as React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import HomeScreen from "./screens/HomeScreen";
import AboutScreen from "./screens/AboutScreen";
import { Pressable, Text } from "react-native";

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        initialRouteName="Home"
        screenOptions={{
          headerStyle: {
            backgroundColor: "#08f",
          },
          headerTintColor: "#FFF",
          contentStyle: {
            backgroundColor: "#fef",
          },
        }}
      >
        <Stack.Screen
          options={{
            headerLargeTitle: true,
            title: "Welcome Home",
            headerStyle: {
              backgroundColor: "red",
            },
            headerTintColor: "#FFF",
            headerTitleStyle: {
              fontWeight: "bold",
            },
            contentStyle: {
              backgroundColor: "#fee",
            },
            headerRight: () => (
              <Pressable onPress={() => alert("Button Pressed")}>
                <Text style={{ color: "#FFF" }}>Menu</Text>
              </Pressable>
            ),
          }}
          name="Home"
          component={HomeScreen}
        />
        <Stack.Screen
          name="About"
          component={AboutScreen}
          initialParams={{ name: "Guest" }}
          options={({ route }) => ({
            title: "About " + route.params?.name,
          })}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
