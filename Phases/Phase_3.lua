function quit()
	love.event.quit()
end

function ft_left(currentPhase)
	if currentPhase.images[1].effect_name == 'select' then
		currentPhase.images[1].x = currentPhase.images[1].x + 128
		currentPhase.images[1].effect_name = 'left'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	elseif currentPhase.images[1].effect_name == 'left' then
		currentPhase.images[1].x = currentPhase.images[1].x - 256
		currentPhase.images[1].effect_name = 'right'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	elseif currentPhase.images[1].effect_name == 'right' then
		currentPhase.images[1].x = currentPhase.images[1].x + 128
		currentPhase.images[1].effect_name = 'select'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	end
end

function ft_right(currentPhase)
	if currentPhase.images[1].effect_name == 'select' then
		currentPhase.images[1].x = currentPhase.images[1].x - 128
		currentPhase.images[1].effect_name = 'right'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	elseif currentPhase.images[1].effect_name == 'right' then
		currentPhase.images[1].x = currentPhase.images[1].x + 256
		currentPhase.images[1].effect_name = 'left'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	elseif currentPhase.images[1].effect_name == 'left' then
		currentPhase.images[1].x = currentPhase.images[1].x - 128
		currentPhase.images[1].effect_name = 'select'
		currentPhase.images[1].effect:send(
			"img",
			currentPhase.shaders[currentPhase.images[1].effect_name]
		)
	end
end

return {
	id = 3,
	name = 'New_Game',
	images = {
		{
			image = love.graphics.newImage('Images/HeroSelection.png'),
			effect_name = 'select',
			effect = love.graphics.newShader [[
				extern Image img;
				vec4 effect(vec4 color,Image tex,vec2 tc,vec2 pc)
				{
					vec4 img_color = Texel(tex,tc);
					vec4 trans_color = Texel(img,tc);

					number white_level   = (
						trans_color.r + trans_color.g + trans_color.b
						) / 3;
					number max_white   = 1;

					if (white_level >= max_white)
					{
						return img_color;
					}

					img_color.a = 0;
					return img_color;
				}
			]],
			scale = 1,
			x = 128,
			y = 128
		}
	},
	kb_events = {
		escape = quit,
		left = ft_left,
		right = ft_right
	},
	shaders = {
		left = love.graphics.newImage('Images/HeroSelectionLeft.png'),
		select = love.graphics.newImage('Images/HeroSelectionCenter.png'),
		right = love.graphics.newImage('Images/HeroSelectionRight.png')
	}
}
