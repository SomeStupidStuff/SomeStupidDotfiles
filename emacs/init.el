;; Initialization
(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(set-face-attribute 'default nil :font "Inconsolata" :height 175)

;; Indenting
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

;; Theme
(use-package doom-themes
  :init (load-theme 'doom-dracula t))

;; Ivy
(use-package ivy
  :bind (("M-SPC" . swiper))
  :config
  (ivy-mode 1))

;; Counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x f" . counsel-find-file)))

;; Evil
(use-package evil
  :config
  (evil-mode 1))

;; Key-chord for evil
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)
(setq key-chord-two-keys-delay 0.10)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Filetype specific
(setq python-shell-interpreter "python3")

(use-package org-bullets)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default)))
 '(doom-modeline-mode t)
 '(frame-brackground-mode (quote dark))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (use-package doom-modeline doom-themes evil-better-visual-line ample-theme ace-flyspell magit key-chord darkroom evil org-bullets org haskell-mode gruber-darker-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
