(require 'package)

;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)

(require 'magit)
(require 'cider)
(require 'clojure-mode)
(require 'eldoc)
(require 'paredit)
(require 'ace-jump-mode)

