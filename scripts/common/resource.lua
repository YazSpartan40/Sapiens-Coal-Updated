local typeMaps = mjrequire "common/typeMaps"
local locale = mjrequire "common/locale"

local mod = {
    loadOrder = 1,
}

function mod:onload(resource)
    
    local gameObjectTypeIndexMap = typeMaps.types.gameObject
    
    mj:log("Charcoal: Registering charcoal resource")
    
    typeMaps:insert("resource", resource.types, {
        key = "charcoal",
        name = locale:get("resource_charcoal"),
        plural = locale:get("resource_charcoal_plural"),
        displayGameObjectTypeIndex = gameObjectTypeIndexMap.charcoal,
        tradeValue = 4,
        tradeBatchSize = 10,
    })
    
    -- Add charcoal to fuel resource groups (FIXED - use .resourceTypes)
    table.insert(resource.groups.campfireFuel.resourceTypes, resource.types.charcoal.index)
    table.insert(resource.groups.kilnFuel.resourceTypes, resource.types.charcoal.index)
    
    -- Update the containsTypesSet hash for both groups
    resource:updateGroupContainedTypesHashForAddition(resource.groups.campfireFuel.index)
    resource:updateGroupContainedTypesHashForAddition(resource.groups.kilnFuel.index)
    
    mj:log("Charcoal: Resource registered and added to fuel groups")
end

return mod
