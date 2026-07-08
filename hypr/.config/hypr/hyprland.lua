------------------
----  COLORS  ----
------------------

local colors = {
	fg0 = "rgb(d4be98)",
	fg1 = "rgb(ddc7a1)",
	fg2 = "rgb(a89984)",
	fg3 = "rgb(928374)",
	fg4 = "rgb(7c6f64)",

	bg0 = "rgb(282828)",
	bg_dim = "rgb(1b1b1b)",
	bg_soft = "rgb(32302f)",
	bg_med = "rgb(45403d)",
	bg_hard = "rgb(5a524c)",

	red = "rgb(ea6962)",
	green = "rgb(a9b665)",
	yellow = "rgb(d8a657)",
	blue = "rgb(7daea3)",
	purple = "rgb(d3869b)",
	aqua = "rgb(89b482)",
	orange = "rgb(e78a4e)",

	grey_light = "rgb(a89984)",
	grey_dark = "rgb(928374)",
}

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "HDMI-A-2",
	mode = "1366x768",
	position = "0x-768",
	scale = 1,
})

hl.monitor({
	output = "DP-1",
	mode = "2560x1440@165",
	position = "0x0",
	scale = 1,
	bitdepth = 10,
	vrr = 1,
})

hl.monitor({
	output = "DP-2",
	mode = "1920x1200@60",
	position = "2560x120",
	scale = 1,
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "krusader"
local browser = "floorp"
local menu = "kitty --class='fsel' --name='fsel' fsel --detach"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	-- hl.exec_cmd("swww-daemon & waybar & swaync")
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hyprshade toggle vibrance")
	hl.exec_cmd("systemctl --user start plasma-polkit-agent")
	hl.exec_cmd("solaar -w hide & nm-applet")
	hl.exec_cmd("easyeffects --gapplication-service")
	hl.exec_cmd("wl-paste --watch cliphist store")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("XDG_MENU_PREFIX", "arch-")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")

hl.config({ cursor = { no_hardware_cursors = false } })

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Permission changes require a Hyprland restart and are not applied on-the-fly
-- for security reasons.

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 8,
		gaps_out = 8,

		border_size = 3,
		col = {
			active_border = colors.yellow,
			inactive_border = colors.bg_med,
		},
		resize_on_border = true,

		no_focus_fallback = true,

		-- Please see the tearing docs before enabling this.
		allow_tearing = true,

		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true, -- You probably want this.
		smart_split = false,
		smart_resizing = true,
		precise_mouse_move = true,
	},

	decoration = {
		rounding = 0,

		-- Change transparency of focused and unfocused windows.
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = colors.bg_dim,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		animate_manual_resizes = true,
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers.
		disable_hyprland_logo = true, -- Disables the random Hyprland logo / anime girl background.
		vrr = 1,
		session_lock_xray = true,
		initial_workspace_tracking = true,

		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
	},
})

hl.curve("expressiveFastSpatial", { type = "bezier", points = { { 0.42, 1.67 }, { 0.21, 0.90 } } })
hl.curve("expressiveSlowSpatial", { type = "bezier", points = { { 0.39, 1.29 }, { 0.35, 0.98 } } })
hl.curve("expressiveDefaultSpatial", { type = "bezier", points = { { 0.38, 1.21 }, { 0.22, 1.00 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1.0 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0.0 }, { 0.8, 0.15 } } })
hl.curve("standardDecel", { type = "bezier", points = { { 0.0, 0.0 }, { 0.0, 1.0 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1.0 }, { 0.0, 1.0 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.52, 0.03 }, { 0.72, 0.08 } } })
hl.curve("stall", { type = "bezier", points = { { 1.0, -0.1 }, { 0.7, 0.85 } } })

-- windows
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "popin 80%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "emphasizedDecel" })

-- layers
hl.animation({ leaf = "layersIn", enabled = true, speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.4, bezier = "menu_accel", style = "popin 94%" })

-- fade
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.5, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.7, bezier = "stall" })

-- workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })
hl.animation({
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = 2.8,
	bezier = "emphasizedDecel",
	style = "slidevert",
})
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 1.2,
	bezier = "emphasizedAccel",
	style = "slidevert",
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "hu",
		numlock_by_default = true,
		follow_mouse = 1,

		accel_profile = "flat",
		sensitivity = 0.25, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier.
local satty =
	"satty --filename - --copy-command wl-copy --early-exit --floating-hack --output-filename ~/Pictures/satty-$(date '+%Y%m%d-%H:%M:%S').png"

-- General actions
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + Delete", hl.dsp.exit())

-- Hyprshot / Satty
hl.bind(mainMod .. " + SHIFT + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode region --raw | " .. satty))
hl.bind(mainMod .. " + CTRL + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode window --raw | " .. satty))
hl.bind(mainMod .. " + ALT + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode output --raw | " .. satty))

hl.bind("SHIFT + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode region"))
hl.bind("CTRL + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode window"))
hl.bind("ALT + F12", hl.dsp.exec_cmd("hyprshot --freeze --mode output"))

-- Color picker
hl.bind("SHIFT + F11", hl.dsp.exec_cmd("hyprpicker --autocopy"))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Move windows
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "r" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -160, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = -80, relative = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = 80, relative = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 160, y = 0, relative = true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + CTRL + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0.
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move through workspaces with scrollwheel
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.focus({ workspace = "r-1" }))

-- Move through workspaces with comma/period or X/Y for two- or single-hand use.
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + CTRL + period", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.window.move({ workspace = "r-1" }))

hl.bind(mainMod .. " + X", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + Y", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + CTRL + X", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + Y", hl.dsp.window.move({ workspace = "r-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging.
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and mic mute.
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Noctalia
hl.bind(
	mainMod .. " + F5",
	hl.dsp.exec_cmd("pkill -x noctalia 2>/dev/null; nohup noctalia > ~/.cache/noctalia-restart.log 2>&1 &")
)

-- Awakened POE Trade: pass shortcuts through to the app.
-- hl.bind("SHIFT + Space", hl.dsp.pass({ window = "class:awakened-poe-trade" })) -- Blocks whitespaces while typing and holding shift
hl.bind("CTRL + ALT + D", hl.dsp.pass({ window = "class:awakened-poe-trade" }))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Workspaces for DP-1
for i = 1, 6 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1", persistent = true })
end

-- Workspaces for DP-2
for i = 7, 10 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2", persistent = true })
end

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland.
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Fix blur on electron context menus.
hl.window_rule({
	name = "blur-fix",
	match = { class = "^()$" },
	no_blur = true,
})

hl.window_rule({
	name = "tag-steam-settings",
	match = { class = "^(steam)$", title = "^(Steam Settings)$" },
	tag = "+steamSettings",
})

hl.window_rule({
	name = "steam-settings",
	match = { tag = "steamSettings" },
	float = true,
	render_unfocused = true,
	size = "(monitor_w*0.5) (monitor_h*0.6)",
	center = true,
})

-- Steam games
hl.window_rule({
	name = "steam-games",
	match = { class = "steam_app.*" },
	float = true,
	fullscreen = true,
	border_size = 0,
})

-- Awakened PoE Trade
hl.window_rule({
	name = "apt",
	match = { class = "awakened-poe-trade" },
	float = true,
	no_blur = true,
	no_shadow = true,
	border_size = 0,
})

-- Fsel
hl.window_rule({
	name = "fsel",
	match = { class = "fsel" },
	float = true,
	center = true,
	size = "600 800",
	pin = true,
	stay_focused = true,
})

-- Noctalia blur
hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
