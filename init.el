(setq inhibit-startup-message t)

(scroll-bar-mode -1) ;Disable visible scrollbar
(tool-bar-mode -1)   ;Disable the toolbar
(tooltip-mode -1)    ;Disable tooltips
(set-fringe-mode 10) ;Give some breathing room

(menu-bar-mode -1)   ;Disable the menu bar

;;Set up the visible bell
(setq visible-bell t)

;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 200)

(load-theme 'wombat)

;;Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;;Disable line numbers for some modes
(dolist (mode '(otg-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
(use-package command-log-mode)

(use-package ivy
  :config
  (ivy-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode , rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
