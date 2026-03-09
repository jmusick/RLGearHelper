-- RL Gear Helper
-- Raid Leader Gear Helper Addon

local addonName, addonTable = ...

-- Midnight expansion raid trinket data
-- Tiers: S = Best in Slot, A = Strong, B = Good, C = Situational
local trinkets = {
    -- The Dreamrift
    {
        name = "Gaze of the Alnseer",
        itemID = 249343,
        raid = "The Dreamrift",
        tiers = {
            S = { "Affliction Warlock", "Arcane Mage", "Arms Warrior", "Assassination Rogue", "Augmentation Evoker", "Balance Druid", "Beast Mastery Hunter", "Blood Death Knight", "Brewmaster Monk", "Demonology Warlock", "Destruction Warlock", "Devastation Evoker", "Discipline Priest", "Devourer Demon Hunter", "Elemental Shaman", "Enhancement Shaman", "Feral Druid", "Fire Mage", "Frost Death Knight", "Frost Mage", "Fury Warrior", "Guardian Druid", "Havoc Demon Hunter", "Holy Paladin", "Holy Priest", "Mistweaver Monk", "Outlaw Rogue", "Preservation Evoker", "Protection Paladin", "Protection Warrior", "Restoration Druid", "Restoration Shaman", "Retribution Paladin", "Shadow Priest", "Subtlety Rogue", "Survival Hunter", "Unholy Death Knight", "Vengeance Demon Hunter", "Windwalker Monk" },
            A = { "Marksmanship Hunter" },
        },
    },
    {
        name = "Undreamt God's Oozing Vestige",
        itemID = 249805,
        raid = "The Dreamrift",
        tiers = {
            A = { "Brewmaster Monk", "Guardian Druid", "Havoc Demon Hunter", "Protection Paladin", "Protection Warrior", "Windwalker Monk" },
            B = { "Arms Warrior", "Assassination Rogue", "Beast Mastery Hunter", "Blood Death Knight", "Fury Warrior", "Subtlety Rogue", "Unholy Death Knight", "Vengeance Demon Hunter" },
            C = { "Enhancement Shaman", "Retribution Paladin" },
            D = { "Marksmanship Hunter", "Outlaw Rogue" },
        },
    },
    -- The Voidspire
    {
        name = "Light Company Guidon",
        itemID = 249344,
        raid = "The Voidspire",
        tiers = {
            S = { "Blood Death Knight", "Frost Death Knight", "Protection Paladin", "Protection Warrior", "Subtlety Rogue", "Unholy Death Knight", "Vengeance Demon Hunter" },
            A = { "Arms Warrior", "Beast Mastery Hunter", "Feral Druid", "Fury Warrior", "Guardian Druid", "Outlaw Rogue", "Windwalker Monk" },
            B = { "Assassination Rogue", "Enhancement Shaman", "Retribution Paladin", "Survival Hunter" },
            C = { "Brewmaster Monk" },
            D = { "Havoc Demon Hunter", "Marksmanship Hunter" },
        },
    },
    {
        name = "Heart of Ancient Hunger",
        itemID = 249342,
        raid = "The Voidspire",
        tiers = {
            S = { "Frost Death Knight", "Fury Warrior", "Protection Paladin", "Protection Warrior" },
            A = { "Arms Warrior", "Blood Death Knight", "Retribution Paladin", "Unholy Death Knight" },
        },
    },
    {
        name = "Wraps of Cosmic Madness",
        itemID = 249340,
        raid = "The Voidspire",
        tiers = {
            A = { "Arcane Mage", "Augmentation Evoker", "Fire Mage" },
            B = { "Balance Druid", "Devastation Evoker" },
            C = { "Devourer Demon Hunter" },
            D = { "Affliction Warlock", "Demonology Warlock", "Destruction Warlock", "Elemental Shaman", "Shadow Priest" },
        },
    },
    {
        name = "Volatile Void Suffuser",
        itemID = 249341,
        raid = "The Voidspire",
        tiers = {
            S = { "Mistweaver Monk" },
            A = { "Restoration Shaman" },
            B = { "Discipline Priest", "Holy Paladin", "Holy Priest", "Preservation Evoker", "Restoration Druid" },
        },
    },
    {
        name = "Vaelgor's Final Stare",
        itemID = 249346,
        raid = "The Voidspire",
        tiers = {
            S = { "Arcane Mage", "Balance Druid", "Destruction Warlock", "Devastation Evoker", "Discipline Priest", "Devourer Demon Hunter", "Elemental Shaman", "Frost Mage", "Holy Paladin", "Holy Priest", "Preservation Evoker", "Restoration Druid", "Shadow Priest" },
            A = { "Affliction Warlock", "Augmentation Evoker", "Demonology Warlock", "Fire Mage" },
            B = { "Mistweaver Monk", "Restoration Shaman" },
        },
    },
    {
        name = "Gloom-Spattered Dreadscale",
        itemID = 249339,
        raid = "The Voidspire",
        tiers = {
            A = { "Brewmaster Monk", "Guardian Druid", "Vengeance Demon Hunter" },
            B = { "Protection Paladin", "Protection Warrior" },
        },
    },
    {
        name = "Litany of Lightblind Wrath",
        itemID = 249808,
        raid = "The Voidspire",
        tiers = {
            C = { "Devourer Demon Hunter", "Holy Paladin" },
            D = { "Mistweaver Monk", "Restoration Shaman" },
        },
    },
    {
        name = "Locus-Walker's Ribbon",
        itemID = 249809,
        raid = "The Voidspire",
        tiers = {
            S = { "Discipline Priest", "Elemental Shaman", "Frost Mage", "Holy Paladin", "Holy Priest", "Mistweaver Monk", "Preservation Evoker", "Restoration Druid", "Restoration Shaman" },
            A = { "Augmentation Evoker", "Balance Druid", "Devourer Demon Hunter" },
            B = { "Destruction Warlock", "Devastation Evoker", "Fire Mage", "Shadow Priest" },
            D = { "Affliction Warlock", "Arcane Mage", "Demonology Warlock" },
        },
    },
    {
        name = "Ranger-Captain's Iridescent Insignia",
        itemID = 249345,
        raid = "The Voidspire",
        tiers = {
            S = { "Brewmaster Monk" },
            A = { "Beast Mastery Hunter", "Guardian Druid", "Havoc Demon Hunter", "Protection Warrior" },
            B = { "Marksmanship Hunter", "Outlaw Rogue", "Vengeance Demon Hunter", "Windwalker Monk" },
            C = { "Assassination Rogue", "Enhancement Shaman", "Feral Druid", "Subtlety Rogue", "Survival Hunter" },
        },
    },
    -- March on Quel'Danas
    {
        name = "Radiant Plume",
        itemID = 249806,
        raid = "March on Quel'Danas",
        tiers = {
            S = { "Beast Mastery Hunter", "Brewmaster Monk", "Frost Death Knight", "Marksmanship Hunter", "Retribution Paladin", "Survival Hunter" },
            A = { "Arms Warrior", "Assassination Rogue", "Blood Death Knight", "Feral Druid", "Fury Warrior", "Guardian Druid", "Havoc Demon Hunter", "Outlaw Rogue", "Protection Paladin", "Protection Warrior", "Subtlety Rogue", "Unholy Death Knight", "Windwalker Monk" },
            C = { "Vengeance Demon Hunter" },
        },
    },
    {
        name = "Umbral Plume",
        itemID = 260235,
        raid = "March on Quel'Danas",
        tiers = {
            S = { "Brewmaster Monk", "Frost Death Knight", "Marksmanship Hunter", "Outlaw Rogue", "Retribution Paladin", "Survival Hunter" },
            A = { "Arms Warrior", "Assassination Rogue", "Beast Mastery Hunter", "Blood Death Knight", "Enhancement Shaman", "Feral Druid", "Fury Warrior", "Guardian Druid", "Havoc Demon Hunter", "Protection Paladin", "Protection Warrior", "Subtlety Rogue", "Unholy Death Knight", "Vengeance Demon Hunter" },
        },
    },
    {
        name = "The Eternal Egg",
        itemID = 249807,
        raid = "March on Quel'Danas",
        tiers = {
            A = { "Guardian Druid", "Protection Paladin", "Protection Warrior" },
            C = { "Brewmaster Monk", "Vengeance Demon Hunter" },
        },
    },
    {
        name = "Shadow of the Empyrean Requiem",
        itemID = 249810,
        raid = "March on Quel'Danas",
        tiers = {
            S = { "Augmentation Evoker", "Demonology Warlock" },
            A = { "Affliction Warlock", "Arcane Mage", "Balance Druid", "Destruction Warlock", "Devastation Evoker", "Fire Mage", "Frost Mage", "Shadow Priest" },
            B = { "Devourer Demon Hunter" },
            C = { "Elemental Shaman" },
        },
    },
    {
        name = "Light of the Cosmic Crescendo",
        itemID = 249811,
        raid = "March on Quel'Danas",
        tiers = {
            A = { "Mistweaver Monk" },
            C = { "Discipline Priest", "Holy Paladin", "Holy Priest", "Preservation Evoker", "Restoration Druid", "Restoration Shaman" },
        },
    },
}

