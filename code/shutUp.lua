-- Dice una frase cada vez que habla alguien
local victimName = "Obama-DunModr";
local frame = CreateFrame("FRAME");
frame:RegisterEvent("CHAT_MSG_GUILD");

local function shutUpEventHandler(self, event, ...)
    local msg, author = ...;

    if author == victimName then
        local one, two = victimName:match("([^,]+)-([^,]+)");
        SendChatMessage("Calla, " .. one, "GUILD");
    end
end

frame:SetScript("OnEvent", shutUpEventHandler);