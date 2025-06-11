---@class SchedulerEntry
---@field Frame integer
---@field Fn function
---@field Delay integer
---@field Type FunctionScheduleType

---@class Scheduler
local Scheduler = {
    ---@type SchedulerEntry[]
    Entries = {},
}

---@enum FunctionScheduleType
Scheduler.Type = {
    PERSISTENT = 1,
    LEAVE_ROOM_CANCEL = 2,
    POST_LEAVE_ROOM_EXECUTE = 3,
    PRE_LEAVE_ROOM_EXECUTE = 4,
}

local game = Game()

---@param fn function
---@param delay integer
---@param type FunctionScheduleType
function Scheduler:Schedule(fn, delay, type)
    table.insert(Scheduler.Entries, {
        Frame = game:GetFrameCount(),
        Fn = fn,
        Delay = delay,
        Type = type
    })
end

return function (mod)
    mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, function ()
        for _, v in pairs(Scheduler.Entries) do
            if v.Type == Scheduler.Type.POST_LEAVE_ROOM_EXECUTE or v.Type == Scheduler.Type.PRE_LEAVE_ROOM_EXECUTE then
                v.Fn()
            end
        end
        Scheduler.Entries = {}
    end)

    if REPENTOGON then
        ---@diagnostic disable-next-line: undefined-field
        mod:AddCallback(ModCallbacks.MC_PRE_NEW_ROOM, function ()
            for _, v in pairs(Scheduler.Entries) do
                if v.Type == Scheduler.Type.PRE_LEAVE_ROOM_EXECUTE then
                    v.Fn()
                end
            end
        end)
    end

    mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function ()
        for i = #Scheduler.Entries, 1, -1 do
            local v = Scheduler.Entries[i]
            if v.Type ~= Scheduler.Type.PERSISTENT then
                if v.Type ~= Scheduler.Type.LEAVE_ROOM_CANCEL
                and (
                    v.Type == Scheduler.Type.POST_LEAVE_ROOM_EXECUTE
                    or (
                        not REPENTOGON
                        and (v.Type == Scheduler.Type.PRE_LEAVE_ROOM_EXECUTE)
                    )
                ) then
                    v.Fn()
                end
                table.remove(Scheduler.Entries, i)
            end
        end
    end)

    mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function ()
        local frameCount = game:GetFrameCount()
        for i = #Scheduler.Entries, 1, -1 do
            local v = Scheduler.Entries[i]
            if v.Frame + v.Delay <= frameCount then
                table.remove(Scheduler.Entries, i)
                v.Fn()
            end
        end
    end)

    return Scheduler
end
