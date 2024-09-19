extends Node2D
@onready var peg = preload("res://peg.tscn")
@onready var disc = preload("res://disc.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(48):
		var newPeg = peg.instantiate()
		var x_pos = (20*(1+fmod(ceil(i/6),2)))+(80*(fmod(i,6)))+(20*fmod(ceil(i/6),2))
		var y_pos = 110+(75*ceil(i/6))
		newPeg.position = Vector2(x_pos,y_pos)
		# i=1,1(20,110),2,1(100,110),3,1(180,110),4,1(260,110),5,1(340,110),6,1(420,110)
		# i=7,2(60,220),8,2(140,220),9,2(220,220),10,2(300,220),11,2(380,220),12,2(460,220)
		# i=13
		$Pegs.add_child(newPeg)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var newDisc = disc.instantiate()
		newDisc.position = event.position
		$Discs.add_child(newDisc)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
