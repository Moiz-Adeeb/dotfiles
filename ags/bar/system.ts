import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal" // Added Variable to the imports
import Gtk from "gi://Gtk?version=3.0"
import Battery from "gi://AstalBattery"
import GLib from "gi://GLib" // Added the required GLib namespace import
import BluetoothStatus from "./bluetooth"
import VolumeStatus from "./volume"
import WifiStatus from "./wifi"

function BatteryStatus(): Gtk.Widget {
    const bat = Battery.get_default()
    return new Widget.Box({
        className: "battery",
        visible: bind(bat, "isPresent"),
        children: [
            new Widget.Label({ label: bind(bat, "charging").as(c => c ? " " : " ") }),
            new Widget.Label({ label: bind(bat, "percentage").as(p => `${Math.floor(p * 100)}%`) })
        ]
    })
}

// Export a single unified container for the right side of the bar
export default function SysStatus(): Gtk.Widget {
    return new Widget.Box({
        halign: Gtk.Align.END,
        className: "sys-status",
        children: [
            VolumeStatus(),
            BatteryStatus(),
            BluetoothStatus(),
            WifiStatus()
        ]
    })
}

