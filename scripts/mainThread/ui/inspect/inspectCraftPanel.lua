local mod = {
    loadOrder = 2,
}

function mod:onload(inspectCraftPanel)
    
    local constructable = mjrequire "common/constructable"
    local gameObject = mjrequire "common/gameObject"
    
    mj:log("Charcoal: Adding 2 charcoal craftables to campfire and kiln menus")
    
    -- Add all 3 charcoal crafting recipes to campfire menu
    local campfireCraftables = inspectCraftPanel.itemLists[gameObject.typeIndexMap.campfire]
    
    if campfireCraftables then
        -- Add the 3 charcoal recipes
        if constructable.types.charcoalFromBranches then
            table.insert(campfireCraftables, constructable.types.charcoalFromBranches.index)
            mj:log("Charcoal: Added charcoalFromBranches to campfire menu")
        end
        
        if constructable.types.charcoalFromLog then
            table.insert(campfireCraftables, constructable.types.charcoalFromLog.index)
            mj:log("Charcoal: Added charcoalFromLog to campfire menu")
        end
        
        mj:log("Charcoal: Successfully added 2 charcoal recipes to campfire menu")
    else
        mj:warn("Charcoal: Could not find campfire in itemLists")
    end
    
    -- Add all 3 charcoal crafting recipes to kiln menu
    local kilnCraftables = inspectCraftPanel.itemLists[gameObject.typeIndexMap.brickKiln]
    
    if kilnCraftables then
        -- Add the 3 charcoal recipes
        if constructable.types.charcoalFromBranches then
            table.insert(kilnCraftables, constructable.types.charcoalFromBranches.index)
            mj:log("Charcoal: Added charcoalFromBranches to kiln menu")
        end
        
        if constructable.types.charcoalFromLog then
            table.insert(kilnCraftables, constructable.types.charcoalFromLog.index)
            mj:log("Charcoal: Added charcoalFromLog to kiln menu")
        end
        
        mj:log("Charcoal: Successfully added 2 charcoal recipes to kiln menu")
    else
        mj:warn("Charcoal: Could not find brickKiln in itemLists")
    end
    
    return inspectCraftPanel
end

return mod
