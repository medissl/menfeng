# 《門縫》

*Production game design document · Rural Taiwan · Desktop Godot · In production*

**門縫** (*Ménfèng*) is the gap at a closed door. **門** is the door or gate. **縫** is the seam or gap. As a child you lower yourself to look under Ah Ma’s door. As an adult you open your eyes on the gap between the living and the dead. Both times the player chooses to look.

## 1. Build contract

A linear, first-person analog horror visual novel that the player explores by clicking through a traditional wooden house. The player returns after Ah Ma’s funeral, follows a VHS she left for them, and discovers what her nightly prayers were keeping in the house. The game plays at the reader’s pace. The world reacts to the completion of meaningful actions. One ending shows Grandpa beside the player and Ah Ma bound behind him.

- **Platform and scope.** Desktop Godot, mouse-first, 16:9, one house and its immediate yard, one sitting. Target 25–35 minutes, including reading and optional inspection. A complete playthrough uses fixed compositions, clean scene cuts, still-image edits, and a few brief local effects.
- **Player verbs.** Move through a named exit, look closer, take, place, pour, light, replay, and open your eyes. The player performs the preparations and discovers the story. The ritual sequence is guided and deterministic.
- **Presentation.** Photoreal AI-assisted stills, separate text, sparse VHS motion, environmental audio, and no voice acting. No WASD movement, 3D navigation, combat, chases, timed choices, hidden endings, riddle chains, or drag-and-drop inventory. Every required action has a visible label. There is no gameplay penalty for leaving an object alone or reading slowly.
- **Current phase.** Desktop Godot development. The first playable proves the childhood door peek. Continue from the milestone table in §9. The project’s AGENTS.md governs engineering and DESIGN.md governs visual conventions. This GDD governs the story, house, progression, media requirements, and acceptance criteria. When a difference affects the intended experience, bring the concrete conflict to the user.
- **One living document.** Carry this GDD and the two reference images into the repo together. Update relevant rows here when work changes. Track milestone progress in §9 and record unresolved production decisions there. Keep asset license credits in §8 or the project’s existing credits source. Use the code diff and Git for implementation history.

## 2. Story canon and what the player learns

The opening is a childhood visit. You live with your parents and spend some holidays at your Ah Ma’s house. She is warm and attentive. She straightens your bedding before bed. At night you wake to red light under a wooden door, with a caption indicating the chanting coming from inside. You crouch and see the hem of her clothes and a shadow that stays when she moves. The next morning she sets breakfast in front of you and says, “Ah Ma is just pai pai.” The player later finds her laughing on the couch, waiting for a reply from an apparently empty seat. A second childhood vignette repeats that conversational pause in another part of the house.

| Canon, in chronological order | How the player learns it, in the order the game needs it |
| --- | --- |
| Grandpa died of sickness when Ah Ma was 30. She raised three children by herself. | In the adult chapter, the family album by the couch shows three children growing up with Ah Ma. A note on the back of Grandpa’s portrait states he died after an illness. A short caption supplies Ah Ma’s age. Include one line connecting the three children to her daily work after he died. |
| By 45, all three had moved away for work. One went to Singapore. The others, including your father, went to larger cities in Taiwan. At 46, a year into living alone, she sought a ritual practitioner. | A montage of three departures in the album uses the same entrance frame. The photos thin out. A later taped memory supplies the destinations and connects the empty house to her decision. Use a caption at the moment the last photograph leaves frame. “Your father took work in the city. One of the others went all the way to Singapore. By forty-five, I was the only one left here.” |
| The practitioner promised to call Grandpa back and open Ah Ma’s sight. In the story’s afterlife, Grandpa had endured the Asura and hell realms and was on his way toward heaven and eventual rebirth. The rite interrupted that passage and brought him back as a starving ghost. | When the player places Grandpa’s portrait, the tape shows one still of Ah Ma across from the practitioner and one of her sitting in the same room with her eyes closed. Two short caption cards carry what the images alone cannot convey. “He told me I could see him again.” Later, “Your grandfather had finished suffering. I called him back before he could move on.” A second caption card makes the family’s cosmology explicit. “Through the Asura realm. Through hell. He was on his way to heaven and another life. I brought him back hungry.” |
| Only Ah Ma could see and speak with him. He was company at first. Hunger and resentment grew. The practitioner demanded nightly prayers and the burning of fetal remains to keep him present and pacify him. Ah Ma kept paying that price for decades. | An early tape still matches the childhood couch frame. On the tape, Ah Ma looks into the empty seat and waits. A drawer holds hospital appointment slips spanning decades. Near the end, her tape directly connects the checkups to the offerings, along with one dated early slip and a stack of later slips. The means by which she obtained the remains stay outside the frame. A mandatory caption connects the clues. “I used to tell you they were checkups. The hospital trips were for the offerings.” |
| By her early 80s, her nightly offering could no longer hold him. The family heard she was mysteriously unwell. Grandpa possessed her and forced her into the drain access in the bathroom. He kept her soul in the house after she died. | Early bathroom inspection shows a replaced cover and a damaged ring pull. When the player returns with the tape’s last instructions, a short reconstruction shows water at the drain, Ah Ma bracing both hands against the threshold, and a hard cut to an empty doorway. Ah Ma’s earlier tape caption explains the loss of control. “He took hold of me. I could feel my hands moving.” The reconstruction and the protagonist’s caption establish that the drain had been uncovered the night she died. The ending supplies the proof that she is still there. |
| Ah Ma made the tape for her favourite grandchild before she died, after she realized he would keep her in the house. She hoped you would see her and buy enough time to reach her. | Father’s note introduces the tape. Ah Ma reveals the real purpose only after the vessel is found. She admits that starting with incense and tea made it more likely you would stay. Her last message is written in her own hand and held up to the camera. |

