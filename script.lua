-- [[ Luna By ALTRON - PREMIUM VISUALS SUITE (PART 1) ]] --
-- Price: 10$ / 1000 RUB | Developer: ALTRON

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

if game:GetService("CoreGui"):FindFirstChild("LunaByAltron") then
    game:GetService("CoreGui"):FindFirstChild("LunaByAltron"):Destroy()
end

local LunaGui = Instance.new("ScreenGui")
LunaGui.Name = "LunaByAltron"
LunaGui.ResetOnSpawn = false
LunaGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 750, 0, 480)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = LunaGui

local PreviewPane = Instance.new("Frame")
PreviewPane.Size = UDim2.new(0, 240, 0, 480)
PreviewPane.Position = UDim2.new(1, -240, 0, 0)
PreviewPane.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
PreviewPane.BorderSizePixel = 0
PreviewPane.Parent = MainFrame

local PreviewTitle = Instance.new("TextLabel")
PreviewTitle.Size = UDim2.new(1, 0, 0, 30)
PreviewTitle.BackgroundTransparency = 1
PreviewTitle.Text = "SKIN VISUALIZER"
PreviewTitle.TextColor3 = Color3.fromRGB(120, 120, 120)
PreviewTitle.TextSize = 10
PreviewTitle.Font = Enum.Font.GothamBold
PreviewTitle.Parent = PreviewPane

local PreviewViewport = Instance.new("ViewportFrame")
PreviewViewport.Size = UDim2.new(1, -20, 0, 220)
PreviewViewport.Position = UDim2.new(0, 10, 0, 30)
PreviewViewport.BackgroundTransparency = 1
PreviewViewport.Parent = PreviewPane

local FurryBait = Instance.new("Frame")
FurryBait.Size = UDim2.new(1, -20, 0, 180)
FurryBait.Position = UDim2.new(0, 10, 1, -200)
FurryBait.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
FurryBait.BorderSizePixel = 1
FurryBait.BorderColor3 = Color3.fromRGB(30, 30, 30)
FurryBait.Parent = PreviewPane

local FurryText = Instance.new("TextLabel")
FurryText.Size = UDim2.new(1, 0, 1, 0)
FurryText.BackgroundTransparency = 1
FurryText.Text = "LUNA WAIFU RENDER\n[Premium Bait Active]"
FurryText.TextColor3 = Color3.fromRGB(80, 80, 80)
FurryText.TextSize = 11
FurryText.Font = Enum.Font.GothamBold
FurryText.Parent = FurryBait

local SideMenu = Instance.new("Frame")
SideMenu.Name = "SideMenu"
SideMenu.Size = UDim2.new(0, 260, 0, 480)
SideMenu.Position = UDim2.new(1, 10, 0, 0)
SideMenu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SideMenu.BorderSizePixel = 1
SideMenu.BorderColor3 = Color3.fromRGB(50, 50, 50)
SideMenu.Parent = MainFrame

local SideHeader = Instance.new("TextLabel")
SideHeader.Size = UDim2.new(1, 0, 0, 40)
SideHeader.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
SideHeader.BorderSizePixel = 0
SideHeader.Text = "BACON VIEWPORT (360)"
SideHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
SideHeader.TextSize = 11
SideHeader.Font = Enum.Font.GothamBold
SideHeader.Parent = SideMenu

local SideViewport = Instance.new("ViewportFrame")
SideViewport.Size = UDim2.new(1, -20, 1, -60)
SideViewport.Position = UDim2.new(0, 10, 0, 50)
SideViewport.BackgroundTransparency = 1
SideViewport.Parent = SideMenu

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Luna By ALTRON"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.Parent = Sidebar

local UserProfileBar = Instance.new("Frame")
UserProfileBar.Size = UDim2.new(1, -10, 0, 70)
UserProfileBar.Position = UDim2.new(0, 5, 1, -75)
UserProfileBar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
UserProfileBar.BorderSizePixel = 0
UserProfileBar.Parent = Sidebar

local UserNameLabel = Instance.new("TextLabel")
UserNameLabel.Size = UDim2.new(1, -10, 0, 20)
UserNameLabel.Position = UDim2.new(0, 5, 0, 5)
UserNameLabel.BackgroundTransparency = 1
UserNameLabel.Text = "User: " .. LocalPlayer.Name
UserNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UserNameLabel.TextSize = 11
UserNameLabel.Font = Enum.Font.GothamBold
UserNameLabel.TextXAlignment = Enum.TextXAlignment.Left
UserNameLabel.Parent = UserProfileBar