local RAID_FILTER = "The Dreamrift"
local trinketButtonPool = {}

local tierColors = {
    S = "|cFFFF8C00",  -- orange
    A = "|cFFB04BF5",  -- purple
    B = "|cFF00BFFF",  -- blue
    C = "|cFF00FF00",  -- green
    D = "|cFFAAAAAA",  -- grey
}
local COLOR_RESET = "|r"

-- Spec ID lookup for class icon textures (via GetSpecializationInfoByID)
local specIDs = {
    ["Affliction Warlock"]    = 265,
    ["Arcane Mage"]           = 62,
    ["Arms Warrior"]          = 71,
    ["Assassination Rogue"]   = 259,
    ["Augmentation Evoker"]   = 1473,
    ["Balance Druid"]         = 102,
    ["Beast Mastery Hunter"]  = 253,
    ["Blood Death Knight"]    = 250,
    ["Brewmaster Monk"]       = 268,
    ["Demonology Warlock"]    = 266,
    ["Destruction Warlock"]   = 267,
    ["Devastation Evoker"]    = 1467,
    ["Devourer Demon Hunter"] = 1480,
    ["Discipline Priest"]     = 256,
    ["Elemental Shaman"]      = 262,
    ["Enhancement Shaman"]    = 263,
    ["Feral Druid"]           = 103,
    ["Fire Mage"]             = 63,
    ["Frost Death Knight"]    = 251,
    ["Frost Mage"]            = 64,
    ["Fury Warrior"]          = 72,
    ["Guardian Druid"]        = 104,
    ["Havoc Demon Hunter"]    = 577,
    ["Holy Paladin"]          = 65,
    ["Holy Priest"]           = 257,
    ["Marksmanship Hunter"]   = 254,
    ["Mistweaver Monk"]       = 270,
    ["Outlaw Rogue"]          = 260,
    ["Preservation Evoker"]   = 1468,
    ["Protection Paladin"]    = 66,
    ["Protection Warrior"]    = 73,
    ["Restoration Druid"]     = 105,
    ["Restoration Shaman"]    = 264,
    ["Retribution Paladin"]   = 70,
    ["Shadow Priest"]         = 258,
    ["Subtlety Rogue"]        = 261,
    ["Survival Hunter"]       = 255,
    ["Unholy Death Knight"]   = 252,
    ["Vengeance Demon Hunter"] = 581,
    ["Windwalker Monk"]       = 269,
}

