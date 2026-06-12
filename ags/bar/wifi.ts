import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal"
import Gtk from "gi://Gtk?version=3.0"
import GLib from "gi://GLib"
import Gio from "gi://Gio"

const wifiState = Variable({
    text: " OFF",
    statusClass: "off" // Options: "connected" | "disconnected" | "off"
})

const updateWifiState = () => {
    try {
        const command = "bash -c 'iwctl station wlan0 show'"
        const [success, stdout] = GLib.spawn_command_line_sync(command)

        if (!success || !stdout || stdout.length === 0) {
            wifiState.set({ text: " OFF", statusClass: "off" })
            return
        }

        const outputText = new TextDecoder().decode(stdout).trim()

        if (outputText.includes("No station") || !outputText.includes("State")) {
            wifiState.set({ text: " OFF", statusClass: "off" })
            return
        }

        if (outputText.includes("disconnected") || !outputText.includes("Connected network")) {
            wifiState.set({ text: " Disconnected", statusClass: "disconnected" })
            return
        }

        const match = outputText.match(/Connected network\s+(.+)/)
        if (match && match[1]) {
            wifiState.set({ text: ` ${match[1].trim()}`, statusClass: "connected" })
        } else {
            wifiState.set({ text: " Disconnected", statusClass: "disconnected" })
        }
    } catch {
        wifiState.set({ text: " OFF", statusClass: "off" })
    }
}

// Spawns your optimized event-driven background kernel subprocess listeners
const spawnListener = (args: string[]) => {
    try {
        const proc = Gio.Subprocess.new(args, Gio.SubprocessFlags.STDOUT_PIPE)
        const stdoutPipe = proc.get_stdout_pipe()
        const dataStream = new Gio.DataInputStream({ base_stream: stdoutPipe })

        const readLine = () => {
            dataStream.read_line_async(GLib.PRIORITY_DEFAULT, null, (stream, result) => {
                try {
                    const [line] = stream!.read_line_finish(result)
                    if (line !== null) {
                        GLib.timeout_add(GLib.PRIORITY_DEFAULT, 100, () => {
                            updateWifiState()
                            return false
                        })
                        readLine()
                    }
                } catch {
                    updateWifiState()
                }
            })
        }
        readLine()
    } catch {
        updateWifiState()
    }
}

spawnListener(["ip", "monitor", "link"])
spawnListener(["udevadm", "monitor", "--subsystem-match=net", "--subsystem-match=rfkill"])
updateWifiState()

export default function WifiStatus(): Gtk.Widget {
    return new Widget.Button({
        className: "wifi-btn",
        onButtonReleaseEvent: (self, event) => {
            const [success, button] = event.get_button()
            if (!success) return false

            if (button === 1) {
                GLib.spawn_command_line_async("footclient -a float_small -e impala")
                return true
            }

            if (button === 3) {
                GLib.spawn_command_line_async("rfkill toggle wifi")
                const current = wifiState.get().text
                if (current.includes("OFF") || current.includes("Disconnected")) {
                    wifiState.set({ text: " CONNECTING...", statusClass: "disconnected" })
                } else {
                    wifiState.set({ text: " OFF", statusClass: "off" })
                }
                return true
            }
            return false
        },
        child: new Widget.Box({
            // FIXED BINDING: Dynamically sets class combinations like "wifi connected" or "wifi off"
            className: bind(wifiState).as(s => `wifi ${s.statusClass}`),
            child: new Widget.Label({
                label: bind(wifiState).as(s => s.text)
            })
        })
    })
}