local PriceText = Instance.new("TextLabel")
PriceText.Size = UDim2.new(1, -10, 0, 15)
PriceText.Position = UDim2.new(0, 5, 0, 25)
PriceText.BackgroundTransparency = 1
PriceText.Text = "Normal: 10$ / 1000 RUB"
PriceText.TextColor3 = Color3.fromRGB(168, 75, 62)
PriceText.TextSize = 9
PriceText.Font = Enum.Font.Gotham
PriceText.TextXAlignment = Enum.TextXAlignment.Left
PriceText.Parent = UserProfileBar

local ScrollTabs = Instance.new("ScrollingFrame")
ScrollTabs.Size = UDim2.new(1, 0, 1, -135)
ScrollTabs.Position = UDim2.new(0, 0, 0, 50)
ScrollTabs.BackgroundTransparency = 1
ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, 620)
ScrollTabs.ScrollBarThickness = 2
ScrollTabs.Parent = Sidebar

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.Parent = ScrollTabs

local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -430, 1, -10)
ContentContainer.Position = UDim2.new(0, 185, 0, 5)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local Pages = {}
local function createPage(pageName)
    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Size = UDim2.new(1, 0, 1, 0)
    PageFrame.BackgroundTransparency = 1
    PageFrame.Visible = false
    PageFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
    PageFrame.ScrollBarThickness = 2
    PageFrame.Parent = ContentContainer
    
    local List = Instance.new("UIListLayout")
    List.Padding = UDim.new(0, 6)
    List.Parent = PageFrame
    Pages[pageName] = PageFrame
    
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 26)
    TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = "  " .. pageName
    TabBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 11
    TabBtn.Parent = ScrollTabs
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(ScrollTabs:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundTransparency = 1 b.TextColor3 = Color3.fromRGB(120, 120, 120) end
        end
        PageFrame.Visible = true
        TabBtn.BackgroundTransparency = 0
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    return PageFrame
end

local function createToggle(pageFrame, toggleName, callback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -10, 0, 35)
    Row.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Row.BorderSizePixel = 0
    Row.Parent = pageFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = toggleName
    Label.TextColor3 = Color3.fromRGB(180, 180, 180)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 11
    Label.Parent = Row
    
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 45, 0, 20)
    Btn.Position = UDim2.new(1, -55, 0, 7)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(120, 120, 120)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 9
    Btn.Parent = Row
    
    local active = false
    Btn.MouseButton1Click:Connect(function()
        active = not active
        Btn.BackgroundColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(35, 35, 35)
        Btn.TextColor3 = active and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(120, 120, 120)
        Btn.Text = active and "ON" or "OFF"
        callback(active)
    end)
end

local tab_vis = createPage("Visuals")
local tab_skn = createPage("Skin Changer")
local tab_esp = createPage("ESP & Arrows")
local tab_mov = createPage("Movement & Songs")
local tab_exp = createPage("Exploits")
local tab_scr = createPage("Screen & Saturation")
local tab_prt = createPage("Particles Settings")
local tab_anm = createPage("Emotes & Animations")
local tab_opt = createPage("Optimization")
local tab_cfg = createPage("Configs")
local tab_afk = createPage("Anti-AFK System")
local tab_chm = createPage("Chams & Materials")
local tab_wld = createPage("World Modulation")
local tab_lit = createPage("Ambience & Skybox")
local tab_hit = createPage("Hitmarkers & UI")
local tab_crs = createPage("Crosshair Customizer")
local tab_msc = createPage("Miscellaneous")
local tab_hkt = createPage("Binds & Hotkeys")
local tab_plr = createPage("Player List Exploit")
local tab_set = createPage("Menu Settings")

Pages["Visuals"].Visible = true
-- [[ LUNA BY ALTRON: PREMIUM VISUALS SUITE (PART 2) ]] --

-- НАПОЛНЕНИЕ РАЗДЕЛОВ И ЛОГИКА ФУНКЦИЙ

