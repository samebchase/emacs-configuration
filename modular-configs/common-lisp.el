(add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook (lambda () (slime-autodoc-mode t)))
(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-connected-hook (lambda () (paredit-mode +1)))

(add-to-list 'load-path (expand-file-name "~/.quicklisp/"))
(load (expand-file-name "~/.quicklisp/slime-helper.el"))

(setq inferior-lisp-program "/usr/bin/sbcl")

(require 'slime)
(slime-setup '(slime-fancy))

(add-hook 'slime-mode-hook            'turn-on-eldoc-mode)
(add-hook 'lisp-mode-hook             'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
