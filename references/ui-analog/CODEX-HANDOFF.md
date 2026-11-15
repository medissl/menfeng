# MENFENG UI handoff

Use this handoff and the six images beside it for the next Godot UI pass. This supersedes the older UI mockups. Start with [the GDD](../../GDD.md) and [the current main scene](../../scenes/opening.tscn). The game is a mouse-first visual novel inside Ah Ma’s rural Taiwanese house. Base the look on the rendered game at 1280 × 720. Source plates are inputs to `vhs_image.gdshader`. Match the filtered game’s muted color, soft edges and grain. Reuse the current art, camera and hotspots. Build the UI as live Controls.

## Layout and controls

| Reference | Implementation |
| --- | --- |
| [Title](title.png) | The existing `assets/opening/passage.jpg` bedroom-door plate. Darken the margins and keep the seam visible. Use dark cinnabar Noto Serif TC for 門縫, small ivory MENFENG, then Begin, Settings and Quit as a compact text list on the left. Keep the corners clear. |
| [Settings](settings.png) and [Pause](pause.png) | Settings from the title uses the door. Pause freezes the current view at its current crop. Place controls over a dark fade in the left third, with clear corners and the gameplay HUD hidden. Use the same volume rail, rectangular ivory thumb and percentage in both screens. Show explicit Off and On and underline the selected value. Use Back in Settings. In Pause, focus Resume first and space Return to title below the settings. |
| [Exploration with incense held](held-incense.png) | At top left use a 16 px open-pocket outline with a shallow U shape and a short rim, next to **Inventory**. At top right use two short horizontal strokes beside **Menu**. Both use quiet ivory text over the image, with a large invisible click area. Drop the count and decorative frames. Show **Holding three incense sticks** in sentence case below Inventory only while held. Read the name from the item data. Keep the objective at bottom center, e.g. **Place the incense in the burner.** Show **Place incense** beside the burner on hover or keyboard focus when clicking there will place it. |
| [Inventory](inventory.png) | Dim the saved room view and hide the gameplay HUD. Display the existing alpha incense prop and a short description at left. Render only occupied slots at right as plain text rows. Mark the previewed row with a red dash. Mark an actually held item with **Held** on its row. Select the held item or first available item on open and show an empty message with **Back** when there are no items. Keep **Hold item** or **Put away** beneath the detail and **Back** at lower right. |
| [VHS playback](vhs.png) | Keep the actual seated angle. Show **Play tape**, **Pause tape**, **Resume tape** or **Replay tape** on hover and focus at the physical deck. Retain an accessible keyboard focus target and the existing transport action. If retaining the separate transport shortcut, anchor it to the same deck label and show a single visible transport label. Keep **‹ Stand up** in the lower right as the exit. Keep **Continue** under the centered reading group, with the **Ah Ma** speaker label above her line. Tape status and timecode stay inside the TV glass. |

Use about 17–19 px for small controls, 24–28 px for spoken lines and 42–44 px for menu headings at 1280 × 720. Keep the small text crisp on the filtered image. Give actions at least 44 px of hit height. Use a short ivory underline and brighter text for focus or hover. A red dash can mark the selected inventory row, and the word **Held** communicates actual state. The PNGs illustrate the layout. Match the Godot art, use the real slider value, and keep focus and selection visually distinct.

Preserve the current hold, put away, place on altar, and light sequence. Verify that using incense clears the held label and inventory row once, wrong targets leave the item held, and closing menu overlays restores their opener’s focus. Check click, keyboard and Escape, pause/resume of tape, standing up, and Reduce Motion. Compare actual filtered captures at 1280 × 720 and the project’s smaller letterboxed window. The mockups were made with the built-in ImageGen tool and represent visual targets for that implementation.

## References

- Everyday environments and worn video signal. [Chilla’s Art, The Convenience Store](https://store.steampowered.com/app/1228520/Chillas_Art_The_Convenience_Store)
- One object as the focus of an inventory view. [Chilla’s Art, Aka Manto inventory screenshot](https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1130620/ss_7e459797eef65bc6b8eec9d0a3046f693ef04c61.1920x1080.jpg)
- The media itself carries the analog UI. [Thorne Baker, Maple County](https://thornebaker.itch.io/maplecounty)

## Prompt to paste into Codex

> Read GDD.md, scenes/opening.tscn, scenes/opening.gd, scenes/inventory.gd, and references/ui-analog/CODEX-HANDOFF.md. Use the six named PNGs as the visual targets. Start from the game as rendered with its existing VHS shader and reuse its art and camera crops. Implement the specified menu, inventory, held-item, and tape controls as live Godot Controls. Keep gameplay utilities out of all open menus. Keep the TV in the sitting-room tape interaction and use the existing red-seam bedroom door for Title and title Settings. Preserve the current ritual and tape flow. Capture each screen in Godot and compare it with the matching reference before finishing.

[Exact ImageGen prompts](IMAGEGEN-PROMPTS.md)
