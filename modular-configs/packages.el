(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)

(require 'magit)
(require 'eldoc)
(require 'cider)
(require 'paredit)
(require 'dired-x)
(require 'rust-mode)
(require 'clojure-mode)
(require 'ace-jump-mode)

