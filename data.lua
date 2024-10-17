local sprite_frames = 30

for sprite_frame = 1, sprite_frames do
  local item = {
    type = "item",
    name = "miku-" .. sprite_frame,
    localised_name = { "item-name.miku" },
    icon = "__dancing-miku__/graphics/items/miku/" .. ((sprite_frame % sprite_frames) + 1) .. ".png",
    icon_size = 252,
    stack_size = 1,
    flags = { "not-stackable" },
    spoil_ticks = 1,
    spoil_result = "miku-" .. ((sprite_frame % sprite_frames) + 1),
  }
  data:extend({ item })
end
