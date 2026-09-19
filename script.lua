-- [[ LUNA BY ALTRON: PREMIUM VISUALS SUITE (PART 1) ]] --
-- Цена: 10$ / 1000 RUB | Разработчик: ALTRON

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- Очистка старых версий скрипта
if game:GetService("CoreGui"):FindFirstChild("LunaByAltron") then
    game:GetService("CoreGui"):FindFirstChild("LunaByAltron"):Destroy()
end

-- Создание ScreenGui
local LunaGui = Instance.new("ScreenGui")
LunaGui.Name = "LunaByAltron"
LunaGui.ResetOnSpawn = false
LunaGui.Parent = game:GetService("CoreGui")

-- Главный фрейм меню
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 750, 0, 480)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 1
MainFrame.BorderColor3 = Color3.fromRGB(68, 68, 68)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = LunaGui

-- Второе окно (Вьюпорт Бекона справа)
local SideMenu = Instance.new("Frame")
SideMenu.Name = "SideMenu"
SideMenu.Size = UDim2.new(0, 260, 0, 480)
SideMenu.Position = UDim2.new(1, 10, 0, 0)
SideMenu.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
SideMenu.BorderSizePixel = 1
SideMenu.BorderColor3 = Color3.fromRGB(68, 68, 68)
SideMenu.Parent = MainFrame

local SideHeader = Instance.new("TextLabel")
SideHeader.Size = UDim2.new(1, 0, 0, 40)
SideHeader.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
SideHeader.BorderSizePixel = 0
SideHeader.Text = "BACON VIEWPORT (360)"
SideHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
SideHeader.TextSize = 11
SideHeader.Font = Enum.Font.GothamBold
SideHeader.Parent = SideMenu

-- Вьюпорт Бекона
local SideContent = Instance.new("Frame")
SideContent.Size = UDim2.new(1, 0, 1, -40)
SideContent.Position = UDim2.new(0, 0, 0, 40)
SideContent.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
SideContent.BorderSizePixel = 0
SideContent.Parent = SideMenu

local SideViewport = Instance.new("ViewportFrame")
SideViewport.Size = UDim2.new(0, 150, 0, 200)
SideViewport.Position = UDim2.new(0.5, -75, 0.5, -100)
SideViewport.BackgroundTransparency = 1
SideViewport.Parent = SideContent

-- Боковая панель основного меню
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 180, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
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

-- Блок автора с ценой
local AuthorBox = Instance.new("Frame")
AuthorBox.Size = UDim2.new(1, -10, 0, 60)
AuthorBox.Position = UDim2.new(0, 5, 1, -65)
AuthorBox.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
AuthorBox.BorderSizePixel = 0
AuthorBox.Parent = Sidebar

local AuthorText = Instance.new("TextLabel")
AuthorText.Size = UDim2.new(1, 0, 0, 25)
AuthorText.BackgroundTransparency = 1
AuthorText.Text = "Developer: ALTRON"
AuthorText.TextColor3 = Color3.fromRGB(255, 255, 255)
AuthorText.TextSize = 11
AuthorText.Font = Enum.Font.GothamSemibold
AuthorText.Parent = AuthorBox

local PriceText = Instance.new("TextLabel")
PriceText.Size = UDim2.new(1, 0, 0, 25)
PriceText.Position = UDim2.new(0, 0, 0, 25)
PriceText.BackgroundTransparency = 1
PriceText.Text = "Normal: 10$ / 1000 RUB"
PriceText.TextColor3 = Color3.fromRGB(168, 75, 62)
PriceText.TextSize = 9
PriceText.Font = Enum.Font.Gotham
PriceText.Parent = AuthorBox

-- Скролл для табов
local ScrollTabs = Instance.new("ScrollingFrame")
ScrollTabs.Size = UDim2.new(1, 0, 1, -120)
ScrollTabs.Position = UDim2.new(0, 0, 0, 50)
ScrollTabs.BackgroundTransparency = 1
ScrollTabs.CanvasSize = UDim2.new(0, 0, 0, 620)
ScrollTabs.ScrollBarThickness = 2
ScrollTabs.Parent = Sidebar

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout.Parent = ScrollTabs

-- Контейнер страниц
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -190, 1, -10)
ContentContainer.Position = UDim2.new(0, 185, 0, 5)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = MainFrame

local Pages = {}
local Toggles = {}

