-- Dice una frase cuando se hace login / se recarga la UI
local frame = CreateFrame("FRAME");
frame:RegisterEvent("PLAYER_LOGIN");

local greetingsArray = {};
greetingsArray[0] = "Hola manesotes";
greetingsArray[1] = "Buenas, señores";
greetingsArray[2] = "Hola caballeros";
greetingsArray[3] = "Muy buenas";
greetingsArray[4] = "Hola holita vecinitos";

local function eventHandler(self, event, ...)
    SendChatMessage(greetingsArray[math.random(0, #greetingsArray)], "GUILD");
end

frame:SetScript("OnEvent", eventHandler);