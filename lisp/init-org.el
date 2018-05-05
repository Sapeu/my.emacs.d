
(require 'org)
;; 设置org-mode中src代码高亮
(setq org-src-fontify-natively t)

;; 设置org-mode
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
