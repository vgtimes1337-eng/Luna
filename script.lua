-- [[ Luna By ALTRON - MINECRAFT NEON EDITION ]] --
-- Developer: ALTRON

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- Фикс инициализации: Безопасное создание в CoreGui с поведением внутри плейса
if game:GetService("CoreGui"):FindFirstChild("LunaByAltron") then
    game:GetService("CoreGui"):FindFirstChild("LunaByAltron"):Destroy()
end

local LunaGui = Instance.new("ScreenGui")
LunaGui.Name = "LunaByAltron"
LunaGui.ResetOnSpawn = false
LunaGui.DisplayOrder = 1 -- Стандартный приоритет, Esc будет ПОВЕРХ меню
LunaGui.Parent = game:GetService("CoreGui")

-- Главный фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 780, 0, 500)
MainFrame.Position = UDim2.new(0.5, -390, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = LunaGui

local GlowLine = Instance.new("Frame")
GlowLine.Size = UDim2.new(1, 0, 0, 2)
GlowLine.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
GlowLine.BorderSizePixel = 0
GlowLine.Parent = MainFrame

-- Правая панель (Премиум визуализатор твоей одежды и скина)
local PreviewPane = Instance.new("Frame")
PreviewPane.Size = UDim2.new(0, 240, 1, -2)
PreviewPane.Position = UDim2.new(1, -240, 0, 2)
PreviewPane.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
PreviewPane.BorderSizePixel = 0
PreviewPane.Parent = MainFrame

local PreviewViewport = Instance.new("ViewportFrame")
PreviewViewport.Size = UDim2.new(1, -20, 0, 240)
PreviewViewport.Position = UDim2.new(0, 10, 0, 30)
PreviewViewport.BackgroundTransparency = 1
PreviewViewport.Parent = PreviewPane

local FurryBait = Instance.new("Frame")
FurryBait.Size = UDim2.new(1, -20, 0, 180)
FurryBait.Position = UDim2.new(0, 10, 1, -200)
FurryBait.BackgroundColor3 = Color3.fromRGB(4, 4, 4)
FurryBait.BorderSizePixel = 1
FurryBait.BorderColor3 = Color3.fromRGB(0, 255, 255)
FurryBait.Parent = PreviewPane

local FurryText = Instance.new("TextLabel")
FurryText.Size = UDim2.new(1, 0, 1, 0)
FurryText.BackgroundTransparency = 1
FurryText.Text = "LUNA FURRY RENDERER\n[Premium Engine Active]"
FurryText.TextColor3 = Color3.fromRGB(138, 43, 226)
FurryText.TextSize = 11
FurryText.Font = Enum.Font.GothamBold
FurryText.Parent = FurryBait

-- Второе окно (Бекон 360)
local SideMenu = Instance.new("Frame")
SideMenu.Name = "SideMenu"
SideMenu.Size = UDim2.new(0, 260, 0, 500)
SideMenu.Position = UDim2.new(1, 10, 0, 0)
SideMenu.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
SideMenu.BorderSizePixel = 1
SideMenu.BorderColor3 = Color3.fromRGB(138, 43, 226)
SideMenu.Parent = MainFrame

local SideHeader = Instance.new("TextLabel")
SideHeader.Size = UDim2.new(1, 0, 0, 40)
SideHeader.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
SideHeader.BorderSizePixel = 0
SideHeader.Text = "BACON TARGET VIEWPORT"
SideHeader.TextColor3 = Color3.fromRGB(0, 255, 255)
SideHeader.TextSize = 11
SideHeader.Font = Enum.Font.GothamBold
SideHeader.Parent = SideMenu

local SideViewport = Instance.new("ViewportFrame")
SideViewport.Size = UDim2.new(1, -20, 1, -60)
SideViewport.Position = UDim2.new(0, 10, 0, 50)
SideViewport.BackgroundTransparency = 1
SideViewport.Parent = SideMenu

-- Боковая панель (Левая колонка)
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, -2)
Sidebar.Position = UDim2.new(0, 0, 0, 2)
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

-- Блок профиля
local UserProfileBar = Instance.new("Frame")
UserProfileBar.Size = UDim2.new(1, -10, 0, 45)
UserProfileBar.Position = UDim2.new(0, 5, 1, -50)
UserProfileBar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
UserProfileBar.BorderSizePixel = 1
UserProfileBar.BorderColor3 = Color3.fromRGB(30, 30, 30)
UserProfileBar.Parent = Sidebar

local UserNameLabel = Instance.new("TextLabel")
UserNameLabel.Size = UDim2.new(1, -10, 1, 0)
UserNameLabel.Position = UDim2.new(0, 10, 0, 0)
UserNameLabel.BackgroundTransparency = 1
UserNameLabel.Text = "User: " .. LocalPlayer.Name
UserNameLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
UserNameLabel.TextSize = 11
UserNameLabel.Font = Enum.Font.GothamBold
UserNameLabel.TextXAlignment = Enum.TextXAlignment.Left
UserNameLabel.Parent = UserProfileBar

local ScrollTabs = Instance.new("ScrollingFrame")
ScrollTabs.Size = UDim2.new(1, 0, 1, -110)
ScrollTabs.Position = UDim2.new(0, 0, 0, 50)
ScrollTabs.BackgroundTransparency = 1
ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, 620)
ScrollTabs.ScrollBarThickness = 2
ScrollTabs.Parent = Sidebar

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.Parent = ScrollTabs

