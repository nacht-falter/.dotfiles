-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
    return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
    blue = "#31748f",
    green = "#9ccfd8",
    violet = "#c4a7e7",
    yellow = "#f6c177",
    black = "#26233a",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.green
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black, -- black
    },
}

-- configure lualine with modified theme
lualine.setup({
    options = {
        theme = lualine_nightfly,
    },
})
