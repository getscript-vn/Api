local BuyCosmetic = "All" -- "All","ItemStocks","CrateStocks"
ReplicatedStorage = game:GetService("ReplicatedStorage")
ModulesGame = ReplicatedStorage.Modules
DataService = require(ModulesGame.DataService)
GetDataService = function(data)
	if not DataService then return nil end     
	local dataservicetable = DataService:GetData()
	if data then
		return dataservicetable and dataservicetable[data] or nil
	end
	return dataservicetable
end
Get = function(data,data1,data2)
	if data1 == true then
		local dataGet = GetDataService()[data]
		local Storage = {}
		if dataGet and typeof(dataGet) == 'table' then 
			for i,v in pairs(dataGet) do 
				if data2 then
					table.insert(Storage,tostring(i))
				else
				Storage[i] = v
				end
			end
		end
		return Storage
    end
	return nil
end

task.spawn(function()
    while task.wait() do
        CA = Get('CosmeticStock',true) 
        if typeof(CA) == 'table' then
            if BuyCosmetic == "All" then
             print('Method 1')
                for _,v in pairs(CA) do
                    if typeof(v) == 'table' then
                        for i1,v1 in pairs(v) do
                            for i=1,(tonumber(v1.Stock) or 1) do
                                if tostring(i1):find('Crate') then
                                    print('BUy')
                                    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyCosmeticCrate"):FireServer(tostring(i1))
                                else
                                 game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyCosmeticItem"):FireServer(tostring(i1))
                                end
                            end
                        end
                    end
                end
            else
            print('Method 2')
                pcall(function()
                    for i1,v1 in pairs(CA.BuyCosmetic) do
                        for i=1,(tonumber(v1.Stock) or 1) do
                            if tostring(i1):find('Crate') then
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyCosmeticCrate"):FireServer(tostring(i1))
                            else
                                game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyCosmeticItem"):FireServer(tostring(i1))
                            end
                        end
                    end
                end)
            end
            wait(300)
            else
            warn("Error Get")
        end
    end
end)
