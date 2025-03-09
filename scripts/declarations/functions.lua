PlaceholderGlobal.Util = {}

---@param type EntityType | integer
---@param variant integer | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnNPC(type, variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(type, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToNPC()
end

---@param variant EffectVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnEffect(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_EFFECT, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToEffect()
end

---@param variant TearVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnTear(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_TEAR, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToTear()
end

---@param variant ProjectileVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnProjectile(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_PROJECTILE, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToProjectile()
end

---@param variant PickupVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnPickup(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_PICKUP, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToPickup()
end

---@param variant FamiliarVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnFamiliar(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_FAMILIAR, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToFamiliar()
end

---@param variant BombVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnBomb(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_BOMB, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToBomb()
end

---@param variant integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnKnife(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_KNIFE, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToKnife()
end

---@param variant LaserVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnLaser(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_LASER, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToLaser()
end

---@param variant integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnSlot(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.GAME:Spawn(EntityType.ENTITY_SLOT, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1))
end

---@generic T
---@param a T
---@param b T
---@param t number
---@return T
function PlaceholderGlobal.Util:Lerp(a, b, t)
    return a + (b - a) * t
end

---@param from number
---@param to number
function PlaceholderGlobal.Util:ShortAngleDis(from, to)
    local disAngle = (to - from) % 360
    return 2 * disAngle % 360 - disAngle
end

---@param from number
---@param to number
---@param fraction number
function PlaceholderGlobal.Util:LerpAngle(from, to, fraction)
    return from + PlaceholderGlobal.Util:ShortAngleDis(from, to) * fraction
end

---@param fireDelay number
function PlaceholderGlobal.Util:ToTearsPerSecond(fireDelay)
    return 30 / (fireDelay + 1)
end

---@param tearsPerSecond number
function PlaceholderGlobal.Util:ToFireDelay(tearsPerSecond)
    return 30 / tearsPerSecond - 1
end

---@param vector Vector
function PlaceholderGlobal.Util:CardinalClamp(vector)
    return Vector.FromAngle(((vector:GetAngleDegrees() + 45) // 90) * 90)
end

---@param angle number
function PlaceholderGlobal.Util:AngleToDirection(angle)
    return PlaceholderGlobal.Enum.Dict.ANGLE_TO_DIRECTION[math.floor((angle % 360 + 45) / 90) % 4 + 1]
end

---@param vector Vector
function PlaceholderGlobal.Util:VectorToDirection(vector)
    if vector:Length() < 0.001 then
        return Direction.NO_DIRECTION
    end

    return PlaceholderGlobal.Util:AngleToDirection(vector:GetAngleDegrees())
end

---@param direction Direction
function PlaceholderGlobal.Util:DirectionToVector(direction)
    return PlaceholderGlobal.Enum.Dict.DIRECTION_TO_VECTOR[direction]
end

---@param direction Direction
function PlaceholderGlobal.Util:DirectionToAngle(direction)
    return PlaceholderGlobal.Enum.Dict.DIRECTION_TO_ANGLE[direction]
end

---@param min number
---@param value number
---@param max number
function PlaceholderGlobal.Util:Clamp(min, value, max)
    return math.max(min, math.min(max, value))
end

---@param flags integer
---@param flag integer
function PlaceholderGlobal.Util:HasFlags(flags, flag)
    return flags & flag ~= 0
end

---@param tbl table
---@param value any
function PlaceholderGlobal.Util:AnyValueIs(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

---@param tbl table
---@param key any
function PlaceholderGlobal.Util:AnyKeyIs(tbl, key)
    for k in pairs(tbl) do
        if k == key then
            return true
        end
    end
    return false
end

---@generic T
---@param tbl T
---@param deeperCopy? boolean
---@return T
function PlaceholderGlobal.Util:DeepCopy(tbl, deeperCopy)
    local copy = {}

    for k, v in pairs(tbl) do
        copy[k] = deeperCopy and type(v) == "table" and PlaceholderGlobal.Util:DeepCopy(v, true) or v
    end

    return copy
end

---@generic T
---@param tbl T
---@param filter fun(a: any): boolean?
---@return T
function PlaceholderGlobal.Util:Filter(tbl, filter)
    local _tbl = {}

    for _, v in pairs(tbl) do
        if filter(v) then
            table.insert(_tbl, v)
        end
    end

    return _tbl
end

---@param min number
---@param max number
---@param rng? RNG
function PlaceholderGlobal.Util:RandomFloatRange(min, max, rng)
    rng = rng or PlaceholderGlobal.Util:NewRNG()
    return min + rng:RandomFloat() * (max - min)
end

---@param filter fun(config: ItemConfigItem): boolean | nil
---@param poolType? ItemPoolType
---@param maxTries? integer
---@param seed? integer
---@return CollectibleType, boolean
function PlaceholderGlobal.Util:GetFilteredCollectible(filter, poolType, maxTries, seed)
    local rng = PlaceholderGlobal.Util:NewRNG(seed or PlaceholderGlobal.Enum.Obj.GAME:GetSeeds():GetStartSeed())
    local pool = PlaceholderGlobal.Enum.Obj.GAME:GetItemPool()
    local config = Isaac.GetItemConfig()
    local collectible = CollectibleType.COLLECTIBLE_BREAKFAST
    local successful

    poolType = poolType or math.max(ItemPoolType.POOL_TREASURE, pool:GetPoolForRoom(PlaceholderGlobal.Enum.Obj.GAME:GetRoom():GetType(), rng:Next()))

    for i = 1, maxTries or 200 do
        collectible = pool:GetCollectible(poolType, false, rng:Next())

        if filter(config:GetCollectible(collectible)) then
            successful = true
            break
        end
    end

    pool:RemoveCollectible(collectible)

    return collectible, successful
end

---@param filter fun(config: ItemConfigItem): boolean | nil
---@param maxTries? integer
---@return TrinketType, boolean
function PlaceholderGlobal.Util:GetFilteredTrinket(filter, maxTries)
    local trinket = TrinketType.TRINKET_WIGGLE_WORM
    local pool = PlaceholderGlobal.Enum.Obj.GAME:GetItemPool()
    local config = Isaac.GetItemConfig()
    local successful

    for i = 1, maxTries or 100 do
        trinket = pool:GetTrinket()

        if filter(config:GetTrinket(trinket)) then
            successful = true
            break
        end
    end

    pool:RemoveTrinket(trinket)

    return trinket, successful
end

---@param filter fun(config: ItemConfigCard): boolean | nil
---@param maxTries? integer
---@param seed? integer
---@param flags? CardFilterFlag | integer
---@return Card, boolean
function PlaceholderGlobal.Util:GetFilteredCard(filter, maxTries, seed, flags)
    local card = Card.CARD_FOOL
    local pool = PlaceholderGlobal.Enum.Obj.GAME:GetItemPool()
    local config = Isaac.GetItemConfig()
    local successful

    seed = seed or PlaceholderGlobal.Enum.Obj.GAME:GetSeeds():GetStartSeed()
    flags = flags or 0

    for i = 1, maxTries or 100 do
        card = pool:GetCard(
            seed,
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.INCLUDE_PLAYING_CARDS),
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.INCLUDE_RUNES),
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.RUNES_ONLY)
        )

        if filter(config:GetCard(card)) then
            successful = true
            break
        end
    end

    return card, successful
end

---@param entity Entity
---@param searchType PlayerSearchType
---@return EntityPlayer?
function PlaceholderGlobal.Util:GetPlayerFromEntity(entity, searchType)
    local player = (entity.SpawnerEntity and entity.SpawnerEntity:ToPlayer()) or (entity.Parent and entity.Parent:ToPlayer()) or entity:ToPlayer()

    if player then
        return player
    end

    if searchType == PlaceholderGlobal.Enum.PlayerSearchType.PLAYER_ONLY then
        return
    end

    ---@type Entity[]
    local spawners = {}

    if entity.SpawnerEntity then
        table.insert(spawners, entity.SpawnerEntity)
    end

    if entity.Parent then
        table.insert(spawners, entity.Parent)
    end

    for _, v in ipairs(spawners) do
        player = v:ToPlayer()

        if player then
            return player
        end

        local familiar = v:ToFamiliar()

        if familiar then
            if searchType ~= PlaceholderGlobal.Enum.PlayerSearchType.FAMILIAR_TEARCOPYING
            or PlaceholderGlobal.Enum.Dict.TEAR_COPYING_FAMILIAR[familiar.Variant] then
                return familiar.Player
            end
        end
    end
end

---@param entity Entity
---@param identifier string
---@param persistenceMode? DataPersistenceMode
---@param default? table
---@return table
function PlaceholderGlobal.Util:GetData(entity, identifier, persistenceMode, default)
    local data

    if not persistenceMode or persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.TEMP then
        data = entity:GetData()
    else
        if persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.RUN then
            data = PlaceholderGlobal.SaveManager.GetRunSave(entity)
        elseif persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.ROOM then
            data = PlaceholderGlobal.SaveManager.GetRoomSave(entity)
        elseif persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.FLOOR_REROLL then
            data = PlaceholderGlobal.SaveManager.GetFloorSave(entity).RerollSave
        elseif persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.FLOOR_NO_REROLL then
            data = PlaceholderGlobal.SaveManager.GetFloorSave(entity).NoRerollSave
        elseif persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.ALL_REROLL then
            data = PlaceholderGlobal.SaveManager.GetRoomFloorSave(entity).RerollSave
        elseif persistenceMode == PlaceholderGlobal.Enum.DataPersistenceMode.NONE_REROLL then
            data = PlaceholderGlobal.SaveManager.GetRoomFloorSave(entity).NoRerollSave
        end
    end

    data._______LE_EPIC_DATA = data._______LE_EPIC_DATA or {}
    data._______LE_EPIC_DATA[PlaceholderGlobal.Name] = data._______LE_EPIC_DATA[PlaceholderGlobal.Name] or {}
    data._______LE_EPIC_DATA[PlaceholderGlobal.Name][identifier] = data._______LE_EPIC_DATA[PlaceholderGlobal.Name][identifier] or default or {}

    return data._______LE_EPIC_DATA[PlaceholderGlobal.Name][identifier]
end

---@param player EntityPlayer
---@param disableClamp? boolean
---@return Vector
function PlaceholderGlobal.Util:GetInputAimVect(player, disableClamp)
    local returnVect

    if player.ControllerIndex == 0 and Options.MouseControl then
        if Input.IsMouseBtnPressed(0) then
            returnVect = (Input.GetMousePosition(true) - player.Position):Normalized()
        end
    end

    returnVect = returnVect or player:GetShootingInput()

    if not disableClamp then
        if returnVect:Length() > 0.001 then
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_MARKED)
            and not player:HasCollectible(CollectibleType.COLLECTIBLE_ANALOG_STICK) then
                returnVect = PlaceholderGlobal.Util:CardinalClamp(returnVect)
            end
        end
    end

    return returnVect
end

---@param player EntityPlayer
function PlaceholderGlobal.Util:IsShootingInput(player)
    return PlaceholderGlobal.Util:GetInputAimVect(player):Length() > 0.001
end

---@param player EntityPlayer
function PlaceholderGlobal.Util:GetAimDir(player)
    if PlaceholderGlobal.Util:IsShootingInput(player) then
        return PlaceholderGlobal.Util:VectorToDirection(PlaceholderGlobal.Util:GetInputAimVect(player))
    else
        return Direction.NO_DIRECTION
    end
end

---@param player EntityPlayer
---@param disableClamp? boolean
function PlaceholderGlobal.Util:GetDynamicAimVect(player, disableClamp)
    local aim = player:GetAimDirection()
    local returnVect = Vector(aim.X, aim.Y)

    if not disableClamp then
        if returnVect:Length() > 0.001 then
            if not player:HasCollectible(CollectibleType.COLLECTIBLE_MARKED)
            and not player:HasCollectible(CollectibleType.COLLECTIBLE_ANALOG_STICK) then
                returnVect = PlaceholderGlobal.Util:CardinalClamp(returnVect)
            end
        end
    end

    return returnVect
end

---@param player EntityPlayer
function PlaceholderGlobal.Util:IsShootingDynamic(player)
    return PlaceholderGlobal.Util:GetDynamicAimVect(player):Length() > 0.001
end

---@param player EntityPlayer
function PlaceholderGlobal.Util:GetDynamicAimDir(player)
    if PlaceholderGlobal.Util:IsShootingDynamic(player) then
        return PlaceholderGlobal.Util:VectorToDirection(PlaceholderGlobal.Util:GetDynamicAimVect(player))
    else
        return Direction.NO_DIRECTION
    end
end

---@param list Entity[]
---@param pos Vector
---@param filter? fun(entity: Entity): boolean?
---@param source? Entity
function PlaceholderGlobal.Util:EntitiesByDistance(list, pos, filter, source)
    local _list = {}

    list = filter and PlaceholderGlobal.Util:Filter(list, filter) or list

    if source then
        local hash = GetPtrHash(source)

        for _, v in pairs(list) do
            if hash ~= GetPtrHash(v) then
                table.insert(_list, v)
            end
        end
    else
        _list = list
    end

    ---@param a Entity
    ---@param b Entity
    table.sort(_list, function (a, b)
        return a.Position:Distance(pos) < b.Position:Distance(pos)
    end)

    return _list
end

---@param pos Vector
---@param source? Entity
---@param maxDistance? number
---@param filter? fun(entity: Entity): boolean | nil
---@return Entity?
function PlaceholderGlobal.Util:GetNearestEntity(pos, source, maxDistance, filter)
    local entity = PlaceholderGlobal.Util:EntitiesByDistance(Isaac.GetRoomEntities(), pos, filter, source)[1]

    if entity and (not maxDistance or entity.Position:Distance(pos) < maxDistance) then
        return entity
    end
end

---@param entity Entity
---@return boolean
function PlaceholderGlobal.Util:IsValidEnemy(entity)
    return (entity:IsEnemy() and entity:IsVulnerableEnemy() and not entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY))
end

---@param idx integer
---@param max integer
---@param spread number
---@return number
function PlaceholderGlobal.Util:SpreadShotAngle(idx, max, spread)
    return (idx - max / 2 - 0.5) * spread / (max - 1)
end

---@param color Color
---@return Color
function PlaceholderGlobal.Util:CopyColor(color)
    local colour = Color(color.R, color.G, color.G, color.A, color.RO, color.GO, color.BO)

    if REPENTOGON then
        ---@diagnostic disable-next-line: undefined-field
        local colorize = color:GetColorize()
        colour:SetColorize(colorize.R, colorize.G, colorize.B, colorize.A)
    end

    return colour
end