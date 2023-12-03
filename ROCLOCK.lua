--ADDS IMPORTANT VAL
local value = game.CoreGui:FindFirstChild("ROCLOCKDATA")
if value then
else
	local insthold = Instance.new("Folder")
	insthold.Name = "ROCLOCKDATA"
	insthold.Parent = game.CoreGui
	local inst = Instance.new("NumberValue")
	inst.Name = "QTIME"
	inst.Parent = insthold
	local inst = Instance.new("StringValue")
	inst.Name = "QYEAR"
	inst.Parent = insthold
	inst.Value = os.date("%y")
end
clockdata = game.CoreGui.ROCLOCKDATA

local toolbar = plugin:CreateToolbar("RO-CLOCK")
local newScriptButton = toolbar:CreateButton("RO-CLOCK", "Tells the time with speech, Find out more at https://github.com/ORileyTan/ROCLOCK", "rbxassetid://15094555895")
newScriptButton.ClickableWhenViewportHidden = true
-- Create new "DockWidgetPluginGuiInfo" object
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
	false,   -- Widget will be initially enabled
	false,  -- Don't override the previous enabled state
	150,    -- Default width of the floating window
	150,    -- Default height of the floating window
	150,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)

-- Create new widget GUI
local window = plugin:CreateDockWidgetPluginGui("ROCLOCK", widgetInfo)
window.Name = "ROCLOCK_101"
window.Title = "RO-CLOCK 1.0.1"  -- Optional widget title

local frame = Instance.new("Frame")
frame.Transparency = 1
frame.Size = UDim2.new(1,0,1,0)
frame.Parent = window

local clockface = Instance.new("TextButton")
clockface.Name = "CLOCK"
clockface.Size = UDim2.new(1,0,1,0)
--clockface.Transparency = 1
--clockface.Font = Enum.Font.Legacy
clockface.TextColor3 = Color3.new(1, 1, 1)
clockface.TextStrokeColor3 = Color3.new(0,0,0)
clockface.TextTransparency = 0
clockface.TextStrokeTransparency = 0
clockface.Parent = frame
clockface.BackgroundColor3 = Color3.new(0.207843, 0.32549, 0.0392157)
clockface.FontFace = Font.fromName("Michroma")
clockface.TextSize = 20

local voice = Instance.new("Sound")
voice.Name = "VOICE"
voice.Parent = frame
voice.Volume = 3
--Credit to screenswitch1
local function Convert(Number)
	return string.split(tostring(Number), ""), ","
end


function checknewyear()
	if clockdata.QYEAR.Value < os.date("%y") then
		clockdata.QYEAR.Value = os.date("%y")
		local splitstring = Convert(os.date("%y"))
		voice.SoundId = "rbxasset://ROCLOCK/NEWYEAR.WAV"
		voice:Play()
		wait(2.5)
		if splitstring[1] == "2" then
			voice.SoundId = "rbxasset://ROCLOCK/20.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
		if splitstring[1] == "3" then
			voice.SoundId = "rbxasset://ROCLOCK/30.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
		wait(1)
	end
end

function speech()
	checknewyear()
	--timeis
	voice.SoundId = "rbxasset://ROCLOCK/TIME.WAV"
	voice:Play()
	wait(1)

	--hour
	if tonumber(os.date("%I")) < 13 then
		voice.SoundId = "rbxasset://ROCLOCK/" .. os.date("%I") .. ".WAV"
		voice:Play()
		wait(1)
	end


	--minutes
	if tonumber(os.date("%M")) < 20 then
		voice.SoundId = "rbxasset://ROCLOCK/" .. os.date("%M") .. ".WAV"
		voice:Play()
	end
	if tonumber(os.date("%M")) > 19 then
		local splitstring = Convert(os.date("%M"))
		
		if splitstring[1] == "2" then
			voice.SoundId = "rbxasset://ROCLOCK/20.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
		if splitstring[1] == "3" then
			voice.SoundId = "rbxasset://ROCLOCK/30.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
		if splitstring[1] == "4" then
			voice.SoundId = "rbxasset://ROCLOCK/40.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
		if splitstring[1] == "5" then
			voice.SoundId = "rbxasset://ROCLOCK/50.WAV"
			voice:Play()
			wait(0.5)
			voice.SoundId = "rbxasset://ROCLOCK/" .. "0" .. splitstring[2] .. ".WAV"
			voice:Play()
		end
	end

	wait(1)

	--am or pm
	if os.date("%p") == "PM" then
		voice.SoundId = "rbxasset://ROCLOCK/PM.WAV"
		voice:Play()
	else
		voice.SoundId = "rbxasset://ROCLOCK/AM.WAV"
		voice:Play()
	end
	wait(1)
end

clockface.Activated:Connect(function ()
	clockface.Active = false
	speech()
	clockface.Active = true
end)

local function onNewScriptButtonClicked()
	if window.Enabled == false then
		window.Enabled = true
	else
		window.Enabled = false
	end
end
newScriptButton.Click:Connect(onNewScriptButtonClicked)
function checkquarter()
	if tonumber(os.date("%M")) == 15 then
		if clockdata.QTIME.Value == 15 then
		else
			clockdata.QTIME.Value = 15
			voice.SoundId = "rbxasset://ROCLOCK/15CHIME.WAV"
			voice:Play()
			wait(4)
			speech()
		end
	end
	if tonumber(os.date("%M")) == 30 then
		if clockdata.QTIME.Value == 30 then
		else
			clockdata.QTIME.Value = 30
			voice.SoundId = "rbxasset://ROCLOCK/30CHIME.WAV"
			voice:Play()
			wait(6)
			speech()
		end
	end
	if tonumber(os.date("%M")) == 45 then
		if clockdata.QTIME.Value == 45 then
		else
			clockdata.QTIME.Value = 45
			voice.SoundId = "rbxasset://ROCLOCK/45CHIME.WAV"
			voice:Play()
			wait(9)
			speech()
		end
	end
	if tonumber(os.date("%M")) == 0 then
		if clockdata.QTIME.Value == 0 then
		else
			clockdata.QTIME.Value = 0
			voice.SoundId = "rbxasset://ROCLOCK/FULLHOURCHIME.WAV"
			voice:Play()
			wait(12)
			speech()
		end
	end
end
while true do
	checkquarter()
	clockface.Text = os.date("%I") .. ":" .. os.date("%M") .. ":" .. os.date("%S") .. " " .. os.date("%p")
	wait(1)
end