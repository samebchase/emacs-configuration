(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'magit)
(require 'eldoc)
(require 'paredit)
(require 'clojure-mode)
(require 'ace-jump-mode)

