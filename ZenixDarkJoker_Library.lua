local ThemeColors = {
	DeepBlack = Color3.fromRGB(0, 0, 0),
	DarkPanel = Color3.fromRGB(10, 10, 10),
	ButtonNormal = Color3.fromRGB(16, 16, 16),
	ButtonHover = Color3.fromRGB(46, 46, 46),
	ButtonPress = Color3.fromRGB(8, 8, 8),
	MidGray = Color3.fromRGB(120, 120, 120),
	LightGray = Color3.fromRGB(200, 200, 200),
	PureWhite = Color3.fromRGB(255, 255, 255)
}

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local activeGradients = {}

local function Tween(obj, props, time, style, dir)
	local tw = TweenService:Create(
		obj,
		TweenInfo.new(time or 0.2, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	tw:Play()
	return tw
end

local function ApplyMetallicBorder(parentElement, thickness)
	local stroke = Instance.new("UIStroke")
	stroke.Color = ThemeColors.PureWhite
	stroke.Thickness = thickness or 2.5
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.LineJoinMode = Enum.LineJoinMode.Round
	stroke.Parent = parentElement

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, ThemeColors.PureWhite),
		ColorSequenceKeypoint.new(0.25, ThemeColors.MidGray),
		ColorSequenceKeypoint.new(0.5, ThemeColors.DeepBlack),
		ColorSequenceKeypoint.new(0.75, ThemeColors.MidGray),
		ColorSequenceKeypoint.new(1, ThemeColors.PureWhite)
	})
	gradient.Rotation = math.random(0, 359)
	gradient.Parent = stroke
	table.insert(activeGradients, gradient)
	return stroke, gradient
end

RunService.RenderStepped:Connect(function(dt)
	for i = #activeGradients, 1, -1 do
		local gradient = activeGradients[i]
		if gradient and gradient.Parent then
			gradient.Rotation = (gradient.Rotation + (100 * dt)) % 360
		else
			table.remove(activeGradients, i)
		end
	end
end)

local Player = Players.LocalPlayer
if not Player then
	Players.PlayerAdded:Wait()
	Player = Players.LocalPlayer
end
local playerGui = Player:WaitForChild("PlayerGui")
local MainHubFrame, ScreenGuiHub

if playerGui:FindFirstChild("ZenixDarkJoker_Final_Version") then
	playerGui.ZenixDarkJoker_Final_Version:Destroy()
end

local redzlib = {
	Themes = {
		Dark = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(15, 15, 15)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(30, 30, 30))
			}),
			["Color Hub 2"] = Color3.fromRGB(0, 0, 0),
			["Color Stroke"] = Color3.fromRGB(255, 255, 255),
			["Color Theme"] = Color3.fromRGB(0, 0, 0),
			["Color Text"] = Color3.fromRGB(255, 255, 255),
			["Color Dark Text"] = Color3.fromRGB(200, 200, 200),
			["Color Button"] = Color3.fromRGB(22, 22, 22),
			["Color TextBox"] = Color3.fromRGB(28, 28, 28)
		}
	},
	Info = { Version = "1.2.0" },
	Save = { UISize = { 500, 390 }, TabSize = 160, Theme = "Dark" }
}

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = ViewportSize.Y / 450
local Theme = redzlib.Themes[redzlib.Save.Theme]

local function SetProps(Instance, Props)
	if Props then
		for prop, value in Props do
			Instance[prop] = value
		end
	end
	return Instance
end

local function SetChildren(Instance, Children)
	if Children then
		for _, Child in Children do
			Child.Parent = Instance
		end
	end
	return Instance
end

local function Create(Class, ...)
	local args = { ... }
	local new = Instance.new(Class)
	if type(args[1]) == "table" then
		SetProps(new, args[1])
		SetChildren(new, args[2])
	elseif typeof(args[1]) == "Instance" then
		new.Parent = args[1]
		SetProps(new, args[2])
		SetChildren(new, args[3])
	end
	return new
end

local function MakeDrag(Instance)
	local dragging = false
	local dragInput, dragStart, startPos

	Instance.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Instance.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Instance.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			Instance.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + (delta.X / UIScale),
				startPos.Y.Scale,
				startPos.Y.Offset + (delta.Y / UIScale)
			)
		end
	end)
	return Instance
end

local function StyleInteractive(frame)
	frame.BackgroundColor3 = ThemeColors.ButtonNormal
	if frame:IsA("GuiButton") then
		frame.AutoButtonColor = false
	end
	frame.MouseEnter:Connect(function()
		Tween(frame, { BackgroundColor3 = ThemeColors.ButtonHover, BackgroundTransparency = 0.08 }, 0.16)
	end)
	frame.MouseLeave:Connect(function()
		Tween(frame, { BackgroundColor3 = ThemeColors.ButtonNormal, BackgroundTransparency = 0 }, 0.16)
	end)
	if frame:IsA("GuiButton") then
		frame.MouseButton1Down:Connect(function()
			Tween(frame, { BackgroundColor3 = ThemeColors.ButtonPress }, 0.07)
		end)
		frame.MouseButton1Up:Connect(function()
			Tween(frame, { BackgroundColor3 = ThemeColors.ButtonHover }, 0.1)
		end)
	end
