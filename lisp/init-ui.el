
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)


(setq inhibit-splash-screen t)

;; 设置鼠标样式
(setq default-cursor-type 'bar)

;; 显示行号
(global-linum-mode t)

;; 设置为最大化
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
