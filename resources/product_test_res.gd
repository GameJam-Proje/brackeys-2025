class_name ProductTestRes
extends Resource

@export var label: String
@export var test_parameter: ParameterRes

@export var expected_value = 0.0

enum Operator {
	EQUAL
}
@export var operator: Operator


func is_passed() -> bool:
	var actual_value = test_parameter.value
	
	match operator:
		Operator.EQUAL:
			return actual_value == expected_value
		_:
			return false
			
