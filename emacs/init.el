(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(ido-mode 1)
(set-frame-font "Ubuntu Mono-18" nil t)
(load-theme 'gruber-darker t)

(setq tab-width 4)
(setq default-tab-width 4)
(setq indent-tabs-mode t)

(blink-cursor-mode 0)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1) (text-scale-adjust 2)))

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

(add-hook 'python-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (setq python-indent 4)
	    (setq tab-width 4)))
(setq python-shell-interpreter "python3")


(defun c-put-braces ()
	(interactive)
	(insert "{}")
	(backward-char)
	(newline)
	(newline)
	(c-indent-line-or-region)
	(previous-line)
	(c-indent-line-or-region))

(add-hook 'c-mode-common-hook
  (lambda ()
    (setq c-basic-offset 4)
    (setq indent-tabs-mode t)
    (setq tab-width 4)
    (text-scale-adjust 2)
    (local-set-key (kbd "C-;") 'c-put-braces)))

(add-hook 'c-mode-hook
	  (lambda ()
	    (setq compile-command "make main")))

(add-hook 'c++-mode-hook
	  (lambda ()
	    (setq compile-command "make main")))

(evil-mode 1)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.25)
(key-chord-define evil-insert-state-map "fd" 'evil-normal-state)

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" default)))
 '(frame-brackground-mode (quote dark))
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (ace-flyspell magit key-chord darkroom evil org-bullets org haskell-mode gruber-darker-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
