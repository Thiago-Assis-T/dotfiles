local wezterm = require 'wezterm'

return {
  -- Enable Tokyo Night color scheme
  color_scheme = 'Tokyo Night',

  -- Window appearance
  window_decorations = "NONE",  -- Removes title bar
  hide_tab_bar_if_only_one_tab = true,
  enable_tab_bar = false,       -- Completely disable tab bar
  use_fancy_tab_bar = false,

  -- Font settings (optional, adjust to your preference)
  font = wezterm.font_with_fallback({
    'JetBrains Mono',
    'Fira Code',
    'Noto Color Emoji',
  }),
  font_size = 11.0,
  line_height = 1.2,

  -- Scrollbar (optional)
  enable_scroll_bar = false,

  -- Cursor style
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 500,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
}
