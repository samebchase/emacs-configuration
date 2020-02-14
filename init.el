;; Initial setup taken from https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time)
(server-start)

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


;; This `setq-default` form adapted from https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el
(setq-default
 ;; Don't use the compiled code if its the older package.
 load-prefer-newer t

 ;; Do not show the startup message.
 inhibit-startup-message t

 ;; Do not put 'customize' config in init.el; give it another file.
 custom-file "~/.emacs.d/custom-file.el")

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically update buffers if file content on the disk has changed.
(global-auto-revert-mode t)

(require 'use-package)

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))


(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))


(use-package perl6-mode
  :ensure t
  :defer t)


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package paredit
  :ensure t
  :init
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package eldoc
  :config
  (global-eldoc-mode t))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t

	;; Display index and count both.
	ivy-count-format "(%d/%d) "

	;; By default, all ivy prompts start with `^'. Disable that.
	ivy-initial-inputs-alist nil)

  :bind (("C-x b" . ivy-switch-buffer)
	 ("C-x B" . ivy-switch-buffer-other-window)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
         ("C-M-s" . isearch-forward-regexp)
         ("C-M-r" . isearch-backward-regexp)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-'" . counsel-imenu)
         ("C-c s" . counsel-rg)
         :map counsel-find-file-map
         ("RET" . ivy-alt-done)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package ace-jump-mode
  :ensure t
  :bind (("C-." . ace-jump-mode)
	 ("C-c l" . ace-jump-line-mode)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package dumb-jump
  :ensure t
  :bind ("C-M-." . dumb-jump-go))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package which-key
  :ensure t
  :config
  (which-key-mode t))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package projectile
  :ensure t
  :config
  ;; Use it everywhere
  (projectile-mode t)
  :bind ("C-x f" . projectile-find-file))


(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))


;; (require 'dired-x)

;; (add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
;; (add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))
;; (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-connected-hook (lambda () (paredit-mode +1)))
;; (add-hook 'slime-mode-hook            'turn-on-eldoc-mode)
;; (add-hook 'lisp-mode-hook             'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

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


