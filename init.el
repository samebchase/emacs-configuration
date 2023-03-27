;;; init.el --- Summary
;;; Commentary:
;;; Quite a lot of the setup is taken from Mr. S.U.V.R.A.T Apte,
;;; https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el

;;; Code:
;; (menu-bar-mode -1)
(tab-bar-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time)
(server-start)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/.cargo/bin")))
(setq exec-path (append exec-path '("~/bin")))
(setq exec-path (append exec-path '("/Users/samuel/.nvm/versions/node/v16.13.0/bin")))


(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")

(setenv "LANGUAGE" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")


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


(defun cider-repl-prompt-on-newline (ns)
  "Return a prompt string with newline.

   NS is the namespace information passed into the function by
   cider."
  (concat ns ">\n"))


;; This `setq-default` form adapted from https://github.com/suvratapte/dot-emacs-dot-d/blob/master/init.el
(setq-default
 ;; Don't use the compiled code if its the older package.
 load-prefer-newer t
 org-adapt-indentation t

 ;; Do not show the startup message.
 inhibit-startup-message t
 fzf/executable "/usr/local/bin/fzf"

 ;; Do not put 'customize' config in init.el; give it another file.
 ;; custom-file "~/.emacs.d/custom-file.el"

 ns-right-command-modifier 'hyper
 ns-right-option-modifier 'super

 cider-repl-prompt-function 'cider-repl-prompt-on-newline)

;; Change all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; Automatically update buffers if file content on the disk has changed.
(global-auto-revert-mode t)


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

;; (global-set-key (kbd "H-M-d") 'fzf-directory)
(global-set-key (kbd "H-s") 'save-buffer)

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
(global-set-key (kbd "H-!") 'org-time-stamp-inactive)
(global-set-key (kbd "H-M-'") 'org-edit-src-exit)
(global-set-key (kbd "H-o") 'org-agenda-open-link)
(global-set-key (kbd "s-/") 'org-capture)


(global-set-key (kbd "H--") 'text-scale-decrease)
(global-set-key (kbd "H-=") 'text-scale-increase)

(global-set-key (kbd "H-<up>") 'enlarge-window-horizontally)
(global-set-key (kbd "H-<down>") 'shrink-window-horizontally)

(global-set-key (kbd "H-<right>") 'enlarge-window)
(global-set-key (kbd "H-<left>") 'shrink-window)

(global-set-key (kbd "M-z") 'zap-up-to-char)


(defun uf/unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

(global-set-key (kbd "M-Q") 'uf/unfill-paragraph)


(require 'use-package)


(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))


(use-package magit
  :ensure t)


(use-package treemacs
  :ensure t)


(use-package lsp-treemacs
  :ensure t)


(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "s-r")
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3303
  ;; (define-key dap-mode-map [mouse-1] nil)
  :hook
  ((rust-mode . lsp)
   ;; (clojure-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)
   (java-mode . #'lsp-deferred))
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  :commands lsp)


(use-package lsp-java
  :ensure t
  :init
  (add-hook 'java-mode-hook #'lsp)
  :config
  ;; (define-key java-mode-map "," nil)
  ;; (define-key java-mode-map ";" nil)
  
  )


(use-package elfeed
  :ensure t)


(use-package yaml-mode
  :ensure t)


(use-package csv-mode
  :ensure t)


(use-package fzf
  :ensure t)


(use-package raku-mode
  :ensure t
  :defer t)


(defun my-cljr-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1))


(use-package toml-mode
  :ensure t)


(use-package clj-refactor
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'my-cljr-clojure-mode-hook))


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


(use-package ace-jump-mode
  :ensure t
  :bind (("C-." . ace-jump-mode)
	 ("C-c l" . ace-jump-line-mode)))


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
  :ensure t)

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


(add-to-list 'load-path "/Users/samuel/.opam/5.0.0~rc1/share/emacs/site-lisp")
(require 'ocp-indent)


(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(elfeed-feeds
   '("http://feeds.feedburner.com/explainextended" "https://webzine.puffy.cafe/atom.xml" "https://surfingcomplexity.blog/feed" "https://this-week-in-rust.org/rss.xml" "https://v2.ocaml.org/feed.xml" "https://buttondown.email/hillelwayne/rss" "https://mattlakeman.org/feed" "https://soatok.blog/b/rss" "https://xeiaso.net/blog.rss" "https://zerodha.tech/index.xml" "https://planet.postgresql.org/rss20.xml" "https://twitter.com/OpenZFS" "https://rakudoweekly.blog/blog-feed/" "https://www.dragonflydigest.com/feed" "https://vermaden.wordpress.com/posts/rss" "https://planet.emacslife.com/atom.xml" "http://planet.lisp.org/rss20.xml" "https://lethain.com/feeds.xml" "https://www.gwern.net/rss" "https://matt.might.net/articles/feed.rss" "https://acoup.blog/rss" "https://eli.thegreenplace.net/feeds/all.atom.xml" "https://newsletter.nixers.net/feed.xml" "https://www.undeadly.org/cgi?action=rss" "https://www.reddit.com/r/openbsd.rss" "https://www.reddit.com/r/rakulang.rss" "https://myme.no/feed.xml" "https://fasterthanli.me/index.xml" "https://ianthehenry.com/feed.xml" "https://databasearchitects.blogspot.com/feeds/posts/default"
     ("https://redecentralize.org/blog/feed.rss" blog decentralized)
     ("http://nullprogram.com/feed" blog programming)
     ("https://venam.nixers.net/blog/feed.xml" blog unix)))
 '(indent-tabs-mode nil)
 '(org-agenda-files
   '())
 '(org-capture-templates
   '(("c" "Code Review" entry
      (file+headline "~/org/tasks.org" "Code Reviews")
      "*** TODO [#B] %?%c" :prepend t)))
 '(org-refile-targets '((org-agenda-files :maxlevel . 3)))
 '(package-selected-packages
   '(jq-mode compat merlin log4j-mode elfeed toml-mode csv-mode yaml-mode nix-mode clj-refactor markdown-mode which-key use-package sly rg raku-mode projectile perlbrew nord-theme fzf flycheck-joker flycheck-clj-kondo elpher deadgrep counsel company cider ace-jump-mode))
 '(tab-bar-select-tab-modifiers '(hyper))
 '(warning-suppress-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2E3440" :foreground "#D8DEE9" :inverse-video nil :box nil :strike-through nil :extend nil :overline nil :underline nil :slant normal :weight regular :height 160 :width normal :foundry "nil" :family "Iosevka"))))
 '(cider-test-error-face ((t (:background "#bf616a" :foreground "#434c5e"))))
 '(cider-test-failure-face ((t (:background "#ebcb8b" :foreground "#434c5e"))))
 '(cider-test-success-face ((t (:background "#a3be8c" :foreground "#434c5e"))))
 '(fixed-pitch ((t (:weight bold :family "Iosevka"))))
 '(markdown-pre-face ((t (:inherit (markdown-code-face font-lock-constant-face) :weight semi-bold :family "Iosevka")))))

(provide 'init)
;;; init.el ends here
