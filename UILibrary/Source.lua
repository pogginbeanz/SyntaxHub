local TweenService = game:GetService('TweenService')

local function importModuleFromId(id)
    return require(game:GetObjects(id)[1])
end

local Signal =
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Sleitnick/RbxUtil/main/modules/signal/init.lua', true))()
local StringGenerator =
    loadstring(
    game:HttpGet('https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/StringGenerator.lua', true)
)()
local DraggableObject =
    loadstring(
    game:HttpGet('https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/DraggableObject.lua', true)
)()
local SoundPlayer =
    loadstring(
    game:HttpGet('https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/SoundPlayer.lua', true)
)()
local SliderMechanic =
    loadstring(
    game:HttpGet('https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/SliderMechanic.lua', true)
)()
local repr =
    loadstring(game:HttpGet('https://raw.githubusercontent.com/pogginbeanz/SyntaxHub/main/Modules/repr.lua', true))()

local RNG = Random.new(os.time() + tick())

local Library = {}
Library.Notices = {}
Library.Settings = {
    Notifications = {
        DefaultStayTime = 4,
        Padding = 5
    }
}

Library.Utility = {
    -- User Interface:
    TweenBackgroundColor3 = function(self, guiObject, color, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {BackgroundColor3 = color})
        tween:Play()
    end,
    TweenBackgroundTransparency = function(self, guiObject, transparency, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {BackgroundTransparency = transparency})
        tween:Play()
    end,
    TweenTextColor3 = function(self, guiObject, color, tweenTime)
        local tweenInfo = TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(guiObject, tweenInfo, {TextColor3 = color})
        tween:Play()
    end,
    TweenPosition = function(self, guiObject, position, tweenTime, override)
        guiObject:TweenPosition(position, 'Out', 'Quad', tweenTime or 1, (override ~= nil and true) or false)
    end,
    -- Maths:
    RoundDecimals = function(self, num, places)
        local mult = 10 ^ places
        return math.floor(num * mult) / mult
    end
}

