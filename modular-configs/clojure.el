(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)

(add-hook 'clojure-mode-hook 'cider-mode)

(eval-after-load 'cider
  '(progn
    (add-hook 'cider-repl-mode-hook 'paredit-mode)
    (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)))

(eval-after-load 'paredit
  '(progn
    (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
    (define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)
    (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
    (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)))

(setq cider-repl-history-file "/Users/samuel/.cider-repl.log")
(setq cider-repl-wrap-history t)


