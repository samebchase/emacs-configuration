;; Other Frame

(global-set-key (kbd "<f5>") 'other-frame)

;; Ibuffer

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Ace Jump Mode

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-c l") 'ace-jump-line-mode)

;; Backspace

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help)
