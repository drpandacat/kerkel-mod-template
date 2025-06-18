PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_PRE_GAME_EXIT, CallbackPriority.LATE, function ()
    for k in pairs(PlaceholderGlobal.Data) do
        PlaceholderGlobal.Data[k] = {}
    end
end)

-- ---@param entity Entity
-- PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, CallbackPriority.LATE, function (_, entity)
--     local hash = GetPtrHash(entity)
--     PlaceholderGlobal.Data.ENTITY[hash] = nil
--     PlaceholderGlobal.Data.ENTITY_BACKUP[hash] = nil
-- end)

---@param entity Entity
local function PostEntityInit(_, entity)
    local hash = GetPtrHash(entity)
    PlaceholderGlobal.Data.ENTITY[hash] = nil
    PlaceholderGlobal.Data.ENTITY_BACKUP[hash] = nil
end
for _, v in ipairs(PlaceholderGlobal.Enum.Dict.POST_ENTITY_INIT) do
    PlaceholderGlobal:AddPriorityCallback(v, CallbackPriority.IMPORTANT - 1, PostEntityInit)
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