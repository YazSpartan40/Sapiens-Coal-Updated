local resource = mjrequire "common/resource"
local skill = mjrequire "common/skill"
local craftAreaGroup = mjrequire "common/craftAreaGroup"

local mod = { loadOrder = 5 }

function mod:onload(research)
    mj:log("Charcoal: Preparing charcoal making research registration")

    local prevLoad = research.load
    research.load = function(research_, gameObject_, constructable, flora)
        prevLoad(research_, gameObject_, constructable, flora)

        mj:log("Charcoal: Research temporarily disabled for testing")
        --[[
        mj:log("Charcoal: Registering charcoalMaking research")

        -- Verify campfireCooking skill exists
        if not skill.types.campfireCooking then
            mj:error("Charcoal: campfireCooking skill not found!")
            return
        end
        mj:log("Charcoal: Found campfireCooking skill with index:", skill.types.campfireCooking.index)

        -- Charcoal Making research - mimics campfireCooking pattern
        local charcoalMakingResearchConfig = {
            -- Does not teach a skill (campfireCooking already learned)
            -- skillTypeIndex = skill.types.campfireCooking.index,
            
            -- Map resources to production recipes (crafting them completes research and unlocks all)
            constructableTypeIndexesByBaseResourceTypeIndex = {
                [resource.types.branch.index] = constructable.types.charcoalFromBranches.index,
                [resource.types.log.index] = constructable.types.charcoalFromLog.index,
            },
            
            -- Resources that trigger research visibility
            resourceTypeIndexes = {
                resource.types.branch.index,
                resource.types.log.index,
            },
            
            -- Only visible after campfireCooking SKILL is learned
            researchRequiredForVisibilityDiscoverySkillTypeIndexes = {
                skill.types.campfireCooking.index,
            },
            
            -- Fast research
            initialResearchSpeedLearnMultiplier = 2.0,
        }

        -- Register the charcoalMaking research
        local charcoalMakingResearchIndex = research_:addResearch("charcoalMaking", charcoalMakingResearchConfig)
        if charcoalMakingResearchIndex then
            research_:updateDerivedInfo(research_.types.charcoalMaking)
            mj:log("Charcoal: charcoalMaking research registered with index:", charcoalMakingResearchIndex)
        else
            mj:warn("Charcoal: Failed to register charcoalMaking research")
        end
        ]]
    end
end

return mod
