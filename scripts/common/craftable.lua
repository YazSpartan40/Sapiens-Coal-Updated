local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec3xMat3 = mjm.vec3xMat3
local mat3Rotate = mjm.mat3Rotate
local mat3Identity = mjm.mat3Identity
local mat3Inverse = mjm.mat3Inverse

local locale = mjrequire "common/locale"
local resource = mjrequire "common/resource"
local actionSequence = mjrequire "common/actionSequence"
local skill = mjrequire "common/skill"
local constructable = mjrequire "common/constructable"
local action = mjrequire "common/action"
local craftAreaGroup = mjrequire "common/craftAreaGroup"

local mod = {
    loadOrder = 3,  -- Load after craftable groups are initialized
}

function mod:onload(craftable)
    local prevLoad = craftable.load
    craftable.load = function(craftable_, gameObject, flora)
        local cookingStickRotationOffset = mat3Inverse(mat3Rotate(mat3Identity, math.pi * 0.25, vec3(0.0,1.0,0.0)))
        craftable.cookingStickRotationOffset = cookingStickRotationOffset
        craftable.cookingStickRotation = mat3Identity
        
        prevLoad(craftable_, gameObject, flora)
        
        mj:log("Charcoal: Registering charcoal craftables")
        
        -- PRODUCTION: Charcoal from 3 branches → 2 charcoal (campfire)
        craftable:addCraftable("charcoalFromBranches", {
            name = locale:get("craftable_charcoal"),
            plural = locale:get("craftable_charcoal_plural"),
            summary = locale:get("craftable_charcoal_summary"),
            iconGameObjectType = gameObject.typeIndexMap.charcoal,
            classification = constructable.classifications.craft.index,
            
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.fireStickCook.index, nil),
            inProgressBuildModel = "craftSimple",  -- Use craftSimple
            
            outputObjectInfo = {
                objectTypesArray = {
                    gameObject.typeIndexMap.charcoal,
        
                }
            },

            skills = {
                required = skill.types.campfireCooking.index,
            },
            requiredResources = {
                {
                    type = resource.types.branch.index,
                    count = 3,
                },
            },
            
            requiredCraftAreaGroups = {
                craftAreaGroup.types.campfire.index,
                craftAreaGroup.types.kiln.index,
            },
            attachResourceToHandIndex = 1,
            attachResourceOffset = vec3xMat3(vec3(-0.7,0.1,0.02), craftable.cookingStickRotationOffset),
            attachResourceRotation = mat3Rotate(mat3Identity, math.pi * 0.5, vec3(0.0,0.0,1.0)),
            temporaryToolObjectType = gameObject.typeIndexMap.stick,
            temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), craftable.cookingStickRotationOffset),
            temporaryToolRotation = craftable.cookingStickRotation,
        })
        
        -- PRODUCTION: Charcoal from 1 log → 1 charcoal (campfire)
        craftable:addCraftable("charcoalFromLog", {
            name = locale:get("craftable_charcoal"),
            plural = locale:get("craftable_charcoal_plural"),
            summary = "Burn a log to create charcoal.",
            iconGameObjectType = gameObject.typeIndexMap.charcoal,
            classification = constructable.classifications.craft.index,
            
            buildSequence = craftable:createStandardBuildSequence(actionSequence.types.fireStickCook.index, nil),
            inProgressBuildModel = "craftSimple",  -- Use craftSimple model
            
            outputObjectInfo = {
                objectTypesArray = {
                    gameObject.typeIndexMap.charcoal,
                    gameObject.typeIndexMap.charcoal,
                }
            },

            skills = {
                required = skill.types.campfireCooking.index,
            },
            requiredResources = {
                {
                    type = resource.types.log.index,
                    count = 1,
                },
            },
            
            requiredCraftAreaGroups = {
                craftAreaGroup.types.campfire.index,
                craftAreaGroup.types.kiln.index,
            },
            attachResourceToHandIndex = 1,
            attachResourceOffset = vec3xMat3(vec3(-0.7,0.1,0.02), craftable.cookingStickRotationOffset),
            attachResourceRotation = mat3Rotate(mat3Identity, math.pi * 0.5, vec3(0.0,0.0,1.0)),
            temporaryToolObjectType = gameObject.typeIndexMap.stick,
            temporaryToolOffset = vec3xMat3(vec3(-0.35,0.0,0.0), craftable.cookingStickRotationOffset),
            temporaryToolRotation = craftable.cookingStickRotation,
        })
        
        mj:log("Charcoal: 2 production craftable recipes registered (unlocked by research)")
    end
end

return mod
