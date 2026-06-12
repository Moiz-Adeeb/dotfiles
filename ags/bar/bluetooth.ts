import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal"
import Gtk from "gi://Gtk?version=3.0"
import Bluetooth from "gi://AstalBluetooth"
import GLib from "gi://GLib"

export default function BluetoothStatus(): Gtk.Widget {
    const bluetooth = new Bluetooth.Bluetooth()

    const state = Variable({
        text: " OFF",
        statusClass: "off"
    })

    // Helper logic to format and push state shifts safely
    const updateState = () => {
        const isPowered = bluetooth.is_powered

        // Safely extract all devices and look for any that are explicitly connected
        const devices = bluetooth.get_devices() || []
        const connectedDevice = devices.find(d => d.connected)

        if (!isPowered) {
            state.set({ text: " OFF", statusClass: "off" })
        } else if (connectedDevice) {
            state.set({ text: `  ${connectedDevice.name}`, statusClass: "connected" })
        } else {
            state.set({ text: " ON", statusClass: "on" })
        }
    }

    // Connect individual listener hooks to every known device to catch live pairing toggles
    const hookDevices = () => {
        const devices = bluetooth.get_devices() || []
        devices.forEach(device => {
            // Uniquely hooks individual device connection state toggles
            device.connect("notify::connected", () => updateState())
        })
    }

    // 1. Core Manager Listeners for Radio power and Device Tree discovery
    bluetooth.connect("notify::is-powered", () => {
        updateState()
        hookDevices()
    })

    // 2. Triggers instantly whenever a new device bonds or vanishes from system profiles
    bluetooth.connect("device-added", () => {
        updateState()
        hookDevices()
    })
    bluetooth.connect("device-removed", () => updateState())

    // Initialize values and establish initial device tree hooks on bootup
    updateState()
    hookDevices()

    return new Widget.Button({
        className: "bluetooth-btn",

        onButtonReleaseEvent: (self, event) => {
            const [success, button] = event.get_button()
            if (!success) return false

            if (button === 1) {
                GLib.spawn_command_line_async("footclient -a float_small -e bluetui")
                return true
            }

            if (button === 3) {
                const nextState = bluetooth.is_powered ? "off" : "on"
                GLib.spawn_command_line_async(`bluetoothctl power ${nextState}`)
                return true
            }
            return false
        },

        child: new Widget.Box({
            className: bind(state).as(s => `bluetooth ${s.statusClass}`),
            child: new Widget.Label({
                label: bind(state).as(s => s.text)
            })
        })
    })
}


// import { Widget } from "astal/gtk3"
// import { bind } from "astal"
// import Gtk from "gi://Gtk?version=3.0"
// import Gdk from "gi://Gdk"
// import Bluetooth from "gi://AstalBluetooth"
// import GLib from "gi://GLib"
//
// export default function BluetoothStatus(): Gtk.Widget {
//     const bluetooth = new Bluetooth.Bluetooth()
//
//     return new Widget.Button({
//         className: "bluetooth-btn",
//
//         onButtonReleaseEvent: (self, event) => {
//             const [success, button] = event.get_button()
//             if (!success) return false
//
//             if (button === 1) {
//                 GLib.spawn_command_line_async("footclient -a float_small -e bluetui")
//                 return true
//             }
//
//             if (button === 3) {
//                 const nextState = bluetooth.is_powered ? "off" : "on"
//                 GLib.spawn_command_line_async(`bluetoothctl power ${nextState}`)
//                 return true
//             }
//             return false
//         },
//
//         child: new Widget.Box({
//             className: "bluetooth",
//             child: new Widget.Label({
//                 label: bind(bluetooth, "is_powered").as(isPowered => {
//                     if (!isPowered) return " OFF"
//
//                     const devices = bluetooth.connected_devices
//                     if (devices && devices.length > 0) return `  ${devices.name}`
//
//                     return " ON"
//                 })
//             })
//         })
//     })
// }
//
