;; Get rid of the start screen
(setq inhibit-startup-message t)

;; Set font
(when (member "Hasklug Nerd Font Mono" (font-family-list))
  (set-frame-font "Hasklug Nerd Font Mono-15" t t))

;;Disable the extraneous gui elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Add Melpa to package list
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Initiate use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Activate Nord theme
(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

;; Activate Which Key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Activate Evil Leader
(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

;; Activate Evil Mode
(use-package evil
   :ensure t
   :config
   (evil-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
