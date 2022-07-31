local TweenService = game:GetService("TweenService")

local function importModuleFromId(id)
    return require(game:GetObjects(id)[1])
end

local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sleitnick/RbxUtil/main/modules/signal/init.lua", true))()

local Library = {}

Library.Utility = {
    TweenBackgroundColor3 = function(self, guiObject, color, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {BackgroundColor3 = color})
        tween:Play()
    end
}

do
    Library.Components = {
        ["Window"] = {
            Gui = function()
            end,
            Element = function()
            end
        },
        ["Label"] = {
            Gui = function(props)
                local label = Instance.new("Frame")
                label.Name = "Label"
                label.AnchorPoint = Vector2.new(0.5, 0.5)
                label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                label.Size = UDim2.fromOffset(405, 42)

                local labelCorner = Instance.new("UICorner")
                labelCorner.Name = "LabelCorner"
                labelCorner.CornerRadius = UDim.new(0, 5)
                labelCorner.Parent = label

                local labelTitle = Instance.new("TextLabel")
                labelTitle.Name = "LabelTitle"
                labelTitle.Font = Enum.Font.Gotham
                labelTitle.Text = props.Text
                labelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                labelTitle.TextSize = 14
                labelTitle.TextXAlignment = Enum.TextXAlignment.Left
                labelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                labelTitle.BackgroundTransparency = 1
                labelTitle.BorderSizePixel = 0
                labelTitle.Position = UDim2.fromScale(0.035, 0)
                labelTitle.Size = UDim2.fromOffset(187, 42)
                labelTitle.Parent = label

                return {
                    GuiObject = label,
                    Functions = {
                        GetText = function()
                            return labelTitle.Text
                        end,
                        SetText = function(newText)
                            labelTitle.Text = newText
                        end,
                        Destroy = function()
                            label:Destroy()
                        end
                    },
                    Events = {}
                }
            end,
            Element = function()
            end
        },
        ["Button"] = {
            Gui = function(props)
                local button = Instance.new("TextButton")
                button.Name = "Button"
                button.Font = Enum.Font.SourceSans
                button.Text = ""
                button.TextColor3 = Color3.fromRGB(0, 0, 0)
                button.TextSize = 14
                button.AutoButtonColor = false
                button.AnchorPoint = Vector2.new(0.5, 0.5)
                button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                button.BorderSizePixel = 0
                button.Position = UDim2.fromScale(0.494, 0.0798)
                button.Size = UDim2.fromOffset(405, 42)

                local buttonCorner = Instance.new("UICorner")
                buttonCorner.Name = "ButtonCorner"
                buttonCorner.CornerRadius = UDim.new(0, 5)
                buttonCorner.Parent = button

                local buttonTitle = Instance.new("TextLabel")
                buttonTitle.Name = "ButtonTitle"
                buttonTitle.Font = Enum.Font.Gotham
                buttonTitle.Text = props.Text
                buttonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                buttonTitle.TextSize = 14
                buttonTitle.TextXAlignment = Enum.TextXAlignment.Left
                buttonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttonTitle.BackgroundTransparency = 1
                buttonTitle.BorderSizePixel = 0
                buttonTitle.Position = UDim2.fromScale(0.035, 0)
                buttonTitle.Size = UDim2.fromOffset(187, 42)
                buttonTitle.Parent = button

                button.MouseEnter:Connect(function()
                    Library.Utility:TweenBackgroundColor3(button, Color3.fromRGB(37, 37, 37), 0.2)
                end)

                button.MouseLeave:Connect(function()
                    Library.Utility:TweenBackgroundColor3(button, Color3.fromRGB(34, 34, 34), 0.2)
                end)

                return {
                    GuiObject = button,
                    Functions = {
                        GetText = function()
                            return buttonTitle.Text
                        end,
                        SetText = function(newText)
                            buttonTitle.Text = newText
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
            end
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
