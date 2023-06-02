extends Node

@onready var displayText:Label = $DisplayText	

func _ready():
#	displayText.text="asd"
	get_tree().get_root().files_dropped.connect(_on_files_dropped)


func _on_files_dropped(files):
	#_getNames(files)
	#print(files[0])
	var list_of_jpg = []
	
	for file in files:
		var regex = RegEx.new()
		regex.compile("(.+\\\\)*(.+)\\.(.+)")
		var result = regex.search(file) # result.get_string(3) # 1= filePath; 2= file; 3=extenshion
		if result:
			var extenshion=result.get_string(3).to_lower() #JPG->jpg 
			if (extenshion=='jpg'): 
				list_of_jpg.append(file) #add jpg files to list of files
				print(result.get_string(2)) #tmp print names
				
		
		
	print(list_of_jpg.size())
	

func _getNames():
	var regex = RegEx.new()
	regex.compile("(.+\\\\)*(.+)\\.(.+)")
	var result = regex.search("D:\\_godot\\i\\Godot\\rcedit-x64.exe")
	if result:
		print(result.get_string(3)) # 1= filePath; 2= file; 3=extenshion


func _input(ev):
	if Input.is_key_pressed(4194439): #NUMPUD1 https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key
		_getNames()
#		var some_array = "D:\\_godot\\i\\Godot\\Godot_v4.1-dev4_win64.exe --rendering-driver opengl3.lnk".split("\\", false, 0)
#
#		print(some_array.size()) # Prints 3
#		print(some_array[0])     # Prints "One"
#		print(some_array[1])     # Prints "Two"
#		print(some_array[2])     # Prints "Three,Four"

