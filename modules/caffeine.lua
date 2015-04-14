local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("A")
    else
        caffeine:setTitle("S")
    end
end
function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end
return {
    init = function()
        if caffeine then
            setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
            caffeine:setClickCallback(caffeineClicked)
        end
    end
}
