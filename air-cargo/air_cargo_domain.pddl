; Domain description
; Describe the relations and transitions that can occur
; This one describes the air cargo transport problem from the book
(define (domain air_cargo)

    ; Define what the planner must support to execute this domain
    ; Only domain requirements are currently supported
    (:requirements
        :strips                 ; basic preconditions and effects
        :negative-preconditions ; to use not in preconditions
        :equality               ; to use = in preconditions
        ; :typing               ; to define type of objects and parameters
    )
    
    ; Define the relations
    ; Question mark prefix denotes free variables
    (:predicates
        (plane ?p) ; ?p is a plane
        (airport ?a) ; ?a is an airport
        (cargo ?c) ; ?c is cargo
        (contains ?p ?c) ; plane ?p contains cargo ?c
        (at ?x ?a) ; thing ?x is at airport ?a
        (empty ?p) ; plane ?p is empty
    )
    
    ;load cargo onto airplane
    (:action load
        :parameters(?c ?p ?a)
        :precondition(and
            (cargo ?c)
            (plane ?p)
            (airport ?a)
            (at ?c ?a)
            (at ?p ?a)
        )
        :effect(and
            (contains ?p ?c)
            (not (at ?c ?a))
        )
    )
    
    ; unload cargo from plane
    (:action unload
        :parameters(?c ?p ?a)
        :precondition(and
            (cargo ?c)
            (plane ?p)
            (airport ?a)
            (contains ?p ?c)
            (at ?p ?a)
        )
        :effect (and
            (at ?c ?a)
            (not (contains ?p ?c))
        )
    )
    
    ; fly plane to another airport
    (:action fly
        :parameters(?p ?from ?to)
        :precondition(and
            (plane ?p)
            (airport ?from)
            (airport ?to)
            (at ?p ?from)
        )
        :effect(and
            (at ?p ?to)
            (not (at ?p ?from))
        )
    )
)