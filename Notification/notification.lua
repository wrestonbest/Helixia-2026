local nofitication = {}

local coregui = game:GetService("CoreGui")
local gui = coregui:FindFirstChild("helixianofitication")

if not gui then
    gui = Instance.new("ScreenGui")
    gui.Name = "helixianofitication"
    gui.ResetOnSpawn = false
    gui.Parent = coregui

    local holder = Instance.new("Frame")
    holder.Name = "Holder"
    holder.BackgroundTransparency = 1
    holder.Size = UDim2.new(1,0,1,0)
    holder.Parent = gui

    local uilist = Instance.new("UIListLayout")
    uilist.Parent = holder
    uilist.HorizontalAlignment = Enum.HorizontalAlignment.Right
    uilist.VerticalAlignment = Enum.VerticalAlignment.Bottom
    uilist.SortOrder = Enum.SortOrder.LayoutOrder
end

local holder = gui:FindFirstChild("Holder")

function nofitication:notify(nofdebug, middledebug, all)
    middledebug = middledebug or {}
    local seltype = string.lower(tostring(middledebug.Type or "default"))
    local time = middledebug.Time or 3
    local outlinecolor = middledebug.OutlineColor or Color3.fromRGB(255,255,255)

    local shadow = Instance.new("ImageLabel")
    local window = Instance.new("Frame")
    local outline = Instance.new("Frame")
    local title = Instance.new("TextLabel")
    local desc = Instance.new("TextLabel")
    local corner = Instance.new("UICorner")

    shadow.Parent = holder
    shadow.AnchorPoint = Vector2.new(0.5,0.5)
    shadow.BackgroundTransparency = 1
    shadow.BorderSizePixel = 0
    shadow.Position = UDim2.new(0.915,0,0.936,0)
    shadow.Size = UDim2.new(0,0,0,0)
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.fromRGB(0,0,0)
    shadow.ImageTransparency = 0.4
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10,10,118,118)

    window.Parent = shadow
    window.BackgroundColor3 = Color3.fromRGB(25,25,25)
    window.BorderSizePixel = 0
    window.Position = UDim2.new(0,5,0,5)
    window.Size = UDim2.new(0,230,0,80)
    window.ZIndex = 2

    corner.Parent = window
    corner.CornerRadius = UDim.new(0,8)

    outline.Parent = window
    outline.BackgroundColor3 = outlinecolor
    outline.BorderSizePixel = 0
    outline.Position = UDim2.new(0,0,0,25)
    outline.Size = UDim2.new(0,230,0,2)
    outline.ZIndex = 5

    title.Parent = window
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0,8,0,2)
    title.Size = UDim2.new(0,222,0,22)
    title.ZIndex = 4
    title.Font = Enum.Font.GothamSemibold
    title.Text = nofdebug.Title or ""
    title.TextColor3 = Color3.fromRGB(220,220,220)
    title.TextSize = 12
    title.TextXAlignment = Enum.TextXAlignment.Left

    desc.Parent = window
    desc.BackgroundTransparency = 1
    desc.Position = UDim2.new(0,8,0,34)
    desc.Size = UDim2.new(0,216,0,40)
    desc.ZIndex = 4
    desc.Font = Enum.Font.GothamSemibold
    desc.Text = nofdebug.Description or ""
    desc.TextColor3 = Color3.fromRGB(180,180,180)
    desc.TextSize = 12
    desc.TextWrapped = true
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.TextYAlignment = Enum.TextYAlignment.Top

    if seltype == "default" then
        coroutine.wrap(function()
            shadow:TweenSize(UDim2.new(0,240,0,90),"Out","Linear",0.2)
            outline:TweenSize(UDim2.new(0,0,0,2),"Out","Linear",time)
            task.wait(time)
            shadow:TweenSize(UDim2.new(0,0,0,0),"Out","Linear",0.2)
            task.wait(0.2)
            shadow:Destroy()
        end)()
    elseif seltype == "image" then
        shadow:TweenSize(UDim2.new(0,240,0,90),"Out","Linear",0.2)
        title.Position = UDim2.new(0,24,0,2)
        local imgbtn = Instance.new("ImageButton")
        imgbtn.Parent = window
        imgbtn.BackgroundTransparency = 1
        imgbtn.Position = UDim2.new(0,4,0,4)
        imgbtn.Size = UDim2.new(0,18,0,18)
        imgbtn.ZIndex = 5
        imgbtn.AutoButtonColor = false
        imgbtn.Image = all and all.Image or ""
        imgbtn.ImageColor3 = all and all.ImageColor or Color3.fromRGB(255,255,255)
        coroutine.wrap(function()
            outline:TweenSize(UDim2.new(0,0,0,2),"Out","Linear",time)
            task.wait(time)
            shadow:TweenSize(UDim2.new(0,0,0,0),"Out","Linear",0.2)
            task.wait(0.2)
            shadow:Destroy()
        end)()
    elseif seltype == "option" then
        shadow:TweenSize(UDim2.new(0,240,0,110),"Out","Linear",0.2)
        window.Size = UDim2.new(0,230,0,100)

        local uncheck = Instance.new("ImageButton")
        local check = Instance.new("ImageButton")

        uncheck.Parent = window
        uncheck.BackgroundTransparency = 1
        uncheck.Position = UDim2.new(0,7,0,76)
        uncheck.Size = UDim2.new(0,18,0,18)
        uncheck.ZIndex = 5
        uncheck.AutoButtonColor = false
        uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
        uncheck.ImageColor3 = Color3.fromRGB(255,84,84)

        check.Parent = window
        check.BackgroundTransparency = 1
        check.Position = UDim2.new(0,28,0,76)
        check.Size = UDim2.new(0,18,0,18)
        check.ZIndex = 5
        check.AutoButtonColor = false
        check.Image = "http://www.roblox.com/asset/?id=6031094667"
        check.ImageColor3 = Color3.fromRGB(83,230,50)

        coroutine.wrap(function()
            local alive = true
            uncheck.MouseButton1Click:Connect(function()
                if all and all.Callback then pcall(all.Callback,false) end
                alive = false
                shadow:TweenSize(UDim2.new(0,0,0,0),"Out","Linear",0.2)
                task.wait(0.2)
                shadow:Destroy()
            end)
            check.MouseButton1Click:Connect(function()
                if all and all.Callback then pcall(all.Callback,true) end
                alive = false
                shadow:TweenSize(UDim2.new(0,0,0,0),"Out","Linear",0.2)
                task.wait(0.2)
                shadow:Destroy()
            end)
            outline:TweenSize(UDim2.new(0,0,0,2),"Out","Linear",time)
            task.wait(time)
            if alive then
                shadow:TweenSize(UDim2.new(0,0,0,0),"Out","Linear",0.2)
                task.wait(0.2)
                shadow:Destroy()
            end
        end)()
    end
end

return nofitication
