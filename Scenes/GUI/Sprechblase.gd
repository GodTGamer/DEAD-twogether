extends Control


var text_count = 0
export var level = 1
onready var bz = $Textboxen/ZombieBox
onready var bg = $Textboxen/GeistBox
onready var b = $Textboxen/Textbox


#onready var textlabel = $RichTextLabel.text

onready var Level1 = ["....", "Yawn", "I feel so light today. Did the diet work?", 
						"*the ghost looks at itself*", "Oh.", "Ohhhhhhhh!", "Crap. What happened?", 
						"Does that mean, I can float through walls and stuff?", "Let me try",
						"Press W-A-S-D to move", 
						"A Zombie in my house? Oh no...", "Braaains!", "Wait a second..", "Braaains!", "He looks oddly familiar", "Braaains!",
						"Oh no. How... is that even possible?", "That's me!", "Or am I him?", "Braaaaaaaaains!!!", "Will you shut it. We where a lawyer, for spook's shake!",
						"Brains.", "This... is so embarrassing.", "I'm just messing with you.", "You can talk?", "Of course I can, I am you!", "Or are you me?", 
						"I literally asked the same question earlier...", "Whatever.", "Any idea how we ended up here?", 
						"Nope. Woke up some time ago and was trapped inside here.", "Speaking of which, can you push me down the key for the door?", 
						"I guess so", "Braaains", "Oh will you stop it?!?", "Press F to interact with small objects", 
						"Press SHIFT to switch between characters",  
						"Are those rats?", "Can you scare them away?", "Can't you just eat them? You're a zombie now remember?", "First off, they taste awful.", 
						"Secondly, they are the ones who gonna eat me", "So just scare them away, will yea?", "Fine... I'll try", "Press Q as a ghost to scare little animals", 
						"Would you look at that. Another you!", "He seems dangerous.", 
						"And that's not me, nor you.", "You're a zombie yourself, why don't you take care of that problem for us?", "Can't.", "And why can't you?", 
						"Because we were lawyers in our last life, not bodybuilders.", "We should have done more work out", "Urg... fine...", "Maybe I can help.", 
						"Awfully nice today, aren't we.", "Not that this would be something new for us.", "So... what happend?", "Besides the zombie-ghost thing.", "How did we die?", 
						"Just look outside the door.", "Maybe that will help you remember.", "...", "Oh... right.", "The nuclear war.", "Whatever.", "Whatever?", "Not like the world was saveable.", 
						"With all the exploitation, climate change and stuff...", "Was I always this negative?"]

onready var Level2 = ["....", "Wow, this is bad...", "Yeah, where are all the people?", "Is everybody gone?", "Even the children that used to play on the streets...", "Actually I meant the broken power cables...", 
						"I cant pass them.", "Dude, you are so heartless.", "I'm sorry but I have bigger problems right now!", "Could you do something about the electricity?", "I can switch off this one right here", 
						"but I'll need a leaver for the other one up there."]
onready var Level3 = ["....", "Finally we left the city.", "Yeah, the forest is so peaceful...", "And quiet...", "Look at the-", "SSSHHH!", "Shut up I'm trying to relax!", "We need to keep going!", "Ugh, okay...", 
						"We need to get to the mineshaft.", "It'll lead us through the mountain", "and to the other side of the city.", "What do we want there?", "You will see.", "Let's get through the forest.", 
						"Theres a big ass spider, I AM NOT going near that thing.", "You need to take care of that.", "Press F to tear the spiderweb."]
						
