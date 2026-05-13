import { createNativeStackNavigator } from "@react-navigation/native-stack";
import LoginScreen from "../screens/LoginScreen";
import SignupScreen from "../screens/SignupScreen";

const Stack = createNativeStackNavigator();

export default function AuthNavigator({ setIsLoggedIn }: { setIsLoggedIn: (isLoggedIn: boolean) => void }) {
  return (
    <Stack.Navigator>
      <Stack.Screen name="Login">
        {props => <LoginScreen {...props} setIsLoggedIn={setIsLoggedIn} />}
      </Stack.Screen>
      <Stack.Screen name="Signup">
        {props => <SignupScreen {...props} setIsLoggedIn={setIsLoggedIn} />}
      </Stack.Screen>
    </Stack.Navigator>
  );
}