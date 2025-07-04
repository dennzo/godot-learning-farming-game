extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene: PackedScene = preload('res://scenes/objects/trees/log.tscn')

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter('shake_intensity', 1.0)
	await get_tree().create_timer(0.6).timeout
	material.set_shader_parameter('shake_intensity', 0.0)

func on_max_damage_reached() -> void:
	call_deferred('add_log_scene')
	queue_free()

func add_log_scene() -> void:
	# instanciate a log node
	var log_instance: Node2D = log_scene.instantiate() as Node2D
	# set the log to the current position of the tree
	log_instance.global_position = global_position
	# add to parent node where the tree is
	get_parent().add_child(log_instance)
	
