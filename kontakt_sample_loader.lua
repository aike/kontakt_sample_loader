--
-- KONTAKT sample file loader for CREATOR TOOLS
--   KONTAKT 6 or later
--
--   licensed under MIT License.
--   Copyright 2023, aike (@aike1000)
--
-- mapping example:
--   Mysample_Gguitar_V64_96_K36_48.wav
--     Group: guitar
--     Velocity: 64..96  (default: 1..127)
--     Keyrange: 36..48  (default: 0..127)

local path = "D:/work/Samples/"

function findGroup(name)
  for idx, group in pairs(instrument.groups) do
    if group.name == name then
      return group
    end
  end
  return nil
end

for _, file in filesystem.directoryRecursive(path) do
  if filesystem.isRegularFile(file) then
    if filesystem.extension(file) == ".wav" then
      -- group
      local groupname = text:match("_G%w+")
      if groupname then
        groupname = groupname:sub(3)
      end
      -- velocity
      local vel_min = 1
      local vel_max = 127
      for param1, param2 in text:gmatch("_V(%d+)_(%d+)") do
        vel_min = math.max(1, param1)
        vel_max = math.min(127, param2)
      end
      -- keyrange
      local keyrange_min = 0
      local keyrange_max = 127
      for param1, param2 in text:gmatch("_K(%d+)_(%d+)") do
        keyrange_min = math.max(0, param1)
        keyrange_max = math.min(127, param2)
      end

      print(file)
      print("  Group", groupname)
      print("  Velocity", vel_min, vel_max)
      print("  Keyrange", keyrange_min, keyrange_max)

      -- create zone
      local zone = Zone()
      zone.file = file
      zone.keyRange.low = keyrange_min
      zone.keyRange.high = keyrange_max
      zone.rootKey = zone.keyRange.low

      -- add to group
      local target_group = instrument.groups[0]
      if groupname then
        target_group = findGroup(groupname)
        if not target_group then
          target_group = Group()
          target_group.name = name
          instrument.groups:add(target_group)
        end
      end
      target_group:add(zone);
    end
  end
end
