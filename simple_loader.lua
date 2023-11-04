-- the most simple sample loader for CREATOR TOOLS

local path = "D:/work/Samples"

for _, file in filesystem.directoryRecursive(path) do
  if filesystem.isRegularFile(file) then
    if filesystem.extension(file) == ".wav" then
      print(file)
      local z = Zone()
      z.file = file
      instrument.groups[0].zones:add(z)
    end
  end
end
