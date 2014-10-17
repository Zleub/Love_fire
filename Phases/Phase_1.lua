function next_phase(currentPhase)
	return 'next_phase', 2
end

return {
	id = 1,
	name = 'Phase_1',
	images = {
		{
			image = love.graphics.newImage('Images/logo.png'),
			scale = 0.2,
			x = 200,
			y = 100
		}
	},
	texts = {
		{
			string = 'Press Start',
			x = 500,
			y = 500
		}
	},
	kb_events = {
		space = next_phase,
		enter = next_phase
	},
}
