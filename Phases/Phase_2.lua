function new_game()
	print('new_game')
end

function load_game()
	print('load_game')
end

function option()
	print('option')
end

return {
	id = 2,
	name = 'Phase_2',
	texts = {
		{
			string = 'New Game',
			x = 500,
			y = 300
		},
		{
			string = 'Load Game',
			x = 500,
			y = 400
		},
		{
			string = 'Option',
			x = 500,
			y = 500
		}
	},
	shapes = {
		{
			shape = 'rectangle',
			x = 500,
			y = 300,
			width = 100,
			height = 75
		}
	}
}
