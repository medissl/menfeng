extends RefCounted

const SAVE_PATH := "user://checkpoint.cfg"
const VERSION := 1


static func read_checkpoint() -> ConfigFile:
	var checkpoint := ConfigFile.new()
	if checkpoint.load(SAVE_PATH) != OK or checkpoint.get_value("Checkpoint", "Version", 0) != VERSION:
		return null
	return checkpoint


static func write_checkpoint(id: String, flags: Dictionary[String, bool]) -> Error:
	var checkpoint := ConfigFile.new()
	checkpoint.set_value("Checkpoint", "Version", VERSION)
	checkpoint.set_value("Checkpoint", "Id", id)
	for flag in flags:
		checkpoint.set_value("Story", flag, flags[flag])
	var temporary := "%s.%d.tmp" % [SAVE_PATH, OS.get_process_id()]
	var result := checkpoint.save(temporary)
	if result == OK:
		result = DirAccess.rename_absolute(ProjectSettings.globalize_path(temporary), ProjectSettings.globalize_path(SAVE_PATH))
	if result != OK and FileAccess.file_exists(temporary):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(temporary))
	return result
