;; 关闭提示音
(setq ring-bell-function 'ignore)

;; 修改 ~/.emacs.d/init.el 时自动加载
(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode t)

;; 自定义缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("mst" "Microsoft")
					    ))

;; 设置不备份文件
(setq make-backup-files nil)

;; 设置不自动保存文件
(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; 开启删除选择模式
(delete-selection-mode t)

;; 开启括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; (setq enable-recursive-minibuffers t)

;; 自动缩进
;; (electric-indent-mode t)


(provide 'init-better-defaults)