The timeline spans roughly 35 years of offerings between age 46 and her early 80s. Use the approved approximate ages in art and writing. Lock specific dates before generating any prop with visible dates.

Keep the family’s altar layout and vocabulary as given by the user. Pek Kong is at the entrance altar, Ti Kong is outside, and the ancestors’ and Grandpa’s pictures are beside the altar. Use **香爐** for the incense burner and Ah Ma’s “pai pai” in the childhood line. The practitioner’s summoning, required offering, forehead mark, and rules for Grandpa are part of the fictional family story. Art should render the familiar devotional objects with care. The horror comes from what Ah Ma agreed to and what Grandpa eventually did.

## 3. House and navigation

Freeze the layout before generating production room art. Proposed blocking below is the working layout. It uses eight navigable backgrounds and two door-gap crops. Close-ups of objects stay in their parent room.

~~~text
Yard and Ti Kong ── Entrance hall and altar ── Sitting room and VHS
       │                       │
       │                 Inner passage ── Ah Ma’s bedroom
       │                       │
Covered burn area ──────── Kitchen ── Bathroom
~~~

| View | Exits | Visible anchors and interactive objects |
| --- | --- | --- |
| Yard | Entrance hall, covered burn area | Forest road, rain at arrival, Ti Kong, front door, exterior view of the wooden house |
| Entrance hall | Yard, sitting room, inner passage | Pek Kong altar, incense burner, ancestor portraits, cleared spot for Grandpa’s portrait, three cup positions |
| Sitting room | Entrance hall | Couch with two worn places, family album, portrait of Grandpa in a cabinet, CRT and VCR, father’s note |
| Inner passage | Entrance hall, bedroom, kitchen | Wooden side door and its gap, childhood and adult inspection at the same threshold |
| Ah Ma’s bedroom | Inner passage | Dresser with incense and closed tin, hospital slips, low cupboard with the child-shaped vessel |
| Kitchen | Inner passage, bathroom, covered burn area | Tea, wine, three small cups, one shelf with folded prayer paper |
| Bathroom | Kitchen | Old tile, wide covered drain access, replacement ring pull, moisture at the sill |
| Covered burn area | Kitchen, yard | Ordinary burner, ash, hard red spill from the house, view toward the woods |

The side door in the passage is closed in both eras. **Look under door** opens a close-up and returns to the passage. It does not add another destination. The front door is the same landmark from the yard and hall. The burn area is one shared location from either approach. Keep paths consistent in daylight memory stills and the adult night. The layout should let a new player remember the house by sight after one circuit.

## 4. Playthrough specification

Time ranges are pacing targets. Story progression depends on completed interactions.

