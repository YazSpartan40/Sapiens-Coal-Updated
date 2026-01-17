local mod = {
    loadOrder = 1,
}

function mod:onload(model)
    mj:log("Charcoal: Adding charcoal model remap")
    
    -- Try remapping charcoal model to use charcoal material
    -- The charcoal.glb model needs to have its material slot remapped
    
    -- Try coal remap (for coal-based models)
    model.remapModels.ore  = model.remapModels.ore or {}
    model.remapModels.ore.charcoal = { ore = "charcoal" }
    
    -- Also try direct charcoal remap
    model.remapModels.charcoal = model.remapModels.charcoal or {}
    model.remapModels.charcoal.charcoal = { charcoal = "charcoal" }
    
    -- Try resource remap (like branch/log use)
    model.remapModels.resource = model.remapModels.resource or {}
    model.remapModels.resource.charcoal = { resource = "charcoal" }
    
    -- Try wood remap
    model.remapModels.wood = model.remapModels.wood or {}
    model.remapModels.wood.charcoal = { wood = "charcoal" }
    
    mj:log("Charcoal: Model remaps registered (coal, charcoal, resource, wood)")
end

return mod
