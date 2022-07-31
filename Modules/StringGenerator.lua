local valid_chars = {}

local function setValid(x, y)
    for i = string.byte(x), string.byte(y) do
        table.insert(valid_chars, string.char(i))
    end
end

local function randomString(length)
    local s = {}

    for i = 1, length do s[i] = valid_chars[math.random(1, #valid_chars)] end

    return table.concat(s)
end

setValid("a", "z")
setValid("A", "Z")
setValid("0", "9")

return randomString