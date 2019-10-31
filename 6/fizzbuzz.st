#!/usr/bin/env gst

Object subclass: Fizzbuzz [
    | start end |

    init [
        self setStart: 1.
        self setEnd: 100.
    ]

    main [
        self getStart to: self getEnd do: [:i|
            "Check each number to see what they should be printing"
            (self isFizz:   i) ifTrue: [Transcript show: 'Fizz'].
            (self isBuzz:   i) ifTrue: [Transcript show: 'Buzz'].
            (self isNormal: i) ifTrue: [Transcript show: i printString].
            Transcript cr.
        ].
    ]

    isFizz:   i [^((i \\ 3) == 0).]
    isBuzz:   i [^((i \\ 5) == 0).]
    isNormal: i [^(self isFizz: i) not & (self isBuzz: i) not.]

    setStart: newStart [start := newStart.]
    setEnd: newEnd [end := newEnd.]

    getStart [^start.]
    getEnd [^end.]
]

fb := (Fizzbuzz new) init.
fb main.
