---@return EntityPlayer[]
function PlaceholderGlobal.Util:GetPlayers()
    if REPENTOGON then
        return PlayerManager.GetPlayers()
    end

    local players = {}

    for i = 1, PlaceholderGlobal.Enum.Obj.Game:GetNumPlayers() do
        players[i] = Isaac.GetPlayer(i)
    end

    return players
end

---@param id CollectibleType
---@return integer
function PlaceholderGlobal.Util:GetNumCollectibles(id)
    if REPENTOGON then
        return PlayerManager.GetNumCollectibles(id)
    end

    local num = 0

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        num = num + v:GetCollectibleNum(id)
    end

    return num
end

---@param id TrinketType
---@return integer
function PlaceholderGlobal.Util:GetTotalTrinketMultiplier(id)
    if REPENTOGON then
        return PlayerManager.GetTotalTrinketMultiplier(id)
    end

    local num = 0

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        num = num + v:GetTrinketMultiplier(id)
    end

    return num
end

---@param seed? integer
---@return RNG
function PlaceholderGlobal.Util:NewRNG(seed)
    seed = seed or math.max(Random(), 1)

    if REPENTOGON then
        ---@diagnostic disable-next-line: redundant-parameter
        return RNG(seed)
    end

    local rng = RNG()

    rng:SetSeed(seed, 35)

    return rng
end

---@param rng RNG
---@param min integer
---@param max integer
---@return integer
function PlaceholderGlobal.Util:RandomInt(rng, min, max)
    if REPENTOGON then
        ---@diagnostic disable-next-line: redundant-parameter
        return rng:RandomInt(min, max)
    end

    return min + rng:RandomInt(max - min + 1)
end

---@param id CollectibleType
---@return boolean
function PlaceholderGlobal.Util:AnyoneHasCollectible(id)
    if REPENTOGON then
        return PlayerManager.AnyoneHasCollectible(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:HasCollectible(id) then
            return true
        end
    end

    return false
end

---@param id TrinketType
---@return boolean
function PlaceholderGlobal.Util:AnyoneHasTrinket(id)
    if REPENTOGON then
        return PlayerManager.AnyoneHasTrinket(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:HasTrinket(id) then
            return true
        end
    end

    return false
end

---@param id PlayerType
---@return boolean
function PlaceholderGlobal.Util:AnyoneIsPlayerType(id)
    if REPENTOGON then
        return PlayerManager.AnyoneIsPlayerType(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:GetPlayerType() == id then
            return true
        end
    end

    return false
end

---@param playerType PlayerType
---@param collectibleType CollectibleType
---@return boolean
function PlaceholderGlobal.Util:AnyPlayerTypeHasCollectible(playerType, collectibleType)
    if REPENTOGON then
        ---@diagnostic disable-next-line: return-type-mismatch
        return PlayerManager.AnyPlayerTypeHasCollectible(playerType, collectibleType)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:GetPlayerType() == playerType and v:HasCollectible(collectibleType) then
            return true
        end
    end

    return false
end

---@param playerType PlayerType
---@param trinketType TrinketType
---@return boolean
function PlaceholderGlobal.Util:AnyPlayerTypeHasTrinket(playerType, trinketType)
    if REPENTOGON then
        ---@diagnostic disable-next-line: return-type-mismatch
        return PlayerManager.AnyPlayerTypeHasTrinket(playerType, trinketType)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:GetPlayerType() == playerType and v:HasTrinket(trinketType) then
            return true
        end
    end

    return false
end

---@param id CollectibleType
---@return EntityPlayer?
function PlaceholderGlobal.Util:FirstCollectibleOwner(id)
    if REPENTOGON then
        return PlayerManager.FirstCollectibleOwner(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:HasCollectible(id) then
            return v
        end
    end
end

---@param id TrinketType
---@return EntityPlayer?
function PlaceholderGlobal.Util:FirstTrinketOwner(id)
    if REPENTOGON then
        return PlayerManager.FirstTrinketOwner(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:HasTrinket(id) then
            return v
        end
    end
end

---@param id PlayerType
---@return EntityPlayer?
function PlaceholderGlobal.Util:FirstPlayerByType(id)
    if REPENTOGON then
        return PlayerManager.FirstPlayerByType(id)
    end

    for _, v in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if v:GetPlayerType() == id then
            return v
        end
    end
end

---@param rng RNG
---@return Vector
function PlaceholderGlobal.Util:RandomVector(rng)
    if REPENTOGON then
        ---@diagnostic disable-next-line: undefined-field
        return rng:RandomVector()
    end

    return Vector.FromAngle(rng:RandomFloat() * 360)
end

---@param player EntityPlayer
---@param flags integer
function PlaceholderGlobal.Util:AddCacheFlags(player, flags)
    if REPENTOGON then
        ---@diagnostic disable-next-line: redundant-parameter
        player:AddCacheFlags(flags, true)
    else
        player:AddCacheFlags(flags)
        player:EvaluateItems()
    end
end

function PlaceholderGlobal.Util:Picker()
    ---@class Picker
    local Picker = {}

    Picker.Outcomes = {}

    ---@param value any
    ---@param weight number
    function Picker:Add(weight, value)
        table.insert(Picker.Outcomes, {weight, value})
    end

    ---@param rng RNG
    function Picker:Pick(rng)
        local totalWeight = 0

        for _, v in ipairs(Picker.Outcomes) do
            totalWeight = totalWeight + v[1]
        end

        local roll = rng:RandomFloat() * totalWeight

        for _, v in ipairs(Picker.Outcomes) do
            if roll > v[1] then
                roll = roll - v[1]
            else
                return v[2]
            end
        end
    end

    function Picker:Clear()
        Picker.Outcomes = {}
    end

    return Picker
end

---@param player EntityPlayer
---@return integer
function PlaceholderGlobal.Util:GetHealthType(player)
    if REPENTOGON then
        ---@diagnostic disable-next-line: undefined-field
        return player:GetHealthType()
    end

    return PlaceholderGlobal.Enum.Dict.PLAYER_TO_HEALTH_TYPE[player:GetPlayerType()] or 0
end