end

redzlib.Elements = {}
redzlib.Elements["Corner"] = function(parent, CornerRadius)
	return Create("UICorner", parent, { CornerRadius = CornerRadius or UDim.new(0, 15) })
end
redzlib.Elements["Gradient"] = function(parent, props)
	return Create("UIGradient", parent, { Color = Theme["Color Hub 1"] })
end

local function CreateTween(config)
	local tween = TweenService:Create(config[1], TweenInfo.new(config[4] or 0.5, Enum.EasingStyle.Quint), { [config[2]] = config[3] })
	tween:Play()
	if config[5] then
		tween.Completed:Wait()
	end
	return tween
end

local function ButtonFrame(Container, Title, Description, HolderSize)
	local TitleL = Create("TextLabel", {
		Font = Enum.Font.GothamMedium,
		TextColor3 = Theme["Color Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 0, 0.5),
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundTransparency = 1,
		TextTruncate = "AtEnd",
		TextSize = 10,
		TextXAlignment = "Left",
		Text = "",
		RichText = true,
		ZIndex = 15
	})
	local DescL = Create("TextLabel", {
		Font = Enum.Font.Gotham,
		TextColor3 = Theme["Color Dark Text"],
		Size = UDim2.new(1, -20),
		AutomaticSize = "Y",
		Position = UDim2.new(0, 12, 0, 15),
		BackgroundTransparency = 1,
		TextWrapped = true,
		TextSize = 8,
		TextXAlignment = "Left",
		Text = "",
		RichText = true,
		ZIndex = 15
	})
	local Frame = Create("TextButton", Container, {
		Size = UDim2.new(1, -20, 0, 32),
		AutomaticSize = "Y",
		Name = "Option",
		Text = "",
		BackgroundColor3 = ThemeColors.ButtonNormal,
		AutoButtonColor = false,
		ZIndex = 14
	})
	redzlib.Elements["Corner"](Frame, UDim.new(0, 8))
	ApplyMetallicBorder(Frame, 1.8)
	StyleInteractive(Frame)

	local LabelHolder = Create("Frame", Frame, {
		AutomaticSize = "Y",
		BackgroundTransparency = 1,
		Size = HolderSize,
		Position = UDim2.new(0, 10, 0),
		AnchorPoint = Vector2.new(0, 0),
		ZIndex = 15
	}, {
		Create("UIListLayout", { SortOrder = "LayoutOrder", VerticalAlignment = "Center", Padding = UDim.new(0, 2) }),
		Create("UIPadding", { PaddingBottom = UDim.new(0, 6), PaddingTop = UDim.new(0, 6) }),
		TitleL,
		DescL
	})

	local Label = {}
	function Label:SetTitle(t)
		if type(t) == "string" and t:gsub(" ", ""):len() > 0 then
			TitleL.Text = '<font family="12187367066">' .. t .. "</font>"
		end
	end
	function Label:SetDesc(d)
		if type(d) == "string" and d:gsub(" ", ""):len() > 0 then
			DescL.Visible = true
			DescL.Text = d
			LabelHolder.Position = UDim2.new(0, 10, 0)
			LabelHolder.AnchorPoint = Vector2.new(0, 0)
		else
			DescL.Visible = false
			DescL.Text = ""
			LabelHolder.Position = UDim2.new(0, 10, 0.5)
			LabelHolder.AnchorPoint = Vector2.new(0, 0.5)
		end
	end
	Label:SetTitle(Title)
	Label:SetDesc(Description)
	return Frame, Label
end

local activeNotifications = {}
function CreateNotification(text, duration)
	local title = "رسالة المطور"
	duration = duration or 6
	local gui = Instance.new("ScreenGui")
	gui.Name = "ZenixNotify_" .. tick()
	gui.Parent = playerGui
	gui.ResetOnSpawn = false
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 285, 0, 75)
	frame.Position = UDim2.new(1, 10, 0, 10)
	frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.ZIndex = 100
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
	ApplyMetallicBorder(frame, 1.6)
	frame.Parent = gui

	local topBorder = Instance.new("Frame")
	topBorder.Size = UDim2.new(1, 0, 0, 2)
	topBorder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	topBorder.BorderSizePixel = 0
	topBorder.ZIndex = 101
	topBorder.Parent = frame

	local progressBar = Instance.new("Frame")
	progressBar.Size = UDim2.new(1, 0, 0, 3)
	progressBar.Position = UDim2.new(0, 0, 1, -3)
	progressBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	progressBar.BorderSizePixel = 0
	progressBar.ZIndex = 101
	progressBar.Parent = frame

	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(1, -16, 0, 24)
	titleLabel.Position = UDim2.new(0, 8, 0, 6)
	titleLabel.Text = title
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 13
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.BackgroundTransparency = 1
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.ZIndex = 101
	titleLabel.Parent = frame

	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -16, 0, 22)
	textLabel.Position = UDim2.new(0, 8, 0, 32)
	textLabel.Text = text
	textLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	textLabel.TextSize = 11
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.TextWrapped = true
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.GothamMedium
	textLabel.ZIndex = 101
	textLabel.Parent = frame

	task.spawn(function()
		local startTime = tick()
		while tick() - startTime < duration and frame.Parent do
			progressBar.Size = UDim2.new(1 - (tick() - startTime) / duration, 0, 0, 3)
			task.wait()
		end
	end)

	local function RepositionNotifications()
		local yOffset = 10
		for i, notif in ipairs(activeNotifications) do
			if notif.frame and notif.frame.Parent then
				notif.frame:TweenPosition(UDim2.new(1, -295, 0, yOffset), "Out", "Quad", 0.3, true)
				yOffset = yOffset + 85
			end
		end
	end

	table.insert(activeNotifications, { frame = frame, gui = gui })
	RepositionNotifications()

	task.delay(duration, function()
		if frame.Parent then
			local targetPos = UDim2.new(1, 20, 0, frame.Position.Y.Offset)
			frame:TweenPosition(targetPos, "In", "Back", 0.4, true)
			task.wait(0.4)
			gui:Destroy()
		end
		for i, notif in ipairs(activeNotifications) do
			if notif.frame == frame then
				table.remove(activeNotifications, i)
				break
			end
		end
		RepositionNotifications()
	end)
