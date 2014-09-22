(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'magit)
(require 'paredit)
(require 'clojure-mode)
(require 'eldoc)
(require 'ace-jump-mode)

