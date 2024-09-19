function getMaxOfNumbers(cK)
    local max = 5000
    for r, v in pairs(cK) do
        if v > max then
            max = v
        end
    end
    for r, v in pairs(cK) do
        if v >= max then
            return max
        end
    end
    return max
end

function removechildintable(cL, bQ)
    for r, v in pairs(cL) do
        if v == bQ then
            cL[r] = nil
        end
    end
end

function getInventoryFruits()
    local ss = {}
    for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
        if v["Type"] == "Blox Fruit" then
            table.insert(ss, v["Value"])
        end
    end
    local mem = ""
    for r, v in pairs(ss) do
        local s2 = getMaxOfNumbers(ss)
        for k, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")) do
            if v["Type"] == "Blox Fruit" and v["Value"] == s2 then
                mem = mem .. v["Name"] .. ", "
            end
        end
        removechildintable(ss, s2)
    end
    return mem
end

local ValueWebhookIDK = 0
spawn(function()
    while wait() do
        if Reset and ValueWebhookIDK == 0 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= BeliValue  then
            ValueWebhookIDK = ValueWebhookIDK + 1
            local ContentSyn = "Huhu"
            if game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= BalieValue then
                ContentSyn = "@here | Beli Đạt Đến Beli Đã Chọn : "..game:GetService("Players")["LocalPlayer"].Data.Beli.Value
            end
            local Webhook = {
                ["username"] = "AVN Sercurity 1.0.1",
                ["content"] = ContentSyn,
                ["embeds"] = {
                   {
                       ["title"] = ">  Webhook Idk",
                       ["color"] = tonumber(00000000),
                       ["type"] = "rich",
                       ["fields"] =  {
                           {
                               ["name"] = "Players :",
                               ["value"] = '```'..game:GetService("Players")["LocalPlayer"].Name..'/12```',
                               ["inline"] = false
                           },
                           {
                               ["name"] = "Fruit Players :",
                               ["value"] = '```'..game:GetService("Players")["LocalPlayer"].Data.DevilFruit.Value..'```',
                               ["inline"] = false
                           },
                           {
                               ["name"] = "Store",
                               ["value"] = '```'..getInventoryFruits()..'```',
                               ["inline"] = true
                           }
                       },
                       ["footer"] = {
                           ["text"] = os.date("%A".." // ".."%d".." ".."%B".." ".."%Y".." // ".."%X").." \104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\46\103\103\47\110\88\110\97\81\68\87\74",
                       }
                   }
               },
            }
            local Data = game:GetService("HttpService"):JSONEncode(Webhook)
            local Head = {["content-type"] = "application/json"}
            local Send = http_request or request or HttpPost or syn.request
            local sendhook = {Url = WebhookLink, Body = Data, Method = "POST", Headers = Head}
            Send(sendhook)
        end
    end
end)
