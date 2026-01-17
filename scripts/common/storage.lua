local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

local rng = mjrequire "common/randomNumberGenerator"
local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"

local mod = {
    loadOrder = 1,
}

function mod:onload(storage)
    
    local gameObjectTypeIndexMap = typeMaps.types.gameObject
    
    mj:log("Charcoal: Registering charcoal storage")
    
    typeMaps:insert("storage", storage.types, {
        key = "charcoal",
        name = locale:get("storage_charcoal"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.charcoal,
        resources = {
            resource.types.charcoal.index,
        },
        storageBox = {
            size = vec3(0.3, 0.2, 0.3),
            rotationFunction = function(uniqueID, seed)
                local randomValue = rng:valueForUniqueID(uniqueID, seed)
                local rotation = mat3Rotate(mat3Identity, randomValue * 6.282, vec3(0.0,1.0,0.0))
                return rotation
            end,
        },
        maxCarryCount = 4,
        maxCarryCountLimitedAbility = 2,
        maxCarryCountForRunning = 1,
        carryOffset = vec3(0.0, 0.1, 0.0),
    })
    
    mj:log("Charcoal: Storage registered")
end

return mod