local function createPage(pageName)
    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Size = UDim2.new(1, 0, 1, 0)
    PageFrame.BackgroundTransparency = 1
    PageFrame.Visible = false
    PageFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
    PageFrame.ScrollBarThickness = 2
    PageFrame.Parent = ContentContainer
    
    local List = Instance.new("UIListLayout")
    List.Padding = UDim.new(0, 8)
    List.Parent = PageFrame
    
    Pages[pageName] = PageFrame
    
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -10, 0, 28)
    TabBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Text = "  " .. pageName
    TabBtn.TextColor3 = Color3.fromRGB(136, 136, 136)
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 11
    TabBtn.Parent = ScrollTabs
    
    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(ScrollTabs:GetChildren()) do
            if b:IsA("TextButton") then b.BackgroundTransparency = 1 b.TextColor3 = Color3.fromRGB(136, 136, 136) end
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
    Row.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    Row.BorderSizePixel = 1
    Row.BorderColor3 = Color3.fromRGB(40, 40, 40)
    Row.Parent = pageFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = toggleName
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.Parent = Row
    
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 45, 0, 20)
    Btn.Position = UDim2.new(1, -55, 0, 7)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(136, 136, 136)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 10
    Btn.Parent = Row
    
    Toggles[toggleName] = false
    
    Btn.MouseButton1Click:Connect(function()
        Toggles[toggleName] = not Toggles[toggleName]
        if Toggles[toggleName] then
            Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
            Btn.Text = "ON"
        else
            Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Btn.TextColor3 = Color3.fromRGB(136, 136, 136)
            Btn.Text = "OFF"
        end
        callback(Toggles[toggleName])
    end)
end

-- Инициализация 20 страниц в строго текстовом формате
local tab_visuals      = createPage("Visuals")
local tab_skins        = createPage("Skin Changer")
local tab_esp          = createPage("ESP & Arrows")
local tab_movement     = createPage("Movement & Songs")
local tab_exploits     = createPage("Exploits")
local tab_screen       = createPage("Screen & Saturation")
local tab_particles    = createPage("Particles Settings")
local tab_animations   = createPage("Emotes & Animations")
local tab_optimization = createPage("Optimization")
local tab_cfg          = createPage("Configs")
local tab_antiafk      = createPage("Anti-AFK System")
local tab_chams        = createPage("Chams & Materials")
local tab_world        = createPage("World Modulation")
local tab_lighting     = createPage("Ambience & Skybox")
local tab_hitmarkers   = createPage("Hitmarkers & UI")
local tab_crosshair    = createPage("Crosshair Customizer")
local tab_misc         = createPage("Miscellaneous")
local tab_hotkeys      = createPage("Binds & Hotkeys")
local tab_players      = createPage("Player List Exploit")
local tab_settings     = createPage("Menu Settings")

Pages["Visuals"].Visible = true
-- [[ LUNA BY ALTRON: PREMIUM VISUALS SUITE (PART 2) ]] --

-- НАПОЛНЕНИЕ РАЗДЕЛОВ И ЛОГИКА ФУНКЦИЙ

-- 1. Раздел Visuals (Основные визуальные эффекты)
createToggle(tab_visuals, "Chinese Hat", function(state)
    local char = LocalPlayer.Character
    if state and char and char:FindFirstChild("Head") then
        local hat = Instance.new("Part")
        hat.Name = "LunaChineseHat"
        hat.Size = Vector3.new(2, 0.4, 2)
        hat.Color = Color3.fromRGB(255, 255, 255)
        hat.CanCollide = false
        hat.Parent = char
        local weld = Instance.new("Weld")
        weld.Part0 = char.Head
        weld.Part1 = hat
        weld.C0 = CFrame.new(0, 0.8, 0)
        weld.Parent = hat
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.Cone
        mesh.Scale = Vector3.new(2.5, 0.5, 2.5)
        mesh.Parent = hat
    else
        if char and char:FindFirstChild("LunaChineseHat") then char.LunaChineseHat:Destroy() end
    end
end)

createToggle(tab_visuals, "3D Demon Wings", function(state)
    local char = LocalPlayer.Character
    local baseTorso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
    if state and baseTorso then
        local wings = Instance.new("Part")
        wings.Name = "LunaWings"
        wings.Size = Vector3.new(4, 3, 0.2)
        wings.Color = Color3.fromRGB(30, 30, 30)
        wings.CanCollide = false
        wings.Parent = char
        local weld = Instance.new("Weld")
        weld.Part0 = baseTorso
        weld.Part1 = wings
        weld.C0 = CFrame.new(0, 0, 0.6)
        weld.Parent = wings
        local mesh = Instance.new("SpecialMesh")
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://13470701147"
        mesh.Scale = Vector3.new(1.5, 1.5, 1.5)
        mesh.Parent = wings
    else
        if char and char:FindFirstChild("LunaWings") then char.LunaWings:Destroy() end
    end
end)

createToggle(tab_visuals, "Neon Glow Body", function(state)
    local char = LocalPlayer.Character
    if char then
        for _, p in pairs(char:GetChildren()) do
            if p:IsA("BasePart") then
                p.Material = state and Enum.Material.Neon or Enum.Material.SmoothPlastic
            end
        end
    end
end)

-- 2. Раздел Skin Changer (Внешний вид)
createToggle(tab_skins, "Visual Headless Chicken", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Head") then
        char.Head.Transparency = state and 1 or 0
        if char.Head:FindFirstChildOfClass("Decal") then char.Head:FindFirstChildOfClass("Decal").Transparency = state and 1 or 0 end
    end
end)

