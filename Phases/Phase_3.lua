function quit()
	love.event.quit()
end

return {
	id = 3,
	name = 'New_Game',
	images = {
		{
			path = 'Images/Hero1.png',
			image = love.graphics.newImage('Images/Hero1.png'),
			scale = 1,
			x = 200,
			y = 100
		},
		{
			path = 'Images/Hero2.png',
			image = love.graphics.newImage('Images/Hero2.png'),
			scale = 1,
			x = 400,
			y = 100
		},
		{
			path = 'Images/Hero3.png',
			image = love.graphics.newImage('Images/Hero3.png'),
			scale = 1,
			x = 600,
			y = 100
		}


	},
	kb_events = {
		escape = quit
	}
}