-- Populated at ADDON_LOADED; avoids repeated GetSpecializationInfoByID calls per render
local specIconCache = {}

-- Reusable pools for detail pane content (frames can't be destroyed in WoW)
local detailHeaders = {}
local detailRows = {}

local function ClearDetailContent()
    for _, fs in ipairs(detailHeaders) do fs:Hide() end
    for _, row in ipairs(detailRows) do row.icon:Hide(); row.text:Hide() end
end

local function GetDetailHeader(index)
    if not detailHeaders[index] then
        local fs = RLGearHelperFrameDetailsScrollFrameContent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetWidth(330)
        fs:SetJustifyH("LEFT")
        detailHeaders[index] = fs
    end
    return detailHeaders[index]
end

local function GetDetailRow(index)
    if not detailRows[index] then
        local content = RLGearHelperFrameDetailsScrollFrameContent
        local row = {}
        row.icon = content:CreateTexture(nil, "ARTWORK")
        row.icon:SetSize(16, 16)
        row.text = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        row.text:SetWidth(308)
        row.text:SetJustifyH("LEFT")
        detailRows[index] = row
    end
    return detailRows[index]
end

local function SetDetailMessage(msg)
    ClearDetailContent()
    local h = GetDetailHeader(1)
    h:SetPoint("TOPLEFT", RLGearHelperFrameDetailsScrollFrameContent, "TOPLEFT", 0, 0)
    h:SetText(msg)
    h:Show()
    RLGearHelperFrameDetailsScrollFrameContent:SetHeight(30)
    RLGearHelperFrameDetailsScrollFrame:UpdateScrollChildRect()
end

-- Create main frame for event handling
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")

-- Minimap button
local minimapAngle = 225
local minimapButton

local function RLGearHelper_ToggleWindow()
    if RLGearHelperFrame:IsShown() then
        RLGearHelperFrame:Hide()
    else
        RLGearHelperFrame:Show()
    end
end

local function RLGearHelper_UpdateMinimapPos()
    local rad = math.rad(minimapAngle)
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", math.cos(rad) * 80, math.sin(rad) * 80)
end

local function RLGearHelper_CreateMinimapButton()
    if not RLGearHelperDB then RLGearHelperDB = {} end
    if not RLGearHelperDB.minimap then RLGearHelperDB.minimap = {} end

    -- Use LibDataBroker + LibDBIcon if available (works with any minimap button manager)
    local ldb  = LibStub and LibStub("LibDataBroker-1.1", true)
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)

    if ldb and icon then
        local dataobj = ldb:NewDataObject("RLGearHelper", {
            type  = "launcher",
            icon  = "Interface\\Icons\\INV_Misc_Gear_01",
            OnClick = function(_, btn)
                if btn == "LeftButton" then RLGearHelper_ToggleWindow() end
            end,
            OnTooltipShow = function(tip)
                tip:AddLine("RL Gear Helper")
                tip:AddLine("|cffffff00Left-click|r to toggle window", 1, 1, 1)
                tip:AddLine("|cffffff00Drag|r to reposition", 1, 1, 1)
            end,
        })
        icon:Register("RLGearHelper", dataobj, RLGearHelperDB.minimap)
        minimapButton = icon:GetMinimapButton("RLGearHelper")
        return
    end

    -- Fallback: plain button parented to Minimap
    minimapButton = CreateFrame("Button", "RLGearHelperMinimapButton", Minimap)
    minimapButton:SetSize(32, 32)
    minimapButton:SetFrameStrata("MEDIUM")
    minimapButton:SetFrameLevel(8)
    minimapButton:RegisterForClicks("AnyUp")
    minimapButton:RegisterForDrag("LeftButton")
    minimapButton:SetMovable(true)

    local bg = minimapButton:CreateTexture(nil, "BACKGROUND")
    bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
    bg:SetSize(26, 26)
    bg:SetPoint("CENTER")

    local ico = minimapButton:CreateTexture(nil, "ARTWORK")
    ico:SetTexture("Interface\\Icons\\INV_Misc_Gear_01")
    ico:SetSize(20, 20)
    ico:SetPoint("CENTER")

    local border = minimapButton:CreateTexture(nil, "OVERLAY")
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    border:SetSize(56, 56)
    border:SetPoint("CENTER")

    minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    minimapButton:SetScript("OnClick", function(_, btn)
        if btn == "LeftButton" then RLGearHelper_ToggleWindow() end
    end)

    minimapButton:SetScript("OnDragStart", function(self)
        self:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local cx, cy = GetCursorPosition()
            local s = UIParent:GetEffectiveScale()
            minimapAngle = math.deg(math.atan2(cy / s - my, cx / s - mx))
            RLGearHelperDB.minimap.angle = minimapAngle
            RLGearHelper_UpdateMinimapPos()
        end)
    end)

    minimapButton:SetScript("OnDragStop", function(self)
        self:SetScript("OnUpdate", nil)
    end)

    minimapButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine("RL Gear Helper")
        GameTooltip:AddLine("|cffffff00Left-click|r to toggle window", 1, 1, 1)
        GameTooltip:AddLine("|cffffff00Drag|r to reposition", 1, 1, 1)
        GameTooltip:Show()
    end)

    minimapButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    if RLGearHelperDB.minimap.angle then
        minimapAngle = RLGearHelperDB.minimap.angle
    end
    RLGearHelper_UpdateMinimapPos()
