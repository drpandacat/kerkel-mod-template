PlaceholderGlobal = RegisterMod("Placeholder Name", 1)

PlaceholderGlobal.PREFIX = "(Placeholder) "
PlaceholderGlobal.SUFFIX = ""

---@param path string
local function include(path)
    return _G.include("scripts" .. PlaceholderGlobal.SUFFIX .. "." .. path)
end

---@param path string
local function require(path)
    return _G.require("scripts" .. PlaceholderGlobal.SUFFIX .. "." .. path)
end

--#region Early utility
include("utility.modcompathelper")
ModCompatHelper:Clear(PlaceholderGlobal)
PlaceholderGlobal.SaveManager = require("utility.savemanager")
PlaceholderGlobal.SaveManager.Init(PlaceholderGlobal)
PlaceholderGlobal.Scheduler = include("utility.scheduler")(PlaceholderGlobal)
--#endregion
--#region Declarations

PlaceholderGlobal.Data = require("declarations.data")

include("declarations.enums")
include("declarations.functions")
include("declarations.repentogoff")
--#endregion
--#region Late utility

include("utility.data")
--#endregion

PlaceholderGlobal.Source = {}
PlaceholderGlobal.Source.Compat = {}
PlaceholderGlobal.Source.Compat.EID = include("compat.eid")
PlaceholderGlobal.Source.Compat.FiendFolio = include("compat.fiendfolio")

ModCompatHelper:Init()