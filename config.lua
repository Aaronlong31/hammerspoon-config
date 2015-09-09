local config = {}

config.modules = {
    "arrangement",
    "monitors",
    "repl",
    "reload",
    "arrows",
    "lock",
    "fullscreen",
    "slide",
    "caffeine",
    "wifi_change_notify",
    "app_event"
}
config.lover = "sw320225205@163.com"
config.wifiNames = {
    ['alibaba-inc'] = "Hi, 老婆, 我在公司，love you!",
    ['NETGRAR97-5G'] = "Hi, 老婆, 我在家，love you!",
    ['HolidayinnExpress'] = "Hi, 老婆, 我在宾馆，love you!"
}

config.wifi2Location = {
    ['alibaba-inc'] = "alibaba",
    ['NETGRAR97-5G'] = "duotai",
    ['HolidayinnExpress'] = "duotai"
}

-- Maps monitor id -> screen index.
config.monitors = {
    autodiscover = true,
    rows = 1
}

-- Window arrangements.
config.arrangements = {
    fuzzy_search = {
        mash = {"cmd", "ctrl", "alt"},
        key = "Z"
    },
    {
        name = "zen",
        alert = true,
        mash = { "cmd", "ctrl", "alt" },
        key = "A",
        arrangement = {
            {
                app_title = "^Mail",
                monitor = 1,
                position = "full_screen",
            },
            {
                app_title = "^Slack",
                monitor = 4,
                position = "left"
            },
            {
                app_title = "^Messages",
                monitor = 4,
                position = function(d)
                    return d:translate_from('bottom_right', {
                        y = 42,
                        h = -40
                    })
                end
            },
            {
                app_title = "^ChronoMate",
                monitor = 4,
                position = function(d)
                    return d:translate_from('top_right', {
                        h = 42
                    })
                end
            },
            {
                app_title = "^Spotify",
                monitor = 6,
                position = "full_screen",
            }
        }
    }
}

return config
