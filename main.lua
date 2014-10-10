function love.load()
	Phases = require 'Phases':init()
	pretty = require 'pl.pretty'

	print(pretty.write(Phases))
end

function love.update(dt)
	Phases:update(dt)
end

function love.draw()
	Phases:draw()
end
