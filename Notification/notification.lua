local nofitication = {}

local coregui = game:GetService("CoreGui")
local gui = coregui:FindFirstChild("helixianofitication")

if not gui then
    gui = Instance.new("ScreenGui")
    gui.Name = "helixianofitication"
    gui.ResetOnSpawn = false
    gui.Parent = coregui

    local uilist = Instance.new("UIListLayout")
    uilist.Parent = gui
    uilist.HorizontalAlignment = Enum.HorizontalAlignment.Right
    uilist.VerticalAlignment = Enum.VerticalAlignment.Bottom
    uilist.SortOrder = Enum.SortOrder.LayoutOrder
end

function nofitication:notify(nofdebug, middledebug, all)
    local selectedtype = string.lower(tostring(middledebug.Type))

    local ambientshadow = Instance.new("ImageLabel")
    local window = Instance.new("Frame")
    local outlinea = Instance.new("Frame")
    local windowtitle = Instance.new("TextLabel")
    local windowdesc = Instance.new("TextLabel")
    local windowcorner = Instance.new("UICorner")

    ambientshadow.Parent = gui
    ambientshadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientshadow.BackgroundTransparency = 1
    ambientshadow.BorderSizePixel = 0
    ambientshadow.Position = UDim2.new(0.915, 0, 0.936, 0)
    ambientshadow.Size = UDim2.new(0, 0, 0, 0)
    ambientshadow.Image = "rbxassetid://1316045217"
    ambientshadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ambientshadow.ImageTransparency = 0.4
    ambientshadow.ScaleType = Enum.ScaleType.Slice
    ambientshadow.SliceCenter = Rect.new(10, 10, 118, 118)

    window.Parent = ambientshadow
    window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    window.BorderSizePixel = 0
    window.Position = UDim2.new(0, 5, 0, 5)
    window.Size = UDim2.new(0, 230, 0, 80)
    window.ZIndex = 2

    windowcorner.Parent = window
    windowcorner.CornerRadius = UDim.new(0, 8)

    outlinea.Parent = window
    outlinea.BackgroundColor3 = middledebug.OutlineColor
    outlinea.BorderSizePixel = 0
    outlinea.Position = UDim2.new(0, 0, 0, 25)
    outlinea.Size = UDim2.new(0, 230, 0, 2)
    outlinea.ZIndex = 5

    windowtitle.Parent = window
    windowtitle.BackgroundTransparency = 1
    windowtitle.Position = UDim2.new(0, 8, 0, 2)
    windowtitle.Size = UDim2.new(0, 222, 0, 22)
    windowtitle.ZIndex = 4
    windowtitle.Font = Enum.Font.GothamSemibold
    windowtitle.Text = nofdebug.Title
    windowtitle.TextColor3 = Color3.fromRGB(220, 220, 220)
    windowtitle.TextSize = 12
    windowtitle.TextXAlignment = Enum.TextXAlignment.Left

    windowdesc.Parent = window
    windowdesc.BackgroundTransparency = 1
    windowdesc.Position = UDim2.new(0, 8, 0, 34)
    windowdesc.Size = UDim2.new(0, 216, 0, 40)
    windowdesc.ZIndex = 4
    windowdesc.Font = Enum.Font.GothamSemibold
    windowdesc.Text = nofdebug.Description
    windowdesc.TextColor3 = Color3.fromRGB(180, 180, 180)
    windowdesc.TextSize = 12
    windowdesc.TextWrapped = true
    windowdesc.TextXAlignment = Enum.TextXAlignment.Left
    windowdesc.TextYAlignment = Enum.TextYAlignment.Top

    if selectedtype == "default" then
        coroutine.wrap(function()
            ambientshadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)
            ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            task.wait(0.2)
            ambientshadow:Destroy()
        end)()
    elseif selectedtype == "image" then
        ambientshadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
        windowtitle.Position = UDim2.new(0, 24, 0, 2)

        local imagebutton = Instance.new("ImageButton")
        imagebutton.Parent = window
        imagebutton.BackgroundTransparency = 1
        imagebutton.Position = UDim2.new(0, 4, 0, 4)
        imagebutton.Size = UDim2.new(0, 18, 0, 18)
        imagebutton.ZIndex = 5
        imagebutton.AutoButtonColor = false
        imagebutton.Image = all.Image
        imagebutton.ImageColor3 = all.ImageColor

        coroutine.wrap(function()
            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)
            ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            task.wait(0.2)
            ambientshadow:Destroy()
        end)()
    elseif selectedtype == "option" then
        ambientshadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
        window.Size = UDim2.new(0, 230, 0, 100)

        local uncheck = Instance.new("ImageButton")
        local check = Instance.new("ImageButton")

        uncheck.Parent = window
        uncheck.BackgroundTransparency = 1
        uncheck.Position = UDim2.new(0, 7, 0, 76)
        uncheck.Size = UDim2.new(0, 18, 0, 18)
        uncheck.ZIndex = 5
        uncheck.AutoButtonColor = false
        uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
        uncheck.ImageColor3 = Color3.fromRGB(255, 84, 84)

        check.Parent = window
        check.BackgroundTransparency = 1
        check.Position = UDim2.new(0, 28, 0, 76)
        check.Size = UDim2.new(0, 18, 0, 18)
        check.ZIndex = 5
        check.AutoButtonColor = false
        check.Image = "http://www.roblox.com/asset/?id=6031094667"
        check.ImageColor3 = Color3.fromRGB(83, 230, 50)

        coroutine.wrap(function()
            local alive = true

            uncheck.MouseButton1Click:Connect(function()
                pcall(function()
                    all.Callback(false)
                end)
                alive = false
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end)

            check.MouseButton1Click:Connect(function()
                pcall(function()
                    all.Callback(true)
                end)
                alive = false
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end)

            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)

            if alive then
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end
        end)()
    end
