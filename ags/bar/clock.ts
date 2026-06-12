import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal"
import Gtk from "gi://Gtk?version=3.0"

// UPDATED: Modified format string to show: Day-of-week, Month, Day, Hour:Minute AM/PM
const time = Variable("").poll(1000, "date '+%A | %d-%b-%Y | %H:%M'")

export default function Clock(): Gtk.Widget {
    return new Widget.Label({
        className: "clock",
        label: bind(time)
    })
}