end

ScreenGuiHub = Create("ScreenGui", playerGui, {
	Name = "ZenixDarkJoker_Final_Version",
	ResetOnSpawn = false,
	IgnoreGuiInset = true,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, { Create("UIScale", { Scale = UIScale, Name = "Scale" }) })

local ScreenFind = playerGui:FindFirstChild(ScreenGuiHub.Name)
if ScreenFind and ScreenFind ~= ScreenGuiHub then
	ScreenFind:Destroy()
end

local MusicIntro = Instance.new("Sound", ScreenGuiHub)
MusicIntro.SoundId = "rbxassetid://116421368790691"
MusicIntro.Volume = 0.5
MusicIntro.Looped = false

local MusicLoop = Instance.new("Sound", ScreenGuiHub)
MusicLoop.SoundId = "rbxassetid://88915139965117"
MusicLoop.Volume = 0.5
MusicLoop.Looped = true

local isMusicPlaying = false
local function PlayMusic()
	if not isMusicPlaying then
		isMusicPlaying = true
		MusicIntro:Play()
	end
end

MusicIntro.Ended:Connect(function()
	if isMusicPlaying and MainHubFrame and MainHubFrame.Visible then
		MusicLoop:Play()
	end
end)

local function StopMusic()
	isMusicPlaying = false
	MusicIntro:Stop()
	MusicLoop:Stop()
end

MainHubFrame = Create("ImageLabel", ScreenGuiHub, {
	Size = UDim2.new(0, 500, 0, 390),
	Position = UDim2.new(0.5, -250, 0.5, -171),
	BackgroundTransparency = 1,
	Visible = false,
	Active = true,
	Name = "Hub",
	ZIndex = 1
})

local WindowBackground = Create("ImageLabel", MainHubFrame, {
	Name = "WindowBackground",
	Size = UDim2.new(1, 0, 1, 0),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundTransparency = 0,
	Image = "rbxthumb://type=Asset&id=76892256611627&w=420&h=420",
	ImageTransparency = 0.1,
	ScaleType = Enum.ScaleType.Crop,
	ZIndex = 0
})
redzlib.Elements["Corner"](WindowBackground, UDim.new(0, 8))

local CloudImage = Instance.new("ImageLabel", MainHubFrame)
CloudImage.Size = UDim2.new(0, 190, 0, 190)
CloudImage.Position = UDim2.new(1, -100, 0, -96)
CloudImage.AnchorPoint = Vector2.new(0.5, 0.5)
CloudImage.Image = "rbxthumb://type=Asset&id=79765384238686&w=420&h=420"
CloudImage.BackgroundTransparency = 1
CloudImage.ZIndex = 0
CloudImage.Name = "Cloud"

local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "Particles"
ParticleContainer.Size = UDim2.new(1, -redzlib.Save.TabSize, 1, -28)
ParticleContainer.Position = UDim2.new(1, 0, 1, 0)
ParticleContainer.AnchorPoint = Vector2.new(1, 1)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.ClipsDescendants = true
ParticleContainer.ZIndex = 2
Instance.new("UICorner", ParticleContainer).CornerRadius = UDim.new(0, 8)
ParticleContainer.Parent = MainHubFrame

local particles = {}
local colorTweenInfo = TweenInfo.new(4.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)

for i = 1, 46 do
	local size = (i % 3 == 0) and 8 or 6
	local wrap = Instance.new("Frame")
	wrap.Size = UDim2.new(0, size + 6, 0, size + 6)
	wrap.BackgroundTransparency = 1
	wrap.ZIndex = 2
	wrap.Parent = ParticleContainer

	local glow = Instance.new("Frame")
	glow.Size = UDim2.new(1, 0, 1, 0)
	glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	glow.BackgroundTransparency = 0.88
	glow.BorderSizePixel = 0
	glow.ZIndex = 2
	glow.Parent = wrap
	Instance.new("UICorner", glow).CornerRadius = UDim.new(1, 0)

	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, size, 0, size)
	dot.Position = UDim2.new(0.5, 0, 0.5, 0)
	dot.AnchorPoint = Vector2.new(0.5, 0.5)
	dot.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	dot.BackgroundTransparency = math.random(25, 65) / 100
	dot.BorderSizePixel = 0
	dot.ZIndex = 3
	Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
	dot.Parent = wrap

	TweenService:Create(dot, colorTweenInfo, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()

	table.insert(particles, {
		element = wrap,
		xPos = math.random(0, 1000) / 1000,
		yPos = math.random(0, 1000) / 1000,
		speed = math.random(45, 75) / 1000,
		freq = math.random(8, 20) / 10,
		amp = math.random(8, 18) / 1000,
		offset = math.random(0, 10)
	})
end

RunService.RenderStepped:Connect(function(dt)
	if not MainHubFrame.Visible then
		return
	end
	for _, p in ipairs(particles) do
		p.yPos = p.yPos - (p.speed * (dt * 0.5))
		local sway = math.sin(tick() * p.freq + p.offset) * p.amp
		p.element.Position = UDim2.new(p.xPos + sway, 0, p.yPos, 0)
		if p.yPos <= -0.1 then
			p.yPos = 1.1
			p.xPos = math.random(0, 1000) / 1000
		end
	end
end)

local Components = Create("Frame", MainHubFrame, {
	Name = "Components",
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	ZIndex = 10
})

local Stroke = Create("UIStroke", MainHubFrame, {
	Color = Color3.fromRGB(255, 255, 255),
	Thickness = 2.5,
	ApplyStrokeMode = Enum.ApplyStrokeMode.Border
})

local StrokeGradient = Create("UIGradient", Stroke, {
	Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
	}),
	Rotation = 0
})
table.insert(activeGradients, StrokeGradient)

