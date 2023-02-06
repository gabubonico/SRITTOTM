extends Button

const READ_TEXT_RATE = 0.05
var bad_ending = false
var convo
var index

# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0
	$a.hide()
	$b.hide()
	convo = ["ey","al final si que has venido","...","no te preocupes",
	"no eres el primero en pasar por aquí","tampoco serás el último","...",
	"tienes la cara completamente roja","no te preocupes",
	"no tienes por qué avergonzarte","ya eres mayor, ¿no?",
	"supongo que ya te habrás dado cuenta pero",
	"al final del dia vivir no deja de ser nada más que una elección",
	"todo el mundo elige si lo piensas","...","bueno","¿estás llorando?",
	"ya, ya. lo siento","no es nada fácil esto","como iba diciendo",
	"es cierto que todo el mundo elige","y yo creo que en cierto modo",
	"eso nos hace libres, creo","siempre tendremos a lo lejos un faro",
	"de que algun dia las cosas serán mejor","y que nos mueve a ir hacia él",
	"esta claro que a veces no lo vemos",
	"'lo mejor esta por llegar!' suelen decir",
	"...","en realidad no hay un final",
	"...","supongo que tendrás frio","no te quiero retener más",
	"te ha tenido que costar mucho subir hasta aquí","pero aun así","no dejes que la gravedad te gane",
	"'¡sopla sobre mi, viento solar!'","...","no voy a intentar convencerte",
	"solo quería ser honesto contigo","en el fondo sé","que ya has elegido"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("debug"):
		get_tree().change_scene("res://endgame.tscn")



func _on_conversation_pressed():
	if bad_ending:
		$Label.text = "................................."
		yield(get_tree().create_timer(1.5),"timeout")
		$ending.show()
	else:
		$Label.text = convo[index]
		index += 1
		
	if $Label.text == "que ya has elegido":
		index -= 1
		ends()
	# tf is a tween
	$Tween.interpolate_property($Label, "percent_visible", 0.0, 1.0, len($Label.text) * READ_TEXT_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()


func ends():
	$a.show()
	$b.show()


func _on_b_pressed():
	$a.hide()
	$b.hide()
	$trollsprite.stop()
	$Label.text = "..."
	bad_ending = true


func _on_a_pressed():	
	get_tree().change_scene("res://scenes/main.tscn")