do
    Library.Components = {
        ['Window'] = {
            Gui = function(props)
                local main = Instance.new('Frame')
                main.Name = 'Window-' .. #Library.Container:GetChildren() + 1
                main.AnchorPoint = Vector2.new(0.5, 0.5)
                main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                main.BorderSizePixel = 0
                main.Position = UDim2.fromScale(0.5, 0.5)
                main.Size = UDim2.fromOffset(560, 319)
                main.ClipsDescendants = true

                local tabFolder = Instance.new('Folder')
                tabFolder.Name = 'TabFolder'
                tabFolder.Parent = main

                local tabHoldFrame = Instance.new('Frame')
                tabHoldFrame.Name = 'TabHoldFrame'
                tabHoldFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                tabHoldFrame.BorderSizePixel = 0
                tabHoldFrame.Position = UDim2.new(0, 0, 0.089, 1)
                tabHoldFrame.Size = UDim2.fromOffset(126, 289)

                local tabHold = Instance.new('Frame')
                tabHold.Name = 'TabHold'
                tabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tabHold.BackgroundTransparency = 1
                tabHold.Position = UDim2.fromScale(0.05, 0.0262)
                tabHold.Size = UDim2.fromScale(0.95, 0.976)

                local tabHoldLayout = Instance.new('UIListLayout')
                tabHoldLayout.Name = 'TabHoldLayout'
                tabHoldLayout.Padding = UDim.new(0, 4)
                tabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
                tabHoldLayout.Parent = tabHold

                tabHold.Parent = tabHoldFrame

                tabHoldFrame.Parent = main

                local topbar = Instance.new('Frame')
                topbar.Name = 'Topbar'
                topbar.AnchorPoint = Vector2.new(0.5, 0)
                topbar.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
                topbar.BorderSizePixel = 0
                topbar.Position = UDim2.fromScale(0.5, 0)
                topbar.Size = UDim2.new(1, 0, 0, 28)

                local title = Instance.new('TextLabel')
                title.Name = 'Title'
                title.Font = Enum.Font.GothamMedium
                title.Text = ('%s - %s'):format(props.Name, props.GameName)
                title.TextColor3 = Color3.fromRGB(255, 255, 255)
                title.TextSize = 13
                title.TextWrapped = true
                title.TextXAlignment = Enum.TextXAlignment.Left
                title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                title.BackgroundTransparency = 1
                title.BorderSizePixel = 0
                title.Position = UDim2.fromOffset(8, 3)
                title.Size = UDim2.fromScale(0.727, 0.821)
                title.ZIndex = 2
                title.Parent = topbar

                local buttons = Instance.new('Frame')
                buttons.Name = 'Buttons'
                buttons.AnchorPoint = Vector2.new(1, 0)
                buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                buttons.BackgroundTransparency = 1
                buttons.BorderSizePixel = 0
                buttons.Position = UDim2.fromScale(1, 0)
                buttons.Size = UDim2.fromOffset(121, 27)

                local close = Instance.new('TextButton')
                close.Name = 'Close'
                close.Font = Enum.Font.SourceSans
                close.Text = ''
                close.TextColor3 = Color3.fromRGB(0, 0, 0)
                close.TextSize = 14
                close.AutoButtonColor = false
                close.AnchorPoint = Vector2.new(1, 0)
                close.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                close.BackgroundTransparency = 1
                close.BorderSizePixel = 0
                close.LayoutOrder = 2
                close.Position = UDim2.new(1, -4, 0, 4)
                close.Size = UDim2.fromOffset(21, 21)
                close.ZIndex = 2

                local icon = Instance.new('ImageLabel')
                icon.Name = 'Icon'
                icon.Image = 'rbxassetid://3926305904'
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

                local shrink = Instance.new('TextButton')
                shrink.Name = 'Shrink'
                shrink.Font = Enum.Font.SourceSans
                shrink.Text = ''
                shrink.TextColor3 = Color3.fromRGB(0, 0, 0)
                shrink.TextSize = 14
                shrink.AutoButtonColor = false
                shrink.AnchorPoint = Vector2.new(1, 0)
                shrink.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                shrink.BackgroundTransparency = 1
                shrink.BorderSizePixel = 0
                shrink.LayoutOrder = 1
                shrink.Position = UDim2.new(1, -4, 0, 4)
                shrink.Size = UDim2.fromOffset(21, 21)
                shrink.ZIndex = 2

                local icon1 = Instance.new('ImageLabel')
                icon1.Name = 'Icon'
                icon1.Image = 'rbxassetid://3926307971'
                icon1.ImageRectOffset = Vector2.new(884, 284)
                icon1.ImageRectSize = Vector2.new(36, 36)
                icon1.ScaleType = Enum.ScaleType.Fit
                icon1.AnchorPoint = Vector2.new(0.5, 0.5)
                icon1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon1.BackgroundTransparency = 1
                icon1.BorderSizePixel = 0
                icon1.Position = UDim2.fromScale(0.5, 0.5)
                icon1.Size = UDim2.new(1, -2, 1, -2)
                icon1.ZIndex = 3
                icon1.Parent = shrink

                shrink.Parent = buttons

                local uIListLayout = Instance.new('UIListLayout')
                uIListLayout.Name = 'UIListLayout'
                uIListLayout.Padding = UDim.new(0, 2)
                uIListLayout.FillDirection = Enum.FillDirection.Horizontal
                uIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                uIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                uIListLayout.Parent = buttons

                local uIPadding = Instance.new('UIPadding')
                uIPadding.Name = 'UIPadding'
                uIPadding.PaddingBottom = UDim.new(0, 4)
                uIPadding.PaddingLeft = UDim.new(0, 4)
                uIPadding.PaddingRight = UDim.new(0, 4)
                uIPadding.PaddingTop = UDim.new(0, 4)
                uIPadding.Parent = buttons

                local settings = Instance.new('TextButton')
                settings.Name = 'Settings'
                settings.Font = Enum.Font.SourceSans
                settings.Text = ''
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

                local icon2 = Instance.new('ImageLabel')
                icon2.Name = 'Icon'
                icon2.Image = 'rbxassetid://3926307971'
                icon2.ImageRectOffset = Vector2.new(324, 124)
                icon2.ImageRectSize = Vector2.new(36, 36)
                icon2.ScaleType = Enum.ScaleType.Fit
                icon2.AnchorPoint = Vector2.new(0.5, 0.5)
                icon2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon2.BackgroundTransparency = 1
                icon2.BorderSizePixel = 0
                icon2.Position = UDim2.fromScale(0.5, 0.5)
                icon2.Size = UDim2.new(1, -4, 1, -4)
                icon2.ZIndex = 3
                icon2.Parent = settings

                settings.Parent = buttons

                buttons.Parent = topbar

                local separator = Instance.new('Frame')
                separator.Name = 'Separator'
                separator.AnchorPoint = Vector2.new(0.5, 0.5)
                separator.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
                separator.BorderSizePixel = 0
                separator.Position = UDim2.fromScale(0.5, 1)
                separator.Size = UDim2.new(1, 0, 0, 1)
                separator.ZIndex = 2
                separator.Parent = topbar

                topbar.Parent = main

                local isShrunk = false
                local function toggleShrink(toggle)
                    if toggle then
                        shrink.Icon.ImageRectOffset = Vector2.new(324, 364)
                        main:TweenSize(
                            UDim2.new(0, 560, 0, 28),
                            'Out',
                            'Quad',
                            0.4,
                            true,
                            function()
                                main:TweenSize(UDim2.new(0, 424, 0, 28), 'Out', 'Quad', 0.4, true)
                            end
                        )
                    else
                        shrink.Icon.ImageRectOffset = Vector2.new(884, 284)
                        main:TweenSize(
                            UDim2.new(0, 560, 0, 28),
                            'Out',
                            'Quad',
                            0.4,
                            true,
                            function()
                                main:TweenSize(UDim2.new(0, 560, 0, 319), 'InOut', 'Quad', 0.4, true)
                            end
                        )
                    end
                end

                shrink.Activated:Connect(
                    function()
                        isShrunk = not isShrunk
                        toggleShrink(isShrunk)
                    end
                )

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
                            return title.Text:split(' - ')[1]
                        end,
                        GetGameName = function()
                            return title.Text:split(' - ')[2]
                        end,
                        GetFullName = function()
                            return title.Text
                        end,
                        SetName = function(newName)
                            local gameName = title.Text:split(' - ')[2]
                            title.Text = ('%s - %s'):format(newName, gameName)
                        end,
                        SetGameName = function(newGameName)
                            local name = title.Text:split(' - ')[1]
                            title.Text = ('%s - %s'):format(name, newGameName)
                        end,
                        Shrink = function()
                            isShrunk = true
                            toggleShrink(true)
                        end,
                        Grow = function()
                            isShrunk = false
                            toggleShrink(false)
                        end,
                        IsShrunk = function()
                            return isShrunk
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
                    local component = Library:GetComponent('Tab')
                    local tabBtnGui = component.TabBtnGui({Name = name})
                    local tabGui = component.TabGui({Name = name})

                    tabBtnGui.Events.OnSelected:Connect(
                        function()
                            for _, tab in pairs(gui.Properties.Tabs) do
                                tab.TabGui.GuiObject.Visible = false
                                Library.Utility:TweenTextColor3(
                                    tab.TabBtnGui.GuiObject.TabTitle,
                                    Color3.fromRGB(204, 204, 204),
                                    0.2
                                )
                            end
                            tabGui.GuiObject.Visible = true
                            Library.Utility:TweenTextColor3(
                                tabBtnGui.GuiObject.TabTitle,
                                Color3.fromRGB(255, 255, 255),
                                0.2
                            )
                            gui.Properties.SelectedTab = name
                        end
                    )

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
        ['Tab'] = {
            TabBtnGui = function(props)
                local onSelected = Signal.new()

                local tabBtn = Instance.new('TextButton')
                tabBtn.Name = props.Name -- "TabBtn"
                tabBtn.Font = Enum.Font.SourceSans
                tabBtn.Text = ''
                tabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                tabBtn.TextSize = 13
                tabBtn.AutoButtonColor = false
                tabBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                tabBtn.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
                tabBtn.BackgroundTransparency = 1
                tabBtn.BorderSizePixel = 0
                tabBtn.Position = UDim2.fromScale(0.433, 0.0519)
                tabBtn.Size = UDim2.fromOffset(109, 30)

                local tabTitle = Instance.new('TextLabel')
                tabTitle.Name = 'TabTitle'
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

                local uICorner = Instance.new('UICorner')
                uICorner.Name = 'UICorner'
                uICorner.CornerRadius = UDim.new(0, 6)
                uICorner.Parent = tabBtn

                tabBtn.MouseEnter:Connect(
                    function()
                        Library.Utility:TweenBackgroundTransparency(tabBtn, 0, 0.2)
                    end
                )

                tabBtn.MouseLeave:Connect(
                    function()
                        Library.Utility:TweenBackgroundTransparency(tabBtn, 1, 0.2)
                    end
                )

                tabBtn.Activated:Connect(
                    function()
                        onSelected:Fire()
                    end
                )

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
                local tab = Instance.new('ScrollingFrame')
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

                local tabLayout = Instance.new('UIListLayout')
                tabLayout.Name = 'TabLayout'
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
        ['Label'] = {
            Gui = function(props)
                local label = Instance.new('Frame')
                label.Name = 'Label'
                label.AnchorPoint = Vector2.new(0.5, 0.5)
                label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                label.Size = UDim2.fromOffset(405, 42)

                local labelCorner = Instance.new('UICorner')
                labelCorner.Name = 'LabelCorner'
                labelCorner.CornerRadius = UDim.new(0, 5)
                labelCorner.Parent = label

                local labelTitle = Instance.new('TextLabel')
                labelTitle.Name = 'LabelTitle'
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
        ['Button'] = {
            Gui = function(props)
                local button = Instance.new('TextButton')
                button.Name = 'Button'
                button.Font = Enum.Font.SourceSans
                button.Text = ''
                button.TextColor3 = Color3.fromRGB(0, 0, 0)
                button.TextSize = 14
                button.AutoButtonColor = false
                button.AnchorPoint = Vector2.new(0.5, 0.5)
                button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                button.BorderSizePixel = 0
                button.Position = UDim2.fromScale(0.494, 0.0798)
                button.Size = UDim2.fromOffset(405, 42)

                local buttonCorner = Instance.new('UICorner')
                buttonCorner.Name = 'ButtonCorner'
                buttonCorner.CornerRadius = UDim.new(0, 5)
                buttonCorner.Parent = button

                local buttonTitle = Instance.new('TextLabel')
                buttonTitle.Name = 'ButtonTitle'
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
        },
        ['Toggle'] = {
            Gui = function(props)
                local onToggle = Signal.new()

                local toggle = Instance.new('TextButton')
                toggle.Name = 'Toggle'
                toggle.Font = Enum.Font.SourceSans
                toggle.Text = ''
                toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
                toggle.TextSize = 14
                toggle.AutoButtonColor = false
                toggle.AnchorPoint = Vector2.new(0.5, 0.5)
                toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                toggle.BorderSizePixel = 0
                toggle.Size = UDim2.fromOffset(405, 42)

                local toggleCorner = Instance.new('UICorner')
                toggleCorner.Name = 'ToggleCorner'
                toggleCorner.CornerRadius = UDim.new(0, 5)
                toggleCorner.Parent = toggle

                local toggleTitle = Instance.new('TextLabel')
                toggleTitle.Name = 'ToggleTitle'
                toggleTitle.Font = Enum.Font.Gotham
                toggleTitle.Text = props.Text
                toggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggleTitle.TextSize = 14
                toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                toggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleTitle.BackgroundTransparency = 1
                toggleTitle.BorderSizePixel = 0
                toggleTitle.Position = UDim2.fromScale(0.035, 0)
                toggleTitle.Size = UDim2.fromOffset(187, 42)
                toggleTitle.Parent = toggle

                local switch = Instance.new('Frame')
                switch.Name = 'Switch'
                switch.AnchorPoint = Vector2.new(1, 0.5)
                switch.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
                switch.BackgroundTransparency = 1
                switch.BorderSizePixel = 0
                switch.Position = UDim2.fromScale(0.955, 0.5)
                switch.Size = UDim2.fromOffset(34, 13)

                local uICorner = Instance.new('UICorner')
                uICorner.Name = 'UICorner'
                uICorner.CornerRadius = UDim.new(1, 0)
                uICorner.Parent = switch

                local uIStroke = Instance.new('UIStroke')
                uIStroke.Name = 'UIStroke'
                uIStroke.Color = Color3.fromRGB(65, 65, 65)
                uIStroke.Thickness = 2
                uIStroke.Parent = switch

                local circle = Instance.new('Frame')
                circle.Name = 'Circle'
                circle.AnchorPoint = Vector2.new(0.5, 0.5)
                circle.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
                circle.BorderSizePixel = 0
                circle.Position = UDim2.fromScale(0.18, 0.5)
                circle.Size = UDim2.fromOffset(9, 9)

                local circleCorner = Instance.new('UICorner')
                circleCorner.Name = 'CircleCorner'
                circleCorner.CornerRadius = UDim.new(1, 0)
                circleCorner.Parent = circle

                circle.Parent = switch

                switch.Parent = toggle

                local function playSwitchAnimation(isToggled, tweenTime)
                    if isToggled then
                        switch.BackgroundTransparency = 0
                        uIStroke.Color = Color3.fromRGB(44, 120, 224)
                        circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Library.Utility:TweenPosition(circle, UDim2.new(1 - 0.18, 0, 0.5, 0), tweenTime, true)
                        Library.Utility:TweenBackgroundColor3(toggle, Color3.fromRGB(37, 37, 37), 0.2)
                    else
                        switch.BackgroundTransparency = 1
                        uIStroke.Color = Color3.fromRGB(65, 65, 65)
                        circle.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
                        Library.Utility:TweenPosition(circle, UDim2.new(0.18, 0, 0.5, 0), tweenTime, true)
                        Library.Utility:TweenBackgroundColor3(toggle, Color3.fromRGB(34, 34, 34), 0.2)
                    end
                end

                local isToggled = props.Initial or false
                toggle.Activated:Connect(function()
                    isToggled = not isToggled
                    playSwitchAnimation(isToggled, 0.2)
                    onToggle:Fire(isToggled)
                end)

                coroutine.wrap(function()
                    while not toggle.Parent do
                        task.wait()
                    end
                    playSwitchAnimation(props.Initial and true or false, 0)
                end)()

                return {
                    GuiObject = toggle,
                    Functions = {
                        GetText = function()
                            return toggleTitle.Text
                        end,
                        SetText = function(newText)
                            toggleTitle.Text = newText
                        end,
                        Set = function(toggled)
                            isToggled = toggled
                            playSwitchAnimation(toggled, 0.2)
                            onToggle:Fire(toggled)
                        end,
                        Get = function()
                            return isToggled
                        end,
                        Destroy = function()
                            toggle:Destroy()
                        end
                    },
                    Events = {
                        OnToggle = onToggle
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

                function Element:Set(toggled)
                    gui.Functions.Set(toggled)
                end

                function Element:Get()
                    return gui.Functions.Get()
                end

                function Element:Destroy()
                    gui.Functions.Destroy()
                end

                return Element
            end
        },
        ['Slider'] = {
            Gui = function(props)
                local changed = Signal.new()

                local slider = Instance.new('TextButton')
                slider.Name = 'Slider'
                slider.Font = Enum.Font.SourceSans
                slider.Text = ''
                slider.TextColor3 = Color3.fromRGB(0, 0, 0)
                slider.TextSize = 14
                slider.AutoButtonColor = false
                slider.AnchorPoint = Vector2.new(0.5, 0.5)
                slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                slider.BorderSizePixel = 0
                slider.Size = UDim2.fromOffset(405, 42)

                local sliderCorner = Instance.new('UICorner')
                sliderCorner.Name = 'SliderCorner'
                sliderCorner.CornerRadius = UDim.new(0, 5)
                sliderCorner.Parent = slider

                local sliderTitle = Instance.new('TextLabel')
                sliderTitle.Name = 'SliderTitle'
                sliderTitle.Font = Enum.Font.Gotham
                sliderTitle.Text = props.Text
                sliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                sliderTitle.TextSize = 14
                sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                sliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                sliderTitle.BackgroundTransparency = 1
                sliderTitle.BorderSizePixel = 0
                sliderTitle.Position = UDim2.fromScale(0.035, 0)
                sliderTitle.Size = UDim2.fromOffset(104, 42)
                sliderTitle.Parent = slider

                local barHold = Instance.new('Frame')
                barHold.Name = 'BarHold'
                barHold.AnchorPoint = Vector2.new(0.5, 0.5)
                barHold.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                barHold.BorderSizePixel = 0
                barHold.Position = UDim2.fromScale(0.675, 0.5)
                barHold.Size = UDim2.fromOffset(233, 2)

                local inputFrame = Instance.new('Frame')
                inputFrame.Name = 'InputFrame'
                inputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                inputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                inputFrame.BackgroundTransparency = 1
                inputFrame.BorderSizePixel = 0
                inputFrame.Position = UDim2.fromScale(0.5, 0.5)
                inputFrame.Size = UDim2.fromScale(1.04, 4)

                inputFrame.Parent = barHold

                local bar = Instance.new('Frame')
                bar.Name = 'Bar'
                bar.AnchorPoint = Vector2.new(0, 0.5)
                bar.BackgroundColor3 = Color3.fromRGB(44, 120, 224)
                bar.BorderSizePixel = 0
                bar.Position = UDim2.fromScale(0, 0.5)
                bar.Size = UDim2.fromScale(0, 1)

                local circle = Instance.new('Frame')
                circle.Name = 'Circle'
                circle.AnchorPoint = Vector2.new(0.5, 0.5)
                circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                circle.BorderSizePixel = 0
                circle.Position = UDim2.fromScale(1, 0.5)
                circle.Size = UDim2.fromOffset(8, 8)

                local uICorner = Instance.new('UICorner')
                uICorner.Name = 'UICorner'
                uICorner.CornerRadius = UDim.new(1, 0)
                uICorner.Parent = circle

                circle.Parent = bar

                local uICorner1 = Instance.new('UICorner')
                uICorner1.Name = 'UICorner'
                uICorner1.CornerRadius = UDim.new(1, 0)
                uICorner1.Parent = bar

                bar.Parent = barHold

                local uICorner2 = Instance.new('UICorner')
                uICorner2.Name = 'UICorner'
                uICorner2.CornerRadius = UDim.new(1, 0)
                uICorner2.Parent = barHold

                barHold.Parent = slider

                local number = Instance.new('TextLabel')
                number.Name = 'Number'
                number.Font = Enum.Font.Gotham
                number.Text = '0'
                number.TextColor3 = Color3.fromRGB(255, 255, 255)
                number.TextSize = 14
                number.TextXAlignment = Enum.TextXAlignment.Right
                number.AnchorPoint = Vector2.new(1, 0.5)
                number.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                number.BackgroundTransparency = 1
                number.BorderSizePixel = 0
                number.Position = UDim2.fromScale(0.365, 0.5)
                number.Size = UDim2.fromOffset(38, 30)
                number.Parent = slider

                local value = props.Initial or props.Min
                local function updateValue(newValue)
                    local mult = math.clamp(props.Max + props.Min, props.Min, props.Max)
                    number.Text = Library.Utility:RoundDecimals(props.Max * newValue, 2)
                    bar.Size = UDim2.new(math.clamp(newValue - (props.Min/props.Max), 0, 1), 0, 1, 0)
                    value = newValue * mult
                    changed:Fire(newValue * mult)
                end

                local sliderMechanic = SliderMechanic.new(bar, inputFrame, props.Min, props.Max, props.Initial)
                sliderMechanic.ValueChanged:Connect(updateValue)

                updateValue(props.Initial / props.Max)

                sliderMechanic.StartDrag:Connect(function()
                    Library.Utility:TweenBackgroundColor3(slider, Color3.fromRGB(37, 37, 37), 0.2)
                end)

                sliderMechanic.StopDrag:Connect(function()
                    Library.Utility:TweenBackgroundColor3(slider, Color3.fromRGB(34, 34, 34), 0.2)
                end)

                return {
                    GuiObject = slider,
                    Functions = {
                        Set = function(num)
                            updateValue(num)
                        end,
                        Get = function()
                            return value
                        end,
                        Destroy = function()
                            sliderMechanic:Destroy()
                            slider:Destroy()
                        end
                    },
                    Events = {
                        StartDrag = sliderMechanic.StartDrag,
                        StopDrag = sliderMechanic.StopDrag,
                        Changed = changed
                    }
                }
            end,
            Element = function(gui)
                local Element = {}

                function Element:Set(num)
                    gui.Functions.Set(num)
                end

                function Element:Get()
                    return gui.Functions.Get()
                end

                function Element:Destroy()
                    gui.Functions.Destroy()
                end

                return Element
            end
        },
        ['Notice'] = {
            Gui = function(props)
                local removing = Signal.new()
                local removed = Signal.new()

                local noticeTypes = {
                    ['Notification'] = {
                        Color = Color3.fromRGB(44, 120, 224),
                        Icon = 'rbxassetid://10444486616',
                        SoundProps = {
                            SoundId = 'rbxassetid://10446862686',
                            Volume = 0.2,
                            DestroyOnEnded = true
                        }
                    },
                    ['Warning'] = {
                        Color = Color3.fromRGB(255, 170, 0),
                        Icon = 'rbxassetid://10444719767',
                        SoundProps = {
                            SoundId = 'rbxassetid://10446865452',
                            Volume = 0.2,
                            DestroyOnEnded = true
                        }
                    },
                    ['Error'] = {
                        Color = Color3.fromRGB(255, 0, 0),
                        Icon = 'rbxassetid://10444699605',
                        SoundProps = {
                            SoundId = 'rbxassetid://10446871400',
                            Volume = 0.2,
                            DestroyOnEnded = true
                        }
                    }
                }
                local noticeType = noticeTypes[props.Type]
                if not noticeType then
                    return
                end

                local notice = Instance.new('Frame')
                notice.Name = 'Notice'
                notice.AnchorPoint = Vector2.new(0, 0.5)
                notice.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                notice.BackgroundTransparency = 0.1
                notice.Position = UDim2.fromScale(-0.2, 0.929)
                notice.Size = UDim2.fromOffset(263, 85)

                local uICorner = Instance.new('UICorner')
                uICorner.Name = 'UICorner'
                uICorner.Parent = notice

                local topbar = Instance.new('Frame')
                topbar.Name = 'Topbar'
                topbar.AnchorPoint = Vector2.new(0.5, 0)
                topbar.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
                topbar.BorderSizePixel = 0
                topbar.Position = UDim2.fromScale(0.5, 0)
                topbar.Size = UDim2.fromOffset(263, 26)

                local uICorner1 = Instance.new('UICorner')
                uICorner1.Name = 'UICorner'
                uICorner1.CornerRadius = UDim.new(0, 6)
                uICorner1.Parent = topbar

                local cornerCover = Instance.new('Frame')
                cornerCover.Name = 'CornerCover'
                cornerCover.AnchorPoint = Vector2.new(0.5, 1)
                cornerCover.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
                cornerCover.BorderSizePixel = 0
                cornerCover.Position = UDim2.fromScale(0.5, 1)
                cornerCover.Size = UDim2.fromOffset(263, 8)
                cornerCover.Parent = topbar

                local title = Instance.new('TextLabel')
                title.Name = 'Title'
                title.Font = Enum.Font.GothamMedium
                title.Text = ('%s - %s'):format(props.Name, props.Type)
                title.TextColor3 = Color3.fromRGB(255, 255, 255)
                title.TextSize = 15
                title.TextWrapped = true
                title.TextXAlignment = Enum.TextXAlignment.Left
                title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                title.BackgroundTransparency = 1
                title.BorderSizePixel = 0
                title.Position = UDim2.fromScale(0.1, 0)
                title.Size = UDim2.fromOffset(211, 26)
                title.Parent = topbar

                local separator = Instance.new('Frame')
                separator.Name = 'Separator'
                separator.AnchorPoint = Vector2.new(0.5, 0.5)
                separator.BackgroundColor3 = noticeType.Color
                separator.BorderSizePixel = 0
                separator.Position = UDim2.fromScale(0.5, 1)
                separator.Size = UDim2.new(1, 0, 0, 1)
                separator.Parent = topbar

                local icon = Instance.new('ImageLabel')
                icon.Name = 'Icon'
                icon.AnchorPoint = Vector2.new(0.5, 0.5)
                icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon.BackgroundTransparency = 1
                icon.BorderSizePixel = 0
                icon.Position = UDim2.fromScale(0.05, 0.5)
                icon.Size = UDim2.fromOffset(19, 19)
                icon.Image = noticeType.Icon
                icon.Parent = topbar

                local close = Instance.new('TextButton')
                close.Name = 'Close'
                close.Font = Enum.Font.SourceSans
                close.Text = ''
                close.TextColor3 = Color3.fromRGB(0, 0, 0)
                close.TextSize = 14
                close.AutoButtonColor = false
                close.AnchorPoint = Vector2.new(1, 0.5)
                close.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
                close.BackgroundTransparency = 1
                close.BorderSizePixel = 0
                close.LayoutOrder = 2
                close.Position = UDim2.new(1, -4, 0.5, 0)
                close.Size = UDim2.fromOffset(21, 21)
                close.ZIndex = 2

                local uICorner2 = Instance.new('UICorner')
                uICorner2.Name = 'UICorner'
                uICorner2.CornerRadius = UDim.new(0, 5)
                uICorner2.Parent = close

                local icon1 = Instance.new('ImageLabel')
                icon1.Name = 'Icon'
                icon1.Image = 'rbxassetid://3926305904'
                icon1.ImageRectOffset = Vector2.new(284, 4)
                icon1.ImageRectSize = Vector2.new(24, 24)
                icon1.ScaleType = Enum.ScaleType.Fit
                icon1.AnchorPoint = Vector2.new(0.5, 0.5)
                icon1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon1.BackgroundTransparency = 1
                icon1.BorderSizePixel = 0
                icon1.Position = UDim2.fromScale(0.5, 0.5)
                icon1.Size = UDim2.new(1, -2, 1, -2)
                icon1.ZIndex = 2
                icon1.Parent = close

                close.Parent = topbar

                topbar.Parent = notice

                local content = Instance.new('TextLabel')
                content.Name = 'Content'
                content.Font = Enum.Font.Gotham
                content.Text = props.Text or ''
                content.TextColor3 = Color3.fromRGB(255, 255, 255)
                content.TextSize = 17
                content.AnchorPoint = Vector2.new(0.5, 0.5)
                content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                content.BackgroundTransparency = 1
                content.BorderSizePixel = 0
                content.Position = UDim2.fromScale(0.5, 0.65)
                content.Size = UDim2.fromOffset(249, 43)
                content.Parent = notice

                local NoticeData = {
                    GuiObject = notice,
                    Active = true
                }
                table.insert(Library.Notices, NoticeData)
                local NoticeIndex = #Library.Notices

                local function getPositionWithPadding(guiObject, direction, padding)
                    direction = direction:lower()
                    if direction == 'top' then
                        return UDim2.new(
                            guiObject.Position.X.Scale,
                            0,
                            guiObject.Position.Y.Scale,
                            guiObject.Position.Y.Offset - (guiObject.Size.Y.Offset + padding)
                        )
                    elseif direction == 'bottom' then
                        return UDim2.new(
                            guiObject.Position.X.Scale,
                            0,
                            guiObject.Position.Y.Scale,
                            guiObject.Position.Y.Offset + (guiObject.Size.Y.Offset + padding)
                        )
                    end
                end

                local function tweenRight(tweenTime)
                    for i, activeNotice in ipairs(Library:GetActiveNotices()) do
                        local newPosition =
                            getPositionWithPadding(
                            activeNotice.GuiObject,
                            'top',
                            Library.Settings.Notifications.Padding
                        )
                        activeNotice.GuiObject:TweenPosition(newPosition, 'Out', 'Quad', 0.2, false)
                    end
                    local newPosition = UDim2.new(0.011, 0, 0.929, 0)
                    notice:TweenPosition(newPosition, 'Out', 'Quad', tweenTime, true)
                end

                local function tweenLeft(tweenTime)
                    --print(repr(Library.Notices, {pretty = true}))
                    if not NoticeData.Active then
                        return
                    end
                    local newPosition = UDim2.new(-0.2, 0, notice.Position.Y.Scale, notice.Position.Y.Offset)
                    notice:TweenPosition(
                        newPosition,
                        'Out',
                        'Quad',
                        tweenTime,
                        true,
                        function()
                            for i, activeNotice in ipairs(Library:GetActiveNotices()) do
                                local activeNoticeIndex = table.find(Library.Notices, activeNotice)
                                print(activeNoticeIndex, NoticeIndex)
                                if activeNoticeIndex < NoticeIndex then
                                    local _newPosition =
                                        getPositionWithPadding(
                                        activeNotice.GuiObject,
                                        'bottom',
                                        Library.Settings.Notifications.Padding
                                    )
                                    activeNotice.GuiObject:TweenPosition(_newPosition, 'Out', 'Quad', 0.2, false)
                                end
                            end
                            NoticeData.Active = false
                        end
                    )
                end

                notice.Parent = Library.Container.Notifications

                tweenRight(0.2)
                task.delay(
                    props.StayTime or Library.Settings.Notifications.DefaultStayTime,
                    function()
                        tweenLeft(0.2)
                    end
                )
                SoundPlayer:Play(noticeType.SoundProps)

                close.Activated:Connect(
                    function()
                        tweenLeft(0.2)
                    end
                )

                return {
                    GuiObject = notice,
                    Functions = {
                        GetText = function()
                            return content.Text
                        end,
                        SetText = function(newText)
                            content.Text = newText
                        end,
                        Remove = function()
                            removing:Fire()
                            tweenLeft(0.2)
                            removed:Fire()
                        end,
                        Destroy = function()
                            NoticeData.Active = false
                            notice:Destroy()
                        end
                    },
                    Events = {
                        Removed = removed
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

                function Element:Remove()
                    gui.Functions.Remove()
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
    return self:CreateElement(
        'Window',
        {
            Name = name,
            GameName = gameName
        }
    )
end

function Library:GetActiveNotices()
    local activeNotices = {}
    for i, notice in ipairs(Library.Notices) do
        if notice.Active then
            table.insert(activeNotices, notice)
        end
    end
    return activeNotices
end

function Library:Notify(hubName, text, stayTime)
    return Library:CreateElement(
        'Notice',
        {
            Name = hubName,
            Type = 'Notification',
            Text = text,
            StayTime = stayTime
        }
    )
end

function Library:Warn(hubName, text, stayTime)
    return Library:CreateElement(
        'Notice',
        {
            Name = hubName,
            Type = 'Warning',
            Text = text,
            StayTime = stayTime
        }
    )
end

function Library:Error(hubName, text, stayTime)
    return Library:CreateElement(
        'Notice',
        {
            Name = hubName,
            Type = 'Error',
            Text = text,
            StayTime = stayTime
        }
    )
end

local function SetupContainer()
    local ScreenGui = Instance.new('ScreenGui')
    ScreenGui.Name = StringGenerator(RNG:NextInteger(20, 30))
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true

    local notifications = Instance.new('Folder')
    notifications.Name = 'Notifications'
    notifications.Parent = ScreenGui

    ScreenGui.Parent = game:GetService('CoreGui')
    Library.Container = ScreenGui
end
SetupContainer()

return Library
