;;
(menu-bar-mode 1)

(global-set-key (kbd "A-/") 'comment-or-uncomment-region-or-line)

;;textmate-mode
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


;; flymake for ruby
(require 'flymake)

;; I don't like the default colors :)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))