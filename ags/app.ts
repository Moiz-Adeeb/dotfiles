import { App, Astal, Widget } from "astal/gtk3"
import Gtk from "gi://Gtk?version=3.0"

// Import your custom modules
import Workspaces from "./bar/workspaces"
import Clock from "./bar/clock"
import SysStatus from "./bar/system"

function Bar(monitor: number = 0): Gtk.Widget {
    return new Widget.Window({
        name: `bar-${monitor}`,
        monitor,
        anchor: Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT,
        exclusivity: Astal.Exclusivity.EXCLUSIVE,
        child: new Widget.CenterBox({
            startWidget: Workspaces(),
            centerWidget: Clock(),
            endWidget: SysStatus()
        })
    })
}

App.start({
    instanceName: "my-bar",
    css: `style.css`,
    main() {
        Bar(0)
    }
})

