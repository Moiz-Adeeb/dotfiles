import { NavigationContainer } from "@react-navigation/native";
import { useState, useEffect } from "react";
import AuthNavigator from "./AuthNavigator";
import HomeScreen from "../screens/HomeScreen";
import { getToken } from "../services/auth-storage";

export default function AppNavigator() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  useEffect(() => {
    (async () => {
      try {
        const token = await getToken();
        if (token) setIsLoggedIn(true);
      } catch (e) {
        console.error("Error checking token", e);
      }
    })();
  }, []);

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