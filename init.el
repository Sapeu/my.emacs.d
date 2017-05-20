;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; dired
;; 按 C+x d 进入当前文件的目录
;; 回车 进入 dired buffer
;; 按 + 创建文件夹
;; 按 C+x C+f 选择文件时无文件会创建文件
;; 按 g 刷新 dired buffer
;; 按 c 复制文件
;; 按 d 选定要的删除文件 按 U 执行删除
;; 按 D 会询问是否删除文件
;; 按 R 重名民文件

(package-initialize)
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


