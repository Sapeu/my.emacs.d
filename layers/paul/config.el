;; 开启行号显示
(global-linum-mode t)

;; 将 occur 的 buffer 中的光标移动方式修改为 HJKL
(evilified-state-evilify-map occur-mode-map
  :mode occur-mode)

;; dwin = do what i mean.
(defun occur-dwim ()
  "Call `occur' with a sane default."
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
