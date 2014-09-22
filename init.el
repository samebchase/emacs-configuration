;; (menu-bar-mode -1)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/modular-configs/")

(load "packages")
(load "general-init")
(load "keybindings")

;; Package specific

;; Language specific

(load "clojure")

;; (load "common-lisp")
;; (load "ocaml")
;; (load "python")
;; (load "latex")
;; (load "proof-general")



