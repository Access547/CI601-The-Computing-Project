extends TextureRect


@onready var bar: ProgressBar = $bar
@onready var label: RichTextLabel = $bar/label

var character: Character
var charFrame: Texture
var charAtlas: AtlasTexture


func loadChars() -> void:
	character = get_parent().get_parent().get_parent().characters[name.to_int()]
	character.Damaged.connect(Update)
	charAtlas = AtlasTexture.new()
	charAtlas.atlas = character.sprite.texture
	charAtlas.region = Rect2(0,0,32,32)
	print(str(character))
	charFrame = charAtlas
	texture = charAtlas
	label.text = str(character.health, "/", character.maxHealth)
	bar.value = (character.health / character.maxHealth) * 100


func Update(amount) -> void:
	label.text = str(character.health, "/", character.maxHealth)
	bar.value = (float(character.health) / float(character.maxHealth)) * 100
