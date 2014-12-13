(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/modular-configs/")

(load "packages")
(load "global-keybindings")
(load "common-lisp")
(load "clojure")
(load "elisp")

(load-theme 'zenburn t)
(display-time)
(desktop-save-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(ido-mode t)

(server-start)

(setq-default indent-tabs-mode nil
              inhibit-startup-screen t
              use-file-dialog nil
              tab-width 4
              column-number-mode t
              display-battery-mode t
              blink-matching-paren t
              blink-matching-delay .25
              split-height-threshold nil
              mac-option-modifier 'super
              mac-command-modifier 'meta
              org-agenda-files "~/org/work.org")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil
                :stipple nil
                :background "#3F3F3F"
                :foreground "#DCDCCC"
                :inverse-video nil
                :box nil
                :strike-through nil
                :overline nil
                :underline nil
                :slant normal
                :weight normal
                :height 150
                :width normal
                :foundry "unknown"
                :family "Inconsolata")))))
