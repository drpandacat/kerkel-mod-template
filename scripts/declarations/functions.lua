PlaceholderGlobal.Util = {}

---@param type EntityType | integer
---@param variant integer | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnNPC(type, variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(type, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToNPC()
end

---@param variant EffectVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnEffect(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_EFFECT, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToEffect()
end

---@param variant TearVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnTear(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_TEAR, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToTear()
end

---@param variant ProjectileVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnProjectile(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_PROJECTILE, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToProjectile()
end

---@param variant PickupVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnPickup(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_PICKUP, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToPickup()
end

---@param variant FamiliarVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnFamiliar(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_FAMILIAR, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToFamiliar()
end

---@param variant BombVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnBomb(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_BOMB, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToBomb()
end

---@param variant integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnKnife(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_KNIFE, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToKnife()
end

---@param variant LaserVariant | integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnLaser(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_LASER, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1)):ToLaser()
end

---@param variant integer
---@param position Vector
---@param velocity? Vector
---@param subtype? integer
---@param spawner? Entity
---@param seed? integer
function PlaceholderGlobal.Util:SpawnSlot(variant, position, velocity, spawner, subtype, seed)
    return PlaceholderGlobal.Enum.Obj.Game:Spawn(EntityType.ENTITY_SLOT, variant, position, velocity or Vector.Zero, spawner or nil, subtype or 0, seed or math.max(Random(), 1))
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
---@return Direction
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
---@param tbl T[]
---@param filter? fun(value: T, key: any): boolean?
---@return T[]
function PlaceholderGlobal.Util:Filter(tbl, filter)
    local _tbl = {}

    for k, v in pairs(tbl) do
        if not filter or filter(v, k) then
            _tbl[#_tbl + 1] = v
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

---@param seed integer
function PlaceholderGlobal.Util:GetPoolForRoom(seed)
    return math.max(ItemPoolType.POOL_TREASURE, PlaceholderGlobal.Enum.Obj.Game:GetItemPool():GetPoolForRoom(PlaceholderGlobal.Enum.Obj.Game:GetRoom():GetType(), seed))
end

---@param filter fun(config: ItemConfigItem): boolean | nil
---@param poolType? ItemPoolType
---@param maxTries? integer
---@param seed? integer
---@return CollectibleType, boolean
function PlaceholderGlobal.Util:GetFilteredCollectible(filter, poolType, maxTries, seed)
    local rng = PlaceholderGlobal.Util:NewRNG(seed or PlaceholderGlobal.Enum.Obj.Game:GetSeeds():GetStartSeed())
    local pool = PlaceholderGlobal.Enum.Obj.Game:GetItemPool()
    local collectible = CollectibleType.COLLECTIBLE_BREAKFAST
    local successful

    poolType = poolType or PlaceholderGlobal.Util:GetPoolForRoom(rng:Next())

    for _ = 1, maxTries or 200 do
        collectible = pool:GetCollectible(poolType, false, rng:Next())

        if filter(PlaceholderGlobal.Util:GetCollectibleConfig(collectible)) then
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
    local pool = PlaceholderGlobal.Enum.Obj.Game:GetItemPool()
    local successful

    for _ = 1, maxTries or 100 do
        trinket = pool:GetTrinket()

        if filter(PlaceholderGlobal.Util:GetTrinketConfig(trinket)) then
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
    local pool = PlaceholderGlobal.Enum.Obj.Game:GetItemPool()
    local successful

    seed = seed or PlaceholderGlobal.Enum.Obj.Game:GetSeeds():GetStartSeed()
    flags = flags or 0

    for _ = 1, maxTries or 100 do
        card = pool:GetCard(
            seed,
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.INCLUDE_PLAYING_CARDS),
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.INCLUDE_RUNES),
            PlaceholderGlobal.Util:HasFlags(flags, PlaceholderGlobal.Enum.CardFilterFlags.RUNES_ONLY)
        )

        if filter(PlaceholderGlobal.Util:GetCardConfig(card)) then
            successful = true
            break
        end
    end

    return card, successful
end

---@param entity Entity
---@param searchType PlayerSearchType
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
        spawners[#spawners + 1] = entity.SpawnerEntity
    end

    if entity.Parent then
        spawners[#spawners + 1] = entity.Parent
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

---@param identifier string
---@param entity? Entity
---@param persistenceFlags? DataPersistenceFlag | integer
---@param default? table
---@return table
function PlaceholderGlobal.Util:GetData(identifier, entity, persistenceFlags, default)
    local data

    if not persistenceFlags then
        if entity then
            local hash = GetPtrHash(entity)
            PlaceholderGlobal.Data.ENTITY[hash] = PlaceholderGlobal.Data.ENTITY[hash] or {}
            data = PlaceholderGlobal.Data.ENTITY[hash]
        else
            data = PlaceholderGlobal.Data.GLOBAL
        end
    else
        if PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.RUN) then
            data = PlaceholderGlobal.SaveManager.GetRunSave(entity)
        elseif PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.FLOOR) then
            data = PlaceholderGlobal.SaveManager.GetFloorSave(entity)
        elseif PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.ROOM) then
            data = PlaceholderGlobal.SaveManager.GetRoomSave(entity)
        elseif PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.TEMP) then
            data = PlaceholderGlobal.SaveManager.GetTempSave(entity)
        end

        if PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.PICKUP_PERSIST_REROLL) then
            data = data.RerollSave
        elseif PlaceholderGlobal.Util:HasFlags(persistenceFlags, PlaceholderGlobal.Enum.DataPersistenceFlag.PICKUP_CLEAR_REROLL) then
            data = data.NoRerollSave
        end
    end

    data[identifier] = data[identifier] or (default and PlaceholderGlobal.Util:DeepCopy(default, true)) or {}

    return data[identifier]
end

---@param player EntityPlayer
function PlaceholderGlobal.Util:IsAimUnclamped(player)
    for k in pairs(PlaceholderGlobal.Enum.Dict.AIM_UNCLAMP_COLLECTIBLE) do
        if player:HasCollectible(k) then
            return true
        end
    end
    return false
end

---@param player EntityPlayer
---@param disableClamp? boolean
function PlaceholderGlobal.Util:GetInputAimVect(player, disableClamp)
    ---@type Vector
    local returnVect

    if player.ControllerIndex == 0 and Options.MouseControl then
        if Input.IsMouseBtnPressed(0) then
            returnVect = (Input.GetMousePosition(true) - player.Position):Normalized()
        end
    end

    returnVect = returnVect or player:GetShootingInput()

    if not disableClamp then
        if returnVect:Length() > 0.001 then
            if not PlaceholderGlobal.Util:IsAimUnclamped(player) then
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
            if not PlaceholderGlobal.Util:IsAimUnclamped(player) then
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

---@generic T[]
---@param list T[]
---@param pos Vector
---@param filter? fun(entity: T): boolean?
---@param source? Entity
---@return T[]
function PlaceholderGlobal.Util:EntitiesByDistance(list, pos, filter, source)
    local _list = {}

    list = filter and PlaceholderGlobal.Util:Filter(list, filter) or list

    if source then
        local hash = GetPtrHash(source)

        for _, v in pairs(list) do
            if hash ~= GetPtrHash(v) then
                _list[#_list + 1] = v
            end
        end
    else
        _list = list
    end

    ---@param a Entity
    ---@param b Entity
    table.sort(_list, function (a, b)
        return a.Position:DistanceSquared(pos) < b.Position:DistanceSquared(pos)
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
function PlaceholderGlobal.Util:IsValidEnemy(entity)
    return (entity:IsEnemy() and entity:IsVulnerableEnemy() and not entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY))
end

---@param pos Vector
---@param source? Entity
---@param maxDistance? number
function PlaceholderGlobal.Util:GetNearestEnemy(pos, source, maxDistance)
    return PlaceholderGlobal.Util:GetNearestEntity(pos, source, maxDistance, function (entity)
        return PlaceholderGlobal.Util:IsValidEnemy(entity)
    end)
end

---@param idx integer
---@param max integer
---@param spread number
function PlaceholderGlobal.Util:SpreadShotAngle(idx, max, spread)
    return (idx - max / 2 - 0.5) * spread / (max - 1)
end

---@param color Color
function PlaceholderGlobal.Util:CopyColor(color)
    local _color = Color(color.R, color.G, color.G, color.A, color.RO, color.GO, color.BO)

    if REPENTOGON then
        ---@diagnostic disable-next-line: undefined-field
        local colorize = color:GetColorize()
        _color:SetColorize(colorize.R, colorize.G, colorize.B, colorize.A)
    end

    return _color
end

---@param kColor KColor
function PlaceholderGlobal.Util:CopyKColor(kColor)
    return KColor(kColor.Red, kColor.Green, kColor.Blue, kColor.Alpha)
end

function PlaceholderGlobal.Util:IsRoomClear()
    local room = PlaceholderGlobal.Enum.Obj.Game:GetRoom()
    return room:IsClear() and not room:IsAmbushActive()
end

---@param value integer
---@param trinket TrinketType
function PlaceholderGlobal.Util:EqualsTrinket(value, trinket)
    return trinket == value or trinket + TrinketType.TRINKET_GOLDEN_FLAG == value
end

---@param familiar EntityFamiliar
function PlaceholderGlobal.Util:ShouldAutoAim(familiar)
    return PlaceholderGlobal.Util:IsShootingDynamic(familiar.Player)
    and (familiar.Player:HasCollectible(CollectibleType.COLLECTIBLE_KING_BABY)
        or familiar.Player:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_KING_BABY)
        or (
            familiar.Player:GetPlayerType() == PlayerType.PLAYER_LILITH_B
            and familiar.Player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
        )
    )
end

---@param familiar EntityFamiliar
function PlaceholderGlobal.Util:GetFamiliarAimVect(familiar)
    if PlaceholderGlobal.Util:ShouldAutoAim(familiar) then
        local entity = PlaceholderGlobal.Util:GetNearestEnemy(familiar.Position, nil, 800) -- ty benny
        if entity then
            return (entity.Position - familiar.Position):Normalized()
        end
    end

    if familiar.Player:HasCollectible(CollectibleType.COLLECTIBLE_MARKED) then
        local hash
        ---@diagnostic disable-next-line: undefined-field
        local target = REPENTOGON and familiar.Player:GetMarkedTarget()
        or PlaceholderGlobal.Util:Filter(Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.TARGET), function (entity)
            if not entity.SpawnerEntity then return end
            hash = hash or GetPtrHash(familiar.Player)
            return GetPtrHash(entity.SpawnerEntity) == hash
        end)[1]
        or PlaceholderGlobal.Util:Filter(Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.OCCULT_TARGET), function (entity)
            if not entity.SpawnerEntity then return end
            hash = hash or GetPtrHash(familiar.Player)
            return GetPtrHash(entity.SpawnerEntity) == hash
        end)[1]
        if target then
            return (target.Position - familiar.Position):Normalized()
        end
    end

    return PlaceholderGlobal.Util:DirectionToVector(familiar.Player:GetFireDirection())
end

---@param id SoundEffect
function PlaceholderGlobal.Util:TryPlayAnnouncerSound(id)
    if Options.AnnouncerVoiceMode == 1
    or Options.AnnouncerVoiceMode == 0 and math.random() < 0.5 then
        return false
    end
    PlaceholderGlobal.Enum.Obj.SFX:Play(id)
    return true
end

--#region ty foks!

---@class FartConfig
---@field Position Vector
---@field Player EntityPlayer
---@field Color? Color
---@field SizeMult? number
---@field Fn? fun(entity: Entity, player: EntityPlayer)
---@field Knockback? boolean

---@param config FartConfig
function PlaceholderGlobal.Util:Fart(config)
    local gigante = config.Player:HasTrinket(TrinketType.TRINKET_GIGANTE_BEAN)
    local radius = gigante and 170 or 85 * (config.SizeMult or 1)
    local scale = gigante and 2 or 1 * (config.SizeMult or 1)
    local effect = PlaceholderGlobal.Util:SpawnEffect(EffectVariant.FART, config.Position)

    effect.SpriteScale = effect.SpriteScale * scale
    effect.Color = config.Color or effect.Color

    if scale > 1.8 then
        PlaceholderGlobal.Enum.Obj.SFX:Stop(SoundEffect.SOUND_FART)
        PlaceholderGlobal.Enum.Obj.SFX:Play(SoundEffect.SOUND_FART, 1, 0, false, 1)
        PlaceholderGlobal.Enum.Obj.SFX:Play(SoundEffect.SOUND_FART, 1.2, 20, false, 0.5)
        PlaceholderGlobal.Enum.Obj.Game:ShakeScreen(3)
    end

    if config.Knockback ~= false then
        PlaceholderGlobal.Enum.Obj.Game:ButterBeanFart(effect.Position, radius, config.Player, false, false)
    end

    local ghostPepper = config.Player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_PEPPER)
    local vect = config.Player:GetMovementVector()

    vect = vect:Length() < 0.01 and PlaceholderGlobal.Enum.Dict.DIRECTION_TO_VECTOR[Direction.UP] or -vect

    if config.Player:HasCollectible(CollectibleType.COLLECTIBLE_BIRDS_EYE)
    and (not ghostPepper or PlaceholderGlobal.Util:NewRNG(effect.InitSeed):RandomFloat() < 0.5) then
        config.Player:ShootRedCandle(vect)
    elseif ghostPepper then
        config.Player:ShootBlueCandle(vect)
    end

    if config.Fn then
        for _, entity in pairs(PlaceholderGlobal.Util:Filter(Isaac.FindInRadius(config.Position, radius, EntityPartition.ENEMY), function (value)
            return PlaceholderGlobal.Util:IsValidEnemy(value)
        end)) do
            config.Fn(entity, config.Player)
        end
    end

    return effect, gigante
end
--#endregion

---@param id CollectibleType
function PlaceholderGlobal.Util:GetCollectibleConfig(id)
    PlaceholderGlobal.Enum.Dict.COLLECTIBLE_CONFIG[id] = PlaceholderGlobal.Enum.Dict.COLLECTIBLE_CONFIG[id] or PlaceholderGlobal.Enum.Obj.Config:GetCollectible(id)
    return PlaceholderGlobal.Enum.Dict.COLLECTIBLE_CONFIG[id]
end

---@param id TrinketType
function PlaceholderGlobal.Util:GetTrinketConfig(id)
    PlaceholderGlobal.Enum.Dict.TRINKET_CONFIG[id] = PlaceholderGlobal.Enum.Dict.TRINKET_CONFIG[id] or PlaceholderGlobal.Enum.Obj.Config:GetTrinket(id)
    return PlaceholderGlobal.Enum.Dict.TRINKET_CONFIG[id]
end

---@param id Card
function PlaceholderGlobal.Util:GetCardConfig(id)
    PlaceholderGlobal.Enum.Dict.CARD_CONFIG[id] = PlaceholderGlobal.Enum.Dict.CARD_CONFIG[id] or PlaceholderGlobal.Enum.Obj.Config:GetCard(id)
    return PlaceholderGlobal.Enum.Dict.CARD_CONFIG[id]
end

---@param id NullItemID
function PlaceholderGlobal.Util:GetNullConfig(id)
    PlaceholderGlobal.Enum.Dict.NULL_CONFIG[id] = PlaceholderGlobal.Enum.Dict.NULL_CONFIG[id] or PlaceholderGlobal.Enum.Obj.Config:GetNullItem(id)
    return PlaceholderGlobal.Enum.Dict.NULL_CONFIG[id]
end

---@param id PillEffect
function PlaceholderGlobal.Util:GetPillConfig(id)
    PlaceholderGlobal.Enum.Dict.PILL_CONFIG[id] = PlaceholderGlobal.Enum.Dict.PILL_CONFIG[id] or PlaceholderGlobal.Enum.Obj.Config:GetPillEffect(id)
    return PlaceholderGlobal.Enum.Dict.PILL_CONFIG[id]
end

---@param id NullItemID
function PlaceholderGlobal.Util:AnyoneHasNullEffect(id)
    for _, player in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if player:GetEffects():HasNullEffect(id) then
            return true
        end
    end
    return false
end

---@param playerType PlayerType
---@param nullEffect NullItemID
function PlaceholderGlobal.Util:AnyPlayerTypeHasNullEffect(playerType, nullEffect)
    for _, player in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if player:GetPlayerType() == playerType and player:GetEffects():HasNullEffect(nullEffect) then
            return true
        end
    end
    return false
end

---@param id NullItemID
function PlaceholderGlobal.Util:FirstNullEffectOwner(id)
    for _, player in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        if player:GetEffects():HasNullEffect(id) then
            return player
        end
    end
end

---@param id NullItemID
function PlaceholderGlobal.Util:GetNumNullEffects(id)
    local num = 0
    for _, player in ipairs(PlaceholderGlobal.Util:GetPlayers()) do
        num = num + player:GetEffects():GetNullEffectNum(id)
    end
    return num
end

---@param position Vector
---@param entity? Entity
function PlaceholderGlobal.Util:IsPositionAccessible(position, entity)
    local room = PlaceholderGlobal.Enum.Obj.Game:GetRoom()
    local positions = {}
    for slot = DoorSlot.LEFT0, DoorSlot.NUM_DOOR_SLOTS - 1 do
        local door = room:GetDoor(slot)

        if door then
            positions[#positions + 1] = door.Position + PlaceholderGlobal.Util:DirectionToVector(door.Position):Rotated(180):Resized(40)
        end
    end
    if entity and entity.GridCollisionClass ~= GridCollisionClass.COLLISION_SOLID then
        return true
    else
        for _, v in ipairs(positions) do
            local npc = PlaceholderGlobal.Util:SpawnNPC(EntityType.ENTITY_SHOPKEEPER, 0, v)
            local pathFinder = npc.Pathfinder
            npc:Remove()
            if pathFinder:HasPathToPos(position, true) then
                return true
            end
        end
    end
    return false
end