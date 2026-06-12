import { Widget } from "astal/gtk3"
import { Variable, bind } from "astal"
import Gtk from "gi://Gtk?version=3.0"
import Gdk from "gi://Gdk"
import Wp from "gi://AstalWp"
import GLib from "gi://GLib"

export default function VolumeStatus(): Gtk.Widget {
    const speaker = Wp.get_default()?.audio.default_speaker

    if (!speaker) {
        return new Widget.Box({
            className: "volume off",
            child: new Widget.Label({ label: " No Audio Device" })
        })
    }

    // UPDATED STATE LOGIC: Calculates text labels and corresponding CSS class names dynamically
    const audioState = Variable({
        text: speaker.mute ? "    Muted" : ` ${Math.ceil(speaker.volume * 100)}%`,
        statusClass: speaker.mute ? "muted" : "active" // Options: "active" | "muted"
    })

    const updateAudioState = () => {
        const isMuted = speaker.mute
        const pct = Math.ceil(speaker.volume * 100)

        audioState.set({
            text: isMuted ? " Muted" : ` ${pct}%`,
            statusClass: isMuted ? "muted" : "active"
        })
    }

    // Listen to changes directly from WirePlumber property notifications
    speaker.connect("notify::volume", () => updateAudioState())
    speaker.connect("notify::mute", () => updateAudioState())

    return new Widget.Button({
        className: "volume-btn",

        onClicked: () => {
            GLib.spawn_command_line_async("footclient -a float_small -e wiremix")
            // speaker.mute = !speaker.mute
        },

        onButtonReleaseEvent: (self, event) => {
            const [success, button] = event.get_button()

            if (success && button === 3) {
                speaker.mute = !speaker.mute
                // GLib.spawn_command_line_async("footclient -a float_small -e wiremix")
                return true
            }
            return false
        },

        child: new Widget.Box({
            // FIXED BINDING: Dynamically appends classes like "volume active" or "volume muted"
            className: bind(audioState).as(s => `volume ${s.statusClass}`),
            children: [
                new Widget.Label({
                    label: bind(audioState).as(s => s.text)
                })
            ]
        })
    })
}





// import { Widget } from "astal/gtk3"
// import { Variable, bind } from "astal"
// import Gtk from "gi://Gtk?version=3.0"
// import Gdk from "gi://Gdk"
// import Wp from "gi://AstalWp"
// import GLib from "gi://GLib"
//
// export default function VolumeStatus(): Gtk.Widget {
//     const speaker = Wp.get_default()?.audio.default_speaker
//
//     if (!speaker) {
//         return new Widget.Box({
//             className: "volume",
//             child: new Widget.Label({ label: "    No Audio Device" })
//         })
//     }
//
//     const audioState = Variable({
//         vol: speaker.volume,
//         isMuted: speaker.mute
//     })
//
//     speaker.connect("notify::volume", () => {
//         audioState.set({ vol: speaker.volume, isMuted: speaker.mute })
//     })
//     speaker.connect("notify::mute", () => {
//         audioState.set({ vol: speaker.volume, isMuted: speaker.mute })
//     })
//
//     return new Widget.Button({
//         className: "volume-btn",
//
//         onClicked: () => {
//             speaker.mute = !speaker.mute
//         },
//
//         onButtonReleaseEvent: (self, event) => {
//             const [success, button] = event.get_button()
//
//             if (success && button === 3) {
//                 GLib.spawn_command_line_async("footclient -a float_small -e wiremix")
//                 return true
//             }
//             return false
//         },
//
//         child: new Widget.Box({
//             className: "volume",
//             children: [
//                 new Widget.Label({
//                     label: bind(audioState).as(({ vol, isMuted }) => {
//                         if (isMuted) {
//                             return " Muted"
//                         }
//                         const pct = Math.ceil(vol * 100)
//                         return ` ${pct}%`
//                     })
//                 })
//             ]
//         })
//     })
// }
//
