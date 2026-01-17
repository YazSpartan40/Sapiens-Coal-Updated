local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3

local mod = {
    loadOrder = 1,
}

function mod:onload(material)
    mj:log("Charcoal: Registering charcoal material")
    
    -- Deep black charcoal color - very dark grey/black
    -- RGB values close to 0 for deep black
    local charcoalColor = vec3(0.01, 0.01, 0.01) -- Very dark black
    mj:insertIndexed(material.types, material.mat("charcoal", charcoalColor, 0.9, 0.0))
    material.types.charcoal.metal = 0.0  -- Not metallic
    
    mj:log("Charcoal: Material registered (deep black color)")
end

return mod
