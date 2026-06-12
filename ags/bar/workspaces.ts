import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal"
import Hyprland from "gi://AstalHyprland"
import Gtk from "gi://Gtk?version=3.0"

export default function Workspaces(): Gtk.Widget {
    const hypr = Hyprland.get_default()

    const state = Variable({
        list: hypr.get_workspaces() || [],
        focusedId: hypr.get_focused_workspace()?.id || 1
    })

    hypr.connect("workspace-added", () => {
        state.set({ ...state.get(), list: hypr.get_workspaces() })
    })
    hypr.connect("workspace-removed", () => {
        state.set({ ...state.get(), list: hypr.get_workspaces() })
    })
    
    hypr.connect("event", (_, name, params) => {
        if (name === "workspace") {
            const targetId = parseInt(params);
            if (!isNaN(targetId)) {
                state.set({ ...state.get(), focusedId: targetId })
            }
        }
    })

    return new Widget.Box({
        className: "workspaces",
        children: bind(state).as(({ list, focusedId }) =>
            list
                .sort((a, b) => a.id - b.id)
                .map(w =>
                    new Widget.Button({
                        className: focusedId === w.id ? "focused" : "",
                        onClicked: () => hypr.message(`dispatch workspace ${w.id}`),
                        child: new Widget.Label({ 
                            label: `${w.id}` 
                        })
                    })
                )
        )
    })
}

