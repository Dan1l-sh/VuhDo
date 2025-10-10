local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("GROUP_ROSTER_UPDATE")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

f:SetScript("OnEvent", function()
  if VUHDO_CONFIG == nil then 
  VUHDO_CONFIG = {} 
  end
  
  VUHDO_CONFIG["SHOW_PANELS"] = true
  VUHDO_CONFIG["HIDE_PANELS_PARTY"] = false

  if VuhDo and VuhDo.LoadVariables then 
	VuhDo:LoadVariables() 
  end
  if VuhDo and VuhDo.initAllPanels and not InCombatLockdown() then
    VuhDo:initAllPanels()
  end

  for i = 1, 10 do
    local panel = _G["VuhDoPanel" .. i]
    if panel then
      panel:SetFrameStrata("LOW")
      panel:SetFrameLevel(1)
      if not panel:IsShown() then
        panel:Show()
      end
    end
  end

for i = 1, 9 do
    local frame = _G["VdAc"..i]
    if frame then
        frame:SetFrameStrata("BACKGROUND")
        frame:SetFrameLevel(19)

        for j = 1, 40 do
            local prefix = "VdAc"..i.."HlU"..j

            local hlU = _G[prefix]
            if hlU then 
				hlU:SetFrameLevel(20) 
			end

            local bgBar = _G[prefix.."BgBar"]
            if bgBar then 
				bgBar:SetFrameLevel(21) 
			end

            local plTg = _G[prefix.."BgBarIcBarlcBarPlTg"]
            if plTg then 
				plTg:SetFrameLevel(22) 
			end

            local icBar = _G[prefix.."BgBarIcBar"]
            if icBar then 
				icBar:SetFrameLevel(22) 
			end

            local hlBar = _G[prefix.."BgBarIcBarHlBar"]
            if hlBar then 
				hlBar:SetFrameLevel(23) 
			end

            local hotBar = _G[prefix.."BgBarIcBarHlBarHotBar"]
            if hotBar then 
				hotBar:SetFrameLevel(24) 
			end
        end
    end
end


end)
