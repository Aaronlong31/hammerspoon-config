local appWatcher = nil
local log = hs.logger.new('app_event', 'info')

function applicationWatcher(appName, eventType, appObject)
    if appName == nil then
        return
    end
    appName, _ = string.gsub(appName, "%s+", "_")
    script = "/bin/bash ~/.hammerspoon/script/save_app_event.sh '" .. appName .. "' " .. eventType 
    log.d(script)
    -- os.execute(script)
    os.execute(string.format("echo %s %s %d >> ~/.hammerspoon/logs/app_event_%s.log", appName, eventType, os.time(), os.date("%Y-%m-%d")))

end

local function module_init()
    appWatcher = hs.application.watcher.new(applicationWatcher)
    appWatcher:start()
end
return {
    init = module_init
}
