(server-start)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/modular-configs/")

(load "packages")
(load "global-keybindings")
(load "clojure")

(load-theme 'zenburn t)

(display-time)

(setq split-height-threshold nil)

(desktop-save-mode 1)

(toggle-uniquify-buffer-names)

(setq-default indent-tabs-mode nil
              column-number-mode t
              display-battery-mode t
              blink-matching-paren t
              blink-matching-delay .25)

(fset 'yes-or-no-p 'y-or-n-p)

(ido-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/org/work.org")))
 '(tab-width 4)
 '(use-file-dialog nil))

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
                :height 200
                :width normal
                :foundry "apple"
                :family "Inconsolata")))))
