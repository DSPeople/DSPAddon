-- Frame para comprobar la carga del Addon
local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");

-- Función que se encarga de mostrar el cuadro de configuración
local function ShowConfig()
  DSPAddonFrame:Show();
end

-- Handler para la carga del Addon
local function eventHandler(self, event, ...)
  local eventName = ...;

  if eventName == "DSPAddon" then
    greetingsCheckButton:SetChecked(useGreetings);
    shutUpCheckButton:SetChecked(useShutUp);
    itemCounterCheckButton:SetChecked(useItemCounter);

    if DSP_firstConfig == nil then
      DSP_firstConfig = false;
    else
      DSP_firstConfig = DSP_firstConfig;
    end
    
    DSPAddonFrame:Hide();
    if not DSP_firstConfig then
      DSP_firstConfig = true;
      ShowConfig();
    end
  end
end

frame:SetScript("OnEvent", eventHandler);


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


-- Detecta el comando /dsp o /DSP para mostrar la ventana de configuración
SLASH_DSP1 = "/dsp"
SLASH_DSP2 = "/DSP"
SlashCmdList["DSP"] = function(msg)
  ShowConfig();
end 