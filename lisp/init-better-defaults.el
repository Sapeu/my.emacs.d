
(setq ring-bell-function 'ignore)

;; 自动加载
(global-auto-revert-mode t)

(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("6p" "paul")
					    ("6m" "Mac OS")
					    ))

;; 显示行号
(global-linum-mode t)


;; 关闭自动备份文件
(setq make-backup-files nil)
;; 关闭自动保存文件
(setq auto-save-default nil)

;; 最近文件配置
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 可以替换选中的文字
(delete-selection-mode t)

(setq enable-recursive-minibuffers t)

(provide 'init-better-defaults)
