(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'magit)
(require 'cider)
(require 'clojure-mode)
(require 'eldoc)
(require 'paredit)
(require 'ace-jump-mode)

