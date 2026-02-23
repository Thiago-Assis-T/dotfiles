#
# ~/.bash_profile
#
# Tell toolkits and libraries we're running on Wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

# Qt applications: use Wayland backend
export QT_QPA_PLATFORM=wayland

# SDL2 applications: use Wayland backend
export SDL_VIDEODRIVER=wayland

# Java/Swing apps: avoid reparenting issues
export _JAVA_AWT_WM_NONREPARENTING=1

# Firefox: enable Wayland backend (if you use Firefox)
export MOZ_ENABLE_WAYLAND=1

# Electron apps: hint to use Ozone platform (Wayland)
export ELECTRON_OZONE_PLATFORM_HINT=auto

# Optional: set default apps
export BROWSER=firefox
export TERMINAL=ghostty

[[ -f ~/.bashrc ]] && . ~/.bashrc
