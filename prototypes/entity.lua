data:extend({
  {
    type = "land-mine",
    name = "extreme-land-mine",
    icon = "__ExtremeExplosives__/graphics/land-mine/icon_land-mine.png",
    flags =
    {
      "placeable-player",
      "placeable-enemy",
      "player-creation",
      "placeable-off-grid"
    },
    minable = {mining_time = 1.5, result = "land-mine"},
    max_health = 15,
    corpse = "small-remnants",
    collision_box = {{-0.4,-0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    dying_explosion = "explosion-hit",
    picture_safe =
    {
      filename = "__ExtremeExplosives__/graphics/land-mine/land-mine.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    picture_set =
    {
      filename = "__ExtremeExplosives__/graphics/land-mine/land-mine-set.png",
      priority = "medium",
      width = 32,
      height = 32
    },
    trigger_radius = 3.5,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          {
            type = "nested-result",
            affects_target = true,
            action =
            {
              type = "area",
              perimeter = 30,
              collision_mask = { "player-layer" },
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  type = "damage",
                  damage = { amount = 250, type = "explosion"}
                }
              }
            },
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = { amount = 5000, type = "explosion"}
          }
        }
      }
    },
  },
})