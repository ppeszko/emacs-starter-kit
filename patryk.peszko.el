;;
(menu-bar-mode 1)

(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line)

(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
(require 'textmate)
(textmate-mode)

(add-to-list 'load-path
                  "~/.emacs.d/vendor/yasnippet.el")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet.el/snippets")

(setq cursor-type "hollow")
(setq default-cursor-in-non-selected-windows nil)
(blink-cursor-mode 0.5)