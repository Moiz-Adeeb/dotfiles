// import { Stack } from "expo-router";
// import React from "react";
// import { View } from "react-native";
// import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
// import "../global.css";

// export default function RootLayout() {
//     return (
//         <SafeAreaProvider>
//             <View className="flex-1">
//                 <Stack screenOptions={ {
//                     headerShown: false,
//                     contentStyle: {
//                         backgroundColor: 'rgba(30, 27, 75, 0.5)'
//                     }
//                 } }>
//                     <Stack.Screen name="index" options={ { headerShown: false } } />
//                     <Stack.Screen name="pages/login/login-page" options={ { title: 'Login' } } />
//                     <Stack.Screen name="pages/sign-up/sign-up-page" options={ { title: 'SignUp' } } />
//                 </Stack>
//             </View>
//         </SafeAreaProvider>
//     );
// }

import { Stack } from "expo-router";
import { SafeAreaProvider } from "react-native-safe-area-context";
import "../global.css";

export default function RootLayout() {
  return (
    <SafeAreaProvider>
      <Stack
        screenOptions={{
          headerShown: false,
          contentStyle: {
            backgroundColor: "rgba(30, 27, 75, 0.5)",
          },
        }}
      />
    </SafeAreaProvider>
  );
}