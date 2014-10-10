function new_game()
	print('new_game')
end

function load_game()
	print('load_game')
end

function option()
	print('option')
end

function quit()
	love.event.quit()
end

function keydown(currentPhase)
	currentPhase.bt_position = currentPhase.bt_position + 1
	if currentPhase.bt_position > currentPhase.bt_position_max then
		currentPhase.bt_position = 1
	end
end

function keyup(currentPhase)
	currentPhase.bt_position = currentPhase.bt_position - 1
	if currentPhase.bt_position < 1 then
		currentPhase.bt_position = currentPhase.bt_position_max
	end
end

function validate(currentPhase)
	currentPhase.bt_events[currentPhase.bt_position]()
end

return {
	id = 2,
	name = 'Phase_2',
	bt_position = 1,
	bt_position_max = 3,
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
	shapes = { -- require position
		{
			shape = 'rectangle',
			x = 500,
			y = 300,
			width = 100,
			height = 75
		},
		{
			shape = 'rectangle',
			x = 500,
			y = 400,
			width = 100,
			height = 75
		},
		{
			shape = 'rectangle',
			x = 500,
			y = 500,
			width = 100,
			height = 75
		}
	},
	bt_events = {
		new_game,
		load_game,
		option
	},
	kb_events = {
		escape = quit,
		up = keyup,
		down = keydown,
		enter = validate
	}
}
