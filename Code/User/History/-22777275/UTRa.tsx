import { View, Text, TextInput, Pressable } from "react-native";
import { useState } from "react";

export default function LoginScreen({ navigation }: any) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = () => {
    // call API here
    console.log(email, password);
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
        <Text className="text-center mt-4 text-blue-500">
          Create an account
        </Text>
      </Pressable>
    </View>
  );
}