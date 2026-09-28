extends Node3D

# รายชื่อท่าจากไลบรารีที่มีอยู่ในโปรเจกต์
var anim_list: Array[String] = [
	"Melee-Library--OLD/EquipR",
	"Melee-Library--OLD/Fall",
	"Melee-Library--OLD/run",
	"Melee-Library--OLD/SlashATK1",
	"Melee-Library--OLD/HeavyATK1",
	"Melee-Library--OLD/SlashATK2"
]

func _ready() -> void:
	# รายชื่อตัวละครทั้ง 6 ตัว
	var characters = [
		$"Body Block",
		$"Body Block2",
		$"Body Block3",
		$"Body Block4",
		$"Body Block5",
		$"Body Block6"
	]
	
	for i in range(characters.size()):
		var char_node = characters[i]
		# เข้าถึงโหนด AnimationPlayer ภายในตัวละคร
		var anim_player: AnimationPlayer = char_node.get_node_or_null("AnimationPlayer")
		
		if anim_player:
			var target_anim = anim_list[i % anim_list.size()]
			# ตรวจสอบว่าแอนิเมชันพร้อมเล่นหรือไม่
			if anim_player.has_animation(target_anim):
				anim_player.play(target_anim)
