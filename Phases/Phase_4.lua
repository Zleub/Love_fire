Phase = {}

function Phase:init()
	self.id = 4
	self.name = 'Load_Game'
	self.music = love.audio.newSource("Musics/Delivering-the-Goods.mp3")
end

return Phase
