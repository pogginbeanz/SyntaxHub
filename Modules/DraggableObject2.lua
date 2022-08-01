local UDim2_new = UDim2.new

local UserInputService = game:GetService("UserInputService")

local DraggableObject = {}
DraggableObject.__index = DraggableObject

function DraggableObject.new(Object, Topbar)
    local self = {}
    self.Object = Object
    self.Topbar = Topbar
    self.DragOffset = Vector2.zero
    self.Dragging = false
    self.DraggingEnabled = false

    setmetatable(self, DraggableObject)

    return self
end

function DraggableObject:Enable()
    local object = self.Object
    local topbar = self.Topbar

    self.InputBegan = topbar.InputBegan:Connect(function(input)
        self.DragOffset = UserInputService:GetMouseLocation() - object.AbsolutePosition
    end)

    self.DraggingEnabled = true
end

function DraggableObject:Disable()

end

return DraggableObject