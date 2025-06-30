local esauJrState

PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_PRE_GAME_EXIT, CallbackPriority.LATE, function ()
    for k in pairs(PlaceholderGlobal.Data) do
        PlaceholderGlobal.Data[k] = {}
    end
end)

---@param entity Entity
PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, CallbackPriority.LATE, function (_, entity)
    local hash = GetPtrHash(entity)
    PlaceholderGlobal.Data.ENTITY[hash] = nil
    PlaceholderGlobal.Data.ENTITY_BACKUP[hash] = nil
end)

if REPENTOGON then
    ---@param player EntityPlayer
    ---@param flags UseFlag
    ---@param slot ActiveSlot
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_USE_ITEM, CallbackPriority.IMPORTANT, function (_, _, _, player, flags, slot)
        local data = PlaceholderGlobal.Util:GetData(nil, player)
        if data.EsauJrMainPlayer then
            data.EsauJrMainPlayer = nil
            return
        end
        esauJrState = player:GetActiveItemDesc(slot).VarData
    end, CollectibleType.COLLECTIBLE_ESAU_JR)

    ---@param player EntityPlayer
    ---@param flag CacheFlag
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_EVALUATE_CACHE, CallbackPriority.IMPORTANT, function (_, player, flag)
        if not esauJrState then return end
        PlaceholderGlobal.Util:GetData(nil, player, PlaceholderGlobal.Enum.DataPersistenceFlag.RUN).EsauJrState = esauJrState
        esauJrState = nil
    end, CacheFlag.CACHE_WEAPON)
end

if REPENTOGON then
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_GLOWING_HOURGLASS_SAVE, CallbackPriority.LATE, function ()
        PlaceholderGlobal.Data.ENTITY_BACKUP = PlaceholderGlobal.Util:DeepCopy(PlaceholderGlobal.Data.ENTITY, true)
        PlaceholderGlobal.Data.GLOBAL_BACKUP = PlaceholderGlobal.Util:DeepCopy(PlaceholderGlobal.Data.GLOBAL, true)
    end)
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_GLOWING_HOURGLASS_LOAD, CallbackPriority.IMPORTANT, function ()
        PlaceholderGlobal.Data.ENTITY = PlaceholderGlobal.Util:DeepCopy(PlaceholderGlobal.Data.ENTITY_BACKUP, true)
        PlaceholderGlobal.Data.GLOBAL = PlaceholderGlobal.Util:DeepCopy(PlaceholderGlobal.Data.GLOBAL_BACKUP, true)
    end)
end