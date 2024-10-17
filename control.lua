local function setup_miku()
  if
    not remote.interfaces.freeplay
    or not remote.interfaces.freeplay.get_created_items
    or not remote.interfaces.freeplay.set_created_items
  then
    return
  end

  local items = remote.call("freeplay", "get_created_items")
  items["miku-1"] = 1
  remote.call("freeplay", "set_created_items", items)
end

script.on_init(setup_miku)
script.on_configuration_changed(setup_miku)
