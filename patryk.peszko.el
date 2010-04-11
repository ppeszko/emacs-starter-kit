;;
(menu-bar-mode 1)

(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line)

(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
    (require 'textmate)
    (textmate-mode)