| Beat | Entry and required clicks | Feedback and next state |
| --- | --- | --- |
| **1. Childhood, 3–4 min** | Inspect the lit gap, click **Look under**, advance to breakfast, inspect the couch memory. | The low angle and red seam are established. Ah Ma’s morning line appears over breakfast. The couch vignette leaves a deliberate pause. Cut to the same house on the present evening. |
| **2. Arrival, 3 min** | Enter the yard at **6:00 p.m.**, pass Ti Kong, enter the hall, pay respects at the entrance altar, go to the sitting room, read father’s note, play the VHS. Father’s note can read, “She put this aside for you. Said her favourite would know where to look.” | Dark forest road, wet wood, and lack of street lighting explain the decision to stay. One line carries the missed funeral. The first tape chapter asks for the incense. |
| **3. Incense and portrait, 5–6 min** | Follow the tape through the inner passage. Inspect the red seam at the same wooden door, then go to the bedroom. Take incense, place and light it in the 香爐. Play the next available tape chapter. Find Grandpa’s framed picture in the sitting-room cabinet, inspect its back, and place it at the altar. | Show the burner with lit incense and the new portrait in place. The chapter makes the couch memory click. Lock in Grandpa’s death and the family leaving through required album and tape frames. |
| **4. Cups and paper, 5–6 min** | Play next tape chapter. Take the three cups as one group and collect the tea and wine from the same kitchen counter. Place the cups, then click the separate tea and wine pours at the altar. Collect the folded prayer paper. Inspect the covered burner. | The altar builds visibly across clicks. The route through the kitchen presents the bathroom. Before the next tape chapter becomes available, inspect the drain close-up. The tape now explains the invitation and the first years of company. |
| **5. Vessel, 5–6 min** | Play next tape chapter. Open the bedroom cupboard, take the heavy sculpted vessel, inspect the hospital slips next to it, and bring the vessel to the burn area. Return to the sitting room and play the newly available tape confession before committing the offering. | The vessel makes a weighty contact sound. The lid lifts enough to show multiple cloth-wrapped forms of different sizes. Ah Ma’s caption identifies the contents explicitly as fetal remains and relates them to the hospital trips. A short bathroom reconstruction follows the confession. |
| **6. Open the gap, 4–5 min** | Take the chalk-like material from the tin in the bedroom. Follow **Mark your forehead** at the altar. Click **Continue** through the short captioned chant. Confirm **Burn the offering** at the covered burner with the vessel and paper in place. Return to the sitting room for Ah Ma’s final tape card, then click **Sit on the couch**. Click **Close your eyes**, then **Open your eyes**. | Show the mark on the fingers or reflected in the CRT. The mark prepares the player to see. Burning buys a short moment of quiet in the story. The playthrough uses an authored cut and silence, with the final click waiting indefinitely. Roll the ending described below. |

**Tape and route rules.** Tape chapters unlock once their current objectives finish. At the CRT, the player can revisit any completed chapter through **Earlier chapters**. **Replay last instruction** presents the latest available instruction without reopening the footage. Captions stay visible until the player advances. Later chapters stay concealed until their beat. Show an available new chapter on the objective line and in the TV hotspot label. Each required item has one home. Early inspection shows that prop in place and lets the player describe it. Where picking it up early would spoil the revelation or change the altar sequence, show a short prompt tied to the current task. When a chapter points the player somewhere new, its last instruction names the room and the object. An optional hint can state both again.

**Object rules.** A click to take puts the item in the current objective’s simple carried-items row. A click on the intended destination places it. Cups move as a group. Tea and wine are two labeled pours with visible fill states. Their earliest draft order may be either. Choose exact cup allocation with the user before final altar artwork. Once a prop is placed, revisit the source and destination to verify it appears in only its correct place. Correct actions commit once. Repeat clicks on completed objects reopen their description. The paper and vessel are consumed by the one authored burn. The altar lamp persists during and after the sequence.

**Ending treatment.** After the offering, remove the house’s incidental bed of sound. From the same position on the couch seen in childhood, **Close your eyes** cuts to black. Text fades, and **Open your eyes** is the only action. On click, show Grandpa’s face at intimate distance in red side light. The face is suddenly visible and clear enough to study. The player can make out Ah Ma farther back, bound at the neck, fighting to meet their eyes. Leave the shot readable for several seconds, then offer **Continue** to cut to black and the title. There is one ending. The game ends at discovery, before any escape or rescue.

## 5. UI, captions, and tone

