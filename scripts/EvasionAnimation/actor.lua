local I = require("openmw.interfaces")
local anim = require('openmw.animation')
local self = require('openmw.self')

local anims = { "idle9" }

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

-- local animKeys = {
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

-- for _, k in ipairs(animKeys) do
--     I.AnimationController.addTextKeyHandler(k, function(groupname, key)
--         print('Group: ' .. groupname .. ', Key: ' .. key .. ', self: ' .. self.recordId)
--         if string.find(key, "min attack") then
--             local target = self -- todo
--             if not target then return end

--             local attackSuccessful = true -- todo
--             if attackSuccessful then
--                 target:sendEvent("playBlendedAnimation", animData)
--                 -- add 1000 fortify atack for 1 sec to self
--             else
--                 -- add 1000 senctuary for 1 sec to target
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
