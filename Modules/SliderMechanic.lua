local UserInputService = game:GetService("UserInputService")

local Signal = loadstring(game:HttpGet('https://raw.githubusercontent.com/Sleitnick/RbxUtil/main/modules/signal/init.lua', true))()

local SliderMechanic = {}
SliderMechanic.__index = SliderMechanic

function SliderMechanic.new(bar, circle, min, max, initial, increment)
    local self = {}
    self.Bar = bar
    self.Circle = circle
    self.Current = initial or min
    self.Min = min or 0
    self.Max = max or 0
    self.MouseHold = false
    self.ValueChanged = Signal.new()

    setmetatable(self, SliderMechanic)

    self.InputBegan = circle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.MouseHold = true
        end
    end)

    self.InputBegan2 = bar.Parent.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self:Recalculate()
        end
    end)

    self.InputChanged = UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and self.MouseHold then
            self:Recalculate()
        end
    end)

    self.InputEnded = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.MouseHold  = false
        end
    end)

    return self
end

function SliderMechanic:Recalculate()
    local mouseLocation = UserInputService:GetMouseLocation()
    local yScale = self.Bar.Size.Y.Scale
    local parentSize = self.Bar.Parent.AbsoluteSize
    local newSize = UDim2.new(0, math.clamp((self.Bar.Position - mouseLocation).X, 0, parentSize.X), yScale, 0)
    self.ValueChanged:Fire(newSize.X.Offset/parentSize.X)
end

function SliderMechanic:Destroy()
    self.InputBegan:Disconnect()
    self.InputBegan2:Disconnect()
    self.InputChanged:Disconnect()
    self.InputEnded:Disconnect()
    self.ValueChanged:Destroy()
end

return SliderMechanic