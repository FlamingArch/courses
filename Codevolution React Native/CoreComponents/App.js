import { useState } from "react";
import {
  View,
  Text,
  Image,
  ScrollView,
  ImageBackground,
  Button,
  Pressable,
  Modal,
  StatusBar,
  ActivityIndicator,
  Alert,
} from "react-native";
import Greet from "./components/Greet";

const logoImg = require("./assets/adaptive-icon.png");

export default function App() {
  const [isModalVisible, setIsModalVisible] = useState(false);

  return (
    <View style={{ backgroundColor: "plum", flex: 1, padding: 60 }}>
      <StatusBar
        backgroundColor="green" // Android Only
        barStyle="light-content"
      />
      <ScrollView>
        <View
          style={{
            backgroundColor: "lightblue",
            width: 300,
            height: 300,
            padding: 20,
          }}
        />
        <View
          style={{
            backgroundColor: "lightgreen",
            width: 300,
            height: 300,
            padding: 20,
          }}
        />
        <Text style={{ color: "white", margin: 20 }}>Hello, World!</Text>
        <Image source={logoImg} style={{ width: 300, height: 300 }} />
        <Image
          source={{ uri: "https://picsum.photos/300" }}
          style={{ width: 300, height: 300 }}
        />
        {/*
          TAP VS LONG PRESS EVENT ORDERS
          onPressIn => onPressOut -> onPress (TAP)
                    => 500 ms -> onLongPress -> onPressOut (TAP AND HOLD)
        */}
        <Pressable onPress={() => console.log("Image Pressed")}>
          <ImageBackground source={logoImg} style={{ flex: 1 }}>
            <Text>Image Text</Text>
          </ImageBackground>
        </Pressable>
        <Pressable onPress={() => console.log("Text Pressed")}>
          <Text>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam
            etiam erat velit scelerisque. Vitae et leo duis ut diam quam nulla.
            Mattis molestie a iaculis at. Nec feugiat nisl pretium fusce.
            Pulvinar neque laoreet suspendisse interdum consectetur libero id
            faucibus nisl. Suspendisse ultrices gravida dictum fusce ut placerat
            orci. Viverra mauris in aliquam sem fringilla ut morbi tincidunt.
            Arcu risus quis varius quam quisque. Lectus arcu bibendum at varius
            vel pharetra. Sit amet nulla facilisi morbi tempus iaculis urna id
            volutpat. Cras tincidunt lobortis feugiat vivamus at augue eget arcu
            dictum. Felis imperdiet proin fermentum leo vel. Est sit amet
            facilisis magna. Massa placerat duis ultricies lacus. Pulvinar
            pellentesque habitant morbi tristique senectus et. Ultricies integer
            quis auctor elit sed vulputate mi sit amet. Lectus arcu bibendum at
            varius vel pharetra vel. Sed risus pretium quam vulputate dignissim
            suspendisse. Enim eu turpis egestas pretium aenean.
          </Text>
        </Pressable>
        <Button
          title="Sup"
          onPress={() => console.log("Button Pressed")}
          color="midnightblue"
        />
        <Button
          title="Open"
          onPress={() => setIsModalVisible(true)}
          color="green"
        />
        <Modal
          visible={isModalVisible}
          onRequestClose={() => setIsModalVisible(false)}
          animationType="slide"
          presentationStyle="formSheet" // iOS only
        >
          <View style={{ flex: 1, backgroundColor: "lightblue", padding: 60 }}>
            <Text>Modal Content</Text>
            <Button
              title="Close"
              color="red"
              onPress={() => setIsModalVisible(false)}
            />
          </View>
        </Modal>
        <ActivityIndicator />
        <ActivityIndicator size="large" />
        <ActivityIndicator size="large" color="midnightblue" />
        <ActivityIndicator
          size="large"
          color="midnightblue"
          animating={false}
        />
        <Button title="Alert" onPress={() => Alert.alert("Invalid Data!")} />
        <Button
          title="Alert 3"
          onPress={() =>
            Alert.alert("Invalid Data!,", "DOB Incorrect", [
              {
                text: "Cancel",
                onPress: () => console.log("Cancel Pressed"),
              },
              {
                text: "OK",
                onPress: () => console.log("OK Pressed"),
              },
            ])
          }
        />
        <Greet name="Bruce Wayne" />
        <Greet name="Clark Kent" />
      </ScrollView>
    </View>
  );
}

