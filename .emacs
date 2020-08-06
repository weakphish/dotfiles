(package-initialize)

(scroll-bar-mode -1)

;; C-c <left> and C-c <right> to undo and redo window layout changes
(winner-mode 1)

;; Auto-pair things like quotes, braces, parens, etc.
(electric-pair-mode 1)
(show-paren-mode 1)

(global-display-line-numbers-mode)

(setq inhibit-startup-message t)

(setq ring-bell-function 'ignore)

;; org-mode logs when a task is moved to done.
(setq org-log-done t)

;; Put all backup files in ~/.saves
(setq backup-directory-alist '(("." . "~/.saves/")))

;; Always copy when backing up, instead of moving.
(setq backup-by-copying t)

;; Put auto-save files in ~/.saves
(setq auto-save-file-name-transforms '((".*" "~/.saves/" t)))
(setq tab-width 4) ; or any other preferred value

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package gruvbox-theme
  :ensure t)
(enable-theme 'gruvbox)
(set-frame-font "JetBrains Mono 12" nil t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(require 'evil)
 (evil-mode 1)

(use-package company
  :ensure t
  :hook ((after-init) . global-company-mode)
  :config
  (setq company-idle-delay 0))
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t))

(use-package counsel
  :after ivy
  :ensure t
  :config
  (counsel-mode))

(use-package swiper
  :after ivy
  :ensure t
  :bind ("C-s" . swiper))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-c C-SPC" . ace-jump-mode))

(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs
	       '(java-mode . (eglot-eclipse-jdt "jdtls"))) ;; need a special handler for jdtls
  (add-hook 'java-mode-hook #'eglot-ensure)
  (add-hook 'js-mode-hook #'eglot-ensure)
  (add-hook 'python-mode-hook #'eglot-ensure)
  (add-hook 'rust-mode-hook #'eglot-ensure))

(use-package projectile
  :after ivy
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  :bind-keymap ("C-c p" . projectile-command-map))

;; (use-package pdf-tools
;;  :ensure t
;;  :config
;;  (pdf-tools-install)
;;  (add-hook 'pdf-view-mode-hook (lambda ()
(use-package rust-mode
  :ensure t
  :config
  (add-hook 'rust-mode-hook
	    (lambda () (setq indent-tabs-mode nil))))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package yaml-mode
  :ensure t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (rjsx-mode rust-mode yaml-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pdf-tools pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text magit macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag gruvbox-theme google-translate golden-ratio go-guru go-eldoc flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav eglot dumb-jump diminish define-word counsel company column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1" :family "JetBrains Mono" :foundry "JB  " :slant normal :weight normal :height 120 :width normal)) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf" :family "JetBrains Mono" :foundry "JB  " :slant normal :weight normal :height 120 :width normal)))))
