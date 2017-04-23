(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)

(defvar s/packages '(
		     company
		     monokai-theme
		     hungry-delete
		     swiper
		     counsel
		     smartparens
		     js2-mode
		     nodejs-repl
		     exec-path-from-shell
		     popwin
		     ) "Default packages")
(setq package-selected-packages s/packages)
(defun s/packages-installed-p ()
  (loop for pkg in s/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (s/packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg s/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭scroll-bar
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode t)
;;关闭启动画面
(setq inhibit-startup-message t)
;; 自动缩进
;; (electric-indent-mode t)
;; 定义open-my-init-file打开~/.emacs.d/init.el文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 点击<f6>执行open-my-init-file
(global-set-key (kbd "<f5>") 'open-my-init-file)
;; 启用global-company-mode
(global-company-mode t)
;; 设置光标类型为线型
(setq-default cursor-type 'bar)
;; 设置不备份文件
(setq make-backup-files nil)
;; 设置不自动保存文件
(setq auto-save-default nil)
;; 在org文件中代码高亮
(require 'org)
(setq org-src-fontify-natively t)
;; 定义C-x C-r选择最近打开
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 开启删除选择模式
(delete-selection-mode t)
;; 启动emacs为全屏状态
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; 开启括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 高亮当前行
(global-hl-line-mode t)
;; 加载主题
(load-theme 'monokai t)
;; 使用hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;; 使用swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
;; 使用smartparens
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;; 使用js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))
;; 使用nodejs-repl
(require 'nodejs-repl)
;; 使用exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; find-function
(global-set-key (kbd "C-h C-f") 'find-function)
;; find-variable
(global-set-key (kbd "C-h C-v") 'find-variable)
;; find-function-on-key
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; ~/org 目录下 org-agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 修改 ~/.emacs.d/init.el 时自动加载
(global-auto-revert-mode t)

;; 使用popwin
(require 'popwin)
(popwin-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-minimum-prefix-length 1)
 '(company-tooltip-idle-delay 0.1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