end

-- OnEvent script
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        print("RL Gear Helper loaded successfully!")
        -- Initialize addon functionality here
        RLGearHelper_OnLoad()
    end
end)

-- Initialization function
function RLGearHelper_OnLoad()
    -- Set up slash commands
    SLASH_RLGEARHELPER1 = "/rlgh"
    SLASH_RLGEARHELPER2 = "/rlgearhelper"
    SlashCmdList["RLGEARHELPER"] = RLGearHelper_SlashCommand

    RLGearHelperFrameCloseButton:SetScript("OnClick", function() RLGearHelperFrame:Hide() end)

    RLGearHelperFrame:SetResizeBounds(420, 300)

    RLGearHelperFrame:SetBackdrop({
        bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile     = true,
        tileSize = 32,
        edgeSize = 32,
        insets   = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    RLGearHelperFrameRaidBtn1:SetText("The Dreamrift")
    RLGearHelperFrameRaidBtn1:SetScript("OnClick", function()
        RAID_FILTER = "The Dreamrift"
        RLGearHelper_RebuildTrinketList()
    end)

    RLGearHelperFrameRaidBtn2:SetText("The Voidspire")
    RLGearHelperFrameRaidBtn2:SetScript("OnClick", function()
        RAID_FILTER = "The Voidspire"
        RLGearHelper_RebuildTrinketList()
    end)

    RLGearHelperFrameRaidBtn3:SetText("March on Quel'Danas")
    RLGearHelperFrameRaidBtn3:SetScript("OnClick", function()
        RAID_FILTER = "March on Quel'Danas"
        RLGearHelper_RebuildTrinketList()
    end)

    local grip = RLGearHelperFrameResizeButton
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:SetScript("OnMouseDown", function() RLGearHelperFrame:StartSizing("BOTTOMRIGHT") end)
    grip:SetScript("OnMouseUp",   function() RLGearHelperFrame:StopMovingOrSizing() end)

    RLGearHelper_RebuildTrinketList()
    RLGearHelper_OnResize(RLGearHelperFrame)
    RLGearHelper_CreateMinimapButton()

    -- Restore saved window size and position
    if not RLGearHelperDB then RLGearHelperDB = {} end
    local win = RLGearHelperDB.window
    if win then
        if win.width and win.height then
            RLGearHelperFrame:SetSize(win.width, win.height)
            RLGearHelper_OnResize(RLGearHelperFrame)
        end
        if win.x and win.y then
            RLGearHelperFrame:ClearAllPoints()
            RLGearHelperFrame:SetPoint(win.point or "CENTER", UIParent, win.relPoint or "BOTTOMLEFT", win.x, win.y)
        end
    end
    -- Pre-request item data so icons are ready when the list is shown
    for _, data in ipairs(trinkets) do
        if data.itemID then
            C_Item.RequestLoadItemDataByID(data.itemID)
        end
    end
    for spec, specID in pairs(specIDs) do
        local _, _, _, icon = GetSpecializationInfoByID(specID)
        if icon then specIconCache[spec] = icon end
    end
    print("RL Gear Helper initialized. Use /rlgh for commands.")
end

function RLGearHelper_SaveWindowPosition()
    if not RLGearHelperDB then RLGearHelperDB = {} end
    if not RLGearHelperDB.window then RLGearHelperDB.window = {} end
    local point, _, relPoint, x, y = RLGearHelperFrame:GetPoint(1)
    RLGearHelperDB.window.point    = point
    RLGearHelperDB.window.relPoint = relPoint
    RLGearHelperDB.window.x        = x
    RLGearHelperDB.window.y        = y
end

function RLGearHelper_SaveWindowSize()
    if not RLGearHelperDB then RLGearHelperDB = {} end
    if not RLGearHelperDB.window then RLGearHelperDB.window = {} end
    RLGearHelperDB.window.width  = RLGearHelperFrame:GetWidth()
    RLGearHelperDB.window.height = RLGearHelperFrame:GetHeight()
end

-- Reflow child frames when the window is resized
function RLGearHelper_OnResize(f)
    if not RLGearHelperFrameTrinketListFrame then return end
    local w = f:GetWidth()
    local h = f:GetHeight()
    -- lpad(15) + list(375) + gap(20) + scrollW + rpad(15) = w  =>  scrollW = w - 425
    local scrollW = w - 425
    local scrollH = h - 53   -- top(38) + bottom(15)
    RLGearHelperFrameTrinketListFrame:SetHeight(h - 126)  -- top offset(111) + bottom(15)
    RLGearHelperFrameDetailsScrollFrame:SetWidth(scrollW)
    RLGearHelperFrameDetailsScrollFrame:SetHeight(scrollH)
    -- subtract scrollbar width (~20) for the inner content frame
    RLGearHelperFrameDetailsScrollFrameContent:SetWidth(scrollW - 20)
    RLGearHelperFrameDetailsScrollFrame:UpdateScrollChildRect()
end

-- Rebuild the trinket list filtered to the current RAID_FILTER
function RLGearHelper_RebuildTrinketList()
    -- Hide all pooled buttons
    for _, btn in ipairs(trinketButtonPool) do
        btn:Hide()
    end

    local listFrame = RLGearHelperFrameTrinketListFrame
    local yOffset = 0
    local poolIdx = 0

    for _, data in ipairs(trinkets) do
        if data.raid == RAID_FILTER then
            poolIdx = poolIdx + 1
            local button = trinketButtonPool[poolIdx]
            if not button then
                button = CreateFrame("Button", nil, listFrame)
                button:SetSize(375, 22)
                -- hover highlight
                local hl = button:CreateTexture(nil, "HIGHLIGHT")
                hl:SetAllPoints()
                hl:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
                hl:SetBlendMode("ADD")
                -- icon
                button._icon = button:CreateTexture(nil, "ARTWORK")
                button._icon:SetSize(18, 18)
                button._icon:SetPoint("LEFT", button, "LEFT", 2, 0)
                -- label
                button._label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                button._label:SetPoint("LEFT", button, "LEFT", 24, 0)
                button._label:SetPoint("RIGHT", button, "RIGHT", -2, 0)
                button._label:SetJustifyH("LEFT")
                trinketButtonPool[poolIdx] = button
            end

            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", listFrame, "TOPLEFT", 0, -yOffset)

            if data.itemID then
                local iconID = C_Item.GetItemIconByID(data.itemID)
                if iconID and iconID ~= 0 then
                    button._icon:SetTexture(iconID)
                else
                    button._icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
                end
                button._icon:Show()
            else
                button._icon:Hide()
            end

            button._label:SetText(data.name)
            button:SetScript("OnClick", function() RLGearHelper_SelectTrinket(data) end)
            button:Show()
            yOffset = yOffset + 22
        end
    end

    SetDetailMessage("Select a trinket from the list to view tier ratings.")
end

-- Show trinket details grouped by tier with spec icons
function RLGearHelper_SelectTrinket(data)
    ClearDetailContent()
    local content = RLGearHelperFrameDetailsScrollFrameContent
    local HDR_H = 20
    local ROW_H = 18
    local PAD  = 6
    local yOff = 0
    local hIdx = 0
    local rIdx = 0

    -- Trinket name
    hIdx = hIdx + 1
    local h = GetDetailHeader(hIdx)
    h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -yOff)
    h:SetText(data.name)
    h:Show()
    yOff = yOff + HDR_H

    -- Raid name
    hIdx = hIdx + 1
    h = GetDetailHeader(hIdx)
    h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -yOff)
    h:SetText("Raid: " .. data.raid)
    h:Show()
    yOff = yOff + HDR_H + PAD

    for _, tier in ipairs({ "S", "A", "B", "C", "D" }) do
        local specs = data.tiers[tier]
        if specs and #specs > 0 then
            -- Tier label
            hIdx = hIdx + 1
            h = GetDetailHeader(hIdx)
            h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -yOff)
            h:SetText(tierColors[tier] .. tier .. " Tier" .. COLOR_RESET)
            h:Show()
            yOff = yOff + HDR_H

            for _, spec in ipairs(specs) do
                rIdx = rIdx + 1
                local row = GetDetailRow(rIdx)

                row.icon:ClearAllPoints()
                row.icon:SetPoint("TOPLEFT", content, "TOPLEFT", 10, -(yOff + 1))
                local icon = specIconCache[spec]
                if icon then
                    row.icon:SetTexture(icon)
                    row.icon:Show()
                else
                    row.icon:Hide()
                end

                row.text:ClearAllPoints()
                row.text:SetPoint("TOPLEFT", content, "TOPLEFT", 30, -yOff)
                row.text:SetText(spec)
                row.text:Show()
                yOff = yOff + ROW_H
            end
            yOff = yOff + PAD
        end
    end

    content:SetHeight(math.max(yOff + 10, 10))
    RLGearHelperFrameDetailsScrollFrame:UpdateScrollChildRect()
