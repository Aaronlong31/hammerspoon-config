local lastSSID = hs.wifi.currentNetwork()
local wifiWatcher = nil
local wifiNames = config:get("wifiNames")
local lover = config:get("lover")
local wifi2Location = config:get("wifi2Location")

local function ssidChanged()
    newSSID = hs.wifi.currentNetwork()
    if newSSID ~= nil and newSSID ~= lastSSID then
        if wifiNames[newSSID] ~= nil then
            hs.messages.iMessage(lover, wifiNames[newSSID])
        end
        if wifi2Location[newSSID] ~= nil then
            os.execute("scselect " .. wifi2Location[newSSID])
        end
        lastSSID = newSSID
    end
end
local function module_init()
    wifiWatcher = hs.wifi.watcher.new(ssidChanged)
    wifiWatcher:start()
end
return {
    init = module_init
}
