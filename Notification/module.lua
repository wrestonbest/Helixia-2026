local gui = game:GetService("CoreGui"):FindFirstChild("helixianofitication")

if not gui then
    local helixianofitication = Instance.new("ScreenGui")
    local uilist = Instance.new("UIListLayout")

    helixianofitication.Name = "helixianofitication"
    helixianofitication.Parent = game:GetService("CoreGui")
    helixianofitication.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    helixianofitication.ResetOnSpawn = false

    uilist.Name = "helixianofiticationuilist"
    uilist.Parent = helixianofitication
    uilist.HorizontalAlignment = Enum.HorizontalAlignment.Right
    uilist.SortOrder = Enum.SortOrder.LayoutOrder
    uilist.VerticalAlignment = Enum.VerticalAlignment.Bottom
end
