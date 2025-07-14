---@param entity Entity
local function PostEntityInit(_, entity)
    PlaceholderGlobal.Data.ENTITY[GetPtrHash(entity)] = nil
end

for _, v in ipairs(PlaceholderGlobal.Dict.POST_INIT_CALLBACK) do
    PlaceholderGlobal:AddPriorityCallback(v, CallbackPriority.IMPORTANT, PostEntityInit)
end

PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_PRE_GAME_EXIT, CallbackPriority.LATE, function ()
    for k in pairs(PlaceholderGlobal.Data) do
        PlaceholderGlobal.Data[k] = {}
    end
end)

if REPENTOGON then
    ---@diagnostic disable-next-line: undefined-field
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_GLOWING_HOURGLASS_SAVE, CallbackPriority.LATE, function ()
        PlaceholderGlobal.Data.ENTITY_BACKUP = PlaceholderGlobal:DeepCopy(PlaceholderGlobal.Data.ENTITY, true)
        PlaceholderGlobal.Data.GLOBAL_BACKUP = PlaceholderGlobal:DeepCopy(PlaceholderGlobal.Data.GLOBAL, true)
    end)
    ---@diagnostic disable-next-line: undefined-field
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_GLOWING_HOURGLASS_LOAD, CallbackPriority.IMPORTANT, function ()
        PlaceholderGlobal.Data.ENTITY = PlaceholderGlobal:DeepCopy(PlaceholderGlobal.Data.ENTITY_BACKUP, true)
        PlaceholderGlobal.Data.GLOBAL = PlaceholderGlobal:DeepCopy(PlaceholderGlobal.Data.GLOBAL_BACKUP, true)
    end)
else
    ---@param entity Entity
    PlaceholderGlobal:AddPriorityCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, CallbackPriority.LATE, function (_, entity)
        PlaceholderGlobal.Data.ENTITY[GetPtrHash(entity)] = nil
    end, EntityType.ENTITY_SLOT)
end