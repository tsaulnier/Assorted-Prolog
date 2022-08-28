; Problem description
; Describe one scenario within the domain constraints
(define (problem air_cargo_problem)
  (:domain air_cargo)

  ; Objects are candidates to replace free variables
  (:objects jfk sfo c1 c2 p1 p2)

  ; The initial state describe what is currently true
  ; Everything else is considered false
  (:init
    (airport jfk)
    (airport sfo)
    (cargo c1)
    (cargo c2)
    (plane p1)
    (plane p2)
    (at c1 sfo)
    (at c2 jfk)
    (at p1 sfo)
    (at p2 jfk)
  )

  ; The goal state describe what we desire to achieve
  (:goal (and
    (at c1 jfk)
    (at c2 sfo)
  ))
)