redzlib.Elements["Gradient"](MainHubFrame, { Rotation = 45 })
MakeDrag(MainHubFrame)
redzlib.Elements["Corner"](MainHubFrame)

local ToggleButton = Instance.new("ImageButton", ScreenGuiHub)
ToggleButton.Size = UDim2.new(0, 56, 0, 56)
ToggleButton.Position = UDim2.new(0.02, 0, 0.28, 0)
ToggleButton.BackgroundTransparency = 1
ToggleButton.Image = "rbxthumb://type=Asset&id=76841742830292&w=150&h=150"
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.ZIndex = 50
ToggleButton.Name = "ZenixToggle"
ToggleButton.AutoButtonColor = false
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 8)

local dragging = false
local dragInput = nil
local clickTimer = 0
local startPos = UDim2.new()
local dragStart = Vector3.new()

ToggleButton.InputBegan:Connect(function(input)
	if not dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1) then
		dragging = true
		dragInput = input
		startPos = ToggleButton.Position
		dragStart = input.Position
		clickTimer = tick()
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		local scale = ScreenGuiHub.Scale.Scale
		ToggleButton.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + (delta.X / scale),
			startPos.Y.Scale,
			startPos.Y.Offset + (delta.Y / scale)
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if dragging and input == dragInput then
		dragging = false
		dragInput = nil
		local endPos = input.Position
		if (endPos - dragStart).Magnitude < 15 or (tick() - clickTimer) < 0.2 then
			MainHubFrame.Visible = not MainHubFrame.Visible
			if MainHubFrame.Visible then
				PlayMusic()
			else
				StopMusic()
			end
		end
	end
end)

local resizeHandle = Create("ImageButton", MainHubFrame, {
	Size = UDim2.new(0, 20, 0, 20),
	Position = UDim2.new(1, -2, 1, -2),
	AnchorPoint = Vector2.new(1, 1),
	BackgroundTransparency = 1,
	Image = "rbxassetid://6031097229",
	ImageColor3 = Color3.fromRGB(220, 220, 220),
	Name = "ResizeHandle",
	ZIndex = 200,
	Active = true,
	AutoButtonColor = false
})

