Collider = require 'hardoncollider'
pretty = require 'pl.pretty'

Phases = {}

function Phases.convert(key)
	if key == 'space' then
		return ' '
	elseif key == 'enter' then
		return 'return'
	else
		return key
	end
end

function Phases:HCrefresh(phase)
	self.HC:clear()

	if phase.shape then
		for k,v in pairs(phase.shapes) do
			if v.shape == 'rectangle' then
				phase.shapes[k] = self.HC:addRectangle(v.x, v.y, v.width, v.height)
			end
		end
	end
end

function Phases:getPhase(id)
	for key, phase in pairs(self.list) do
		if phase.id == id then
			self:HCrefresh(phase)
			return phase
		end
	end
end

function Phases:update(dt)
	local msg = nil
	local data = nil

	if self.current.kb_events then
		for key, ft in pairs(self.current.kb_events) do
			key = Phases.convert(key)

			if love.keyboard.isDown(key) then
				msg, data = ft(self.current)
			end
		end
	end

	if msg == 'next_phase' then
		self.current = self:getPhase(data)
	end
end

function Phases:require(files)
	local tmp

	for k,v in pairs(files) do
		tmp = string.sub(v, 1, -5)
		self.list[tmp] = require ('Phases/'..tmp)
	end
end

function Phases:init()
	local files = love.filesystem.getDirectoryItems("Phases")

	if files == nil then
		print('no phases')
		love.event.quit()
	else
		self.list = {}
		self.HC = Collider.new(150)

		self:require(files)
		self.current = self:getPhase(1)
		return self
	end
end

function Phases:draw()
	if self.current.shapes then
			pretty.dump(self.current.shapes)
		for k,v in pairs(self.current.shapes) do
			v:draw('line')
		end
	end

	if Phases.current.images then
		for k,v in pairs(Phases.current.images) do
			love.graphics.draw(v.image, v.x, v.y, 0, v.scale, v.scale)
		end
	end

	if Phases.current.texts then
		for k,v in pairs(Phases.current.texts) do
			love.graphics.print(v.string, v.x, v.y, 0, v.scale, v.scale)
		end
	end
end

return Phases
