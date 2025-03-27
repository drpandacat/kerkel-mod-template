PlaceholderGlobal.Enum = {}

PlaceholderGlobal.Enum.Obj = {
    Game = Game(),
    SFX = SFXManager(),
}

---@enum FireplaceVariant
PlaceholderGlobal.Enum.Fireplace = {
    NORMAL = 0,
    RED = 1,
    BLUE = 2,
    PURPLE = 3,
    WHITE = 4,
    MOVEABLE = 10,
    COAL = 11,
    MOVEABLE_BLUE = 12,
    MOVEABLE_PURPLE = 13,
}

PlaceholderGlobal.Enum.HealthType = {
    RED = 0,
    SOUL = 1,
    LOST = 2,
    COIN = 3,
    BONE = 4,
}

PlaceholderGlobal.Enum.Dict = {
    ---@type Direction[]
    ANGLE_TO_DIRECTION = {
        Direction.RIGHT,
        Direction.DOWN,
        Direction.LEFT,
        Direction.UP,
    },
    ---@type table<Direction, Vector>
    DIRECTION_TO_VECTOR = {
        [Direction.DOWN] = Vector(0, 1),
        [Direction.LEFT] = Vector(-1, 0),
        [Direction.UP] = Vector(0, -1),
        [Direction.RIGHT] = Vector(1, 0),
        [Direction.NO_DIRECTION] = Vector(0, 0),
    },
    ---@type table<Direction, integer>
    DIRECTION_TO_ANGLE = {
        [Direction.LEFT] = 180,
        [Direction.UP] = -90,
        [Direction.RIGHT] = 0,
        [Direction.DOWN] = 90,
        [Direction.NO_DIRECTION] = 0,
    },
    ---@type table<PlayerType, integer>
    PLAYER_TO_HEALTH_TYPE = {
        [PlayerType.PLAYER_BLACKJUDAS] = PlaceholderGlobal.Enum.HealthType.SOUL,
        [PlayerType.PLAYER_BLUEBABY] = PlaceholderGlobal.Enum.HealthType.SOUL,
        [PlayerType.PLAYER_THELOST] = PlaceholderGlobal.Enum.HealthType.LOST,
        [PlayerType.PLAYER_KEEPER] = PlaceholderGlobal.Enum.HealthType.COIN,
        [PlayerType.PLAYER_THEFORGOTTEN] = PlaceholderGlobal.Enum.HealthType.BONE,
        [PlayerType.PLAYER_THESOUL] = PlaceholderGlobal.Enum.HealthType.SOUL,
        [PlayerType.PLAYER_JUDAS_B] = PlaceholderGlobal.Enum.HealthType.SOUL,
        [PlayerType.PLAYER_BLUEBABY_B] = PlaceholderGlobal.Enum.HealthType.SOUL,
        [PlayerType.PLAYER_THELOST_B] = PlaceholderGlobal.Enum.HealthType.LOST,
        [PlayerType.PLAYER_KEEPER_B] = PlaceholderGlobal.Enum.HealthType.COIN,
        [PlayerType.PLAYER_THESOUL_B] = PlaceholderGlobal.Enum.HealthType.SOUL,
    },
    ---@type table<FamiliarVariant, true>
    TEAR_COPYING_FAMILIAR = {
        [FamiliarVariant.INCUBUS] = true,
        [FamiliarVariant.TWISTED_BABY] = true,
        [FamiliarVariant.UMBILICAL_BABY] = true,
        [FamiliarVariant.BLOOD_BABY] = true,
        [FamiliarVariant.SPRINKLER] = true,
        [FamiliarVariant.CAINS_OTHER_EYE] = true,
    },
    ---@type table<FireplaceVariant, true>
    DESTROYABLE_FIREPLACE = {
        [PlaceholderGlobal.Enum.Fireplace.NORMAL] = true,
        [PlaceholderGlobal.Enum.Fireplace.RED] = true,
    },
    ---@type table<CollectibleType, true>
    AIM_UNCLAMP_COLLECTIBLE = {
        [CollectibleType.COLLECTIBLE_MARKED] = true,
        [CollectibleType.COLLECTIBLE_ANALOG_STICK] = true,
        [CollectibleType.COLLECTIBLE_EYE_OF_THE_OCCULT] = true,
        [CollectibleType.COLLECTIBLE_EPIC_FETUS] = true,
    }
}

---@enum CardFilterFlag
PlaceholderGlobal.Enum.CardFilterFlag = {
    INCLUDE_PLAYING_CARDS = 1 << 0,
    INCLUDE_RUNES = 1 << 1,
    RUNES_ONLY = 1 << 2,
}

---@enum PlayerSearchType
PlaceholderGlobal.Enum.PlayerSearchType = {
    PLAYER_ONLY = 1,
    FAMILIAR_TEARCOPYING = 2,
    ALL = 3,
}

---@enum DataPersistenceMode
PlaceholderGlobal.Enum.DataPersistenceMode = {
    TEMP = 1,
    RUN = 2,
    ROOM = 3,
    FLOOR_REROLL = 4,
    FLOOR_NO_REROLL = 5,
    ALL_REROLL = 6,
    NONE_REROLL = 7,
}