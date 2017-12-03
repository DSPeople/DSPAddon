local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");

local function eventHandler(self, event, ...)
  local eventName = ...;

  if useItemCounter and eventName == "DSPAddon" then
    local countTotal = GetItemCount(124124, true);
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(124124);

    -- Frame para mostrar los nuevos items
    local itemsFrame = CreateFrame("FRAME", "BackpackItemQuantityFrame", BackpackTokenFrame);
    itemsFrame:SetFrameStrata("MEDIUM");
    itemsFrame:SetWidth(BackpackTokenFrame:GetWidth() - 20);
    itemsFrame:SetHeight(20);

    -- Textura del frame de items
    local itemsBackground = itemsFrame:CreateTexture(nil,"BACKGROUND");
    itemsBackground:SetColorTexture(0, 0, 0, 1);
    itemsBackground:SetAllPoints(itemsFrame);
    itemsFrame.texture = itemsBackground;

    itemsFrame:SetPoint("CENTER",0,-20);
    itemsFrame:Show();

    -- Frame para el icono del item
    local iconFrame = CreateFrame("FRAME", "Icon", itemsFrame);
    iconFrame:SetFrameStrata("MEDIUM");
    iconFrame:SetWidth(13);
    iconFrame:SetHeight(13);
    -- Textura para el icono del item
    local t = iconFrame:CreateTexture(nil,"BACKGROUND");
    t:SetTexture(itemTexture);
    t:SetAllPoints(iconFrame);
    iconFrame.texture = t;
    
    iconFrame:SetPoint("LEFT",15,0);
    iconFrame:Show();

    -- Frame para el texto del item
    local textFrame = CreateFrame("FRAME", "Text", itemsFrame);
    textFrame:SetFrameStrata("MEDIUM");
    textFrame:SetWidth(50);
    textFrame:SetHeight(13);
    -- FontString para el texto
    textFrame.text = textFrame:CreateFontString(nil,"OVERLAY", "GameFontNormalLarge");
		textFrame.text:SetPoint("LEFT", textFrame, "LEFT");
    textFrame.text:SetTextColor(1, 1, 1, 1);
    textFrame.text:SetText(countTotal);
    
    textFrame:SetPoint("LEFT",40,0);
    textFrame:Show();
  end
end

frame:SetScript("OnEvent", eventHandler);