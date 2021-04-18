local Color = {}
Color.__index = Color

function Color.new(hex)
	local o = {}
	setmetatable(o, Color)
	o.r = math.floor(hex / 2 ^ 16) % 2 ^ 8
	o.g = math.floor(hex / 2 ^ 8) % 2 ^ 8
	o.b = math.floor(hex) % 2 ^ 8
	return o
end

function Color.from_rbg(r, g, b)
	local o = {}
	setmetatable(o, Color)
	o.r = r
	o.g = g
	o.b = b
	return o
end

function Color:color()
	return string.format("#%02x%02x%02x", self.r, self.g, self.b)
end

function clamp_channel(channel)
	return math.max(math.min(channel, 255), 0)
end

function Color:bright(inc)
	local c = Color.from_rbg(
		clamp_channel(self.r + inc),
		clamp_channel(self.g + inc),
		clamp_channel(self.b + inc)
	)
	return c
end

return Color
