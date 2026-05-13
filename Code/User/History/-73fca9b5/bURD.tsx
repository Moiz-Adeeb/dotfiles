import { View, Text } from "react-native";

export default function HomeScreen({ navigation }: any) {
  return (
    <View className="flex-1 items-center justify-center bg-white">
      <Text className="text-xl font-bold">Home Screen</Text>
    </View>
  );
}