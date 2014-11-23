local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

local function module_init()
    local mash = config:get('fullscreen.mash', { "cmd", "ctrl" })
    local key = config:get('fullscreen.key', "A")

    hotkey.bind(mash, key, function()
        local win = window.focusedwindow()
        if win ~= nil then
            win:setfullscreen(not win:isFullScreen())
        end
    end)
end

return {
    init = module_init
}
