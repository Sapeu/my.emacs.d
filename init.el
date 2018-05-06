;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; 定义打开emacs配置文件方法
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; (require 'init-packages)
;; (require 'init-ui)
;; (require 'init-better-defaults)
;; (require 'init-org)
;; (require 'init-keybindings)

;; load-file and load
;; (Load"init-packages")
;; (Load "init-ui")
;; (load "init-better-defaults")
;; (Load "init-keybindings"
;; (Load "init-org")

(load-file "~/.emacs.d/lisp/init-packages.elc")
(load-file "~/.emacs.d/lisp/init-ui.elc")
;;(load-file "/.emacs.d/lisp/init-better-defaults.elc")
(load-file "~/.emacs.d/lisp/init-keybindings.elc" )
(load-file "~/.emacs.d/lisp/init-org.el" )

(autoload 'test-autoload "init-better-defaults")
(test-autoload)

(update-file-autoloads "~/.emacs.d/lisp/init-better-defaults.el" t "~/.emacs.d/lisp/init-better-defaults-autoload.el")

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