local resizing = false
local resizeStartPos, resizeStartSize

resizeHandle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizing = true
		resizeStartPos = input.Position
		resizeStartSize = MainHubFrame.AbsoluteSize
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local scale = ScreenGuiHub.Scale.Scale
		local delta = input.Position - resizeStartPos
		local newWidth = math.clamp((resizeStartSize.X + delta.X) / scale, 380, 900)
		local newHeight = math.clamp((resizeStartSize.Y + delta.Y) / scale, 280, 700)
		MainHubFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		resizing = false
	end
end)

local TopBar = Create("Frame", Components, {
	Size = UDim2.new(1, 0, 0, 28),
	BackgroundTransparency = 1,
	Name = "Top Bar",
	ZIndex = 11
})

local Title = Create("TextLabel", TopBar, {
	Position = UDim2.new(0, 30, 0.5),
	AnchorPoint = Vector2.new(0, 0.5),
	AutomaticSize = "XY",
	Text = '<font family="12187375194">Zenix Dark Joker</font>',
	RichText = true,
	TextXAlignment = "Left",
	TextSize = 13.8,
	TextColor3 = Theme["Color Text"],
	BackgroundTransparency = 1,
	Name = "Title",
	ZIndex = 12
})

Create("TextLabel", Title, {
	Size = UDim2.fromScale(0, 1),
	AutomaticSize = "X",
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.new(1, 5, 0.9),
	Text = '<font family="12187367066">by go2mohamed  |  </font><font family="12187367066">BROOKHAVEN SCRIPT</font>',
	RichText = true,
	TextColor3 = Theme["Color Dark Text"],
	BackgroundTransparency = 1,
	TextXAlignment = "Left",
	TextYAlignment = "Bottom",
	TextSize = 8,
	Name = "SubTitle",
	ZIndex = 12
})

