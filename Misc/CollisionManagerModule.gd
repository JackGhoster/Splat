extends Area2D

@export var particles : GPUParticles2D

var gemLayer = 4
var spikeLayer = 8
var lastGem = null

func _on_area_entered(area):
	if area.collision_layer == gemLayer:
		GemLogic(area)
		
	elif area.collision_layer == spikeLayer:
		SpikeLogic()

func GemLogic(area):
	GameManager.score += 1
	print(GameManager.score)
	particles = area.get_node("GPUParticles2D")
	area.get_node("CollisionShape2D").disabled = true
	particles.emitting = true
	lastGem = area
	await get_tree().create_timer(1).timeout
	if lastGem != null:
		area.queue_free()
		lastGem = null
		
func SpikeLogic():
	get_tree().reload_current_scene()
