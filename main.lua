local function main()
do
local wrap, yield = coroutine.wrap, coroutine.yield

local function putrev(w)
if w then
putrev(yield())
io.write(w)
end
end

function prevchar(s)
local p = wrap(putrev)
p"\n"
string.gsub(s, ".",p)
p()
end

function prevword(s)
local p = wrap(putrev)
local function q(a, b) p(a) p(b) end
p"\n"
string.gsub(s, "(%S+)(%s*)", q)
p()
end
end

prevchar ("This is a test")
prevchar ("Hello my name is Krystal")

end
main()
