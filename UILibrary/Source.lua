local TweenService = game:GetService("TweenService")

local function importModuleFromId(id)
    return require(game:GetObjects(id)[1])
end

local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sleitnick/RbxUtil/main/modules/signal/init.lua", true))()
local Fusion = importModuleFromId("rbxassetid://10420227346")

local Library = {}

Library.Utility = {
    TweenBackgroundColor3 = function(self, guiObject, color, tweenTime)
        local tweenInfo = TweenInfo.new(
            tweenTime or 1,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        )

        local tween = TweenService:Create(guiObject, tweenInfo, { BackgroundColor3 = color })
        tween:Play()
    end
}

do
    local New = Fusion.New
    local Children = Fusion.Children
    local OnEvent = Fusion.OnEvent
    local State = Fusion.State
    Library.Components = {
        ["Window"] = {
            Gui = function()
                
            end,
            Element = function()
    
            end,
        },
        ["Label"] = {
            Gui = function(props)

            end,
            Element = function()

            end
        },
        ["Button"] = {
            Gui = function(props)
                local text = State(props.Text)

                local button
                button = New "TextButton" {
                    Name = "Button",
                    Font = Enum.Font.SourceSans,
                    Text = "",
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    TextSize = 14,
                    AutoButtonColor = false,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(34, 34, 34),
                    BorderSizePixel = 0,
                    Position = UDim2.fromScale(0.494, 0.0798),
                    Size = UDim2.fromOffset(405, 42),

                    [OnEvent "MouseEnter"] = function()
                        Library.Utility:TweenBackgroundColor3(button, Color3.fromRGB(37, 37, 37), 0.2)
                    end,
                    [OnEvent "MouseLeave"] = function()
                        Library.Utility:TweenBackgroundColor3(button, Color3.fromRGB(34, 34, 34), 0.2)
                    end,

                    [Children] = {
                      New "UICorner" {
                        Name = "ButtonCorner",
                        CornerRadius = UDim.new(0, 5),
                      },

                      New "TextLabel" {
                        Name = "ButtonTitle",
                        Font = Enum.Font.Gotham,
                        Text = text,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.fromScale(0.035, 0),
                        Size = UDim2.fromOffset(187, 42),
                      },
                    }
                  }

                  return {
                    GuiObject = button,
                    Functions = {
                        GetText = function()
                            return text:get()
                        end,
                        SetText = function(newText)
                            text:set(newText)
                        end,
                        Destroy = function()
                            button:Destroy()
                        end
                    },
                    Events = {
                        OnClick = button.Activated
                    }
                  }
            end,
            Element = function(gui)
                local Element = {}

                function Element:GetText()
                    return gui.Functions.GetText()
                end

                function Element:SetText(newText)
                    gui.Functions.SetText(newText)
                end

                function Element:Destroy()
                    gui.Functions.Destroy()
                end

                return Element
            end,
        }
    }
end

function Library:GetComponent(componentName)
    return self.Components[componentName]
end

function Library:CreateElement(componentName, props)
    local component = self:GetComponent(componentName)
    return component.Element(component.Gui(props or {}))
end

function Library:CreateWindow()
    local props = {}
	return self:CreateElement("Window", props)
end

return Library