;;; -*- lexical-binding: t -*-
;; Emacs Config b.

;;; Code:
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

(global-display-line-numbers-mode 1)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-tab-line-mode 0)
(setq inhibit-startup-message t
      font-lock-maximum-decoration t)

(use-package dracula-theme
  :init
  (load-theme 'dracula t))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt) ;; if a treesitter grammar can't be found for the language detected in the buffer, prompt me to install it
  :config
  (treesit-auto-add-to-auto-mode-alist 'all) ;; if a treesitter grammar is found for the language detected in the buffer, use the corresponding language-ts-mode
  (global-treesit-auto-mode))


(provide 'init)
;;; init.el ends here
