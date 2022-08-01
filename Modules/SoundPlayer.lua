local SoundPlayer = {}

function SoundPlayer:Play(props)
    local sound = Instance.new("Sound")
    sound.Name = props.Name or "Sound"
    sound.SoundId = props.SoundId or ""
    sound.Looped = props.Looped or false
    sound.TimePosition = props.StartPosition or 0
    sound.Parent = SoundPlayer.Container

    sound:Play()
    if props.DestroyOnEnded then
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
    end
end

function SoundPlayer:Stop(name)
    local sound = SoundPlayer.Container:FindFirstChild(name or "")
    if sound then
        sound:Stop()
        sound:Destroy()
    end
end

local function SetupContainer()
    local Folder = Instance.new("Folder")
    Folder.Name = "SoundPlayerContainer"
    Folder.Parent = game:GetService("CoreGui")
    SoundPlayer.Container = Folder
end
SetupContainer()

return SoundPlayer