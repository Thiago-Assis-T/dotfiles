local wezterm = require("wezterm")

return {
	-- Enable Wayland
	enable_wayland = true,

	-- Color scheme
	color_scheme = "Dracula",
	-- Background transparency
	window_background_opacity = 0.8, -- Adjust this value (0.0 = fully transparent, 1.0 = fully opaque)

	-- Font configuration
	font = wezterm.font("ShureTech Mono Nerd Font"),
	font_size = 11.0,

	-- Disable the tab bar (multiplexer UI)
	enable_tab_bar = false,

	-- GPU Acceleration and Rendering
	front_end = "OpenGL", -- "OpenGL" is stable; "WebGpu" is an alternative
	prefer_egl = true, -- Important for Wayland and X11 GPU access
}