local MainScroll = Create("ScrollingFrame", Components, {
	Size = UDim2.new(0, redzlib.Save.TabSize, 1, -TopBar.Size.Y.Offset),
	ScrollBarImageColor3 = Theme["Color Theme"],
	Position = UDim2.new(0, 0, 1, 0),
	AnchorPoint = Vector2.new(0, 1),
	ScrollBarThickness = 1.5,
	BackgroundTransparency = 1,
	ScrollBarImageTransparency = 0.2,
	CanvasSize = UDim2.new(),
	AutomaticCanvasSize = "Y",
	ScrollingDirection = "Y",
	BorderSizePixel = 0,
	Name = "Tab Scroll",
	ZIndex = 11
}, {
	Create("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10) }),
	Create("UIListLayout", { Padding = UDim.new(0, 5) })
})

local Containers = Create("Frame", Components, {
	Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	ClipsDescendants = true,
	Name = "Containers",
	ZIndex = 11
})

local ButtonsFolder = Create("Folder", TopBar, { Name = "Buttons" })
local CloseButton = Create("ImageButton", {
	Size = UDim2.new(0, 21, 0, 21),
	Position = UDim2.new(1, -10, 0.5),
	AnchorPoint = Vector2.new(1, 0.5),
	BackgroundTransparency = 1,
	Image = "rbxassetid://10747384394",
	AutoButtonColor = false,
	Name = "Close",
	ZIndex = 12
})

local MinimizeButton = Create("ImageButton", {
	Size = UDim2.new(0, 21, 0, 21),
	Position = UDim2.new(1, -35, 0.5),
	AnchorPoint = Vector2.new(1, 0.5),
	BackgroundTransparency = 1,
	Image = "rbxassetid://10734896206",
	AutoButtonColor = false,
	Name = "Minimize",
	ZIndex = 12
})
SetChildren(ButtonsFolder, { CloseButton, MinimizeButton })

local Minimized, SaveSize, WaitClick
local Window = {}

function Window:CloseBtn()
	Window:Dialog({
		Title = "Zenix Dark Joker",
		Text = "هل تريد إغلاق السكربت؟",
		Options = {
			{
				"نعم",
				function()
					StopMusic()
					ScreenGuiHub:Destroy()
				end
			},
			{ "لا" }
		}
	})
end

function Window:MinimizeBtn()
	if WaitClick then
		return
	end
	WaitClick = true
	if Minimized then
		MinimizeButton.Image = "rbxassetid://10734896206"
		CreateTween({ MainHubFrame, "Size", SaveSize, 0.25, true })
		Minimized = false
	else
		MinimizeButton.Image = "rbxassetid://10734924532"
		SaveSize = MainHubFrame.Size
		CreateTween({ MainHubFrame, "Size", UDim2.fromOffset(MainHubFrame.Size.X.Offset, 28), 0.25, true })
		Minimized = true
	end
	WaitClick = false
end

function Window:Dialog(Configs)
	local DTitle = Configs.Title or "Dialog"
	local DText = Configs.Text or ""
	local DOptions = Configs.Options or {}

	local Screen = Create("Frame", MainHubFrame, {
		BackgroundTransparency = 1,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Name = "Dialog",
		ZIndex = 100
	})

	local Frame = Create("Frame", Screen, {
		Active = true,
		Size = UDim2.fromOffset(250, 150),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(16, 16, 16),
		ZIndex = 101
	}, {
		Create("TextLabel", {
			Font = Enum.Font.GothamBold,
			Size = UDim2.new(1, 0, 0, 20),
			Text = DTitle,
			TextXAlignment = "Left",
			TextColor3 = Theme["Color Text"],
			TextSize = 15,
			Position = UDim2.fromOffset(15, 5),
			BackgroundTransparency = 1,
			ZIndex = 102
		}),
		Create("TextLabel", {
			Font = Enum.Font.GothamMedium,
			Size = UDim2.new(1, -25),
			AutomaticSize = "Y",
			Text = DText,
			TextXAlignment = "Left",
			TextColor3 = Theme["Color Dark Text"],
			TextSize = 12,
			Position = UDim2.fromOffset(15, 25),
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 102
		})
	})

	redzlib.Elements["Corner"](Frame)
	ApplyMetallicBorder(Frame, 2)

	local ButtonsHolder = Create("Frame", Frame, {
		Size = UDim2.fromScale(1, 0.35),
		Position = UDim2.fromScale(0, 1),
		AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		BackgroundTransparency = 1,
		ZIndex = 102
	}, {
		Create("UIListLayout", {
			Padding = UDim.new(0, 10),
			VerticalAlignment = "Center",
			FillDirection = "Horizontal",
			HorizontalAlignment = "Center"
		})
	})

	CreateTween({ Screen, "BackgroundTransparency", 0.6, 0.15 })

	local ButtonCount, Dialog = 1, {}
	function Dialog:Button(Configs)
		local Name = Configs[1] or ""
		local Callback = Configs[2] or function() end
		ButtonCount = ButtonCount + 1

		local Button = Create("TextButton", ButtonsHolder, {
			Text = Name,
			Font = Enum.Font.GothamBold,
			TextColor3 = Theme["Color Text"],
			TextSize = 12,
			BackgroundColor3 = ThemeColors.ButtonNormal,
			AutoButtonColor = false,
			ZIndex = 105
		})
		redzlib.Elements["Corner"](Button, UDim.new(0, 6))
		ApplyMetallicBorder(Button, 2)
		StyleInteractive(Button)

		for _, Btn in pairs(ButtonsHolder:GetChildren()) do
			if Btn:IsA("TextButton") then
				Btn.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 20) / ButtonCount), 0, 32)
			end
		end

		Button.Activated:Connect(function()
			Dialog.Close()
			Callback()
		end)
	end

	function Dialog:Close()
		Screen:Destroy()
	end

	table.foreach(DOptions, function(_, Button)
		Dialog:Button(Button)
	end)

	return Dialog
end

CloseButton.Activated:Connect(Window.CloseBtn)
MinimizeButton.Activated:Connect(Window.MinimizeBtn)

local TabContainers = {}
local TabButtons = {}

