local t = {}

---@class ReferenceConfig
---@field Item ItemConfigItem
---@field Reference string
---@field RareDesc string
---@field Partial boolean

---@type CollectibleType[]
t.STACKABLE_COLLECTIBLE = {}
---@type ReferenceConfig[]
t.REFERENCE_CONFIG = {}
---@type table<ItemType, string>
t.ITEM_TYPE_TO_REFERENCE_KEY = {
    [ItemType.ITEM_ACTIVE] = "Actives",
    [ItemType.ITEM_PASSIVE] = "Passives",
    [ItemType.ITEM_TRINKET] = "Trinkets",
}

---@param id CollectibleType
function t:RegisterStackableCollectible(id)
    t.STACKABLE_COLLECTIBLE[#t.STACKABLE_COLLECTIBLE + 1] = id
end

---@param config ReferenceConfig
function t:RegisterReferenceItem(config)
    t.REFERENCE_CONFIG[#t.REFERENCE_CONFIG + 1] = config
end

ModCompatHelper:Register(PlaceholderGlobal, "FiendFolio", function ()
    FiendFolio:AddStackableItems(t.STACKABLE_COLLECTIBLE)
    for _, v in ipairs(t.REFERENCE_CONFIG) do
        FiendFolio.ReferenceItems[t.ITEM_TYPE_TO_REFERENCE_KEY[v.Item.Type]]
        [#FiendFolio.ReferenceItems[t.ITEM_TYPE_TO_REFERENCE_KEY[v.Item.Type]]+ 1] = {
            ID = v.Item.ID,
            Reference = v.Reference,
            RareDesc = v.RareDesc,
            Partial = v.Partial,
        }
    end
end)

return t