;; Emacs Config b
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(global-display-line-numbers-mode 1)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-tab-line-mode 1)
(setq inhibit-startup-message t
      font-lock-maximum-decoration t)

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

(use-package dracula-theme)
(load-theme 'dracula t)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))



