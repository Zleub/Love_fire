pretty = require 'pl.pretty'

function Quadlist(tileset)
	local i = 0
	local j = 0
	local Quadlist = {}

	Quadlist[0] = love.graphics.newImage(tileset.image)
	while j < tileset.imageheight do
		i = 0
		while i < tileset.imagewidth do
			table.insert(Quadlist,
				love.graphics.newQuad(i, j, tileset.tilewidth, tileset.tileheight,
					tileset.imagewidth, tileset.imageheight))
			i = i + tileset.tilewidth
		end
		j = j + tileset.tileheight
	end

	return Quadlist
end

function mainwin()
	frame = loveframes.Create('frame')
	frame:SetScreenLocked(true)
	frame:SetResizable(true)

end

function love.load()
	loveframes = require 'loveframes'
	tiled = require 'tiled'
	tiledquads = Quadlist(tiled.tilesets[1])

	-- list = loveframes.Create("list")
	-- list:SetSize(200, love.window.getHeight())

	-- local image = loveframes.Create("image", list)
	-- image:SetImage(tiledquads[1])

	button = loveframes.Create('button')
	button:SetPos(love.window.getWidth() - button.width)
	button.OnClick = mainwin

	scale = 1
	testx = 0
	testy = 0
	movrate = 1000
end

function love.mousepressed(x, y, button)

	if button == 'wu' then
		scale = scale - 0.2
	end
	if button == 'wd' then
		scale = scale + 0.2
	end
	if button == 'l' then
		print('l')
	end
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)

	loveframes.mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	loveframes.keypressed(key, unicode)
end

function love.keyreleased(key)
	loveframes.keyreleased(key)
end

function love.textinput(text)
	loveframes.textinput(text)
end

function love.update(dt)

	-- LOVEFRAME KEEP IN UPDATE
	if list then
		list:SetSize(200, love.window.getHeight())
	end
	if button then
		button:SetPos(love.window.getWidth() - button.width)
	end
	if frame then
		frame:SetMaxWidth(love.window.getWidth())
		frame:SetMaxHeight(love.window.getHeight())
	end

	-- MAP MOVING
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		testy = testy - dt * movrate
	elseif love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		testy = testy + dt * movrate
	elseif love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		testx = testx - dt * movrate
	elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		testx = testx + dt * movrate
	end

	loveframes.update(dt)
end

function draw_isolayer(layer, offsetx, offsety)
	local i
	local j
	local k

	local m
	local n

	k = 1
	j = 0
	while j < layer.height do
		i = 1
		m = love.window.getWidth() / 2 - (tiled.tilesets[1].tilewidth / 2) * (j + 1) + offsetx
		n = 0 + (tiled.tilesets[1].tileheight / 2) * (j + 1) + offsety

		while i <= layer.width do
			if layer.data[k] ~= 0 then
				love.graphics.draw(tiledquads[0], tiledquads[ layer.data[k] ], m, n)
			end
			m = m + tiled.tilesets[1].tilewidth / 2
			n = n + tiled.tilesets[1].tileheight / 2
			i = i + 1
			k = k + 1
		end
		j = j + 1
	end
end

function love.draw()
	love.graphics.print(love.timer.getFPS(), love.graphics.getWidth() - 20, love.graphics.getHeight() - 11)
	-- love.graphics.scale(scale)
	love.graphics.print(tiled.tilesets[1].tilewidth / 2)
	for k,v in pairs(tiled.layers) do
		draw_isolayer(tiled.layers[k], testx,testy)
	end
	-- love.graphics.scale(1)
	loveframes.draw()
	-- draw_isolayer(tiled.layers[1], 0, 0)
	-- draw_isolayer(tiled.layers[2], 0, tiled.tilesets[1].tilewidth / 4)

end
