
-- =================
-- MONITOR
-- =================

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@144",
    position = "auto",
    scale = 1,
})


-- =================
-- PROGRAMS
-- =================

local mainMod = "SUPER"

local terminal = "foot"
local fileManager = "foot yazi"
local menu = "rofi -show drun"
local browser = "firefox"


-- =================
-- ENVIRONMENT
-- =================

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")


-- =================
-- AUTOSTART
-- =================

hl.on("hyprland.start", function()

    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    hl.exec_cmd("clipman restore")
    hl.exec_cmd("pamixer --restore-mute")

    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd("wl-clip-persist --clipboard regular")

    hl.exec_cmd("awww-daemon")

end)


-- =================
-- INPUT
-- =================

hl.config({

    cursor = {
        inactive_timeout = 3,
        no_hardware_cursors = 1,
    },

    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,

        sensitivity = 0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },

        tablet = {
            output = "eDP-1",
            transform = 0,
        },
    },

})


-- =================
-- LOOK & FEEL
-- =================

hl.config({

    general = {
        gaps_in = 6,
        gaps_out = 5,
        border_size = 2,

        col = {
            active_border = "rgba(ffffffff)",
            inactive_border = "rgba(888888ff)",
        },

        resize_on_border = true,
        layout = "dwindle",
    },

    decoration = {
        rounding = 3,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },

        shadow = {
            enabled = true,
            range = 4,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

})


-- =================
-- ANIMATIONS
-- =================

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {{0.23, 1}, {0.32, 1}},
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {{0.65, 0.05}, {0.36, 1}},
})

hl.curve("linear", {
    type = "bezier",
    points = {{0, 0}, {1, 1}},
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {{0.5, 0.5}, {0.75, 1}},
})

hl.curve("quick", {
    type = "bezier",
    points = {{0.15, 0}, {0.1, 1}},
})


hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 5.39,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4.79,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 4.1,
    bezier = "easeOutQuint",
    style = "popin 87%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1.49,
    bezier = "linear",
    style = "popin 87%",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 1.73,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 1.46,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3.03,
    bezier = "quick",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 3.81,
    bezier = "easeOutQuint",
})

hl.animation({
    leaf = "layersIn",
    enabled = true,
    speed = 4,
    bezier = "easeOutQuint",
    style = "fade",
})

hl.animation({
    leaf = "layersOut",
    enabled = true,
    speed = 1.5,
    bezier = "linear",
    style = "fade",
})

hl.animation({
    leaf = "fadeLayersIn",
    enabled = true,
    speed = 1.79,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "fadeLayersOut",
    enabled = true,
    speed = 1.39,
    bezier = "almostLinear",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 1.21,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 1.94,
    bezier = "almostLinear",
    style = "fade",
})


-- =================
-- KEYBINDS
-- =================

-- Window management

hl.bind("SUPER + R",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind("SUPER + Q",
    hl.dsp.window.close()
)

hl.bind("SUPER + F",
    hl.dsp.window.fullscreen({ action = "toggle" })
)

hl.bind("SUPER + M",
    hl.dsp.exit()
)


-- Screenshots

hl.bind("SUPER + S",
    hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy -t image/png]])
)


-- Applications

hl.bind(mainMod .. " + W",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(mainMod .. " + E",
    hl.dsp.exec_cmd(fileManager)
)

hl.bind(mainMod .. " + SHIFT + D",
    hl.dsp.exec_cmd("foot -e dpm")
)

hl.bind(mainMod .. " + D",
    hl.dsp.exec_cmd(menu)
)

hl.bind(mainMod .. " + B",
    hl.dsp.exec_cmd(browser)
)


-- Clipboard

hl.bind("SUPER + V",
    hl.dsp.exec_cmd(
        "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy && wtype -M ctrl -k v -m ctrl"
    )
)


-- Focus movement

hl.bind(mainMod .. " + LEFT",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(mainMod .. " + RIGHT",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(mainMod .. " + UP",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(mainMod .. " + DOWN",
    hl.dsp.focus({ direction = "down" })
)


-- Window resizing

hl.bind(mainMod .. " + SHIFT + LEFT",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true })
)

hl.bind(mainMod .. " + SHIFT + RIGHT",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true })
)

hl.bind(mainMod .. " + SHIFT + UP",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true })
)

hl.bind(mainMod .. " + SHIFT + DOWN",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true })
)


-- Waybar restart

hl.bind(mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd("killall waybar && waybar")
)


-- Wallpaper

hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("python3 ~/.config/hypr/scripts/wallpaper.py")
)


-- Workspaces

for i = 1, 5 do

    hl.bind(mainMod .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

end


-- Mouse move / resize

hl.bind(mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

