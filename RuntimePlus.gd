extends Node

@onready var runtime_selector: Node3D = $Window/RuntimeSelector
@onready var window: Window = $Window
@onready var free_camera: FreeLookCamera = $Window/FreeCamera

var window_pos
var first_time = true

func _ready() -> void:
	var settings_path := "display/window/subwindows/embed_subwindows"
	# Delete if you don't care
	if ProjectSettings.get_setting(settings_path):
		print("`Embed Subwindows` is recommended to be OFF in Project Settings")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_F1:
		show_window()

func show_window() -> void:
	if window.visible: return
	window.show()
	if first_time:
		var camera_3d = get_viewport().get_camera_3d()
		free_camera.teleport(camera_3d.transform)
		first_time = false
	else:
		window.position = window_pos

func close_window() -> void:
	window_pos = window.position
	window.hide()
