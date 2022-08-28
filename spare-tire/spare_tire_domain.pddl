; Domain description
; Describe the relations and transitions that can occur
; This one describes the air cargo transport problem from the book
(define (domain tire_change)

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
        (tire ?t) ; ?t is a tire
        (ground ?g) ; ?g is the ground, any amount of tires can be here
        (tire_location ?tl) ; ?tl is a location for a single tire
        (on ?t ?x) ; tire ?t is at location ?x
    )
    
    ;remove tire from trunk or axle and put on ground
    (:action remove
        :parameters(?t ?g ?tl)
        :precondition(and
            (tire ?t)
            (ground ?g)
            (tire_location ?tl)
            (on ?t ?tl)
        )
        :effect(and
           (not(on ?t ?tl))
           (on ?t ?g)
           (empty ?tl)
        )
    )
    
    ; take tire from ground and put on axle or in trunk
    (:action putOn
        :parameters(?t ?g ?tl)
        :precondition(and
           (tire ?t)
           (ground ?g)
           (tire_location ?tl)
           (on ?t ?g)
           (empty ?tl)
        )
        :effect (and
            (not(on ?t ?g))
            (on ?t ?tl)
            (not(empty ?tl))
        )
    )
    
    ; leave car overnight and remove all tires
    (:action leaveOvernight
        :parameters(?t1 ?t2 ?tl1 ?tl2 ?g)
        :precondition()
        :effect(and
            (not(at ?t1 ?tl1))
            (not(at ?t1 ?tl2))
            (not(at ?t1 ?g))
            (not(at ?t2 ?tl1))
            (not(at ?t2 ?tl2))
            (not(at ?t2 ?g))
        )
    )
)