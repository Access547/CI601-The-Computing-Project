extends TileMap

const blueSelect: Vector2i = Vector2i(4,0)
const redSelect: Vector2i = Vector2i(5,0)








func RemoveTileEffect(tile: int, layer: int) -> void:
		match tile:
			0:
				erase_cell(layer, Vector2i(3, -1))
			1:
				erase_cell(layer, Vector2i(4, -1))
			2:
				erase_cell(layer, Vector2i(3, 0))
			3:
				erase_cell(layer, Vector2i(4, 0))
			4:
				erase_cell(layer, Vector2i(3, 1))
			5:
				erase_cell(layer, Vector2i(4, 1))
			6:
				erase_cell(layer, Vector2i(3, 2))
			7:
				erase_cell(layer, Vector2i(4, 2))
			_:
				pass

func SetTileEffect(tile: int):
		match tile:
			0:
				set_cell(2, Vector2i(3, -1), 0, redSelect)
			1:
				set_cell(2, Vector2i(4, -1), 0, redSelect)
			2:
				set_cell(2, Vector2i(3, 0), 0, redSelect)
			3:
				set_cell(2, Vector2i(4, 0), 0, redSelect)
			4:
				set_cell(2, Vector2i(3, 1), 0, redSelect)
			5:
				set_cell(2, Vector2i(4, 1), 0, redSelect)
			6:
				set_cell(2, Vector2i(3, 2), 0, redSelect)
			7:
				set_cell(2, Vector2i(4, 2), 0, redSelect)
			_:
				pass

func SetSelectedTile(tile: int):
	
	for i in 2:
		for j in 4:
			set_cell(1, Vector2i(i + 3, j - 1), 0, blueSelect)
	
	
	match tile:
		0:
			set_cell(1, Vector2i(3, -1), 0, redSelect)
		1:
			set_cell(1, Vector2i(4, -1), 0, redSelect)
		2:
			set_cell(1, Vector2i(3, 0), 0, redSelect)
		3:
			set_cell(1, Vector2i(4, 0), 0, redSelect)
		4:
			set_cell(1, Vector2i(3, 1), 0, redSelect)
		5:
			set_cell(1, Vector2i(4, 1), 0, redSelect)
		6:
			set_cell(1, Vector2i(3, 2), 0, redSelect)
		7:
			set_cell(1, Vector2i(4, 2), 0, redSelect)
		_:
			pass


func SetSelectedEnemyTile(tile: int):
	for i in 4:
		set_cell(1, Vector2i(7, i - 2), 0, blueSelect)
		
	match tile:
		0:
			set_cell(1, Vector2i(7, 1), 0, redSelect)
		1:
			set_cell(1, Vector2i(7, 0), 0, redSelect)
		2:
			set_cell(1, Vector2i(7, -1), 0, redSelect)
		3:
			set_cell(1, Vector2i(7, -2), 0, redSelect)
		_:
			pass


