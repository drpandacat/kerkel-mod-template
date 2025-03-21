---@param id ModCallbacks | any
---@param fn function
---@param filter any
function PlaceholderGlobal:AddCallback(id, fn, filter) end
---@param id ModCallbacks | any
---@param priority CallbackPriority | integer
---@param fn function
---@param filter any
function PlaceholderGlobal:AddPriorityCallback(id, priority, fn, filter) end
function PlaceholderGlobal:HasData() return true end
function PlaceholderGlobal:LoadData() return "" end
---@param id ModCallbacks
---@param fn function
function PlaceholderGlobal:RemoveCallback(id, fn) end
function PlaceholderGlobal:RemoveData() end
---@param data string
function PlaceholderGlobal:SaveData(data) end
PlaceholderGlobal.Name = ""

REPENTOGON = {}
PlayerManager = {}

ModConfigMenu = {}
TheFuture = {}
CustomHealthAPI = {}
FiendFolio = {}
EID = {}

NoHealthCapModEnabled = false
NoHealthCapRedMax = 0
NoHealthCapSoulHearts = 0
NoHealthCapBoneHearts = 0
NoHealthCapBrokenHearts = 0