;; Initial setup taken from https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el

(require 'package)

;; Add melpa to package archives.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)


;; Load and activate Emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.  This
;; also sets the load path.
(package-initialize)

;; Install "use-package" if it is not installed.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))







;; (menu-bar-mode -1)
;; (scroll-bar-mode -1)
;; (tool-bar-mode -1)


;; (require 'package)

;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/"))

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; (package-initialize)

;; (require 'magit)
;; (require 'eldoc)
;; (require 'cider)
;; (require 'paredit)
;; (require 'dired-x)
;; (require 'rust-mode)
;; (require 'clojure-mode)
;; (require 'ace-jump-mode)


;; ;; Other Frame

;; (global-set-key (kbd "<f5>") 'other-frame)

;; ;; Ibuffer

;; (global-set-key (kbd "C-x C-b") 'ibuffer)

;; ;; Ace Jump Mode

;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key global-map (kbd "C-c l") 'ace-jump-line-mode)

;; ;; Magit

;; (global-set-key (kbd "C-x g") 'magit-status)


;; (add-to-list 'load-path "~/src/lisp/sly")
;; (require 'sly-autoloads)

;; (add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
;; (add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))
;; (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-connected-hook (lambda () (paredit-mode +1)))

;; (add-to-list 'load-path (expand-file-name "~/.quicklisp/"))
;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))

;; (setq inferior-lisp-program "/usr/bin/sbcl")

;; (require 'slime)
;; (slime-setup '(slime-fancy))

;; (add-hook 'slime-mode-hook            'turn-on-eldoc-mode)
;; (add-hook 'lisp-mode-hook             'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)


;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)


;; (load-theme 'nord t)

;; (display-time)
;; (desktop-save-mode 1)
;; (fset 'yes-or-no-p 'y-or-n-p)
;; (ido-mode t)

;; (server-start)

;; (setq-default indent-tabs-mode nil
;;               ;; dired-omit-files-p t
;;               ;; dired-omit-files (concat dired-omit-files "\\|^\\..+$")
;;               inhibit-startup-screen t
;;               use-file-dialog nil
;;               tab-width 4
;;               column-number-mode t
;;               display-battery-mode t
;;               blink-matching-paren t
;;               blink-matching-delay .25
;;               split-height-threshold nil
;;               mac-option-modifier 'super
;;               mac-command-modifier 'meta)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Inconsolata")))))

;; (setenv "LD_LIBRARY_PATH"
;;   (concat
;;    "/home/samuel/builds/rust/master/install/lib/"
;;    (getenv "LD_LIBRARY_PATH")))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    (quote
;;     ("850213aa3159467c21ee95c55baadd95b91721d21b28d63704824a7d465b3ba8" default)))
;;  '(package-selected-packages
;;    (quote
;;     (perl6-mode nord-theme markdown-mode markdown-mode+ zenburn-theme rut-smode paredit magit cider ace-jump-mode)))
;;  '(safe-local-variable-values
;;    (quote
;;     ((c-file-offsets
;;       (innamespace . 0)
;;       (inline-open . 0)
;;       (case-label . +))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
