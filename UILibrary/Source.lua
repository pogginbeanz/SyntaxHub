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
            Gui = function(props)
                local main = Instance.new("Frame")
                main.Name = "Main"
                main.AnchorPoint = Vector2.new(0.5, 0.5)
                main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                main.BorderSizePixel = 0
                main.Position = UDim2.fromScale(0.499, 0.473)
                main.Size = UDim2.fromOffset(560, 319)

                local tabFolder = Instance.new("Folder")
                tabFolder.Name = "TabFolder"
                tabFolder.Parent = main

                local tabHold2 = Instance.new("Frame")
                tabHold2.Name = "TabHold2"
                tabHold2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                tabHold2.BorderSizePixel = 0
                tabHold2.Position = UDim2.new(0, 0, 0.089, 1)
                tabHold2.Size = UDim2.fromOffset(126, 289)

                local tabHold = Instance.new("Frame")
                tabHold.Name = "TabHold"
                tabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tabHold.BackgroundTransparency = 1
                tabHold.Position = UDim2.fromScale(0.05, 0.0262)
                tabHold.Size = UDim2.fromScale(0.95, 0.976)

                local tabHoldLayout = Instance.new("UIListLayout")
                tabHoldLayout.Name = "TabHoldLayout"
                tabHoldLayout.Padding = UDim.new(0, 4)
                tabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
                tabHoldLayout.Parent = tabHold

                tabHold.Parent = tabHold2

                tabHold2.Parent = main

                local topbar = Instance.new("Frame")
                topbar.Name = "Topbar"
                topbar.AnchorPoint = Vector2.new(0.5, 0)
                topbar.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                topbar.BorderSizePixel = 0
                topbar.Position = UDim2.fromScale(0.5, 0)
                topbar.Size = UDim2.new(1, 0, 0, 28)

                local title = Instance.new("TextLabel")
                title.Name = "Title"
                title.Font = Enum.Font.GothamMedium
                title.Text = ("%s - %s"):format(props.Name, props.GameName)
                title.TextColor3 = Color3.fromRGB(255, 255, 255)
                title.TextSize = 13
                title.TextWrapped = true
                title.TextXAlignment = Enum.TextXAlignment.Left
                title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                title.BackgroundTransparency = 1
                title.BorderSizePixel = 0
                title.Position = UDim2.fromOffset(8, 3)
                title.Size = UDim2.fromScale(0.357, 0.821)
                title.ZIndex = 2
                title.Parent = topbar

                local buttons = Instance.new("Frame")
                buttons.Name = "Buttons"
                buttons.AnchorPoint = Vector2.new(1, 0)
                buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttons.BackgroundTransparency = 1
                buttons.BorderSizePixel = 0
                buttons.Position = UDim2.fromScale(1, 0)
                buttons.Size = UDim2.fromOffset(121, 27)

                local close = Instance.new("TextButton")
                close.Name = "Close"
                close.Font = Enum.Font.SourceSans
                close.Text = ""
                close.TextColor3 = Color3.fromRGB(0, 0, 0)
                close.TextSize = 14
                close.AutoButtonColor = false
                close.AnchorPoint = Vector2.new(1, 0)
                close.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                close.BackgroundTransparency = 1
                close.BorderSizePixel = 0
                close.LayoutOrder = 1
                close.Position = UDim2.new(1, -4, 0, 4)
                close.Size = UDim2.fromOffset(21, 21)
                close.ZIndex = 2

                local uICorner = Instance.new("UICorner")
                uICorner.Name = "UICorner"
                uICorner.CornerRadius = UDim.new(0, 5)
                uICorner.Parent = close

                local icon = Instance.new("ImageLabel")
                icon.Name = "Icon"
                icon.Image = "rbxassetid://3926305904"
                icon.ImageRectOffset = Vector2.new(284, 4)
                icon.ImageRectSize = Vector2.new(24, 24)
                icon.ScaleType = Enum.ScaleType.Fit
                icon.AnchorPoint = Vector2.new(0.5, 0.5)
                icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon.BackgroundTransparency = 1
                icon.BorderSizePixel = 0
                icon.Position = UDim2.fromScale(0.5, 0.5)
                icon.Size = UDim2.new(1, -2, 1, -2)
                icon.ZIndex = 3
                icon.Parent = close

                close.Parent = buttons

                local uIListLayout = Instance.new("UIListLayout")
                uIListLayout.Name = "UIListLayout"
                uIListLayout.Padding = UDim.new(0, 2)
                uIListLayout.FillDirection = Enum.FillDirection.Horizontal
                uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                uIListLayout.Parent = buttons

                local uIPadding = Instance.new("UIPadding")
                uIPadding.Name = "UIPadding"
                uIPadding.PaddingBottom = UDim.new(0, 4)
                uIPadding.PaddingLeft = UDim.new(0, 4)
                uIPadding.PaddingRight = UDim.new(0, 4)
                uIPadding.PaddingTop = UDim.new(0, 4)
                uIPadding.Parent = buttons

                local settings = Instance.new("TextButton")
                settings.Name = "Settings"
                settings.Font = Enum.Font.SourceSans
                settings.Text = ""
                settings.TextColor3 = Color3.fromRGB(0, 0, 0)
                settings.TextSize = 14
                settings.AutoButtonColor = false
                settings.AnchorPoint = Vector2.new(1, 0)
                settings.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                settings.BackgroundTransparency = 1
                settings.BorderSizePixel = 0
                settings.Position = UDim2.new(0.958, -4, 0, 4)
                settings.Size = UDim2.fromOffset(21, 21)
                settings.ZIndex = 2

                local uICorner1 = Instance.new("UICorner")
                uICorner1.Name = "UICorner"
                uICorner1.CornerRadius = UDim.new(0, 5)
                uICorner1.Parent = settings

                local icon1 = Instance.new("ImageLabel")
                icon1.Name = "Icon"
                icon1.Image = "rbxassetid://3926307971"
                icon1.ImageRectOffset = Vector2.new(324, 124)
                icon1.ImageRectSize = Vector2.new(36, 36)
                icon1.ScaleType = Enum.ScaleType.Fit
                icon1.AnchorPoint = Vector2.new(0.5, 0.5)
                icon1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon1.BackgroundTransparency = 1
                icon1.BorderSizePixel = 0
                icon1.Position = UDim2.fromScale(0.5, 0.5)
                icon1.Size = UDim2.new(1, -4, 1, -4)
                icon1.ZIndex = 3
                icon1.Parent = settings

                settings.Parent = buttons

                buttons.Parent = topbar

                local separator = Instance.new("Frame")
                separator.Name = "Separator"
                separator.AnchorPoint = Vector2.new(0.5, 0.5)
                separator.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
                separator.BorderSizePixel = 0
                separator.Position = UDim2.fromScale(0.5, 1)
                separator.Size = UDim2.new(1, 0, 0, 1)
                separator.ZIndex = 2
                separator.Parent = topbar

                topbar.Parent = main

                main.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui

                return {
                    GuiObject = main,
                    Functions = {
                        GetName = function()
                            return title.Text:split(" - ")[1]
                        end,
                        GetGameName = function()
                            return title.Text:split(" - ")[2]
                        end,
                        SetName = function(newName)
                            local gameName = title.Text:split(" - ")[2]
                            title.Text = ("%s - %s"):format(newName, gameName)
                        end,
                        SetGameName = function(newGameName)
                            local name = title.Text:split(" - ")[1]
                            title.Text = ("%s - %s"):format(name, newGameName)
                        end,
                        Destroy = function()
                            main:Destroy()
                        end
                    },
                    Events = {}
                }
            end,
            Element = function(gui)
                local Element = {}

                function Element:GetName()
                    return gui.Functions.GetName()
                end

                function Element:GetGameName()
                    return gui.Functions.GetGameName()
                end

                function Element:SetName(newName)
                    gui.Functions.SetName(newName)
                end

                function Element:SetGameName(newGameName)
                    gui.Functions.SetGameName(newGameName)
                end

                function Element:Destroy()
                    gui.Functions.Destroy()
                end

                return Element
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

function Library:CreateWindow(name, gameName)
    return self:CreateElement("Window", {
        Name = name,
        GameName = gameName
    })
end

return Library