onready var Level4 = ["....", "So this is where you wanted to lead me?", "A grave yard?", "That is correct.", "Why in the ending worlds name would I want to be here?", "Well, because it's not the first time.", "At least for me.", 
						"...", "So this is the place where we were buried.", "When I woke up in this.... lost world.", "I felt a part of me was missing.", "So you searched for me.", "I searched for anything.", "Didn't expect to find a ghost version of myself, tho.", 
						"At least you didn't turn out to be a haunt, or a wraith.", "Just your average little ghost.", "Not even after death I am something special.", " That's typically me.", "And you too, you boring old zombie.", "At least I have learned to have a little fun.", 
						"There is one thing I wanted to ask.", "How long have you been looking for me.", "Well.. Maybe a decade.", "Lost count eventually", "I would've got bored eventually.", "I doubt that.", "Do you remember your dedication to be a lawyer.", "Yes, but that was a long ago.", 
						"You wanted to help others, because you couldn't save your friend.", "Please don't remind me.", "What I am trying to say is...", "You weren't as bad as you always thought you'd be.", "Sigh... And your are telling me this why?", "Because neither you and I can move on, without each other.", 
						"We can't move on to whatever awaits us after this alone.", "We are two parts of the same coin.", "Why am I like this?"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var box_level_1 = [Color.white, Color.aqua, Color.aqua, Color.aqua, Color.aqua, Color.aqua, Color.aqua, Color.aqua, Color.aqua, 
							Color.white, Color.aqua, Color.green, Color.aqua, Color.green, Color.aqua, Color.green,
							 Color.aqua, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.green, Color.aqua, Color.green, Color.aqua,
							Color.green, Color.green, Color.aqua, Color.aqua, Color.aqua, Color.green, Color.green, Color.aqua, Color.green, Color.aqua,
							Color.white, Color.white, Color.green, Color.green, Color.aqua, Color.green, Color.green, Color.green, Color.aqua,
							Color.white, Color.aqua, Color.green, Color.green, Color.aqua, Color.green, Color.aqua, Color.green, Color.green,
							Color.aqua, Color.aqua, Color.green, Color.green, Color.aqua, Color.aqua, Color.aqua, Color.green, Color.green, 
							Color.aqua, Color.aqua, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.aqua, Color.green]
	
onready var box_level_2 = [Color.white, Color.aqua, Color.green, Color.green, Color.green, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.aqua, Color.green, Color.green]

onready var box_level_3 = [Color.white, Color.green, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.green, Color.green, Color.green, Color.aqua, Color.green, Color.green, Color.aqua, Color.aqua, Color.white]

onready var box_level_4 = [Color.white, Color.aqua, Color.aqua, Color.green, Color.aqua, Color.green, Color.green, Color.aqua, Color.aqua, 
							Color.green, Color.green, Color.aqua, Color.green, Color.green, Color.green, Color.green, Color.aqua, Color.aqua, Color.aqua, 
							Color.green, Color.aqua, Color.aqua, Color.green, Color.green, Color.aqua, Color.green, Color.green, Color.aqua, Color.green, Color.aqua, 
							Color.green, Color.green, Color.aqua, Color.green, Color.green, Color.green, Color.aqua]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	$Textboxen/RichTextLabel.add_font_override()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ForewardButton_pressed():
	if level == 1:
		if text_count >= 0 and text_count < Level1.size() - 1:
			text_count += 1
	#show_speacker()
			$Textboxen/RichTextLabel.text = Level1[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_1[text_count])
	#print($RichTextLabel.text)
	elif level == 2:
		if text_count >= 0 and text_count < Level2.size() - 1:
			text_count += 1
			$Textboxen/RichTextLabel.text = Level2[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_2[text_count])
	elif level == 3:
		if text_count >= 0 and text_count < Level3.size() - 1:
			text_count += 1
			$Textboxen/RichTextLabel.text = Level3[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_3[text_count])
	elif level == 4:
		if text_count >= 0 and text_count < Level4.size() - 1:
			text_count += 1
			$Textboxen/RichTextLabel.text = Level4[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_4[text_count])


func _on_BackButton_pressed():
	if level == 1:
		if text_count > 0 and text_count < Level1.size():
			text_count -= 1
			$Textboxen/RichTextLabel.text = Level1[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_1[text_count])
	elif level == 2:
		if text_count > 0 and text_count < Level2.size():
			text_count -= 1
			$Textboxen/RichTextLabel.text = Level2[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_2[text_count])
	elif level == 3:
		if text_count > 0 and text_count < Level3.size():
			text_count -= 1
			$Textboxen/RichTextLabel.text = Level3[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_3[text_count])
	elif level == 4:
		if text_count > 0 and text_count < Level4.size():
			text_count -= 1
			$Textboxen/RichTextLabel.text = Level4[text_count]
			$Textboxen/RichTextLabel.add_color_override("default_color", box_level_4[text_count])

#func show_speacker():
#	if text_count >= 1:
#		var hider = box_level_1[text_count - 1]
#		hider.hide()
#	box_level_1[text_count].show()
