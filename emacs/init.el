;; Initialization
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(set-face-attribute 'default nil :font "Inconsolata" :height 155)

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
(setq custom-file "~/.emacs.d/custom.el")

;; Indenting
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))
(column-number-mode)

;; Tabline
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-style "bar")
  (centaur-tabs-height 30)
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-bar 'left)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "●")
  :bind
  (("M-[" . #'centaur-tabs-backward)
   ("M-]" . #'centaur-tabs-forward)))

;; Theme
(use-package doom-themes
  :init (load-theme 'doom-dracula t))

;; Rainbow Paren
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Color Identifiers
(use-package color-identifiers-mode
  :config (global-color-identifiers-mode 1)
  :hook (prog-mode . color-identifiers:refresh))

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

;; Snippets
(use-package yasnippet
  :config
  (setq yas-snippet-dirs
		'("~/.emacs.d/snippets"))
  (setq yas-indent-line 'auto)
  (setq yas-also-auto-indent-first-line t)
  (yas-global-mode 1))

;; Evil
(defun kill-line-contents ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line nil))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-u") 'kill-line-contents)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Key-chord for evil
(use-package key-chord
  :init
  (setq key-chord-two-keys-delay 0.10)
  :config
  (key-chord-mode 1))

(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-u") 'kill-whole-line)

;; Filetype specific
(setq python-shell-interpreter "python3")

(setq c-basic-offset 4)

(add-hook 'c-mode-hook (lambda ()
						 (setq indent-tabs-mode t)))

(use-package rust-mode)
(add-hook 'rust-mode-hook (lambda ()
							(setq indent-tabs-mode nil)))

(use-package org-bullets)
(add-hook 'org-mode-hook (lambda ()
						   (setq indent-tabs-mode nil)))
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)

(add-hook 'rust-mode-hook (lambda () (color-identifiers-mode nil)))

;; Misc stuff
(defun edit-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(bind-key "C-x k" 'kill-current-buffer)
(bind-key "C-x C-k" 'kill-buffer)
(bind-key "C-c e" 'edit-init-file)

(add-hook 'prog-mode-hook 'electric-pair-mode)
