local function initIfNil(modTable)
    if not modTable then
        modTable = {}
    end
    if not modTable.owners then
        modTable.owners = {}
    else
        print("Brightness Particles loading, previously modified by: ")
        for owner in modTable.owners do
            print(owner)
        end
    end
    table.insert(modTable.owners, "brightness_particles")
    return modTable
end

mods.brightness = initIfNil(mods.brightness)
mods.brightness.particleList = initIfNil(mods.brightness.particleList)
mods.brightness.primitiveList = initIfNil(mods.brightness.primitiveList)