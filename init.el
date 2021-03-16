;; Initial setup taken from https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time)
(server-start)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

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


(defun cider-repl-prompt-on-newline (ns)
  "Return a prompt string with newline.
   
   NS is the namespace information passed into the function by
   cider."
  (concat ns ">\n"))


(setq-default
 ;; Don't use the compiled code if its the older package.
 load-prefer-newer t

 ;; Do not show the startup message.
 inhibit-startup-message t
 fzf/executable "/usr/local/bin/fzf"

 ;; Do not put 'customize' config in init.el; give it another file.
 custom-file "~/.emacs.d/custom-file.el"

 ns-right-command-modifier 'hyper
 ns-right-option-modifier 'super

 cider-repl-prompt-function 'cider-repl-prompt-on-newline)

 

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically update buffers if file content on the disk has changed.
;; (global-auto-revert-mode t)


(global-set-key (kbd "H-2") 'split-window-below)
(global-set-key (kbd "H-3") 'split-window-right)

(global-set-key (kbd "H-q") 'delete-window)
(global-set-key (kbd "H-w") 'delete-other-windows)
(global-set-key (kbd "H-f") 'other-window)

(global-set-key (kbd "H-r") 'window-configuration-to-register)
(global-set-key (kbd "H-e") 'jump-to-register)

(global-set-key (kbd "H-j") 'pop-to-mark-command)

(global-set-key (kbd "s-f") 'forward-sexp)
(global-set-key (kbd "s-b") 'backward-sexp)
(global-set-key (kbd "s-t") 'transpose-sexps)
(global-set-key (kbd "s-<tab>") 'prog-indent-sexp)
(global-set-key (kbd "s-SPC") 'mark-sexp)

(global-set-key (kbd "H-c") 'kill-ring-save)
(global-set-key (kbd "H-x") 'kill-region)
(global-set-key (kbd "H-v") 'yank)

(global-set-key (kbd "C-o") 'open-line)

(global-set-key (kbd "H-a") 'magit)
(global-set-key (kbd "H-M-g") 'ace-jump-word-mode)
(global-set-key (kbd "H-g") 'ace-jump-char-mode)

;; (global-set-key (kbd "H-M-d") 'fzf-directory)
(global-set-key (kbd "H-s") 'save-buffer)

(global-set-key (kbd "s-s") 'swoop)
(global-set-key (kbd "H-s-s") 'swoop-multi)

(global-set-key (kbd "s-j") 'ace-jump-mode-pop-mark)

(global-set-key (kbd "H-b") 'ido-switch-buffer)
(global-set-key (kbd "H-d") 'fzf-projectile)


(global-set-key (kbd "s-c") 'cider-connect-clj)
(global-set-key (kbd "s-z") 'cider-switch-to-repl-buffer)
(global-set-key (kbd "s-n") 'cider-repl-set-ns)
(global-set-key (kbd "H-l") 'cider-load-buffer)
(global-set-key (kbd "H-k") 'cider-eval-defun-at-point)

(global-set-key (kbd "H-<f3>") 'cider-debug-defun-at-point)

(global-set-key (kbd "H-t") 'cider-test-run-test)
(global-set-key (kbd "H-M-t") 'cider-test-run-ns-tests)

(global-set-key (kbd "H-m") 'org-narrow-to-subtree)
(global-set-key (kbd "H-M-m") 'widen)

(global-set-key (kbd "H-'") 'org-edit-special)
(global-set-key (kbd "H-M-'") 'org-edit-src-exit)

(global-set-key (kbd "H--") 'text-scale-decrease)
(global-set-key (kbd "H-=") 'text-scale-increase)

(global-set-key (kbd "H-<up>") 'enlarge-window-horizontally)
(global-set-key (kbd "H-<down>") 'shrink-window-horizontally)

(global-set-key (kbd "H-<right>") 'enlarge-window)
(global-set-key (kbd "H-<left>") 'shrink-window)

(global-set-key (kbd "M-z") 'zap-up-to-char)


(require 'use-package)

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))


(use-package deadgrep
  :ensure t)


(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))


(use-package swoop
  :ensure t)


(use-package fzf  
  :ensure t)


(use-package raku-mode
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
  (add-hook 'mrepl-mode-hook #'enable-paredit-mode)
  (add-hook 'sly-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly)))


;; This configuration adapted from Mr. S.U.V.R.A.T Apte, 
(use-package eldoc
  :config
  (global-eldoc-mode t))


(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))


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


(use-package sly
  :ensure t)

;; (unless (package-installed-p 'clojure-mode)
;;   (package-install 'clojure-mode))
(use-package clojure-mode
  :ensure t)


(use-package cider
  :ensure t)


(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))


(use-package flycheck-joker
  :after clojure-mode
  :ensure t)


(use-package flycheck-clj-kondo
  :ensure t
  :after clojure-mode
  :config
  (dolist (checkers '((clj-kondo-clj . clojure-joker)
                      (clj-kondo-cljs . clojurescript-joker)
                      (clj-kondo-cljc . clojure-joker)
                      (clj-kondo-edn . edn-joker)))
    (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers)))))


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

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 170 :width normal :foundry "nil" :family "Iosevka"))))
 '(cider-repl-stderr-face ((t (:inherit font-lock-warning-face :weight normal))))
 '(font-lock-comment-face ((t (:foreground "#A3BE8C"))))
 '(font-lock-doc-face ((t (:foreground "#A3BE8C"))))
 '(markdown-pre-face ((t (:inherit ##)))))

