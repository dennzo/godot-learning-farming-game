class_name VectorHelper
extends Node

func does_float_start_with(input: float, starts_with: float) -> bool:
	# Check if the first digit of the y component is 0.7 or -0.7
	return (str(abs(input)).starts_with(str(starts_with)))
