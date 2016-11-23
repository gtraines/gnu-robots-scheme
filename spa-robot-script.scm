;;; Using the Sense-Plan-Act Paradigm in GNU Robots Randomly-Generated Maps
;;; Graham Traines
;;; Scheme Script Interpreted in Guile

;;; Administrative Functions

(use-modules (ice-9 pretty-print))

;;; Helper Functions
(define (walk-list lst func)
  (if (not (list? lst))
      (func lst)
      (if (not (null? lst))
	  (begin
	    (walk-list (car lst) func)
	    (walk-list (cdr lst) func)))))

;;; Sense

;;; Define Task Environment:
;;; Performance Measures ~ Environment ~ Actuators ~ Sensors

;;; ******************************
;;; **** Performance Measures ****
;;; ******************************

(define (cost-turn) '-2)
(define (cost-move) '-2)
(define (cost-grab) '-5)
(define (cost-zap) '-10)
(define (cost-smell) '-1)
(define (cost-feel) '-1)
(define (cost-look) '-1)

;;; Robot's current shield level
(define (get-shields)
  (robot-get-shields))

;;; Robot's current energy level
(define (get-energy)
  (robot-get-energy))

;;; How many prizes the robot has picked up
(define (get-score)
  (robot-get-score))

;;; ******************************
;;; **** Environment Sensing  ****
;;; ******************************

(define (smell-enemy)
  (pretty-print "Smell enemy?")
  (pretty-print (robot-smell "baddie")))

(define (smell-space)
  (pretty-print "Smell empty space?")
  (pretty-print (robot-smell "space")))

(define (sensor-cycle sensor-list)
  (pretty-print "Running sensor cycle")
  (walk-list sensor-list (lambda (sensor) (display (sensor)))))
    
(define (startup-bot)
  (pretty-print "Starting up robot")
  (robot-turn 1))

(startup-bot)
(sensor-cycle ((smell-space) (smell-enemy)))
