 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  C: turbocopier.                                                       �
 ; �  Copyright 1997 by Rocket Software                                     �
 ; �                                                                        �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Nert - error handler.                                                 �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN NERT (shk /)
  (setq *error* esav)
  (if (/= shk "Function cancelled") (write-line shk))
  (setvar "snapmode" snapp)
 (princ))
 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  Nert end.                                                             �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸

 ; 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
 ; �  C - no relation to the language...well, not much.                     �
 ; 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
 (DEFUN C:TCOPY (/ ss)
  (setq esav *error*)
  (setq *error* nert)
  (setq snapp (getvar "snapmode"))
  (setvar "snapmode" 0)
  (if (setq ss (ssget))
      (command "copy" ss "" "m"))
  (setvar "snapmode" snapp)
  (setq *error* esav)
 (princ))