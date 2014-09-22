(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'clojure-mode-hook #'enable-paredit-mode)

(setq nrepl-buffer-name-separator "-"
      nrepl-buffer-name-show-port t
      cider-switch-to-repl-command 'cider-switch-to-current-repl-buffer)

(add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

;; (add-hook 'clojure-mode-hook 'cider-mode)

;; (add-hook 'clojure-mode-hook 'paredit-mode)

;; (eval-after-load 'cider
;;    '(progn
;;      (add-hook 'cider-repl-mode-hook 'paredit-mode)))

;; (setq cider-repl-history-file "cider-repl.log")
;; (setq cider-repl-wrap-history t)

;; (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
;; (define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)
;; (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
;; (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)


