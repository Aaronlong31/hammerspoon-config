local lastSSID = hs.wifi.currentNetwork()
local wifiWatcher = nil
local wifiNames = {
    ['alibaba-inc'] = "Hi, 我在公司，love you!",
    ['NETGRAR97-5G'] = 'Hi, 我在家，love you!',
    ['HolidayinnExpress'] = 'Hi, 我在宾馆，love you!'
}

local function ssidChanged()
    newSSID = hs.wifi.currentNetwork()
    if newSSID ~= nil and newSSID ~= lastSSID then
        if wifiNames[newSSID] ~= nil then
            hs.messages.iMessage("sw320225205@163.com", wifiNames[newSSID])
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
