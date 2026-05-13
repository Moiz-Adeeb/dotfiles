import { View, Text, TextInput, Pressable } from "react-native";
import { useState } from "react";
import { saveToken } from "../services/auth-storage";

export default function SignupScreen({ navigation, setIsLoggedIn }: any) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleSignup = async () => {
    try {
      // TODO: call real signup API and get token
      await saveToken("dummy-token");
      setIsLoggedIn(true);
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <View className="flex-1 justify-center px-6 bg-white">
      <Text className="text-3xl font-bold mb-6">Sign Up</Text>

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

      <Pressable onPress={handleSignup} className="bg-green-500 p-4 rounded-lg">
        <Text className="text-white text-center font-semibold">Sign Up</Text>
      </Pressable>

      <Pressable onPress={() => navigation.navigate("Login")}>
        <Text className="text-center mt-4 text-blue-500">Already have an account?</Text>
      </Pressable>
    </View>
  );
}