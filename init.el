;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "https://elpa.emacs-china.org/melpa/") t)
  )

(require 'cl)

(defvar paul/packages '(
			company
			cherry-blossom-theme
			hungry-delete
			;; smex
			swiper
			counsel
			smartparens
			js2-mode
			nodejs-repl
			exec-path-from-shell
			) "Default packages")

;; 设置选中的packages
(setq package-selected-packages paul/packages)

(defun paul/packages-installed-p ()
  (loop for pkg in paul/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (paul/packages-installed-p)
  (message "%s" "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg paul/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; (electric-indent-mode -1)
(setq inhibit-splash-screen t)

;; (linum-mode t)
;; 显示行号
(global-linum-mode t)

;; 定义打开emacs配置文件方法
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 设置调用打开emacs配置文件方法快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 最近文件设置
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
;; 设置快捷键打开最近文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 设置自动补全
(global-company-mode t)

;; (setq cursor-type 'bar)
;; 设置鼠标样式
(setq default-cursor-type 'bar)

;; 关闭自动备份文件
(setq make-backup-files nil)

(require 'org)
;; 设置org-mode中src代码高亮
(setq org-src-fontify-natively t)

;; 可以替换选中的文字
(delete-selection-mode t)

;; 设置为最大化
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

;; 设置主题
(load-theme 'cherry-blossom t)

;; 设置一次性删除多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 设置smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; 配置swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 设置smartparens，括号匹配
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; 设置js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; 使用nodejs-repl
(require 'nodejs-repl)

;; 配置exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 查找方法快捷键
(global-set-key (kbd "C-h C-f") 'find-function)

;; 查找变量快捷键
(global-set-key (kbd "C-h C-v") 'find-variable)

;; 设置按照按键查找方法
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 设置org-mode
;; (setq org-agenda-files '("~/org")
      ;; (global-set-key (kbd "C-c a") 'org-agenda))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("cc60d17db31a53adf93ec6fad5a9cfff6e177664994a52346f81f62840fe8e23" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
