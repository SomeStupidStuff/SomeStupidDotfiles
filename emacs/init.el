;; Initialization
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(set-face-attribute 'default nil :font "Inconsolata" :height 175)

;; Package manager
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("elpa" . "https://elpa.gnu.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(require 'use-package)
(setq use-package-always-ensure t)

;; Indenting
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))
(column-number-mode)

;; Theme
(use-package doom-themes
  :init (load-theme 'doom-dracula t))

;; Rainbow Paren
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Ivy
(use-package ivy
  :bind (("M-SPC" . swiper))
  :config
  (ivy-mode 1))

;; Counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)))

;; Evil
(defun kill-line-contents ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line nil))

(use-package evil
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-u") 'kill-line-contents)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

;; Key-chord for evil
(use-package key-chord
  :init
  (setq key-chord-two-keys-delay 0.10)
  :config
  (key-chord-mode 1))

(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Filetype specific
(setq python-shell-interpreter "python3")

(use-package org-bullets)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
