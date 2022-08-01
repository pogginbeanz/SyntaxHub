local RunService = game:GetService("RunService")

local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject = {}
DraggableObject.__index = DraggableObject

function DraggableObject.new(Object, Topbar)
    local self = {}
    self.Object = Object
    self.Topbar = Topbar
    self.Enabled = false
    self.DragOffset = Vector2.zero
    self.Dragging = false

    setmetatable(self, DraggableObject)

    return self
end

function DraggableObject:Enable()
    local object = self.Object
    local topbar = self.Topbar

    local function update()
        local vector = self.DragOffset + UserInputService:GetMouseLocation()
        local position = UDim2_new(0, vector.X, 0, vector.Y)
        object.Position = position
    end

    self.InputBegan = topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.DragOffset = object.AbsolutePosition - UserInputService:GetMouseLocation()
            self.Dragging = true
        end
    end)

    self.InputChanged = UserInputService.InputChanged:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement and self.Dragging then
            update()
        end
    end)

    self.InputEnded = UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self.Dragging = false
        end
    end)

    self.Enabled = true
end

function DraggableObject:Disable()
    self.InputBegan:Disconnect()
    self.InputChanged:Disconnect()
    self.InputEnded:Disconnect()
    self.Enabled = false
end

return DraggableObject