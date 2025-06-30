local t = {}

---@class DescObj
---@field ObjType EntityType
---@field ObjVariant PickupVariant
---@field ObjSubType CollectibleType | TrinketType | Card | PillEffect
---@field Description string

---@class DescriptionConfig
---@field Name string
---@field Description string
---@field Modifier? fun(obj: DescObj): DescObj | false?

---@enum Lang
t.Lang = {
    ENGLISH_US = "en_us",
    ENGLISH_US_DETAILED = "en_us_detailed",
    RUSSIAN = "ru",
    FRENCH = "fr",
    PORTUGUESE = "pt",
    SPANISH = "spa",
    POLISH = "pl",
    BULGARIAN = "bul",
    TURKISH = "turkish"
}

---@enum Desc
t.Desc = {
    COLLECTIBLE = 1,
    TRINKET = 2,
    CARD = 3,
    PILL = 4,
    PLAYER = 5,
    BIRTHRIGHT = 6,
}

---@type table<Desc, table<CollectibleType | TrinketType | Card | PillEffect | PlayerType, table<Lang, DescriptionConfig>>>
t.DESCRIPTIONS = {}

---@param type Desc
---@param id CollectibleType | TrinketType | Card | PillEffect | PlayerType
---@param name string
---@param desc string
---@param lang? Lang
---@param modifier? fun(obj: DescObj): DescObj | false?
function t:Add(type, id, name, desc, lang, modifier)
    lang = lang or t.Lang.ENGLISH_US

    t.DESCRIPTIONS[type] = t.DESCRIPTIONS[type] or {}
    t.DESCRIPTIONS[type][id] = t.DESCRIPTIONS[type][id] or {}
    t.DESCRIPTIONS[type][id][lang] = {
        Name = name,
        Description = desc,
        Modifier = modifier
    }
end

---@param obj DescObj
function t:GetMult(obj)
    if obj.ObjType ~= EntityType.ENTITY_PICKUP then return end
    if obj.ObjVariant == PickupVariant.PICKUP_TRINKET then
        return (obj.ObjSubType > TrinketType.TRINKET_GOLDEN_FLAG and 2 or 1)
        + (PlayerManager.AnyoneHasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX) and 1 or 0)
    end
end

---@param obj DescObj
function t:Stacks(obj)
    if obj.ObjType ~= EntityType.ENTITY_PICKUP then return end
    if obj.ObjVariant == PickupVariant.PICKUP_COLLECTIBLE then
        return PlayerManager.AnyoneHasCollectible(obj.ObjSubType) or PlayerManager.AnyoneHasCollectible(CollectibleType.COLLECTIBLE_DIPLOPIA)
    end
end

t.TYPE_TO_OBJ = {
    [t.Desc.COLLECTIBLE] = {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE},
    [t.Desc.TRINKET] = {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET},
    [t.Desc.CARD] = {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD},
    [t.Desc.PILL] = {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL},
    [t.Desc.PLAYER] = {EntityType.ENTITY_PLAYER},
    [t.Desc.BIRTHRIGHT] = {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, CollectibleType.COLLECTIBLE_BIRTHRIGHT},
}

ModCompatHelper:Register(PlaceholderGlobal, "EID", function ()
    EID:setModIndicatorName(PlaceholderGlobal.Name)

    ---@type table<Desc, function>
    local DESC_TYPE_TO_FN = {
        [t.Desc.COLLECTIBLE] = EID.addCollectible,
        [t.Desc.TRINKET] = EID.addTrinket,
        [t.Desc.CARD] = EID.addCard,
        [t.Desc.PILL] = EID.addPill,
        [t.Desc.PLAYER] = EID.addCharacterInfo,
        [t.Desc.BIRTHRIGHT] = EID.addBirthright,
    }

    for type, entries in pairs(t.DESCRIPTIONS) do
        for id, entry in pairs(entries) do
            for lang, config in pairs(entry) do
                DESC_TYPE_TO_FN[type](EID, id, config.Description, config.Name, lang)

                if REPENTOGON then
                    if type == t.Desc.CARD then
                        local card = PlaceholderGlobal.Util:GetCardConfig(id)
                        ---@type Sprite
                        ---@diagnostic disable-next-line: undefined-field
                        local old = card.ModdedCardFront
                        local new = Sprite()
                        new:Load(old:GetFilename(), true)
                        new:Play(card.HudAnim, true)
                        new:GetLayer(0):SetSize(Vector.One * 0.5)
                        EID:addIcon("Card" .. id, card.HudAnim, -1, 9, 9, 4, 8, new)
                    elseif type == t.Desc.PLAYER then
                        local player = EntityConfig.GetPlayer(id) ---@cast player EntityConfigPlayer
                        local old = player:GetModdedCoopMenuSprite()

                        if old then
                            local new = Sprite()
                            local anim = player:GetName()
                            new:Load(old:GetFilename())
                            new:Play(anim, true)
                            new:GetLayer(0):SetSize(Vector.One * 0.7)
                            EID:addIcon("Player" .. id, anim, 0, 16, 16, 7.5, 5, new)
                        end
                    end
                end

                if config.Modifier then
                    EID:addDescriptionModifier(
                        "le epic modifier" .. PlaceholderGlobal.Name,
                        ---@param obj DescObj
                        function (obj)
                            local targ = t.TYPE_TO_OBJ[type]
                            return obj.ObjType == targ[1]
                            and obj.ObjVariant == targ[2]
                            and obj.ObjSubType == id
                        end,
                        ---@param obj DescObj
                        function (obj)
                            return config.Modifier(obj) or obj
                        end
                    )
                end
            end
        end
    end
end)

return t