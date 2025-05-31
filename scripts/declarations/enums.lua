PlaceholderGlobal.Enum = {}

PlaceholderGlobal.Enum.Obj = {}

PlaceholderGlobal.Enum.Obj.Game = Game()
PlaceholderGlobal.Enum.Obj.SFX = SFXManager()
PlaceholderGlobal.Enum.Obj.Config = Isaac.GetItemConfig()
PlaceholderGlobal.Enum.Obj.Level = PlaceholderGlobal.Enum.Obj.Game:GetLevel()

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
        [CollectibleType.COLLECTIBLE_MOMS_KNIFE] = true,
        [CollectibleType.COLLECTIBLE_EPIC_FETUS] = true,
        [CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE] = true,
        [CollectibleType.COLLECTIBLE_MARKED] = true,
        [CollectibleType.COLLECTIBLE_ANALOG_STICK] = true,
        [CollectibleType.COLLECTIBLE_EYE_OF_THE_OCCULT] = true
    },
    ---@type table<EffectVariant, true>
    CREEP = {
        [EffectVariant.CREEP_RED] = true,
        [EffectVariant.CREEP_GREEN] = true,
        [EffectVariant.CREEP_YELLOW] = true,
        [EffectVariant.CREEP_WHITE] = true,
        [EffectVariant.CREEP_BLACK] = true,
        [EffectVariant.PLAYER_CREEP_LEMON_MISHAP] = true,
        [EffectVariant.PLAYER_CREEP_HOLYWATER] = true,
        [EffectVariant.PLAYER_CREEP_WHITE] = true,
        [EffectVariant.PLAYER_CREEP_BLACK] = true,
        [EffectVariant.PLAYER_CREEP_RED] = true,
        [EffectVariant.PLAYER_CREEP_GREEN] = true,
        [EffectVariant.PLAYER_CREEP_HOLYWATER_TRAIL] = true,
        [EffectVariant.CREEP_BROWN] = true,
        [EffectVariant.PLAYER_CREEP_LEMON_PARTY] = true,
        [EffectVariant.PLAYER_CREEP_PUDDLE_MILK] = true,
        [EffectVariant.CREEP_SLIPPERY_BROWN] = true,
        [EffectVariant.CREEP_SLIPPERY_BROWN_GROWING] = true,
        [EffectVariant.COLOSTOMIA_PUDDLE] = true,
        [EffectVariant.CREEP_STATIC] = true,
        [EffectVariant.CREEP_LIQUID_POOP] = true,
    },
    ---@type table<EffectVariant, true>
    CREEP_SAFE = {
        [EffectVariant.PLAYER_CREEP_LEMON_MISHAP] = true,
        [EffectVariant.PLAYER_CREEP_HOLYWATER] = true,
        [EffectVariant.PLAYER_CREEP_WHITE] = true,
        [EffectVariant.PLAYER_CREEP_BLACK] = true,
        [EffectVariant.PLAYER_CREEP_RED] = true,
        [EffectVariant.PLAYER_CREEP_GREEN] = true,
        [EffectVariant.PLAYER_CREEP_HOLYWATER_TRAIL] = true,
        [EffectVariant.PLAYER_CREEP_LEMON_PARTY] = true,
        [EffectVariant.PLAYER_CREEP_PUDDLE_MILK] = true,
    },
    ---@type table<EffectVariant, true>
    CREEP_UNSAFE = {
        [EffectVariant.CREEP_RED] = true,
        [EffectVariant.CREEP_GREEN] = true,
        [EffectVariant.CREEP_YELLOW] = true,
        [EffectVariant.CREEP_WHITE] = true,
        [EffectVariant.CREEP_BLACK] = true,
        [EffectVariant.CREEP_SLIPPERY_BROWN] = true,
        [EffectVariant.CREEP_SLIPPERY_BROWN_GROWING] = true,
        [EffectVariant.CREEP_LIQUID_POOP] = true,
        [EffectVariant.COLOSTOMIA_PUDDLE] = true,
        [EffectVariant.CREEP_STATIC] = true,
    },
    ---@type table<EffectVariant, true>
    CREEP_ELLIPSE = {
        [EffectVariant.PLAYER_CREEP_HOLYWATER] = true,
        [EffectVariant.PLAYER_CREEP_LEMON_MISHAP] = true,
        [EffectVariant.PLAYER_CREEP_LEMON_PARTY] = true,
        [EffectVariant.PLAYER_CREEP_PUDDLE_MILK] = true,
        [EffectVariant.COLOSTOMIA_PUDDLE] = true,
    },
    ---@type table<CollectibleType, ItemConfigItem>
    COLLECTIBLE_CONFIG = {},
    ---@type table<TrinketType, ItemConfigItem>
    TRINKET_CONFIG = {},
    ---@type table<Card, ItemConfigCard>
    CARD_CONFIG = {},
    ---@type table<NullItemID, ItemConfigItem>
    NULL_CONFIG = {},
    ---@type table<PillEffect, ItemConfigPillEffect>
    PILL_CONFIG = {},
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

---@enum DataPersistenceFlag
PlaceholderGlobal.Enum.DataPersistenceFlag = {
    RUN = 1 << 0,
    FLOOR = 1 << 1,
    ROOM = 1 << 2,
    TEMP = 1 << 3,
    PICKUP_PERSIST_REROLL = 1 << 4,
    PICKUP_CLEAR_REROLL = 1 << 5,
}