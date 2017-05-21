
;; (package-initialize)

(add-to-list 'load-path "~/.emacs.d/els")
;; 定义open-my-init-file打开~/.emacs.d/init.el文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; require 依赖 load 依赖 load-file
(require 'init-packages)
;; (load "init-packages")
;; (load-file "~/.emacs.d/lisp/init-packages.elc")
(require 'init-ui)
;; (autoload 'test-autoload "init-ui")
;; (test-autoload)
;; (update-file-autoloads "~/.emacs.d/els/init-ui.el" t "~/.emacs.d/els/custom-autoload.el")
;; (require 'custom-autoload)
;; (test-autoload)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq custom-file (expand-file-name "els/custom.el" user-emacs-directory))
(load-file custom-file)
