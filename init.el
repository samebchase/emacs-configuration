;;; init.el --- Summary
;;; Commentary:
;;; Quite a lot of the setup is taken from Mr. S.U.V.R.A.T Apte,
;;; https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el

;;; Code:
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tab-bar-mode 1)
(display-time)
(server-start)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/.cargo/bin")))
(setq exec-path (append exec-path '("~/bin")))

(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")

(setenv "LANGUAGE" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq gc-cons-threshold 100000000)
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

(require 'package)

;; Add melpa to package archives.
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives 
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
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
(global-set-key (kbd "H-s-f") 'flop-frame)
(global-set-key (kbd "H-M-f") 'flip-frame)
(global-set-key (kbd "C-s-f") 'transpose-frame)

(global-set-key (kbd "s-w") 'ace-window)
(global-set-key (kbd "s-k") 'kill-buffer)
 
(global-set-key (kbd "H-/") 'comment-or-uncomment-region)

(global-set-key (kbd "H-r") 'window-configuration-to-register)
(global-set-key (kbd "H-e") 'jump-to-register)

(global-set-key (kbd "H-j") 'pop-to-mark-command)

(global-set-key (kbd "s-f") 'forward-sexp)
(global-set-key (kbd "s-b") 'backward-sexp)
(global-set-key (kbd "s-t") 'transpose-sexps)
(global-set-key (kbd "s-<tab>") 'prog-indent-sexp)
(global-set-key (kbd "s-i") 'prog-indent-sexp)
(global-set-key (kbd "s-SPC") 'mark-sexp)
(global-set-key (kbd "s-m") 'mark-sexp)
(global-set-key (kbd "s-w") 'whitespace-cleanup)


(global-set-key (kbd "H-c") 'kill-ring-save)
(global-set-key (kbd "H-x") 'kill-region)
(global-set-key (kbd "H-v") 'yank)

(global-set-key (kbd "C-o") 'open-line)

(global-set-key (kbd "H-a") 'magit)
(global-set-key (kbd "H-M-g") 'ace-jump-word-mode)
(global-set-key (kbd "H-g") 'ace-jump-char-mode)

(global-set-key (kbd "H-M-d") 'fzf-directory)
(global-set-key (kbd "H-s") 'save-buffer)

(global-set-key (kbd "s-s") 'org-clock-in)
(global-set-key (kbd "s-S") 'org-clock-out)

(global-set-key (kbd "s-j") 'ace-jump-mode-pop-mark)

(global-set-key (kbd "H-b") 'ido-switch-buffer)

(global-set-key (kbd "s-c") 'cider-connect-clj)
(global-set-key (kbd "s-z") 'cider-switch-to-repl-buffer)
(global-set-key (kbd "s-n") 'cider-repl-set-ns)
(global-set-key (kbd "s-d") 'lsp-describe-thing-at-point)

(global-set-key (kbd "H-l") 'cider-load-buffer)
(global-set-key (kbd "H-k") 'cider-eval-defun-at-point)
(global-set-key (kbd "H-<f3>") 'cider-debug-defun-at-point)
(global-set-key (kbd "H-t") 'cider-test-run-test)
(global-set-key (kbd "H-M-t") 'cider-test-run-ns-tests)

(global-set-key (kbd "H-n") 'org-toggle-narrow-to-subtree)

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
  :ensure t
  :bind ("C-x g" . magit-status))

;; (use-package lsp-java
;;   :ensure t
;;   :init
;;   (add-hook 'java-mode-hook #'lsp))

;; (use-package magit-delta
;;   :ensure t
;;   :init
;;   (add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1))))

(use-package fzf
  :ensure t)

(use-package raku-mode
  :ensure t
  :defer t)

(use-package nix-mode
  :ensure t)

(defun my-cljr-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1))


(use-package clj-refactor
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'my-cljr-clojure-mode-hook))

;; A few of these configurations have been adapted from
;; Mr. S.U.V.R.A.T Apte.
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

(use-package eldoc
  :config
  (global-eldoc-mode t))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; (use-package lsp-mode
;;   :ensure t
;;   :init
;;   (setq lsp-keymap-prefix "s-r")
;;   :hook
;;   ((rust-mode . lsp)
;;    ;; (clojure-mode . lsp)
;;    (lsp-mode . lsp-enable-which-key-integration)
;;    (java-mode . #'lsp-deferred))
;;   :config
;;   (dolist (m '(clojure-mode
;;                clojurec-mode
;;                clojurescript-mode
;;                clojurex-mode))
;;     (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
;;   :commands lsp)


(use-package rust-mode
  :ensure t)


(use-package markdown-mode
  :ensure t)

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

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-M-s" . isearch-forward-regexp)
	 ("C-M-r" . isearch-backward-regexp)))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("C-'" . counsel-imenu)
	 ("C-c s" . counsel-rg)
	 :map counsel-find-file-map
	 ("RET" . ivy-alt-done)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))


(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))


(use-package projectile
  :ensure t
  :config
  ;; Use it everywhere
  (projectile-mode t)
  :bind ("H-d" . projectile-find-file))


(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))


(use-package sly
  :ensure t
  :bind ("C-<return>" . sly-mrepl-return))

;; (unless (package-installed-p 'clojure-mode)
;;   (package-install 'clojure-mode))
(use-package clojure-mode
  :ensure t)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(use-package go-mode
  :ensure t
  :config (progn
	    (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
	    (add-hook 'go-mode-hook #'lsp-deferred)
	    (add-hook 'go-mode-hook #'yas-minor-mode)))

(use-package cider
  :ensure t)


(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))


(use-package flycheck-joker
  :after clojure-mode
  :ensure t)


(use-package nix-mode
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

;; (use-package lsp-mode
;;   :ensure t
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "s-l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (c-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)


;; (use-package ccls
;;   :ensure t
;;   :init (setq ccls-sem-highlight-method 'font-lock)
;;   :hook ((c-mode c++-mode objc-mode) . (lambda () (require 'ccls) (lsp))))


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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(org-agenda-files
   '("~/projects/hiring/qube/shortest-path/plan.org" "/home/samuel/org/tech.org" "/home/samuel/org/tasks.org"))
 '(package-selected-packages
   '(go-mode ace-window 0blayout ac-capf lua-mode rust-mode cmake-mode catppuccin-theme nix-mode sly-macrostep ox-gemini gemini-mode ccls lsp-mode flycheck-clj-kondo flycheck-joker flycheck vc-fossil use-package swoop sly rg projectile pod-mode perl6-mode paredit nord-theme markdown-mode+ magit fzf f elpher dumb-jump deadgrep csv-mode counsel company command-log-mode clojure-mode-extra-font-locking cider ace-jump-mode))
 '(safe-local-variable-values
   '((Base . 10)
     (Package . FIVEAM)
     (Syntax . Ansi-Common-Lisp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2E3440" :foreground "#D8DEE9" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 140 :width normal :foundry "ADBO" :family "Iosevka"))))
 '(cider-repl-stderr-face ((t (:inherit font-lock-warning-face :weight normal))))
 '(cider-test-error-face ((t (:background "#d08770"))))
 '(cider-test-failure-face ((t (:background "#BF616A"))))
 '(cider-test-success-face ((t (:background "#A3BE8C" :foreground "black"))))
 '(markdown-code-face ((t (:inherit fixed-pitch :family "Iosevka"))))
 '(markdown-pre-face ((t (:inherit ##)))))

(provide 'init)
;;; init.el ends here
