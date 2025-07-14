PlaceholderGlobal.Obj = {}

PlaceholderGlobal.Obj.Game = Game()
PlaceholderGlobal.Obj.SFX = SFXManager()
PlaceholderGlobal.Obj.Config = Isaac.GetItemConfig()
PlaceholderGlobal.Obj.Level = PlaceholderGlobal.Obj.Game:GetLevel()

---@enum FireplaceVariant
PlaceholderGlobal.Fireplace = {
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

PlaceholderGlobal.HealthType = {
    RED = 0,
    SOUL = 1,
    LOST = 2,
    COIN = 3,
    BONE = 4,
}

PlaceholderGlobal.Dict = {
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
        [PlayerType.PLAYER_BLACKJUDAS] = PlaceholderGlobal.HealthType.SOUL,
        [PlayerType.PLAYER_BLUEBABY] = PlaceholderGlobal.HealthType.SOUL,
        [PlayerType.PLAYER_THELOST] = PlaceholderGlobal.HealthType.LOST,
        [PlayerType.PLAYER_KEEPER] = PlaceholderGlobal.HealthType.COIN,
        [PlayerType.PLAYER_THEFORGOTTEN] = PlaceholderGlobal.HealthType.BONE,
        [PlayerType.PLAYER_THESOUL] = PlaceholderGlobal.HealthType.SOUL,
        [PlayerType.PLAYER_JUDAS_B] = PlaceholderGlobal.HealthType.SOUL,
        [PlayerType.PLAYER_BLUEBABY_B] = PlaceholderGlobal.HealthType.SOUL,
        [PlayerType.PLAYER_THELOST_B] = PlaceholderGlobal.HealthType.LOST,
        [PlayerType.PLAYER_KEEPER_B] = PlaceholderGlobal.HealthType.COIN,
        [PlayerType.PLAYER_THESOUL_B] = PlaceholderGlobal.HealthType.SOUL,
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
        [PlaceholderGlobal.Fireplace.NORMAL] = true,
        [PlaceholderGlobal.Fireplace.RED] = true,
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
    ---@type table<string, Direction>
    WALK_ANIM_TO_DIRECTION = {
        WalkDown = Direction.DOWN,
        WalkUp = Direction.UP,
        WalkRight = Direction.RIGHT,
        WalkLeft = Direction.LEFT,
    },
    ---@type table<Direction, string>
    DIRECTION_TO_WALK_ANIM = {
        [Direction.DOWN] = "WalkDown",
        [Direction.UP] = "WalkUp",
        [Direction.RIGHT] = "WalkRight",
        [Direction.LEFT] = "WalkLeft",
    },
    ---@type table<Direction, Direction>
    CLOCKWISE = {
        [Direction.LEFT] = Direction.UP,
        [Direction.UP] = Direction.RIGHT,
        [Direction.RIGHT] = Direction.DOWN,
        [Direction.DOWN] = Direction.LEFT,
    },
    ---@type table<Direction, Direction>
    COUNTERCLOCKWISE = {
        [Direction.LEFT] = Direction.DOWN,
        [Direction.UP] = Direction.LEFT,
        [Direction.RIGHT] = Direction.UP,
        [Direction.DOWN] = Direction.RIGHT,
    },
    ---@type ModCallbacks[]
    POST_INIT_CALLBACK = {
        ModCallbacks.MC_POST_PLAYER_INIT,
        ModCallbacks.MC_POST_TEAR_INIT,
        ModCallbacks.MC_FAMILIAR_INIT,
        ModCallbacks.MC_POST_BOMB_INIT,
        ModCallbacks.MC_POST_PICKUP_INIT,
        ModCallbacks.MC_POST_LASER_INIT,
        ModCallbacks.MC_POST_KNIFE_INIT,
        ModCallbacks.MC_POST_PROJECTILE_INIT,
        ModCallbacks.MC_POST_NPC_INIT,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_SLOT_INIT,
    },
    ---@type ModCallbacks[]
    POST_UPDATE_CALLBACK = {
        ModCallbacks.MC_POST_PEFFECT_UPDATE,
        ModCallbacks.MC_POST_TEAR_UPDATE,
        ModCallbacks.MC_FAMILIAR_UPDATE,
        ModCallbacks.MC_POST_BOMB_UPDATE,
        ModCallbacks.MC_POST_PICKUP_UPDATE,
        ModCallbacks.MC_POST_LASER_UPDATE,
        ModCallbacks.MC_POST_KNIFE_UPDATE,
        ModCallbacks.MC_POST_PROJECTILE_UPDATE,
        ModCallbacks.MC_NPC_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_SLOT_UPDATE,
    },
    ---@type ModCallbacks[]
    PRE_UPDATE_CALLBACK = {
        ModCallbacks.MC_PRE_NPC_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PLAYER_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_TEAR_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_FAMILIAR_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_BOMB_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PICKUP_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_LASER_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_KNIFE_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PROJECTILE_UPDATE,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_SLOT_UPDATE,
    },
    ---@type ModCallbacks[]
    PRE_COLLISION_CALLBACK = {
        ModCallbacks.MC_PRE_PLAYER_COLLISION,
        ModCallbacks.MC_PRE_TEAR_COLLISION,
        ModCallbacks.MC_PRE_FAMILIAR_COLLISION,
        ModCallbacks.MC_PRE_BOMB_COLLISION,
        ModCallbacks.MC_PRE_PICKUP_COLLISION,
        ModCallbacks.MC_PRE_KNIFE_COLLISION,
        ModCallbacks.MC_PRE_PROJECTILE_COLLISION,
        ModCallbacks.MC_PRE_NPC_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_LASER_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_SLOT_COLLISION,
    },
    ---@type ModCallbacks[]
    POST_COLLISION_CALLBACK = {
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_PLAYER_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_TEAR_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_FAMILIAR_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_BOMB_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_PICKUP_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_LASER_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_KNIFE_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_PROJECTILE_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_NPC_COLLISION,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_SLOT_COLLISION,
    },
    ---@type ModCallbacks[]
    POST_RENDER_CALLBACK = {
        ModCallbacks.MC_POST_PLAYER_RENDER,
        ModCallbacks.MC_POST_TEAR_RENDER,
        ModCallbacks.MC_POST_FAMILIAR_RENDER,
        ModCallbacks.MC_POST_BOMB_RENDER,
        ModCallbacks.MC_POST_PICKUP_RENDER,
        ModCallbacks.MC_POST_LASER_RENDER,
        ModCallbacks.MC_POST_KNIFE_RENDER,
        ModCallbacks.MC_POST_PROJECTILE_RENDER,
        ModCallbacks.MC_POST_NPC_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_POST_SLOT_RENDER,
    },
    ---@type ModCallbacks[]
    PRE_RENDER_CALLBACK = {
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PLAYER_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_TEAR_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_FAMILIAR_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_BOMB_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PICKUP_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        -- ModCallbacks.MC_PRE_LASER_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_KNIFE_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_PROJECTILE_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_NPC_RENDER,
        ---@diagnostic disable-next-line: undefined-field
        ModCallbacks.MC_PRE_SLOT_RENDER,
    },
}

---@enum CardFilterFlag
PlaceholderGlobal.CardFilterFlag = {
    INCLUDE_PLAYING_CARDS = 1 << 0,
    INCLUDE_RUNES = 1 << 1,
    RUNES_ONLY = 1 << 2,
}

---@enum PlayerSearchType
PlaceholderGlobal.PlayerSearchType = {
    PLAYER_ONLY = 1,
    FAMILIAR_TEARCOPYING = 2,
    ALL = 3,
}

---@enum DataPersistenceFlag
PlaceholderGlobal.DataPersistenceFlag = {
    RUN = 1 << 0,
    FLOOR = 1 << 1,
    ROOM = 1 << 2,
    TEMP = 1 << 3,
    PICKUP_PERSIST_REROLL = 1 << 4,
    PICKUP_CLEAR_REROLL = 1 << 5,
    SHARED = 1 << 6,
}