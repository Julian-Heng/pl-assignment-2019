#!/usr/bin/env gst


Object subclass: Fizzbuzz [
    | start |
    | end |

    init [
        self setStart: 1.
        self setEnd: 100.
    ]

    main [
        self getStart to: self getEnd do: [ :i |
            self printFizz: i.
            self printBuzz: i.
            self printNormal: i.
            Transcript cr.
        ]
    ]

    printFizz: num [
        ((num \\ 3) == 0)
            ifTrue: [ Transcript show: 'Fizz' ]
    ]

    printBuzz: num [
        ((num \\ 5) == 0)
            ifTrue: [ Transcript show: 'Buzz' ]
    ]

    printNormal: num [
        ((num \\ 3) == 0) | ((num \\ 5) == 0)
            ifFalse: [ Transcript show: num printString ]
    ]

    setStart: newStart [ start := newStart ]
    setEnd: newEnd [ end := newEnd ]
    getStart [ ^start ]
    getEnd [ ^end ]
]


Fizzbuzz class extend [
    new [ ^((super new) init) ]
]

fb := Fizzbuzz new.
fb main.
