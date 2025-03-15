---@class ModReference
PlaceholderGlobal = RegisterMod("Placeholder Name", 1)

PlaceholderGlobal.SaveManager = include("scripts.utility.savemanager")
PlaceholderGlobal.SaveManager.Init(PlaceholderGlobal)

PlaceholderGlobal.Scheduler = include("scripts.utility.scheduler")(PlaceholderGlobal)

include("scripts.declarations.enums")
include("scripts.declarations.functions")
include("scripts.declarations.repentogoff")