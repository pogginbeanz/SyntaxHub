local TweenService = game:GetService("TweenService")

local function importModuleFromId(id)
    return require(game:GetObjects(id)[1])
end

local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sleitnick/RbxUtil/main/modules/signal/init.lua", true))()
local StringGenerator = loadstring(game:HttpGet("https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/StringGenerator.lua", true))()
local DraggableObject = loadstring(game:HttpGet("https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/DraggableObject2.lua", true))()

local RNG = Random.new(os.time() + tick())

local Library = {}

Library.Utility = {
    TweenBackgroundColor3 = function(self, guiObject, color, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {BackgroundColor3 = color})
        tween:Play()
    end,
    TweenBackgroundTransparency = function(self, guiObject, transparency, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {BackgroundTransparency = transparency})
        tween:Play()
    end
}

do
    Library.Components = {
        ["Window"] = {
            Gui = function(props)
                local main = Instance.new("Frame")
                main.Name = "Window-" .. #Library.Container:GetChildren() + 1
                main.AnchorPoint = Vector2.new(0.5, 0.5)
                main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                main.BorderSizePixel = 0
                main.Position = UDim2.fromScale(0.5, 0.5)
                main.Size = UDim2.fromOffset(560, 319)

                local tabFolder = Instance.new("Folder")
                tabFolder.Name = "TabFolder"
                tabFolder.Parent = main

                local tabHoldFrame = Instance.new("Frame")
                tabHoldFrame.Name = "TabHoldFrame"
                tabHoldFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                tabHoldFrame.BorderSizePixel = 0
                tabHoldFrame.Position = UDim2.new(0, 0, 0.089, 1)
                tabHoldFrame.Size = UDim2.fromOffset(126, 289)

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

                tabHold.Parent = tabHoldFrame

                tabHoldFrame.Parent = main

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

                main.Parent = Library.Container

                local WindowDrag = DraggableObject.new(main, topbar)
                WindowDrag:Enable()
                local IsWindowDraggable = true

                return {
                    GuiObject = main,
                    Properties = {
                        Tabs = {},
                        SelectedTab = nil
                    },
                    Functions = {
                        GetName = function()
                            return title.Text:split(" - ")[1]
                        end,
                        GetGameName = function()
                            return title.Text:split(" - ")[2]
                        end,
                        GetFullName = function()
                            return title.Text
                        end,
                        SetName = function(newName)
                            local gameName = title.Text:split(" - ")[2]
                            title.Text = ("%s - %s"):format(newName, gameName)
                        end,
                        SetGameName = function(newGameName)
                            local name = title.Text:split(" - ")[1]
                            title.Text = ("%s - %s"):format(name, newGameName)
                        end,
                        SetPosition = function(position)
                            main.Position = position
                        end,
                        SetDraggable = function(draggable)
                            if draggable then
                                WindowDrag:Enable()
                            else
                                WindowDrag:Disable()
                            end
                            IsWindowDraggable = draggable
                        end,
                        IsDraggable = function()
                            return IsWindowDraggable
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

                function Element:GetFullName()
                    return gui.Functions.GetFullName()
                end

                function Element:SetName(newName)
                    gui.Functions.SetName(newName)
                end

                function Element:SetGameName(newGameName)
                    gui.Functions.SetGameName(newGameName)
                end

                function Element:SetPosition(position)
                    gui.Functions.SetPosition(position)
                end

                function Element:CreateTab(name)
                    local component = Library:GetComponent("Tab")
                    local tabBtnGui = component.TabBtnGui({Name = name})
                    local tabGui = component.TabGui({Name = name})

                    tabBtnGui.Events.OnSelected:Connect(function()
                        for _, tab in pairs(gui.Properties.Tabs) do
                            tab.TabGui.GuiObject.Visible = false
                            tab.TabBtnGui.GuiObject.TabTitle.TextColor3 = Color3.fromRGB(204, 204, 204)
                        end
                        tabGui.GuiObject.Visible = true
                        tabBtnGui.GuiObject.TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                        gui.Properties.SelectedTab = name
                    end)

                    gui.Properties.Tabs[name] = {
                        TabBtnGui = tabBtnGui,
                        TabGui = tabGui
                    }

                    tabBtnGui.GuiObject.Parent = gui.GuiObject.TabHoldFrame.TabHold
                    tabGui.GuiObject.Parent = gui.GuiObject.TabFolder

                    return component.Element(tabBtnGui, tabGui)
                end

                function Element:SelectTab(name)
                    if gui.Properties.Tabs[name] then
                        gui.Properties.Tabs[name].TabBtnGui.OnSelected:Fire()
                    end
                end

                function Element:Destroy()
                    gui.Functions.Destroy()
                end

                return Element
            end
        },
        ["Tab"] = {
            TabBtnGui = function(props)
                local onSelected = Signal.new()

                local tabBtn = Instance.new("TextButton")
                tabBtn.Name = props.Name -- "TabBtn"
                tabBtn.Font = Enum.Font.SourceSans
                tabBtn.Text = ""
                tabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                tabBtn.TextSize = 13
                tabBtn.AutoButtonColor = false
                tabBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                tabBtn.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
                tabBtn.BackgroundTransparency = 1
                tabBtn.BorderSizePixel = 0
                tabBtn.Position = UDim2.fromScale(0.433, 0.0519)
                tabBtn.Size = UDim2.fromOffset(109, 30)

                local tabTitle = Instance.new("TextLabel")
                tabTitle.Name = "TabTitle"
                tabTitle.Font = Enum.Font.Gotham
                tabTitle.Text = props.Name
                tabTitle.TextColor3 = Color3.fromRGB(204, 204, 204)
                tabTitle.TextSize = 14
                tabTitle.TextXAlignment = Enum.TextXAlignment.Left
                tabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tabTitle.BackgroundTransparency = 1
                tabTitle.BorderSizePixel = 0
                tabTitle.Position = UDim2.fromScale(0.07, 0)
                tabTitle.Size = UDim2.fromOffset(101, 30)
                tabTitle.Parent = tabBtn

                local uICorner = Instance.new("UICorner")
                uICorner.Name = "UICorner"
                uICorner.CornerRadius = UDim.new(0, 6)
                uICorner.Parent = tabBtn

                tabBtn.MouseEnter:Connect(function()
                    Library.Utility:TweenBackgroundTransparency(tabBtn, 0, 0.2)
                end)

                tabBtn.MouseLeave:Connect(function()
                    Library.Utility:TweenBackgroundTransparency(tabBtn, 1, 0.2)
                end)

                tabBtn.Activated:Connect(function()
                    onSelected:Fire()
                end)

                return {
                    GuiObject = tabBtn,
                    Functions = {
                        Destroy = function()
                            tabBtn:Destroy()
                        end
                    },
                    Events = {
                        OnSelected = onSelected
                    }
                }
            end,
            TabGui = function(props)
                local tab = Instance.new("ScrollingFrame")
                tab.Name = props.Name -- "Tab"
                tab.AutomaticCanvasSize = Enum.AutomaticSize.Y
                tab.CanvasSize = UDim2.new()
                tab.ScrollBarThickness = 3
                tab.Active = true
                tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tab.BackgroundTransparency = 1
                tab.BorderSizePixel = 0
                tab.Position = UDim2.fromScale(0.252, 0.12)
                tab.Size = UDim2.fromOffset(408, 263)
                tab.Visible = false

                local tabLayout = Instance.new("UIListLayout")
                tabLayout.Name = "TabLayout"
                tabLayout.Padding = UDim.new(0, 5)
                tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
                tabLayout.Parent = tab

                return {
                    GuiObject = tab,
                    Functions = {
                        Destroy = function()
                            tab:Destroy()
                        end
                    },
                    Events = {}
                }
            end,
            Element = function(tabBtnGui, tabGui)
                local Element = {}

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

function Library:CreateElementWithArguments(componentName, ...)
    local component = self:GetComponent(componentName)
    return component.Element(...)
end

function Library:CreateWindow(name, gameName)
    return self:CreateElement("Window", {
        Name = name,
        GameName = gameName
    })
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = StringGenerator(RNG:NextInteger(20, 30))
ScreenGui.Parent = game:GetService("CoreGui")
Library.Container = ScreenGui

return Library
