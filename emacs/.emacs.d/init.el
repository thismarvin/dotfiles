;; General
(setq visible-bell t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Better Scrolling?
;;;; Yoinked from https://stackoverflow.com/a/42878636
(setq
 scroll-conservatively 1000                     ;; Only 'jump' when moving this far.
 scroll-margin 4                                ;; Scroll N lines to screen edge.
 scroll-step 1                                  ;; Keyboard scroll one line at a time.
 mouse-wheel-scroll-amount '(6 ((shift) . 1))   ;; Mouse scroll N lines.
 mouse-wheel-progressive-speed nil              ;; Don't accelerate scrolling.

 redisplay-dont-pause t                         ;; Don't pause display on input.

 ;; Always redraw immediately when scrolling, more responsive and doesn't hang!
 fast-but-imprecise-scrolling nil
 jit-lock-defer-time 0
 )

(delete-selection-mode 1)
(global-auto-revert-mode 1)

;; User Interface
(menu-bar-mode 1)
(tool-bar-mode -1)
(show-paren-mode 1)

(blink-cursor-mode 1)
(setq-default cursor-type 'bar)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(global-display-fill-column-indicator-mode 1)
(setq display-fill-column-indicator-column 100)

(load-theme 'modus-vivendi t)

(set-frame-font "JetBrains Mono Bold 13" nil t)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   '("deddb3d85a1d464eeb3e1990039a508d5374a38be16c85498279977383ba40a8" "6c4c97a17fc7b6c8127df77252b2d694b74e917bab167e7d3b53c769a6abb6d6" "753f94728bb9d1e50ec142acd6f91642ade3e7c56ffa1a79da1b25bb709ccdf0" default))
 '(package-selected-packages
   '(tree-sitter-langs tree-sitter magit-delta rust-mode astyle avy flycheck flyspell-correct-ivy magit lsp-ui company ccls lsp-mode editorconfig)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; flyspell
(add-hook 'text-mode-hook #'flyspell-mode)

;; tree-sitter
(require 'tree-sitter)
(require 'tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; editorconfig
(editorconfig-mode 1)

;; magit-delta
(add-hook 'magit-mode-hook #'magit-delta-mode)

;; lsp-mode
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; ivy
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)

;; avy
(global-set-key (kbd "C-;") 'avy-goto-char)

;; astyle
(require 'astyle)
(add-hook 'c-mode-hook #'astyle-on-save-mode)