-- 1. Раздел Visuals (Премиум-кристалл над головой и Лазерное светящееся кольцо)
local hatConnection = nil
createToggle(tab_vis, "Premium Diamond Indicator", function(state)
    local char = LocalPlayer.Character
    if state and char and char:FindFirstChild("Head") then
        local crystal = Instance.new("Part")
        crystal.Name = "LunaPremiumCrystal"
        crystal.Size = Vector3.new(0.6, 1.2, 0.6)
        crystal.Color = Color3.fromRGB(255, 255, 255)
        crystal.Material = Enum.Material.Neon
        crystal.CanCollide = false
        crystal.Parent = char
        
        local mesh = Instance.new("SpecialMesh", crystal)
        mesh.MeshType = Enum.MeshType.Prism
        mesh.Scale = Vector3.new(1, 1, 1)
        
        local weld = Instance.new("Weld", crystal)
        weld.Part0 = char.Head
        weld.Part1 = crystal
        weld.C0 = CFrame.new(0, 1.5, 0)
        
        local spinAngle = 0
        hatConnection = RunService.Heartbeat:Connect(function()
            if crystal and crystal.Parent then
                spinAngle = spinAngle + 2
                local hover = math.sin(tick() * 3) * 0.15
                weld.C0 = CFrame.new(0, 1.5 + hover, 0) * CFrame.Angles(0, math.radians(spinAngle), 0)
            end
        end)
    else
        if hatConnection then hatConnection:Disconnect() hatConnection = nil end
        if char and char:FindFirstChild("LunaPremiumCrystal") then char.LunaPremiumCrystal:Destroy() end
    end
end)

createToggle(tab_vis, "Neon Pulse Laser Ring", function(state)
    local char = LocalPlayer.Character
    if state and char and char:FindFirstChild("HumanoidRootPart") then
        local ring = Instance.new("Part")
        ring.Name = "LunaLaserRing"
        ring.Size = Vector3.new(4, 0.05, 4)
        ring.Color = Color3.fromRGB(255, 255, 255)
        ring.Material = Enum.Material.Neon
        ring.CanCollide = false
        ring.Parent = char
        
        local mesh = Instance.new("SpecialMesh", ring)
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://3270017"
        mesh.Scale = Vector3.new(5, 5, 0.2)
        
        local weld = Instance.new("Weld", ring)
        weld.Part0 = char.HumanoidRootPart
        weld.Part1 = ring
        weld.C0 = CFrame.new(0, -3.1, 0)
        
        task.spawn(function()
            while state and ring and ring.Parent do
                local scale = 5 + math.sin(tick() * 5) * 0.4
                mesh.Scale = Vector3.new(scale, scale, 0.2)
                task.wait()
            end
        end)
    else
        if char and char:FindFirstChild("LunaLaserRing") then char.LunaLaserRing:Destroy() end
    end
end)

-- 2. Раздел Skin Changer
createToggle(tab_skn, "Visual Headless", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Head") then
        char.Head.Transparency = state and 1 or 0
        if char.Head:FindFirstChildOfClass("Decal") then char.Head:FindFirstChildOfClass("Decal").Transparency = state and 1 or 0 end
    end
end)

createToggle(tab_skn, "Visual Korblox Leg", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("RightLowerLeg") then
        char.RightLowerLeg.Transparency = state and 1 or 0
        char.RightUpperLeg.Transparency = state and 1 or 0
        char.RightFoot.Transparency = state and 1 or 0
    end
end)

