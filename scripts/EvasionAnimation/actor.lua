local I = require("openmw.interfaces")
local anim = require('openmw.animation')
local self = require('openmw.self')

local anims = { "idle9" } -- todo rename anims
-- filename.kf -> NiTextKeyExtraData -> TextKeys -> Value from Idle9:Start to DodgeLeft:Start and DodgeRight:Start

local animData = {
    startKey = "start",
    stopKey = "stop",
    priority = anim.PRIORITY.Hit + 1,
}

local function playAnim(attack)
    if attack.successful then return end
    if not anim.hasGroup(self, anims[1]) then return end

    local pickedAnim = anims[math.random(#anims)]
    I.AnimationController.playBlendedAnimation(pickedAnim, animData)
end

I.Combat.addOnHitHandler(playAnim)

-- local animGroups = {
--     "weapononehand",
--     "weapontwohand",
--     "weapontwowide",
--     "handtohand",
-- }

-- local animData = {
--     group = animGroup,
--     options = {
--         startKey = "start",
--         stopKey = "stop",
--         priority = anim.PRIORITY.Hit + 1,
--     },
-- }

-- for _, group in ipairs(animGroups) do
--     I.AnimationController.addTextKeyHandler(group, function(groupname, key)
--         print('Group: ' .. groupname .. ', Key: ' .. key .. ', self: ' .. self.recordId)
--         if string.find(key, "min attack") then
--             local target = self -- todo
--             -- maybe there will be something at QuickLoot in ql_pickpocket.lua
--             if not target then return end

--             local attackSuccessful = true -- todo
--             if attackSuccessful then
--                 -- send event to the target to guarantee an attack from self for a second or so
--             else
--                 target:sendEvent("playBlendedAnimation", animData)
--                 -- send event to the target to guarantee a miss from self for a second or so
--             end
--         end
--     end)
-- end

-- return {
--     eventHandlers = {
--         playBlendedAnimation = function(eventData)
--             I.AnimationController.playBlendedAnimation(eventData.group, eventData.options)
--         end,
--     }
-- }
