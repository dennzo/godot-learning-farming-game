class_name GameInputEvent

static var direction: Vector2

static func movement_input() -> Vector2:
	# allow movement input in all directions, even diagonal
	direction = Input.get_vector('walk_left', 'walk_right', 'walk_up', 'walk_down')
	
	return direction
	
	# Below is only linear movement up, down, left and right
	#if Input.is_action_pressed('walk_up'):
		#direction = Vector2.UP
	#elif Input.is_action_pressed('walk_down'):
		#direction = Vector2.DOWN
	#elif Input.is_action_pressed('walk_left'):
		#direction = Vector2.LEFT
	#elif Input.is_action_pressed('walk_right'):
		#direction = Vector2.RIGHT
	#else:
		#direction = Vector2.ZERO
				#
	#return direction

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	else:
		return true

static func use_tool() -> bool:
	var use_tool_value: bool = Input.is_action_just_pressed('hit')
	
	return use_tool_value
