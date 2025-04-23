extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var stone_scene: PackedScene = preload('res://scenes/objects/rocks/stone.tscn')

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter('shake_intensity', 0.6)
	await get_tree().create_timer(0.50).timeout
	material.set_shader_parameter('shake_intensity', 0.0)

func on_max_damage_reached() -> void:
	call_deferred('add_stone_scene')
	queue_free()

func add_stone_scene() -> void:
	# instanciate a rock node
	var stone_instance: Node2D = stone_scene.instantiate() as Node2D
	# set the rock to the current position of the rock
	stone_instance.global_position = global_position
	# add to parent node where the rock is
	get_parent().add_child(stone_instance)
	