function CreateTab(TabName)
	local TabBtn = Create("TextButton", {
		Parent = MainScroll,
		Size = UDim2.new(1, 0, 0, 26),
		Text = "",
		BackgroundColor3 = ThemeColors.ButtonNormal,
		AutoButtonColor = false,
		ZIndex = 12
	})
	redzlib.Elements["Corner"](TabBtn, UDim.new(0, 8))
	ApplyMetallicBorder(TabBtn, 1.8)
	StyleInteractive(TabBtn)

	local icon = Instance.new("ImageLabel")
	icon.Size = UDim2.new(0, 18, 0, 18)
	icon.Position = UDim2.new(0, 5, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundTransparency = 1
	icon.Image = "rbxthumb://type=Asset&id=76809797628298&w=420&h=420"
	icon.ZIndex = 13
	icon.Parent = TabBtn

	Create("TextLabel", {
		Parent = TabBtn,
		Size = UDim2.new(1, -30, 1, 0),
		Position = UDim2.new(0, 28, 0, 0),
		Text = '<font family="12187367066">' .. TabName .. "</font>",
		TextColor3 = Theme["Color Text"],
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		RichText = true,
		ZIndex = 13
	})

	local Page = Create("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ScrollBarThickness = 2,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		ZIndex = 12
	})
	Create("UIListLayout", Page, { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder })
	Create("UIPadding", Page, { PaddingLeft = UDim.new(0, 10), PaddingTop = UDim.new(0, 10) })
	table.insert(TabContainers, Page)
	table.insert(TabButtons, TabBtn)

	if #TabContainers == 1 then
		Page.Parent = Containers
	end

	TabBtn.Activated:Connect(function()
		for _, p in pairs(TabContainers) do
			p.Parent = nil
		end
		Page.Parent = Containers
	end)

	local Tab = {}

	function Tab:AddButton(Configs)
		local name = Configs[1] or "Button"
		local cb = Configs.Callback or Configs[2] or function() end
		local btn = ButtonFrame(Page, name, nil, UDim2.new(1, -20))
		btn.Activated:Connect(function()
			if type(cb) == "function" then
				cb()
			end
		end)
		return btn
	end

	function Tab:AddToggle(Configs)
		local name = Configs[1] or "Toggle"
		local default = Configs[2] or false
		local cb = Configs.Callback or Configs[3] or function() end
		local frame = ButtonFrame(Page, name, nil, UDim2.new(1, -50))

		local toggle = Create("Frame", {
			Parent = frame,
			Size = UDim2.new(0, 32, 0, 16),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = default and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(50, 50, 50),
			ZIndex = 15
		})
		redzlib.Elements["Corner"](toggle, UDim.new(1, 0))
		ApplyMetallicBorder(toggle, 1.6)

		local dot = Create("Frame", {
			Parent = toggle,
			Size = UDim2.new(0, 12, 0, 12),
			Position = default and UDim2.new(1, -14, 0.5, 0) or UDim2.new(0, 2, 0.5, 0),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = default and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(255, 255, 255),
			ZIndex = 16
		})
		redzlib.Elements["Corner"](dot, UDim.new(1, 0))

		local state = default
		local function set(v)
			state = v
			Tween(toggle, { BackgroundColor3 = state and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(50, 50, 50) }, 0.18)
			dot:TweenPosition(state and UDim2.new(1, -14, 0.5, 0) or UDim2.new(0, 2, 0.5, 0), "Out", "Quart", 0.2, true)
			Tween(dot, { BackgroundColor3 = state and Color3.fromRGB(10, 10, 10) or Color3.fromRGB(255, 255, 255) }, 0.18)
		end

		frame.Activated:Connect(function()
			set(not state)
			if type(cb) == "function" then
				cb(state)
			end
		end)
		return { SetToggle = set }
	end

	function Tab:AddSlider(Configs)
		local name = Configs[1] or "Slider"
		local min = Configs[2] or 1
		local max = Configs[3] or 100
		local default = Configs[5] or 25
		local cb = Configs.Callback or Configs[6] or function() end

		local btn = ButtonFrame(Page, name, nil, UDim2.new(1, -180))

		local bar = Create("Frame", {
			Parent = btn,
			BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			Size = UDim2.new(0, 120, 0, 6),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			ZIndex = 15
		})
		redzlib.Elements["Corner"](bar, UDim.new(1, 0))
		ApplyMetallicBorder(bar, 1.5)

		local fill = Create("Frame", {
			Parent = bar,
			BackgroundColor3 = Theme["Color Stroke"],
			Size = UDim2.fromScale((default - min) / math.max(max - min, 1), 1),
			ZIndex = 16
		})
		redzlib.Elements["Corner"](fill, UDim.new(1, 0))

		local icon = Create("Frame", {
			Parent = bar,
			Size = UDim2.new(0, 11, 0, 11),
			BackgroundColor3 = Color3.fromRGB(230, 230, 230),
			Position = UDim2.fromScale((default - min) / math.max(max - min, 1), 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ZIndex = 17
		})
		redzlib.Elements["Corner"](icon, UDim.new(1, 0))
		ApplyMetallicBorder(icon, 1)

		local label = Create("TextLabel", {
			Parent = btn,
			Size = UDim2.new(0, 40, 0, 14),
			Position = UDim2.new(1, -140, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Text = tostring(default),
			TextColor3 = Theme["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			BackgroundTransparency = 1,
			ZIndex = 15
		})

		local function updateSlider(input)
			local ratio = math.clamp((input.Position.X - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), 0, 1)
			local val = math.floor(min + (ratio * (max - min)))
			label.Text = tostring(val)
			icon.Position = UDim2.fromScale(ratio, 0.5)
			fill.Size = UDim2.fromScale(ratio, 1)
			if type(cb) == "function" then
				cb(val)
			end
		end

		local allowedInputs = { Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }
		local activeInput = nil
		bar.InputBegan:Connect(function(input)
			if table.find(allowedInputs, input.UserInputType) then
				activeInput = input
				updateSlider(input)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == activeInput then
				updateSlider(input)
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input == activeInput then
				activeInput = nil
			end
		end)
		return btn
	end

	function Tab:AddTextBox(Configs)
		local name = Configs[1] or "Text Box"
		local default = Configs[2] or ""
		local placeholder = Configs.Placeholder or "اكتب هنا..."
		local cb = Configs.Callback or Configs[4] or function() end

		local btn = ButtonFrame(Page, name, nil, UDim2.new(1, -38))
		local boxFrame = Create("Frame", {
			Parent = btn,
			Size = UDim2.new(0, 150, 0, 18),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(22, 22, 22),
			ZIndex = 15
		})
		redzlib.Elements["Corner"](boxFrame, UDim.new(0, 5))
		ApplyMetallicBorder(boxFrame, 1.6)

		local box = Create("TextBox", {
			Parent = boxFrame,
			Size = UDim2.new(0.9, 0, 0.85, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Text = default,
			PlaceholderText = placeholder,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			ClearTextOnFocus = false,
			ZIndex = 16
		})

		box.FocusLost:Connect(function()
			if type(cb) == "function" then
				cb(box.Text)
			end
		end)
		return btn
	end

	function Tab:AddDropdown(Configs)
		local title = Configs.Title or "Dropdown"
		local options = Configs.Options or {}
		local cb = Configs.Callback or function() end
		local selected = options[1] or ""

		local btn = ButtonFrame(Page, title, nil, UDim2.new(1, -80))
		local valueLabel = Create("TextLabel", {
			Parent = btn,
			Size = UDim2.new(0, 70, 0, 20),
			Position = UDim2.new(1, -10, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			Text = selected,
			TextColor3 = Theme["Color Text"],
			Font = Enum.Font.GothamBold,
			TextSize = 10,
			BackgroundColor3 = ThemeColors.ButtonNormal,
			BackgroundTransparency = 0.2,
			ZIndex = 15
		})
		redzlib.Elements["Corner"](valueLabel, UDim.new(0, 6))
		ApplyMetallicBorder(valueLabel, 1.6)

		local dropdownFrame = Create("Frame", {
			Parent = Page,
			Size = UDim2.new(1, -20, 0, 0),
			BackgroundColor3 = ThemeColors.DarkPanel,
			Visible = false,
			ClipsDescendants = true,
			AutomaticSize = "Y",
			ZIndex = 50
		})
		redzlib.Elements["Corner"](dropdownFrame, UDim.new(0, 6))
		ApplyMetallicBorder(dropdownFrame, 1.8)
		Create("UIListLayout", dropdownFrame, { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder })
		Create("UIPadding", dropdownFrame, {
			PaddingLeft = UDim.new(0, 5),
			PaddingRight = UDim.new(0, 5),
			PaddingTop = UDim.new(0, 5),
			PaddingBottom = UDim.new(0, 5)
		})

		local function refresh(opts)
			for _, child in ipairs(dropdownFrame:GetChildren()) do
				if child:IsA("TextButton") then
					child:Destroy()
				end
			end
			for _, opt in ipairs(opts) do
				local b = Create("TextButton", dropdownFrame, {
					Size = UDim2.new(1, 0, 0, 24),
					Text = opt,
					BackgroundColor3 = ThemeColors.ButtonNormal,
					AutoButtonColor = false,
					TextColor3 = Theme["Color Text"],
					Font = Enum.Font.GothamMedium,
					TextSize = 10,
					ZIndex = 51
				})
				redzlib.Elements["Corner"](b, UDim.new(0, 5))
				ApplyMetallicBorder(b, 1.5)
				StyleInteractive(b)
				b.Activated:Connect(function()
					selected = opt
					valueLabel.Text = opt
					dropdownFrame.Visible = false
					if type(cb) == "function" then
						cb(opt)
					end
				end)
			end
			dropdownFrame.Size = UDim2.new(1, -20, 0, #opts * 26 + 10)
		end
		refresh(options)

		btn.Activated:Connect(function()
			dropdownFrame.Visible = not dropdownFrame.Visible
			if dropdownFrame.Visible then
				dropdownFrame.Size = UDim2.new(1, -20, 0, #options * 26 + 10)
			end
		end)

		local dropdownObj = {}
		function dropdownObj:Refresh(opts)
			options = opts
			refresh(opts)
			valueLabel.Text = opts[1] or ""
			selected = opts[1] or ""
		end
		return dropdownObj
	end

	return Tab
end

local function ShowMainHub()
	MainHubFrame.Visible = true
	PlayMusic()
	CreateNotification("نورت السكربت يا غالي", 5)
	task.delay(5.5, function()
		CreateNotification("أنت الآن تستخدم سكربت Zenix Dark Joker", 5)
	end)
end

ShowMainHub()

local Library = {
	CreateTab = CreateTab,
	Notify = CreateNotification,
	Window = Window,
	Show = ShowMainHub,
	Frame = MainHubFrame,
	Gui = ScreenGuiHub
}

return Library
