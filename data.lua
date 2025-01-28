local sprite_frames = 30
local sound_frames = 145
local sprite_fps = 30 -- If this is 60 then it doesn't work... WTF?
local overall_frames = sprite_fps * sound_frames

local overall_frame = 0

for sound_frame = 1, sound_frames do
  for sprite_frame = 1, sprite_fps do
    overall_frame = overall_frame + 1
    local item = {
      type = "item",
      name = "miku-" .. overall_frame,
      localised_name = { "item-name.miku" },
      icon = "__dancing-miku__/graphics/items/miku/" .. ((sprite_frame % sprite_frames) + 1) .. ".png",
      icon_size = 252,
      hidden = true,
      stack_size = 1,
      flags = { "not-stackable" },
      spoil_ticks = 1,
      spoil_result = "miku-" .. ((overall_frame % overall_frames) + 1),
    }
    if sprite_frame == 1 then
      item.spoil_to_trigger_result = {
        trigger = {
          type = "direct",
          action_delivery = {
            type = "instant",
            source_effects = {
              type = "play-sound",
              sound = { filename = "__dancing-miku__/sounds/ievan-polkka/" .. sound_frame .. ".ogg", volume = 0.5 },
            },
          },
        },
        items_per_trigger = 1,
      }
    end
    data:extend({ item })
  end
end
