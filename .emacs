(setq tab-width 2)
(setq default-tab-width 2)
(setq java-basic-offset 2)

(require 'package)
(setq package-archives
			'(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
				("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.1)
 '(ac-modes
	 (quote
		(emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode markdown-mode dart-mode shell-mode kotlin-mode haskell-mode fundamental-mode rust-mode yaml-mode csharp-mode latex-mode llvm-mode nxml-mode idris-mode)))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(flyspell-abbrev-p t)
 '(flyspell-after-incorrect-word-string nil)
 '(font-use-system-font t)
 '(global-auto-complete-mode t)
 '(global-linum-mode t)
 '(idris-interpreter-path "/home/ice1000/.cabal/bin/idris")
 '(ispell-program-name "aspell")
 '(package-selected-packages
	 (quote
		(yaml-mode zone-select zone-rainbow zone-nyan scala-mode sbt-mode rust-mode ruby-test-mode mode-icons markdown-preview-mode markdown-mode+ llvm-mode kotlin-mode jekyll-modes j-mode indent-guide idris-mode ibuffer-git haskell-mode groovy-mode go-mode gited elm-mode dart-mode d-mode csharp-mode bing-dict ace-flyspell ac-c-headers)))
 '(show-paren-mode t)
 '(size-indication-mode t))


(when (window-system)
  (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

; (load-path "/home/ice1000/.emacs.d/")

(global-set-key (kbd "C-c d") 'bing-dict-brief)
(setq bing-dict-save-search-result t)
;; (setq zone-when-idle t 90)
(setq gitter-token "")

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun package-installed-and-up-to-date-p (package)
	;; assumes that package-refresh-contents has already been called
	;; also assume all built-in packages are out of date, which is usually true.
  (if (not (package-installed-p package))
			nil
    (let* ((newest-desc  (cdr (assq package package-archive-contents)))
           (installed-desc (cdr (or (assq package package-alist) (assq package package--builtins))))
           (newest-version  (package-desc-vers newest-desc))
           (installed-version (package-desc-vers installed-desc)))
			(or (equal installed-version newest-version) (version-list-< newest-version installed-version)))))

(message "%s" "Emacs Prelude is now refreshing its package database...")
(package-refresh-contents)
(message "%s" " done.")

(defvar gordon-packages
	'(color-theme
		org auctex frame-cmds frame-fns
		bash-completion csharp-mode openwith git-commit-mode
		magit auto-complete smex rainbow-delimiters dsvn
		ggtags goto-chg undo-tree)
  "Packages that will be installed/updated to the latest version on startup")

(dolist (package gordon-packages)
  (when (not (package-installed-and-up-to-date-p package))
    (package-install package)))

(dolist (upgradeable-packgage (package-menu--find-upgrades))
  (package-install upgradeable-packgage))