-- 3. Раздел ESP & Arrows
local espBoxes = {}
createToggle(tab_esp, "Enable Premium 3D Box ESP", function(state)
    if state then
        RunService:BindToRenderStep("Luna3D", 200, function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if not espBoxes[p] then
                        local b = Instance.new("BoxHandleAdornment", game:GetService("CoreGui"))
                        b.Size = Vector3.new(4, 6, 4)
                        b.Color3 = Color3.fromRGB(255, 255, 255)
                        b.AlwaysOnTop = true
                        b.Transparency = 0.6
                        b.Adornee = p.Character.HumanoidRootPart
                        espBoxes[p] = b
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("Luna3D")
        for _, b in pairs(espBoxes) do b:Destroy() end
        espBoxes = {}
    end
end)

-- 4. Раздел Exploits (Настоящий Anti-Fling)
createToggle(tab_exp, "Active Anti-Fling Forcefield", function(state)
    if state then
        RunService:BindToRenderStep("LunaFling", 100, function()
            local c = LocalPlayer.Character
            if c and c:FindFirstChild("HumanoidRootPart") then
                for _, part in pairs(c:GetChildren()) do 
                    if part:IsA("BasePart") then part.Velocity, part.RotVelocity = Vector3.zero, Vector3.zero end 
                end
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = p.Character.HumanoidRootPart
                        if (hrp.Position - c.HumanoidRootPart.Position).Magnitude < 30 then
                            if hrp.Velocity.Magnitude > 40 or hrp.RotVelocity.Magnitude > 40 then
                                hrp.Velocity, hrp.RotVelocity, hrp.CanCollide = Vector3.zero, Vector3.zero, false
                            end
                        end
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("LunaFling")
    end
end)

-- 5. Раздел Screen & Saturation
local cc = Lighting:FindFirstChild("LunaColor") or Instance.new("ColorCorrectionEffect", Lighting)
cc.Name = "LunaColor"
createToggle(tab_scr, "Max Saturation Boost", function(state) cc.Saturation = state and 1.6 or 0 end)
createToggle(tab_scr, "Stretch Screen Resolution", function(state) 
    TweenService:Create(Camera, TweenInfo.new(0.4), {FieldOfView = state and 115 or 70}):Play() 
end)

-- 6. Раздел Optimization
createToggle(tab_opt, "FPS Booster (Smooth Plastic)", function(state)
    if state then
        for _, o in pairs(workspace:GetDescendants()) do
            if o:IsA("Texture") or o:IsA("Decal") then o.Texture = ""
            elseif o:IsA("BasePart") then o.Material = Enum.Material.SmoothPlastic end
        end
    end
end)

-- 7. Раздел Anti-AFK
createToggle(tab_afk, "Enable Anti-AFK Protection", function(state)
    if state then
        LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.zero, Camera.CFrame)
            task.wait(0.5)
            game:GetService("VirtualUser"):Button2Up(Vector2.zero, Camera.CFrame)
        end)
    end
end)

-- ==========================================
-- ИСПРАВЛЕННЫЙ ХОТКЕЙ И РЕАЛЬНЫЕ 360 ВЬЮПОРТЫ
-- ==========================================

-- Кнопка закрытия меню на RIGHT SHIFT
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        LunaGui.Enabled = not LunaGui.Enabled
    end
end)

-- Функция создания красивого вращающегося скина
local function setupViewportModel(viewport, isBacon)
    local cam = Instance.new("Camera", viewport)
    cam.FieldOfView = 40
    viewport.CurrentCamera = cam
    
    local model = Instance.new("Model", viewport)
    
    local torso = Instance.new("Part", model)
    torso.Name = "Torso"
    torso.Size = Vector3.new(1.6, 2, 0.8)
    torso.Color = isBacon and Color3.fromRGB(168, 75, 62) or Color3.fromRGB(40, 40, 40)
    torso.Material = Enum.Material.Neon
    torso.Position = Vector3.new(0, 0, 0)
    
    local head = Instance.new("Part", model)
    head.Name = "Head"
    head.Size = Vector3.new(1, 1, 1)
    head.Color = Color3.fromRGB(220, 170, 150)
    head.Position = Vector3.new(0, 1.4, 0)
    
    if isBacon then
        local hair = Instance.new("Part", model)
        hair.Size = Vector3.new(1.2, 0.3, 1.2)
        hair.Color = Color3.fromRGB(60, 35, 20)
        hair.Material = Enum.Material.SmoothPlastic
        hair.Position = Vector3.new(0, 1.9, 0)
    end
    
    local sb = Instance.new("SelectionBox", viewport)
    sb.Adornee = model
    sb.Color3 = Color3.fromRGB(255, 255, 255)
    sb.LineThickness = 0.02
    
    local angle = 0
    RunService.RenderStepped:Connect(function(dt)
        angle = angle + (dt * 30)
        local rad = math.radians(angle)
        cam.CFrame = CFrame.new(Vector3.new(math.sin(rad) * 4.5, 0.6, math.cos(rad) * 4.5), Vector3.new(0, 0.4, 0))
    end)
end

-- Запуск рендеров манекенов
setupViewportModel(PreviewViewport, false)
setupViewportModel(SideViewport, true)
