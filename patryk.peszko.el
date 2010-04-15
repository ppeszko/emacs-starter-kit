;;
(menu-bar-mode 1)

(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line)

;;textmate-mode
;;(add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
;;(require 'textmate)
;;(textmate-mode)

(add-to-list 'load-path
                  "~/.emacs.d/vendor/yasnippet.el")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet.el/snippets")

(setq cursor-type "hollow")
(setq default-cursor-in-non-selected-windows nil)
(blink-cursor-mode 0.5)

;;eshell banner
(setq eshell-banner-message "Welcome Patryk on the Emacs shell\n\n")
;; clearing eshell
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;shell color and read only prompt
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;; Rinari
;;(add-to-list 'load-path "~/.emacs.d/vendor/rinari/rinari.el")
;;(require 'rinari)

;;(require 'color-theme)

;;OpenPeepcode
;; (add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
;; (require 'textmate)
;; (textmate-mode)
;; (add-to-list 'load-path "~/.emacs.d/vendor/")
;; (require 'peepopen)

;; Color Themes
;; (add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
;; (require 'color-theme)
;; (color-theme-initialize)

;; ;; Activate theme
;; (load (concat dotfiles-dir "topfunky/theme.el"))
;; (color-theme-subtle-hacker
