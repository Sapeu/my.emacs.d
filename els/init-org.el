;; 在org文件中代码高亮
(require 'org)
(setq org-src-fontify-natively t)

;; ~/org 目录下 org-agenda
(setq org-agenda-files '("~/org"))

(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
