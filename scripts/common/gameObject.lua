local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local resource = mjrequire "common/resource"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(gameObject)
    
    mj:log("Charcoal: Registering charcoal game object")
    
    gameObject:addGameObjectsFromTable({
        charcoal = {
            name = locale:get("object_charcoal"),
            plural = locale:get("object_charcoal_plural"),
            modelName = "charcoal",  -- References charcoal.glb in models folder
            materialName = "charcoal",  -- Force use of charcoal material (black)
            scale = 1.0,
            hasPhysics = true,
            resourceTypeIndex = resource.types.charcoal.index,
            markerPositions = {
                { worldOffset = vec3(0.0, mj:mToP(0.1), 0.0) }
            },
            mass = 0.5,
            category = "resources",
        },
    })

    mj:log("Charcoal: Game object registered")
    
    return gameObject
end

return mod
