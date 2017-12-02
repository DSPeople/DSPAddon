-- Dice una frase cada vez que habla alguien
local victimName = "Devilcloüd-DunModr";
local frame = CreateFrame("FRAME");
frame:RegisterEvent("CHAT_MSG_GUILD");

local function shutUpEventHandler(self, event, ...)
  if useShutUp then
    local msg, author = ...;

    if author == victimName then
      local one, two = victimName:match("([^,]+)-([^,]+)");
      SendChatMessage("Calla, " .. one, "GUILD");
    end
  end
end

frame:SetScript("OnEvent", shutUpEventHandler);