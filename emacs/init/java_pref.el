
;;jdee stuff, mainly kept for reference
(custom-set-variables

 '(jde-global-classpath (split-string classpath jde-classpath-separator))
 '(jde-jdk-registry (quote (("1.6.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0"))))
 '(jde-sourcepath (quote ("/Users/jdatko/cs510/svn/othello/trunk/src/")))
 '(transient-mark-mode nil))


;;custome jdee stuff for my current project
(setq jde-make-working-directory "/Users/jdatko/cs510/svn/othello/trunk")
(add-to-list 'jde-global-classpath "/Users/jdatko/cs510/svn/othello/trunk/classes/")
(setq jde-run-application-class "edu.drexel.cs.ai.othello.Othello")
(setq jde-run-working-directory "/Users/jdatko/cs510/svn/othello/trunk")