- **Title screen.** Use a nearly black still of the closed door with a thin red seam for the title background. Title **《門縫》**, **Begin**, **Settings**, and **Quit**. Put a concise content notice with the first Begin flow covering pregnancy loss, death, and disturbing imagery. Target Traditional Chinese title typography with licensed CJK coverage. The working script is in English with the family’s terminology. Confirm translation scope and spoken-language details of the world before final text layout.
- **Exploration.** The image is the dominant surface. Use small, plainly labeled edge controls for exits. The current objective is a single line near the bottom. Required hotspots have a restrained outline or label on hover. An optional **Show hotspots** control outlines all currently usable objects, including when the player returns from a close-up. All hit regions sit inside the view’s reference frame and remain reachable at the tested minimum window.
- **Inspection.** Show the object crop, one or two lines of point-of-view text, and **Back**. Context actions name the result, such as **Place portrait**. The last position and objective survive opening and closing an inspection. Text sits on a solid or nearly opaque dark band, away from clues. Text and click targets stay clean while the room or tape has grain.
- **Tape.** Keep a 4:3 image inside the CRT treatment with a small timecode. Use **Play**, **Pause**, **Replay**, and **Back**. Use 1–3 photographic stills per segment with a held expression or gesture. Ah Ma’s words appear as a subtitle or a written card she holds. Keep each line brief and advance with a click. Use speaker labels only when required. Caption significant environmental sounds where their source or timing carries information.
- **Readability and pacing.** Support larger text, subtitles/effect captions, reduced distortion, master volume, and a pause menu. Default to click-to-advance at plot-critical captions. Reduced distortion suppresses image transitions and keeps the stills stable. The low-angle peek and final reveal still work as clean cuts. Progress clues stay readable in silence. Double clicks during cuts and returning from pause can never skip a story trigger.
- **Ending/reset.** The final reveal is followed by **Continue** and then a return to the title. A new session restores the untouched room, first VHS chapter, and opening rain cues. Use one run of roughly half an hour as the baseline. If the supplied project already has a tested checkpoint mechanism, reuse it. Otherwise the first playable needs pause and restart.

