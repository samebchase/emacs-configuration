(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/modular-configs/")

(load "packages")
(load "global-keybindings")
(load "common-lisp")
(load "clojure")
(load "elisp")

(load-theme 'nord t)

(display-time)
(desktop-save-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)

(server-start)

(setq-default indent-tabs-mode nil
              ;; dired-omit-files-p t
              ;; dired-omit-files (concat dired-omit-files "\\|^\\..+$")
              inhibit-startup-screen t
              use-file-dialog nil
              tab-width 4
              column-number-mode t
              display-battery-mode t
              blink-matching-paren t
              blink-matching-delay .25
              split-height-threshold nil
              mac-option-modifier 'super
              mac-command-modifier 'meta)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Inconsolata")))))

(setenv "LD_LIBRARY_PATH"
  (concat
   "/home/samuel/builds/rust/master/install/lib/"
   (getenv "LD_LIBRARY_PATH")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("850213aa3159467c21ee95c55baadd95b91721d21b28d63704824a7d465b3ba8" default)))
 '(package-selected-packages
   (quote
    (perl6-mode nord-theme markdown-mode markdown-mode+ zenburn-theme rut-smode paredit magit cider ace-jump-mode)))
 '(safe-local-variable-values
   (quote
    ((c-file-offsets
      (innamespace . 0)
      (inline-open . 0)
      (case-label . +))))))