createToggle(tab_skins, "Visual Korblox Deathspeaker Leg", function(state)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("RightLowerLeg") then
        char.RightLowerLeg.Transparency = state and 1 or 0
        char.RightUpperLeg.Transparency = state and 1 or 0
        char.RightFoot.Transparency = state and 1 or 0
    end
end)

-- 3. Раздел ESP & Arrows (Подсветка игроков)
local espBoxes = {}
createToggle(tab_esp, "Enable 3D Box ESP", function(state)
    if state then
        RunService:BindToRenderStep("Luna3DESP", Enum.RenderPriority.Camera.Value, function()
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    if not espBoxes[plr] then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Size = Vector3.new(4, 6, 4)
                        box.Color3 = Color3.fromRGB(255, 255, 255)
                        box.AlwaysOnTop = true
                        box.ZIndex = 5
                        box.Transparency = 0.6
                        box.Adornee = plr.Character.HumanoidRootPart
                        box.Parent = game:GetService("CoreGui")
                        espBoxes[plr] = box
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("Luna3DESP")
        for _, box in pairs(espBoxes) do box:Destroy() end
        espBoxes = {}
    end
end)

createToggle(tab_esp, "Enable 2D Box ESP", function(state) end)
createToggle(tab_esp, "Enable Circle ESP", function(state) end)
createToggle(tab_esp, "Show Target Distance", function(state) end)
createToggle(tab_esp, "Show HP Bars", function(state) end)

-- 4. Раздел Movement & Songs
createToggle(tab_movement, "Enable Hit Song Effect", function(state) end)

-- 5. Раздел Exploits: НАСТОЯЩИЙ АНТИ-ФЛИНГ
createToggle(tab_exploits, "Active Anti-Fling Forcefield", function(state)
    if state then
        RunService:BindToRenderStep("LunaAntiFling", Enum.RenderPriority.Physical.Value, function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Velocity = Vector3.zero
                        part.RotVelocity = Vector3.zero
                    end
                end
                for _, p in pairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and (hrp.Position - char.HumanoidRootPart.Position).Magnitude < 30 then
                            if hrp.Velocity.Magnitude > 45 or hrp.RotVelocity.Magnitude > 45 then
                                hrp.Velocity = Vector3.zero
                                hrp.RotVelocity = Vector3.zero
                                hrp.CanCollide = false
                            end
                        end
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("LunaAntiFling")
    end
end)

-- 6. Раздел Screen & Saturation (Экран)
local ccEffect = Lighting:FindFirstChild("LunaColor") or Instance.new("ColorCorrectionEffect", Lighting)
ccEffect.Name = "LunaColor"

createToggle(tab_screen, "Max Color Saturation", function(state)
    ccEffect.Saturation = state and 1.6 or 0
end)

createToggle(tab_screen, "Stretch Screen Resolution (FOV Boost)", function(state)
    TweenService:Create(Camera, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {FieldOfView = state and 115 or 70}):Play()
end)

-- 7. Раздел Optimization (ФПС Бустер)
createToggle(tab_optimization, "Remove Textures & Decals", function(state)
    if state then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Texture") or obj:IsA("Decal") then
                obj.Texture = ""
            elseif obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
            end
        end
    end
end)

createToggle(tab_optimization, "Disable Dynamic Shadows", function(state)
    Lighting.GlobalShadows = not state
end)

-- 8. Раздел Anti-AFK System
createToggle(tab_antiafk, "Enable Anti-AFK Anti-Kick", function(state)
    if state then
        LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:Button2Down(Vector2.new(0,0), Camera.CFrame)
            task.wait(0.5)
            vu:Button2Up(Vector2.new(0,0), Camera.CFrame)
        end)
    end
end)

-- Секция хоткеев (Открытие и закрытие по Right Shift)
local isMenuVisible = true
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.RightShift then
        isMenuVisible = not isMenuVisible
        MainFrame.Visible = isMenuVisible
    end
end)

-- Рендер манекена Бекона на 360 градусов справа
task.spawn(function()
    local SideViewport = MainFrame:WaitForChild("SideMenu"):WaitForChild("SideContent"):WaitForChild("ViewportFrame")
    local baconChar = game:GetObjects("rbxassetid://10486071375") or Instance.new("Model")
    baconChar.Name = "BaconDummy"
    baconChar.Parent = SideViewport
    
    local sideCam = Instance.new("Camera")
    sideCam.FieldOfView = 50
    SideViewport.CurrentCamera = sideCam
    sideCam.Parent = SideViewport
    
    local rotAngle = 0
    RunService.RenderStepped:Connect(function(dt)
        rotAngle = rotAngle + (dt * 25)
        sideCam.CFrame = CFrame.new(Vector3.new(0, 2, 6)) * CFrame.Angles(0, math.radians(rotAngle), 0)
    end)
end)
