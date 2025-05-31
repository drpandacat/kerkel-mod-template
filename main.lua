PlaceholderGlobal = RegisterMod("Placeholder Name", 1)

--#region Early utility

PlaceholderGlobal.SaveManager = require("scripts.utility.savemanager")
PlaceholderGlobal.SaveManager.Init(PlaceholderGlobal)
PlaceholderGlobal.Scheduler = include("scripts.utility.scheduler")(PlaceholderGlobal)
--#endregion
--#region Declarations

PlaceholderGlobal.Data = require("scripts.declarations.data")

include("scripts.declarations.enums")
include("scripts.declarations.functions")
include("scripts.declarations.repentogoff")
--#endregion
--#region Late utility

include("scripts.utility.data")
--#endregion