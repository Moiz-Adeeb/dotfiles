import { View, Text, TextInput, Pressable } from "react-native";
import { useState } from "react";
import { saveToken } from "../services/auth-storage";
//import { login } from "../api/api"; // uncomment when API is ready

export default function LoginScreen({ navigation, setIsLoggedIn }: any) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = async () => {
    try {
      // TODO: replace with real API call
      // const data = await login(email, password);
      // if (data?.token) {
      //   await saveToken(data.token);
      //   setIsLoggedIn(true);
      // }

      // Temporary local flow:
      await saveToken("dummy-token");
      setIsLoggedIn(true);
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <View className="flex-1 justify-center px-6 bg-white">
      <Text className="text-3xl font-bold mb-6">Login</Text>

      <TextInput
        placeholder="Email"
        className="border p-3 mb-4 rounded-lg"
        value={email}
        onChangeText={setEmail}
      />

      <TextInput
        placeholder="Password"
        secureTextEntry
        className="border p-3 mb-6 rounded-lg"
        value={password}
        onChangeText={setPassword}
      />

      <Pressable onPress={handleLogin} className="bg-blue-500 p-4 rounded-lg">
        <Text className="text-white text-center font-semibold">Login</Text>
      </Pressable>

      <Pressable onPress={() => navigation.navigate("Signup")}>
        <Text className="text-center mt-4 text-blue-500">Create an account</Text>
      </Pressable>
    </View>
  );
}