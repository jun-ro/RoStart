


local Players = game:GetService("Players")
--Reference the DataStore, using ID so it's always updated and I don't have to import it every time

local D2 = require(1936396537)

--Add the keys
D2.Combine("MasterKey", "Gems")

--Load when player joins
Players.PlayerAdded:Connect(function(player)
    local DataGems = D2("Gems", player)

    --Makes the stats folder, very basic.
    local folder = Instance.new('Folder',player); folder.Name = "Stats"
    local gems = Instance.new('IntValue', folder); gems.Name = "Gems"

    --Basic implementations
    if DataGems:Get() ~= nil then
        --Gets the value of DataGem currently.
        gems.Value = DataGems:Get()
    else
        gems.Value = 0;
    end

    --Whenever the value changes the Key sets a new value
    gems.Changed:Connect(function()
        DataGems:Set(gems.Value)
    end)



end)
