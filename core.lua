-- Frame para comprobar la carga del Addon
local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");

local function eventHandler(self, event, ...)
  local eventName = ...;

  if event == "ADDON_LOADED" and eventName == "DSPAddon" then
    greetingsCheckButton:SetChecked(useGreetings);
    shutUpCheckButton:SetChecked(useShutUp);
    itemCounterCheckButton:SetChecked(useItemCounter);
    if not firstConfig then
      ShowConfig();
      -- firstConfig = true;
    end
  end
end

frame:SetScript("OnEvent", eventHandler);

-- Función que se encarga de mostrar el cuadro de configuración
local function ShowConfig()
  DSPAddonFrame:Show();
end

-- Función que se ejecuta cuando se hace click en los CheckButton del cuadro de configuración
local function CheckButtonOnClick(self, button, ...)
  if self == greetingsCheckButton then
    useGreetings = greetingsCheckButton:GetChecked();
  elseif self == shutUpCheckButton then
    useShutUp = shutUpCheckButton:GetChecked();
  elseif self == itemCounterCheckButton then
    useItemCounter = itemCounterCheckButton:GetChecked();
  end
end

greetingsCheckButton:SetScript("OnClick", CheckButtonOnClick);
getglobal(greetingsCheckButton:GetName() .. "Text"):SetText("Greetings");

shutUpCheckButton:SetScript("OnClick", CheckButtonOnClick);
getglobal(shutUpCheckButton:GetName() .. "Text"):SetText("Shut Up");

itemCounterCheckButton:SetScript("OnClick", CheckButtonOnClick);
getglobal(itemCounterCheckButton:GetName() .. "Text"):SetText("Item Counter");