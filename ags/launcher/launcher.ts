import { App, Astal, Widget } from "astal/gtk3"
import { Variable } from "astal"
import Gtk from "gi://Gtk?version=3.0"
import Apps from "gi://AstalApps"

export const launcherVisible = Variable(false)

export default function AppLauncher(): Gtk.Widget {
    const appsService = new Apps.Apps()
    const query = Variable("")
    const filteredApps = query.map(q => appsService.query(q))

    const textEntry = new Widget.Entry({
        className: "launcher-entry",
        placeholderText: "Search apps...",
        canFocus: true,
        onChanged: (self) => query.set(self.text),
        onActivate: () => {
            const list = appsService.query(query.get())
            if (list.length > 0) {
                list[0].launch() // Launch the first search match safely
                launcherVisible.set(false)
            }
        }
    })

    const window = new Widget.Window({
        name: "launcher",
        application: App,
        anchor: Astal.WindowAnchor.CENTER,
        keymode: Astal.Keymode.EXCLUSIVE,
        // We handle visibility explicitly via the setup hook instead of a standard bind wrapper
        child: new Widget.Box({
            vertical: true,
            className: "launcher-box",
            style: "background-color: #1e1e2e; border: 2px solid #cba6f7; border-radius: 12px; padding: 20px;",
            children: [
                textEntry,
                new Widget.Scrollable({
                    hscroll: Gtk.PolicyType.NEVER,
                    vscroll: Gtk.PolicyType.AUTOMATIC,
                    style: "background-color: #181825; border-radius: 8px; padding: 10px;",
                    child: new Widget.Box({
                        vertical: true,
                        children: filteredApps.map(list =>
                            list.map(app => new Widget.Button({
                                className: "app-item",
                                style: "padding: 8px; margin: 2px 0px; border-radius: 6px; background: none; border: none;",
                                onClicked: () => {
                                    app.launch()
                                    launcherVisible.set(false)
                                },
                                child: new Widget.Box({
                                    children: [
                                        new Widget.Icon({ icon: app.icon_name || "application-x-executable" }),
                                        new Widget.Label({ style: "margin-left: 12px; color: #cdd6f4;", label: app.name })
                                    ]
                                })
                            }))
                        )
                    })
                })
            ],
            setup: (self) => self.connect("show", () => {
                textEntry.text = ""
                textEntry.grab_focus()
            })
        }),
        setup: (self) => {
            // FIXED: Explicitly listen to state shifts and toggle visual mapping variables natively
            launcherVisible.observe(visible => {
                self.visible = visible
            })
        }
    })

    window.set_default_size(500, 450)
    return window
}

