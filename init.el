(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
	     '("org" . "https://orgmode.org/elpa/"))
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit 0blayout which-key ergoemacs-mode org-bullets counsel powerline evil-mc flycheck exec-path-from-shell company-ycmd jedi ein slime auctex evil-tutor ox-reveal ox-ioslide makey f s el-get w3m evil goto-chg quelpa))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/org-impress-js.el")
(require 'ox-reveal)
(setq org-reveal-root "file:///Users/Nidawaqar/reveal.js")
(setq org-use-property-inheritance t)
(exec-path-from-shell-initialize)
(company-mode 1)
(require 'ycmd)
(set-variable 'ycmd-server-command '("python3" "./ycmd/"))
(add-hook 'after-init-hook #'global-ycmd-mode)
(company-mode 1)
(global-flycheck-mode)
(require 'flycheck-ycmd)
(flycheck-ycmd-setup)
(require 'company-ycmd)
(company-ycmd-setup)
(require 'ycmd-eldoc)
(require 'which-key)
(which-key-mode 1)
(setq inhibit-compacting-font-caches t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(ivy-mode 1)
(add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup)
(electric-pair-mode 1)
(require 'ein)
(require 'xah-fly-keys)
(xah-fly-keys-set-layout "qwerty") ; required if you use qwerty

;; possible layout values:
;; "qwerty"
;; "qwerty-abnt"
;; "qwertz"
;; "dvorak"
;; "programer-dvorak"
;; "colemak"
;; "colemak-mod-dh"
;; "workman"

;; dvorak is the default

(xah-fly-keys 1)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
(eval-after-load 'w3m
  '(progn
     (define-key w3m-mode-map "q" 'w3m-previous-buffer)
     (define-key w3m-mode-map "w" 'w3m-next-buffer)
     (define-key w3m-mode-map "x" 'w3m-close-window)
     (define-key w3m-mode-map "z" 'w3m-delete-buffer)
     (define-key w3m-mode-map "p" 'w3m-copy-buffer)))

 ;; w3m search engine change (using duckduckgo lite)      
 (eval-after-load "w3m"                                   
 '(progn                                                  
 (require 'w3m-search)                                    
 (setq w3m-search-default-engine "duckduckgo")            
 (add-to-list 'w3m-search-engine-alist                    
	      '("duckduckgo" "http://www.duckduckgo.com/lite/?q=%s"))))
 (global-linum-mode 1)
(if (eq system-type 'darwin)
(global-set-key (kbd "s-SPC") 'xah-fly-command-mode-activate)
)
