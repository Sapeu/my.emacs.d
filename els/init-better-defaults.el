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

;; 选中的内容
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; 判断是选中内容格式化合适整个内容格式化
(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;; 补全(暂时不管用 mac 上可能管用 commd+斜杠)
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

;; 询问 yes or no 时,更换为简写的 y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 在 dired 中删除或拷贝询问是否递归时,不提示,默认选递归操作
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; 每次在 dired 下打开目录时不生成新的 buffer
(put 'dired-find-alternate-file 'disabled nil)
;; with-eval-after-load 在 dired 时执行程序,避免 require 加载慢
(with-eval-after-load 'dired
  ;; require 加载慢
  ;; (require 'dired)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  )
(require 'dired-x)
(setq dired-dwim-target t)

;; 显示匹配的括号
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it))))

;; 隐藏DOS换行符(^M)
(defun hidden-dos-eol ()
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; 删除DOS换行符(^M)
(defun remove-dos-eol ()
  (interactive)
  (goto-char) (point-min)
  (while (search-forward "\r" nil t) (replace-match "")))

;; 将选中区域默认为搜索关键字
(defun occur-dwin ()
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(provide 'init-better-defaults)
