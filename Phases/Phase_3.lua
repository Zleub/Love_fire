Phase = {}

function Phase:quit()
	love.event.quit()
end

function Phase:ft_left()
	if self.images[1].effect_name == 'center' then
		self.images[1].x = self.images[1].x + 128
		self.images[1].effect_name = 'left'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	elseif self.images[1].effect_name == 'left' then
		self.images[1].x = self.images[1].x - 256
		self.images[1].effect_name = 'right'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	elseif self.images[1].effect_name == 'right' then
		self.images[1].x = self.images[1].x + 128
		self.images[1].effect_name = 'center'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	end
end

function Phase:ft_right()
	if self.images[1].effect_name == 'center' then
		self.images[1].x = self.images[1].x - 128
		self.images[1].effect_name = 'right'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	elseif self.images[1].effect_name == 'right' then
		self.images[1].x = self.images[1].x + 256
		self.images[1].effect_name = 'left'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	elseif self.images[1].effect_name == 'left' then
		self.images[1].x = self.images[1].x - 128
		self.images[1].effect_name = 'center'
		self.images[1].effect:send(
			"img",
			self.shaders[self.images[1].effect_name]
		)
	end
end

function Phase:init()
	self.id = 3
	self.name = 'New_Game'
	self.images = {
		{
			image = love.graphics.newImage('Images/HeroSelection.png'),
			effect_name = 'center',
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
						return img_color;
					else
						{
							img_color.a = 0;
							return img_color;
						}
				}
			]],
			scale = 1,
			x = 128,
			y = 128
		}
	}
	self.kb_events = {
		escape = self.quit,
		left = self.ft_left,
		right = self.ft_right
	}
	self.shaders = {
		left = love.graphics.newImage('Images/HeroSelectionLeft.png'),
		center = love.graphics.newImage('Images/HeroSelectionCenter.png'),
		right = love.graphics.newImage('Images/HeroSelectionRight.png')
	}

	self.images[1].effect:send("img", self.shaders[self.images[1].effect_name])
end

return Phase
