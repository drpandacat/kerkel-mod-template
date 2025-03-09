---@class ModReference
PlaceholderGlobal = RegisterMod("Placeholder Name", 1)

--#region Lib
PlaceholderGlobal.SaveManager = include("scripts.utility.savemanager")
PlaceholderGlobal.SaveManager.Init(PlaceholderGlobal)
--#region

--#region Declarations
include("scripts.declarations.enums")
include("scripts.declarations.functions")
include("scripts.declarations.repentogoff")
--#endregion

--#region Utility
include("scripts.utility.scheduler")
--#endregion