Build the UI with the project’s existing Godot nodes and theme patterns. If a layout needs establishing, a fixed 16:9 design canvas with aspect-preserving scaling lets the background and hotspot bounds stay together. Check 1280×720, 1920×1080, and a non-16:9 window with safe letterboxing. [Godot multiple resolutions guide](https://docs.godotengine.org/en/stable/tutorials/rendering/multiple_resolutions.html)

## 6. Progression and state

Keep the current main stage, current view, collected/placed items, and tape progress in one owner. Use a small fixed sequence in the project’s existing script style. Derive visible props, available exits, and enabled actions from that state. A modal close-up, the pause menu, and the tape player may hold temporary UI state.

| Main state | Completion condition | On completion |
| --- | --- | --- |
| Childhood | Peek, view breakfast, view couch and second memory | Start adult in the yard |
| Arrival | Enter hall, acknowledge altar, read father’s note, finish VHS chapter 1 | Enable taking and lighting incense |
| Incense | Inspect the door gap in the adult passage, then place and light incense in the burner | Unlock VHS chapter 2 |
| Portrait | Finish chapter 2, view the album, inspect and place Grandpa’s portrait | Unlock VHS chapter 3 |
| Offerings | Finish chapter 3, place cup set, pour tea and wine, take prayer paper, inspect burn site and bathroom drain | Unlock VHS chapter 4 |
| Vessel | Finish chapter 4, take vessel, read hospital slips, bring vessel to burner and look inside | Unlock VHS chapter 5 |
| Confession | Finish chapter 5 and view bathroom reconstruction | Enable taking the chalk-like material |
| Sight | Mark forehead at the altar, place paper and burn the offering, return to VHS | Unlock VHS chapter 6 |
| Final look | Finish chapter 6, sit on the couch, close eyes, open eyes | Reveal Grandpa and Ah Ma. Continue returns to title |

**VHS chapters.** Chapter 1 welcomes the player and names the incense. Chapter 2 asks for the portrait and directs the player to the album. Chapter 3 requests the cups, drinks and paper. Chapter 4 tells how Ah Ma invited Grandpa home and sends the player for the vessel. Chapter 5 names the contents, the price, and the last instructions. Chapter 6 asks the player to look beside them. Facts owing an explicit line are in §2. For replay, keep all completed chapter captions available from **Earlier chapters** on the CRT. **Replay last instruction** opens a caption with the most recent instruction from any view. Pressing **Back** restores the same view. Replaying a chapter changes no game progress.

When the adult can explore, the entire house is navigable. Exploration before an item’s stage gives an inspection with minimal description. The three cup positions and foreground art can be placed before deciding the final tea and wine split. Treat the group as complete when both pour actions are satisfied. For the burning sequence, show **Set down vessel** before **Look inside**. Once the confession has played and the mark is applied, the covered burner exposes **Place paper**, then **Burn offering**. Each dialogue advance or action consumes one click. While a cut is in motion, the initiating click is consumed and the next action waits for release.

The adult room changes persist across navigation and VHS playback. One-shot cues fire at the first valid transition. Reopening a view can restart its room ambience with a fade and can display its current image. Test early discovery, backtracking from both sides of the burn area, repeated clicks, replay, and restart. Use the Godot version and project conventions found in the provided repository before choosing node or file names. Built-in scene nodes, anchored Control hit regions, texture layers, and AudioStreamPlayer are enough for the first pass.

## 7. Visual production and AI asset guide

### Visual references

1. [Warm altar reference supplied in chat](references/warm-altar.jpg). Use red practical lights, hard amber accents, near-black devotional objects, dark carving, brass, and a crowded but deliberate altar silhouette. Preserve enough midtone detail to read the burner and offerings.
2. [Cold tape reference supplied in chat](references/cold-tape.jpg). Use a head-on framed altar, charcoal background, desaturated grey-green casts, dim figures, soft highlights, and a low-resolution photographic surface. Use the composition and tone to distinguish old tape from the live room.

3. [Grainy kitchen reference supplied in chat](references/grainy-kitchen.jpg). Use the image area for shadow noise, uneven exposure and how the darkness absorbs detail.

4. [Analog-TV altar reference supplied in chat](references/analog-tv-altar.jpg). This is the current image-quality target. Use ink-black negative space, small jewel-blue light sources, crisp silhouettes with soft low-resolution edges, and restrained color bleed.

Treat the opening as a stable image on an old color TV. Local practical lamp light gives the room a blue-black palette, with scarlet from under the door. Preserve readable shapes and let the softer texture sit in the midtones. The opening uses a clean picture edge and an uncluttered frame. Distinguish the in-world VHS inserts with their 4:3 container and transport cues. Keep captions and controls separate from the background still.

### Asset budget and construction

| Family | First production pass | Continuity and checks |
| --- | --- | --- |
| World backgrounds | Eight clean adult backgrounds listed in §3, composed for a 16:9 canvas. Work at 1920×1080 or higher at source where available. | Both sides of every usable doorway match. Keep an obvious exit landing area. Make each key item clearly identifiable at 1280×720. |
| Memory and opening | One child-height passage base, two matched door-gap frames, one breakfast frame, one couch vignette and one additional short conversational vignette. Use edits or crops of accepted room views where the perspective permits. | Same door planks, seam, wear marks and room layout in both eras. Child height, daylight and weather may change. |
| Prop images | Incense, incense burner, Grandpa’s framed portrait front and back, cups, tea and wine, prayer paper, hospital slips, chalk-like material, closed and opened child-shaped vessel, and drain cover. | Use close crops where adequate. Use transparent layers or local patches for movable props, filled cups, removed items, and the vessel lid. Author every date and character as editable text. |
| VHS | Six chapters with one to three stills each. Reuse the accepted room masters and stable Ah Ma references. Use separately composed inserts for the practitioner, old album, and handwritten message. | Ah Ma has a stable face, wardrobe and age for each era. Photograph ordinary gestures and let a held frame create discomfort. Use the shared grain and exposure baseline. Apply the tape framing and transport overlays in Godot. |
| Horror changes | Lit wick and incense ember, brief rain layer, reconstruction of the drain, and final reveal. Keep one optional silhouette layer for the early door gap. | Use matched patches, crossfades or short layer movement. Grandpa stays unseen until the reveal. The final shot makes both his face and Ah Ma readable on a dim display. |
| Interface | Minimal Godot theme, title treatment and cursor states. | Use native controls and editable text. Keep focus indicators and caption backgrounds outside the image degradation effect. |

### Generation sequence

1. **Block the whole house with rectangles or rough stills.** Put each door, altar, couch, CRT, bedroom cupboard, basin, bathroom drain and the sheltered burner in its correct place. Walk the eight viewpoints in Godot before rendering them.
2. **Establish the house and VHS look frames.** Use the revised passage and peek for local practical lighting and broadcast softness. Test the altar’s warm practical light and a cold frontal VHS composition with the same house fixtures. Check grain survival and prop readability in an actual game capture at 1280 × 720.
3. **Build references for the recurring people and key props.** Lock Ah Ma at childhood-visit and recorded-tape ages, Grandpa in the family portrait, and the final face as the same man after years of hunger. Lock the door wear pattern, incense burner profile, CRT model, vessel silhouette, and drain cover against the floor plan.
4. **Generate adult room masters from that layout.** Use the validated hall as the reference for adjacent views. Sketch the framing before each generation. For a later state, submit that exact approved background as the edit target and change the smallest possible region. Preserve the source master and named crop.
5. **Add close-ups and states.** Crop existing frames where possible. Composite prop changes with separate layers. Test removing objects from sockets, pouring, and placing at the altar. Leave blank text areas on photographed slips, notes, and plaques. Add approved Traditional Chinese separately.
6. **Integrate and inspect real captures.** Compare adjacent views and before/after pairs at 1280×720. Check the door-gap callback, a built-up altar, the vessel inspection, and the ending at native game scale. Reject drifting geography, altered props, unreadable characters, or impossible light geometry before polishing. Store only selected runtime assets in the repo and keep private prompt references with the project materials as appropriate.

**Prompt recipe.** State the room and adjacent landmark, era, camera height and target framing, what the player must be able to see or click, source of practical light, house materials, and whether the reference is an edit target or a mood reference. Specify soft standard-definition detail, local practical light, distinct dark silhouettes, and subtle color bleed. Keep subtitles and tape transport controls separate. For states, specify the one desired change, its location, and the stable camera and objects around it.

**Example master brief.** “Rural Taiwanese traditional wooden home, entrance hall around 6 p.m. on a rainy evening. Static first-person view facing the established hall layout. Main devotional altar at the entrance, blackened brass incense burner visible on wood, small warm red lights, family photographs on the adjacent wall, unobstructed passage on the left. Red practical light and cool wet daylight from the front door. Dark surfaces with readable midtones. Photographic pre-digital feel. 16:9. Preserve room layout in later edits. Leave readable writing to typography.”

**Example state edit.** “Use the approved entrance hall still as the edit target. Put the approved three-cup group on the marked tray. Keep the camera, burner, plaques, portraits, lighting, and shadows elsewhere in the room as in the source. Leave the space for Grandpa’s portrait exactly as drawn in the blocking.”

Use one import preset per practical media class where that works. For final images, an opaque compressed format is useful for backgrounds and lossless PNG is suitable for transparent layers and fine prop detail. Check the actual import options in the provided Godot version. [Godot image and texture importing guide](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_images.html)

### Performance of the scares

- **Door gap.** Let the player approach, inspect the floor, and click to lower the camera. Show the red line before the shape behind it. Use a practical lamp, a slight shadow change, and the sound of breathing cloth near the floor.
- **Couch.** Ah Ma’s eyes settle on the empty place. Hold that image a beat after her line leaves the screen. Match the adult framing so the worn second seat answers the earlier moment visually.
- **Vessel.** Let its weight register in the handoff to the burner. Show several shapes through a small opening under the lid. The tape names what is inside. Keep the player’s attention on Ah Ma’s choice and their own next click.
- **Ending.** Use an intimate held shot with Grandpa’s face in front and Ah Ma visible past his shoulder. Start the ghost from Grandpa’s portrait reference. Keep familiar facial structure beneath the unnatural eyes, tension, hunger and expression. Hold the image without an automatic cut or loud stinger. Use only one held frame for the reveal before the closing cut.

## 8. Sound production without voices

Use room beds and practical textures as the score. Narrative voices stay in text. In childhood, show Ah Ma’s measured posture and breath, and use a caption such as **[Ah Ma chants under her breath]**. Give the scene wood, cloth and night ambience. The tape’s last instructions come through authored captions and a written card.

| Cue | Where and when | Sound search or edit brief |
| --- | --- | --- |
| Exterior rain and rural night | Arrival, then quieter after entering. Rain stops once the player has reached the hall. Leave water dripping from the eaves. | Rain on tiles or roof, distant wind through trees, wet leaf drip. Build one exterior bed and use filtering or volume to separate interior. |
| House at rest | Adult rooms and childhood holding shots | Low timber tick, cloth, sparse insects from outdoors. Keep the bed quiet enough for distinct single events. |
| Threshold | Opening peek and adult callback | A faint wood shift and soft cloth movement with a clear source. Let the second version lose part of its ambient bed. |
| VHS | At physical Play, Pause, and chapter ends | VCR button click, transport start, brief analog hiss and stop. Use subtle filtering to keep the sound inside the television. |
| Offering work | Incense placement, cup set, pours, paper, burner | Ceramic against wood, match strike, quiet tea pour, paper handling and small ignition. Each click receives a grounded response. |
| Vessel and bathroom | Vessel placement and drain reconstruction | Heavy ceramic contact, gritty lid scrape, room-length water drips and a single movement against the drain cover. |
| Final sight | Burn, return, close eyes, open eyes | Let fire die down. Reduce the house bed, then hold near silence on the reveal. A faint couch spring or cloth shift can place Grandpa beside the player before the click. |

**Sourcing.** Start with Freesound CC0 and CC BY clips from an attributable uploader. Check the individual asset page and exact license before using a file. Record title, creator, direct asset URL, license and version, changes, and cue in the table below or the existing credits source. Credit CC BY assets in the shipped credits. Use licensed libraries when their terms cover the intended build, project collaboration and required distribution. For Sonniss GDC clips, check the applicable edition’s terms before use. The license distinguishes synchronized finished games from distribution of the sounds as assets. Prefer CC0 or suitable CC BY for source files that will be checked into a public repository. Download individual needed clips or approved licensed extracts during the sound milestone. [Freesound licensing guidance](https://freesound.org/help/faq/), [Sonniss GDC bundle license](https://sonniss.com/gdc-bundle-license/)

| Cue | File or clip title | Creator and source | License and version | Edits and credit |
| --- | --- | --- | --- | --- |
| Add when selected | Individual clip | Direct asset page | Checked against planned use | Note trims, filters, and final credit |

**Implementation.** Use Master, Ambience and SFX buses where the project has no equivalent. WAV suits short local cues. Ogg is an option for longer loops. Trim clicks or tails where needed, crossfade room beds, and leave mix headroom. Pause stops or holds the active sounds consistently with the current screen. Muting preserves captions and visible feedback. Verify headphone and ordinary speaker playback at a comfortable volume. [Godot audio buses](https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html), [Godot audio imports](https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_audio_samples.html)

## 9. Milestones and handoff

The repo and Godot project are the starting point for the tasks below. At the start of each session, read its AGENTS.md and DESIGN.md, inspect Git status and the project entry scene, read the current milestone here, and choose the smallest complete change that advances it. Use the project’s version, conventions, and existing test commands. Use a focused manual run when the project has no automated harness for the affected behavior. Preserve unrelated changes and configured project settings. The user controls pushes, merges and deployments.

| Status | Slice and dependencies | Change area and completion evidence |
| --- | --- | --- |
| [x] **1. Door-gap proof** | After project access. Make a playable title-to-peek flow with a rough passage still, a matched close-up, and one caption and cue. | Entry scene, two images and one transition. On mouse click, the red seam and perspective read immediately. Pause and return work. Capture the rendered view and watch at 1280×720. |
| [ ] **2. Arrival and explore** | After 1. Connect all eight provisional views. Reach the TV from the yard and pass through the return callback at the inner door. | Room navigation and the first tape control. Walk every link in both directions. Back from close-ups lands in the parent view. Check the CRT frame and graphic-to-hotspot alignment across window sizes. |
| [ ] **3. First ritual action** | After 2. Play chapter 1, take incense, place it, and light it. Implement the carried-item row only as needed by this interaction. | Progression and prop state in the playable scene. Early inspection, placement, replay, and repeated clicks remain safe. Revisiting the room preserves the ember and source-state change. |
| [ ] **4. A complete rough cut** | After 3. Connect portrait and album, then cups and paper. Verify that section. Connect vessel and confession, then mark, burn, and final look. Verify each adjacent pair of beats as it lands. | Main-stage logic and authored beats, with placeholder media. Complete a silent mouse-only run from title through the one ending, backtrack, restart, and check that mandatory story facts and all controls are present. Record the rough-cut runtime. |
| [ ] **5. Matched art** | After 2 for test frames and after 4 for batch integration. Do the paired art test before editing or generating the rest of the house. | Assets and per-view art placement. Accept the warm hall and cold tape pair before expanding. Compare the runtime stills against §§3 and 7. Playtest the opening and ending on a dim display and inspect the vessel and portrait at minimum size. |
| [ ] **6. Ambience and pacing** | After 4. Source and import the minimum cue set. Tune the final look after 5. | Audio imports, buses, scene cues and the existing credits. Verify loop seams, captions, credits, audio on/off, and no duplicate cue on revisit. Compare room transitions and final silence on headphones and speakers. |
| [ ] **7. Final integrated review** | After 5 and 6. Verify the chapter and export only if authorized within the project task. | Fresh start and clean playthrough, slower caption reading, repeated clicks, non-16:9 frame, reduced-effects, muted mode and restart. Check the working diff, Godot errors and the project’s relevant checks. Keep rendered evidence in the existing workflow. |

**Checkpoints.** After 3, review the actual peek, first tape chapter and placed incense before expanding the flow. After 4, watch a fresh player complete the rough cut and recount the story before committing to a bulk art pass. After 6, hold the final reveal on screen during the review and confirm that the intended two figures register in sequence.

**Completion test for the story.** Someone unfamiliar with the pitch should be able to explain from one playthrough why Ah Ma brought Grandpa home, why she went to the hospital, how she died, why the tape was for this grandchild, and what changed when they opened their eyes. Ask them which prop, frame or line told them each answer. If a required fact appears only in this GDD, move it into a mandatory visual beat or a short caption. Ask where they got lost, what they first noticed in the last image, and where they felt most uneasy. Adjust direction, contrast, or cue placement before adding more content.

### Decisions to settle when they matter

| Decision | Default in this draft | Settle before |
| --- | --- | --- |
| House blocking and floor plan | The eight views and connections in §3 | Production room generation |
| Family wording, altar object placement, and exact pour allocation | Use the user’s terms and established layout. Keep the cup fill split provisional. | Captions, art with inscriptions, and final altar composite |
| Period within the VHS era, prop dates, names and localized script | Rural Taiwan. English working captions and Traditional Chinese title. Visible dates and names can remain blank in rough art. | Text-heavy props and asset lock |
| Visual explicitness of the vessel | Indirect shapes and a direct caption, with the reveal fully clear in story terms. | Vessel art generation |
| Ah Ma’s confession and final intent | She hopes you will see her and be able to reach her. The ending stops at seeing her. | Final dialogue pass |
| Download and export rights for production audio | Prefer CC0 and CC BY. Verify selected asset rights for the actual repo and release distribution. | Importing selected third-party sound and publishing |

**Current handoff.** Door-gap proof is playable from the Godot main scene. The next unstarted slice is **Arrival and explore**. The opening uses two matched imagegen stills graded like old color TV, subtle static color fringing, synthesized scratch sound, and captioned chanting. Reduce Motion skips the peek transition. In Godot 4.7.2 Compatibility, viewport mouse checks passed at 1280 × 720 and 1024 × 768 for Begin, both peek inputs, Look away, pause, reduced motion, muted volume, and return to title. The title, passage, and peek were inspected from actual engine renders. The rest of the childhood sequence and the adult house are still to be built. As each slice lands, change its status here and add a short note only for an unresolved issue, a deliberately changed decision, or evidence future work needs.

## 10. Supporting references

**Opening art provenance.** The final passage and peek were edited with built-in imagegen using the original scene stills for continuity and the user’s analog-TV altar photo for lighting, contrast, and color. A static Godot backdrop shader adds a small amount of horizontal color bleed.

<details>
<summary>Opening image prompts</summary>

**Passage**

undefined

**Peek**

undefined

</details>

- Taiwanese domestic altars, family portraits, and offerings. Use the user’s household placement as the in-game layout. [P. Steven Sangren, Taiwan Journal of Anthropology](https://ianthro.ioe.sinica.edu.tw/wp-content/uploads/2021/01/TJA_18-2%EF%BC%BFLI-YIH-YUAN-MEMORIAL-LECTURE.pdf#page=9), [Taiwan Historica, 天公爐](https://www.th.gov.tw/Epaper_Content/237/8135/)
- Fixed-room interaction and the timing of familiar objects. [TheHOUSE, Sinthai Studio](https://sinthaistudio.com/portfolios/thehouse/)
- VHS as an object the player handles and interprets. [Maple County, Thorne Baker](https://thornebaker.itch.io/maplecounty)
