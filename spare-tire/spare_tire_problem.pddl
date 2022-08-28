; Problem description
; Describe one scenario within the domain constraints
; This one describes the spare tire problem from the book
(define (problem spare_tire_problem)
  (:domain tire_change)

  ; Objects are candidates to replace free variables
  (:objects flat spare ground trunk axle)

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    (tire flat)
    (tire spare)
    (tire_location trunk)
    (tire_location axle)
    (ground ground)
    (on flat axle)
    (on spare trunk)
  )

  ; The goal state describe what we desire to achieve
  (:goal
    (on spare axle)
  )
)