end

return nofitication    windowdesc.TextColor3 = Color3.fromRGB(180, 180, 180)
    windowdesc.TextSize = 12
    windowdesc.TextWrapped = true
    windowdesc.TextXAlignment = Enum.TextXAlignment.Left
    windowdesc.TextYAlignment = Enum.TextYAlignment.Top

    if selectedtype == "default" then
        coroutine.wrap(function()
            ambientshadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)
            ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            task.wait(0.2)
            ambientshadow:Destroy()
        end)()
    elseif selectedtype == "image" then
        ambientshadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
        windowtitle.Position = UDim2.new(0, 24, 0, 2)

        local imagebutton = Instance.new("ImageButton")
        imagebutton.Parent = window
        imagebutton.BackgroundTransparency = 1
        imagebutton.Position = UDim2.new(0, 4, 0, 4)
        imagebutton.Size = UDim2.new(0, 18, 0, 18)
        imagebutton.ZIndex = 5
        imagebutton.AutoButtonColor = false
        imagebutton.Image = all.Image
        imagebutton.ImageColor3 = all.ImageColor

        coroutine.wrap(function()
            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)
            ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            task.wait(0.2)
            ambientshadow:Destroy()
        end)()
    elseif selectedtype == "option" then
        ambientshadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
        window.Size = UDim2.new(0, 230, 0, 100)

        local uncheck = Instance.new("ImageButton")
        local check = Instance.new("ImageButton")

        uncheck.Parent = window
        uncheck.BackgroundTransparency = 1
        uncheck.Position = UDim2.new(0, 7, 0, 76)
        uncheck.Size = UDim2.new(0, 18, 0, 18)
        uncheck.ZIndex = 5
        uncheck.AutoButtonColor = false
        uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
        uncheck.ImageColor3 = Color3.fromRGB(255, 84, 84)

        check.Parent = window
        check.BackgroundTransparency = 1
        check.Position = UDim2.new(0, 28, 0, 76)
        check.Size = UDim2.new(0, 18, 0, 18)
        check.ZIndex = 5
        check.AutoButtonColor = false
        check.Image = "http://www.roblox.com/asset/?id=6031094667"
        check.ImageColor3 = Color3.fromRGB(83, 230, 50)

        coroutine.wrap(function()
            local alive = true

            uncheck.MouseButton1Click:Connect(function()
                pcall(function()
                    all.Callback(false)
                end)
                alive = false
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end)

            check.MouseButton1Click:Connect(function()
                pcall(function()
                    all.Callback(true)
                end)
                alive = false
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end)

            outlinea:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
            task.wait(middledebug.Time)

            if alive then
                ambientshadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                task.wait(0.2)
                ambientshadow:Destroy()
            end
        end)()
    end
end

return nofitication