// import { Widget } from "astal/gtk3"
// import { Variable, bind } from "astal"
// import Gtk from "gi://Gtk?version=3.0"
// import GLib from "gi://GLib"
// import Gio from "gi://Gio"
//
// const wifiText = Variable("  OFF")
//
// // const updateWifiState = () => {
// //     try {
// //         const command = "bash -c 'iwctl station wlan0 show'"
// //         const [success, stdout] = GLib.spawn_command_line_sync(command)
// //
// //         if (!success || !stdout || stdout.length === 0) {
// //             wifiText.set("  OFF")
// //             return
// //         }
// //
// //         const outputText = new TextDecoder().decode(stdout).trim()
// //
// //         if (outputText.includes("No station") || !outputText.includes("State")) {
// //             wifiText.set("  OFF")
// //             return
// //         }
// //
// //         if (outputText.includes("disconnected") || !outputText.includes("Connected network")) {
// //             wifiText.set("  Disconnected")
// //             return
// //         }
// //
// //         const match = outputText.match(/Connected network\s+(.+)/)
// //         if (match && match[1]) {
// //             wifiText.set(`  ${match[1].trim()}`)
// //         } else {
// //             wifiText.set("  Disconnected")
// //         }
// //     } catch {
// //         wifiText.set("  OFF")
// //     }
// // }
// //
// // const spawnListener = (args: string[]) => {
// //     try {
// //         const proc = Gio.Subprocess.new(args, Gio.SubprocessFlags.STDOUT_PIPE)
// //         const stdoutPipe = proc.get_stdout_pipe()
// //         const dataStream = new Gio.DataInputStream({ base_stream: stdoutPipe })
// //
// //         const readLine = () => {
// //             dataStream.read_line_async(GLib.PRIORITY_DEFAULT, null, (stream, result) => {
// //                 try {
// //                     const [line] = stream!.read_line_finish(result)
// //                     if (line !== null) {
// //                         // Debounce the call slightly to allow kernel states to settle, 
// //                         // preventing redundant command execution loops
// //                         GLib.timeout_add(GLib.PRIORITY_DEFAULT, 100, () => {
// //                             updateWifiState()
// //                             return false
// //                         })
// //                         readLine()
// //                     }
// //                 } catch {
// //                     updateWifiState()
// //                 }
// //             })
// //         }
// //         readLine()
// //     } catch {
// //         updateWifiState()
// //     }
// // }
// //
// // // HIGHLY EFFICIENT FLUSH: 
// // // 1. ip monitor captures wlan0 software connection states
// // spawnListener(["ip", "monitor", "link"])
// // // 2. udevadm ONLY wakes up your bar when the physical hardware interface or rfkill states change
// // spawnListener(["udevadm", "monitor", "--subsystem-match=net", "--subsystem-match=rfkill"])
// //
// // // Initialize on bar startup
// // updateWifiState()
// //
// // export default function WifiStatus(): Gtk.Widget {
// //     return new Widget.Button({
// //         className: "wifi-btn",
// //
// //         onButtonReleaseEvent: (self, event) => {
// //             const [success, button] = event.get_button()
// //             if (!success) return false
// //
// //             if (button === 1) {
// //                 GLib.spawn_command_line_async("footclient -a float_small -e impala")
// //                 return true
// //             }
// //
// //             if (button === 3) {
// //                 GLib.spawn_command_line_async("rfkill toggle wifi")
// //
// //                 // Provide instant layout feedback ahead of the hardware refresh cycle
// //                 const currentText = wifiText.get()
// //                 if (currentText.includes("OFF") || currentText.includes("Disconnected")) {
// //                     wifiText.set("  CONNECTING...")
// //                 } else {
// //                     wifiText.set("  OFF")
// //                 }
// //
// //                 return true
// //             }
// //             return false
// //         },
// //
// //         child: new Widget.Box({
// //             className: "wifi",
// //             child: new Widget.Label({
// //                 label: bind(wifiText)
// //             })
// //         })
// //     })
// // }
//
// // Central state verification logic
// const updateWifiState = () => {
//     try {
//         const command = "bash -c 'iwctl station wlan0 show'"
//         const [success, stdout] = GLib.spawn_command_line_sync(command)
//
//         // If command fails, returns empty, or iwctl cannot see the card, it is powered OFF
//         if (!success || !stdout || stdout.length === 0) {
//             wifiText.set("  OFF")
//             return
//         }
//
//         const outputText = new TextDecoder().decode(stdout).trim()
//
//         if (outputText.includes("No station") || !outputText.includes("State")) {
//             wifiText.set("  OFF")
//             return
//         }
//
//         if (outputText.includes("disconnected") || !outputText.includes("Connected network")) {
//             wifiText.set("  Disconnected")
//             return
//         }
//
//         const match = outputText.match(/Connected network\s+(.+)/)
//         // FIXED CRITICAL CHECK: Safely extract the first capture group string index
//         if (match && match[1]) {
//             wifiText.set(`  ${match[1].trim()}`)
//         } else {
//             wifiText.set("  Disconnected")
//         }
//     } catch {
//         wifiText.set("  OFF")
//     }
// }
//
// const spawnListener = (args: string[]) => {
//     try {
//         const proc = Gio.Subprocess.new(args, Gio.SubprocessFlags.STDOUT_PIPE)
//         const stdoutPipe = proc.get_stdout_pipe()
//         const dataStream = new Gio.DataInputStream({ base_stream: stdoutPipe })
//
//         const readLine = () => {
//             dataStream.read_line_async(GLib.PRIORITY_DEFAULT, null, (stream, result) => {
//                 try {
//                     const [line] = stream!.read_line_finish(result)
//                     if (line !== null) {
//                         // Debounce the call slightly to allow kernel states to settle, 
//                         // preventing redundant command execution loops
//                         GLib.timeout_add(GLib.PRIORITY_DEFAULT, 100, () => {
//                             updateWifiState()
//                             return false
//                         })
//                         readLine()
//                     }
//                 } catch {
//                     updateWifiState()
//                 }
//             })
//         }
//         readLine()
//     } catch {
//         updateWifiState()
//     }
// }
//
// // HIGHLY EFFICIENT FLUSH: 
// // 1. ip monitor captures wlan0 software connection states
// spawnListener(["ip", "monitor", "link"])
// // 2. udevadm ONLY wakes up your bar when the physical hardware interface or rfkill states change
// spawnListener(["udevadm", "monitor", "--subsystem-match=net", "--subsystem-match=rfkill"])
//
// // Initialize on bar startup
// updateWifiState()
//
// export default function WifiStatus(): Gtk.Widget {
//     return new Widget.Button({
//         className: "wifi-btn",
//
//         onButtonReleaseEvent: (self, event) => {
//             const [success, button] = event.get_button()
//             if (!success) return false
//
//             if (button === 1) {
//                 GLib.spawn_command_line_async("footclient -a float_small -e impala")
//                 return true
//             }
//
//             if (button === 3) {
//                 GLib.spawn_command_line_async("rfkill toggle wifi")
//
//                 // Provide instant layout feedback ahead of the hardware refresh cycle
//                 const currentText = wifiText.get()
//                 if (currentText.includes("OFF") || currentText.includes("Disconnected")) {
//                     wifiText.set("  CONNECTING...")
//                 } else {
//                     wifiText.set("  OFF")
//                 }
//
//                 return true
//             }
//             return false
//         },
//
//         child: new Widget.Box({
//             className: "wifi",
//             child: new Widget.Label({
//                 label: bind(wifiText)
//             })
//         })
//     })
// }
//
//
//
// // import { Widget } from "astal/gtk3"
// // import { Variable, bind } from "astal"
// // import Gtk from "gi://Gtk?version=3.0"
// // import GLib from "gi://GLib"
// //
// // const queryWifiState = (): string => {
// //     try {
// //         // Query iwctl for the connection details of wlan0
// //         const command = `bash -c "iwctl station wlan0 show"`
// //         const [success, stdout] = GLib.spawn_command_line_sync(command)
// //
// //         // If the command fails, returns empty, or iwctl cannot see the card, it is completely powered OFF
// //         if (!success || !stdout || stdout.length === 0) {
// //             return "  OFF"
// //         }
// //
// //         const outputText = new TextDecoder().decode(stdout)
// //
// //         // If the card is powered on but not linked to any router access point
// //         if (outputText.includes("disconnected") || !outputText.includes("Connected network")) {
// //             return "  Disconnected"
// //         }
// //
// //         // Parse out the exact SSID line dynamically using a strict string extraction regex
// //         const match = outputText.match(/Connected network\s+(.+)/)
// //         if (match && match[1]) {
// //             return `  ${match[1].trim()}`
// //         }
// //
// //         return "  Disconnected"
// //     } catch {
// //         // Safe fallback if the hardware interface disappears completely from the kernel tree
// //         return "  OFF"
// //     }
// // }
// //
// // // Poll the state every 4 seconds to catch background network shifts
// // const iwdWifi = Variable("    Disconnected").poll(4000, () => queryWifiState())
// //
// // export default function WifiStatus(): Gtk.Widget {
// //     return new Widget.Button({
// //         className: "wifi-btn",
// //
// //         onButtonReleaseEvent: (self, event) => {
// //             const [success, button] = event.get_button()
// //             if (!success) return false
// //
// //             // Left-Click -> Open impala wireless connection manager popup
// //             if (button === 1) {
// //                 GLib.spawn_command_line_async("footclient -a float_small -e impala")
// //                 return true
// //             }
// //
// //             // Right-Click -> Toggle wireless radio power cleanly via rfkill
// //             if (button === 3) {
// //                 GLib.spawn_command_line_async("rfkill toggle wifi")
// //
// //                 const currentText = iwdWifi.get()
// //                 // Instant UI feedback to hide any text layout transition lag
// //                 if (currentText.includes("OFF") || currentText.includes("Disconnected")) {
// //                     iwdWifi.set("  CONNECTING...")
// //                 } else {
// //                     iwdWifi.set("  OFF")
// //                 }
// //
// //                 return true
// //             }
// //             return false
// //         },
// //
// //         child: new Widget.Box({
// //             className: "wifi",
// //             child: new Widget.Label({
// //                 label: bind(iwdWifi)
// //             })
// //         })
// //     })
// // }
//
// // --------------------------------------------------------------------------------------------------------------------------------------------
//
// // import { Widget } from "astal/gtk3"
// // import { Variable, bind } from "astal"
// // import Gtk from "gi://Gtk?version=3.0"
// // import GLib from "gi://GLib"
// //
// // const iwdWifi = Variable("    Disconnected").poll(5000, () => {
// //     try {
// //         const command = `bash -c "iwctl station wlan0 show | grep 'Connected network' | awk -F'  +' '{print \\$3}'"`
// //         const [success, stdout] = GLib.spawn_command_line_sync(command)
// //
// //         if (success && stdout) {
// //             const ssid = new TextDecoder().decode(stdout).trim()
// //             return ssid ? `  ${ssid}` : "  Disconnected"
// //         }
// //         return "  OFF"
// //     } catch {
// //         return "  No Wi-Fi Hardware"
// //     }
// // })
// //
// // export default function WifiStatus(): Gtk.Widget {
// //     return new Widget.Button({
// //         className: "wifi-btn",
// //
// //         onButtonReleaseEvent: (self, event) => {
// //             const [success, button] = event.get_button()
// //             if (!success) return false
// //
// //             if (button === 1) {
// //                 GLib.spawn_command_line_async("footclient -a float_small -e impala")
// //                 return true
// //             }
// //
// //             // if (button === 3) {
// //             //     GLib.spawn_command_line_async(`rfkill toggle wifi`)
// //             //     return true
// //             // }
// //             // return false
// //
// //             if (button === 3) {
// //                 GLib.spawn_command_line_async("rfkill toggle wifi")
// //
// //                 const currentText = iwdWifi.get()
// //                 if (currentText.includes("OFF") || currentText.includes("Disconnected")) {
// //                     iwdWifi.set("  CONNECTING...")
// //                 } else {
// //                     iwdWifi.set("  OFF")
// //                 }
// //
// //                 return true
// //             }
// //             return false
// //         },
// //
// //         child: new Widget.Box({
// //             className: "wifi",
// //             child: new Widget.Label({
// //                 label: bind(iwdWifi)
// //             })
// //         })
// //
// //     })
// // }
