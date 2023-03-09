extends CharacterBody2D

@export var landingParticles : GPUParticles2D

func _process(delta):
	pass



func _on_particle_emmiter_body_entered(body):
	landingParticles.emitting = true