end

-- Slash command handler
function RLGearHelper_SlashCommand(msg)
    if msg == "" then
        print("RL Gear Helper commands:")
        print("/rlgh - Show this help")
        print("/rlgh show - Show the gear helper window")
        print("/rlgh reset - Reset window size and position to defaults")
        print("/rlgh version - Show addon version")
    elseif msg == "show" then
        RLGearHelper_ShowWindow()
    elseif msg == "reset" then
        RLGearHelper_ResetWindow()
    elseif msg == "version" then
        print("RL Gear Helper v1.1.0")
    else
        print("Unknown command. Use /rlgh for help.")
    end
end

function RLGearHelper_ResetWindow()
    if RLGearHelperDB then RLGearHelperDB.window = nil end
    RLGearHelperFrame:SetSize(800, 530)
    RLGearHelperFrame:ClearAllPoints()
    RLGearHelperFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    RLGearHelper_OnResize(RLGearHelperFrame)
    RLGearHelperFrame:Show()
    print("RL Gear Helper: window reset to default size and position.")
end

-- Function to show the UI window
function RLGearHelper_ShowWindow()
    if not RLGearHelperFrame:IsShown() then
        RLGearHelperFrame:Show()
        RLGearHelper_UpdateWindow()
    end
end

-- Function to update the window content
function RLGearHelper_UpdateWindow()
    SetDetailMessage("Select a trinket from the list to view tier ratings.")
end
