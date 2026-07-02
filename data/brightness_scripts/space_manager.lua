local Brightness = mods.brightness

--[[

A class you can create that has a list of layers and space values, pre and post.

You still have to manage space values yourself, because you have to render them yourself, but this at least gives you the structure to hold them.


The future of this is the manager for all UI objects, with onUpdate, onRender, and onTick fields.
Goal being to decouple render code from business logic.
]]





local function handle_particles(layer)
    local i = 1
    while particleList[layer] and i <= #particleList[layer] do
        i = update_particle(particleList[layer][i], i)
    end
end

local function handle_ship_particles(layer, ship)
    local i = 1
    while particleList[layer] and i <= #particleList[layer] do
        if ship.iShipId == particleList[layer][i].space then
            i = update_particle(particleList[layer][i], i)
        else
            i = i + 1
        end
    end
end

local function registerRenderEvents(eventList, handlerFunction)
    for name, _ in pairs(eventList) do
        script.on_render_event(Defines.RenderEvents[name], function(maybeShip)
            handlerFunction(name .. "_PRE", maybeShip)
        end, function(maybeShip)
            handlerFunction(name, maybeShip)
        end)
    end
end

--In three lists to try to order them by in-game z-order.
local globalEventsBeforeShip = {
    MAIN_MENU = true,
    LAYER_BACKGROUND = true,
    LAYER_FOREGROUND = true
}

local shipEvents = {
    SHIP = true,
    SHIP_MANAGER = true,
    SHIP_JUMP = true,
    SHIP_HULL = true,
    SHIP_ENGINES = true,
    SHIP_FLOOR = true,
    SHIP_BREACHES = true,
    SHIP_SPARKS = true,
}

local globalEventsAfterShip = {
    LAYER_ASTEROIDS = true,
    LAYER_PLAYER = true,
    LAYER_FRONT = true,
    SPACE_STATUS = true,
    TABBED_WINDOW = true,
    MOUSE_CONTROL = true,
    GUI_CONTAINER = true
}
-- registerRenderEvents(globalEventsBeforeShip, handle_particles)
-- registerRenderEvents(shipEvents, handle_ship_particles)
-- registerRenderEvents(globalEventsAfterShip, handle_particles)