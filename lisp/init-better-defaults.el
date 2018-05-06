
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

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region"))
      (progn
	(indent-buffer)
	(message "Indent Buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; 替换yes或者no为y或者n
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置一直是递归删除和递归拷贝
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(require 'dired)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

(provide 'init-better-defaults)
