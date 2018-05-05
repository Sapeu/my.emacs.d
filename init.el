;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)

;; (electric-indent-mode -1)

;; (linum-mode t)

;; 定义打开emacs配置文件方法
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 设置调用打开emacs配置文件方法快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 最近文件设置
(require 'recentf)

;; 设置快捷键打开最近文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 可以替换选中的文字
(delete-selection-mode t)


;; 设置smex
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)



;; 配置exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; 查找方法快捷键
(global-set-key (kbd "C-h C-f") 'find-function)

;; 查找变量快捷键
(global-set-key (kbd "C-h C-v") 'find-variable)

;; 设置按照按键查找方法
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


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
 '(js2-external-variable ((t (:foreground "dark gray")))))
