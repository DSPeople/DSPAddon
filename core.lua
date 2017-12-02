local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("PLAYER_LOGOUT");

local function eventHandler(self, event, ...)
    local eventName = ...;

    if event == "ADDON_LOADED" and eventName == "DSPAddon" then
        if not firstConfig then
            message("Tenemos que configurarte");
        end
    end
end

frame:SetScript("OnEvent", eventHandler);
