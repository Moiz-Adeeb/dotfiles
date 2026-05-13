import { NavigationContainer } from "@react-navigation/native";
import { useState } from "react";
import AuthNavigator from "./AuthNavigator";
import HomeScreen from "../screens/HomeScreen";

export default function AppNavigator() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  return (
    <NavigationContainer>
      {isLoggedIn ? (
        <HomeScreen />
      ) : (
        <AuthNavigator setIsLoggedIn={setIsLoggedIn} />
      )}
    </NavigationContainer>
  );
}