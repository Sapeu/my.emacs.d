;; 关闭工具栏
(tool-bar-mode -1)

;; 关闭scroll-bar
(scroll-bar-mode -1)

;;关闭启动画面
(setq inhibit-startup-message t)

;; 设置光标类型为线型
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode t)

;; 启动emacs为全屏状态
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;;###autoload
(defun test-autoload()
  (interactive)
  (message "Test autoload"))

(provide 'init-ui)
