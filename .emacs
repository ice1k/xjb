;;; package --- .emacs

;;; Code:
;;; Commentary:
 
(setq tab-width 2)

(setq user-full-name "ice1000")
(setq user-mail-address "ice1000kotlin@foxmail.com")

(display-time-mode 1)
(set-language-environment "UTF-8")
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

(setq-default make-backup-files nil)
(setq buffer-file-coding-system 'utf-8)
(setq inhibit-startup-message t)
(put 'LaTeX-hide-environment 'disabled nil)
(auto-image-file-mode t)

(require 'package)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
				("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(global-unset-key (kbd "C-z"))

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 3 60) 'recentf-save-list)

;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(server-start)

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-modes
	 (quote
		(emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode markdown-mode dart-mode shell-mode kotlin-mode haskell-mode fundamental-mode rust-mode yaml-mode csharp-mode latex-mode llvm-mode nxml-mode idris-mode makefile-mode groovy-mode html-mode)))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(display-time-mode t)
 '(flycheck-hlint-args nil)
 '(flycheck-hlint-ignore-rules nil)
 '(flyspell-abbrev-p t)
 '(flyspell-after-incorrect-word-string nil)
 '(font-use-system-font t)
 '(global-auto-complete-mode t)
 '(global-indent-info-mode t nil (indent-info))
 '(global-linum-mode t)
 '(global-whitespace-mode nil)
 '(idris-interpreter-path "/home/ice1000/.cabal/bin/idris")
 '(indent-guide-global-mode t)
 '(indent-info-tab-width-max 2)
 '(ispell-program-name "aspell")
 '(nyan-mode nil)
 '(package-selected-packages
	 (quote
		(cmake-mode github-stars brainfuck-mode easy-jekyll figlet hlinum gh-md w3m mwe-log-commands nyan-mode neotree git-commit electric-operator chinese-word-at-point indent-info mines paredit-everywhere paredit flycheck-kotlin flycheck-julia flycheck-haskell flycheck-color-mode-line flycheck-clang-tidy flycheck-clang-analyzer flycheck-ocaml flycheck-rust zone-sl latex-extra auctex yaml-mode zone-rainbow zone-nyan scala-mode sbt-mode rust-mode ruby-test-mode mode-icons markdown-preview-mode markdown-mode+ llvm-mode kotlin-mode jekyll-modes j-mode indent-guide idris-mode ibuffer-git haskell-mode groovy-mode go-mode elm-mode dart-mode d-mode csharp-mode bing-dict ace-flyspell ac-c-headers)))
 '(paredit-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(standard-indent 2)
 '(tab-width 2)
 '(tree-widget-image-enable t))

;; (load-path "/home/ice1000/.emacs.d/")

(global-set-key (kbd "C-c d") 'bing-dict-brief)
(setq bing-dict-save-search-result t)
(setq gitter-token "")

(require 'zone)
;; (setq zone-programs [ zone-nyan ])
(zone-when-idle 120)
(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))

(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; (eval-after-load 'flycheck
;;   (progn
;;     (require 'flycheck-kotlin)
;;     (flycheck-kotlin-setup)))

(if (string-prefix-p "agda" (shell-command-to-string "agda version") t)
		(load-file
		 (let ((coding-system-for-read 'utf-8))
			 (shell-command-to-string "agda-mode locate"))))

(set-frame-parameter (selected-frame) 'alpha '(85 80))
(add-to-list 'default-frame-alist '(alpha . (85 . 80)))

(defun toggle-transparency ()
  "Toggle the transparency value."
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
		    ((numberp (cdr alpha)) (cdr alpha))
		    ;; Also handle undocumented (<active> <inactive>) form.
		    ((numberp (cadr alpha)) (cadr alpha)))
	      100)
	 '(85 . 80) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(thing-at-point 'chinese-or-other-word)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Sarasa Mono SC" :foundry "CYEL" :slant normal :weight normal :height 158 :width normal))))
 '(agda2-highlight-operator-face ((t (:inherit font-lock-variable-name-face)))))