-- Центральный контейнер настроек
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -430, 1, -12)
ContentContainer.Position = UDim2.new(0, 185, 0, 5)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local Pages = {}
local function createPage(pageName)
    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Size = UDim2.new(1, 0, 1, 0)
    PageFrame.BackgroundTransparency = 1
    PageFrame.Visible = false
    PageFrame.CanvasSize = UDim2.new(0, 0, 0, 650)
    PageFrame.ScrollBarThickness = 2
    PageFrame.Parent = ContentContainer
    
    local List = Instance.new("UIListLayout")
    List.Padding = UDim.new(0, 6)
    List.Parent = PageFrame
    Pages[pageName] = PageFrame
    
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 26)
    TabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = "  " .. pageName
    TabBtn.TextColor3 = Color3.fromRGB(110, 110, 110)
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 11
    TabBtn.Parent = ScrollTabs
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(ScrollTabs:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundTransparency = 1 b.TextColor3 = Color3.fromRGB(110, 110, 110) end
        end
        PageFrame.Visible = true
        TabBtn.BackgroundTransparency = 0
        TabBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
    end)
    return PageFrame
end

local function createToggle(pageFrame, toggleName, callback)
    local Row = Instance.new("Frame")
    Row.Size = UDim2.new(1, -10, 0, 35)
    Row.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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
        Btn.BackgroundColor3 = active and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(35, 35, 35)
        Btn.TextColor3 = active and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(120, 120, 120)
        Btn.Text = active and "ON" or "OFF"
        callback(active)
    end)
end

-- Все 20 вкладок
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

-- ==========================================
-- ПРЕМИУМ ЛОГИКА ВИЗУАЛОВ И ЭКСПЛОИТОВ
-- ==========================================

-- 1. Раздел Visuals (Премиум-кристалл и Пульсирующее лазерное кольцо)
local hatConnection = nil
createToggle(tab_vis, "Premium Diamond Indicator", function(state)
    local char = LocalPlayer.Character
    if state and char and char:FindFirstChild("Head") then
        local crystal = Instance.new("Part")
        crystal.Name = "LunaPremiumCrystal"
        crystal.Size = Vector3.new(0.6, 1.2, 0.6)
        crystal.Color = Color3.fromRGB(0, 255, 255)
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
        ring.Color = Color3.fromRGB(138, 43, 226)
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
createToggle(tab_esp, "Enable 3D Box ESP", function(state)
    if state then
        RunService:BindToRenderStep("Luna3D", 200, function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if not espBoxes[p] then
                        local b = Instance.new("BoxHandleAdornment", game:GetService("CoreGui"))
                        b.Size = Vector3.new(4, 6, 4)
                        b.Color3 = Color3.fromRGB(0, 255, 255)
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

-- 8. Раздел Chams & Materials (Продвинутый Highlight неон)
local activeChams = {}
createToggle(tab_chm, "Minecraft Shader Chams", function(state)
    if state then
        RunService:BindToRenderStep("LunaChams", 200, function()
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and not activeChams[p] then
                    local hl = Instance.new("Highlight")
                    hl.FillColor = Color3.fromRGB(138, 43, 226)
                    hl.OutlineColor = Color3.fromRGB(0, 255, 255)
                    hl.FillTransparency = 0.4
                    hl.OutlineTransparency = 0
                    hl.Adornee = p.Character
                    hl.Parent = game:GetService("CoreGui")
                    activeChams[p] = hl
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("LunaChams")
        for _, hl in pairs(activeChams) do hl:Destroy() end
        activeChams = {}
    end
end)

-- 9. Раздел World Modulation (Night Mode)
local originalTime = Lighting.TimeOfDay
createToggle(tab_wld, "Minecraft Night Mode", function(state)
    Lighting.TimeOfDay = state and "00:00:00" or originalTime
end)

-- 10. Раздел Ambience & Skybox (Fullbright)
createToggle(tab_lit, "Enable Fullbright", function(state)
    Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(128, 128, 128)
    Lighting.OutdoorAmbient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(128, 128, 128)
end)

-- ==========================================
-- ИСПРАВЛЕННЫЙ ХОТКЕЙ И БЕЗОПАСНЫЙ РЕНДЕР
-- ==========================================

-- Кнопка закрытия меню на RIGHT SHIFT (Полная привязка)
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        LunaGui.Enabled = not LunaGui.Enabled
    end
end)

-- Безопасная загрузка твоего реального скина через UserId (Без вылетов)
local function setupPlayerViewport()
    local cam = Instance.new("Camera", PreviewViewport)
    cam.FieldOfView = 40
    PreviewViewport.CurrentCamera = cam
    
    local success, model = pcall(function()
        return Players:CreateHumanoidModelFromUserId(LocalPlayer.UserId)
    end)
    
    if success and model then
        model.Parent = PreviewViewport
        local hrp = model:WaitForChild("HumanoidRootPart", 5) or model:FindFirstChildOfClass("Part")
        if hrp then
            local sb = Instance.new("SelectionBox", PreviewViewport)
            sb.Adornee = model
            sb.Color3 = Color3.fromRGB(138, 43, 226)
            sb.LineThickness = 0.015
            
            local angle = 0
            RunService.RenderStepped:Connect(function(dt)
                if model and model.Parent then
                    angle = angle + (dt * 30)
                    local rad = math.radians(angle)
