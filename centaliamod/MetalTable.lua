local Metals = {
    {material = "iron", description = "Iron", color = "#dddddd", ingot = true}
}

cent.metal_ingot = {}

function cent.register_metal(mat, data)
    local mod = minetest.get_current_modname()
    local itemname = mod.. ":" ..mat.. "_ingot"

    data.item = itemname
    cent.metal_ingot[mat] = data

    local description = data.description .. " Ingot"
    if data.force_description then
        description = data.description
    end

    minetest.register_craftitem(itemname, {
        description = description,
        inventory_image = "ingot.png^[multiply:" .. data.color,
        groups = {
            ["ingot" .. mat] = 1,
            ingot = 1 
        }
    })
end

for _,spec in pairs(Metals) do
    local desc       = spec.description
    local name       = spec.material
    local color      = spec.color

    if spec.ingot ~= nil and spec.ingot ~= false then
        local fdesc = nil
        if spec.ingot ~= true then
            fdesc = spec.ingot
        end

    cent.register_metal(name, {
        description       = fdesc or desc,
        color             = color,
        force_description = fdesc ~= nil,
    })
    end

end
