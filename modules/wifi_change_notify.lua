local officeWifiName = 'alibaba-inc'
local homeWifiName = 'NETGRAR97-5G'
local lastSSID = hs.wifi.currentNetwork()
local wifiWatcher = nil

local function im(message)
    hs.messages.iMessage("sw320225205@163.com", message)
end

local function ssidChanged()
    newSSID = hs.wifi.currentNetwork()
    if newSSID == officeWifiName and lastSSID ~= officeWifiName then
        im("Hi, 我在公司，love you!")
    elseif newSSID == homeWifiName and lastSSID ~= homeWifiName then
        im("Hi, 我在家，love you!")
    end
end
local function module_init()
    wifiWatcher = hs.wifi.watcher.new(ssidChanged)
    wifiWatcher:start()
end
return {
    init = module_init
}
