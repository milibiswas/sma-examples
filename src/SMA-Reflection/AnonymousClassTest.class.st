Class {
	#name : #AnonymousClassTest,
	#superclass : #TestCase,
	#category : #'SMA-Reflection'
}

{ #category : #'as yet unclassified' }
AnonymousClassTest >> testAnon [
	| anonClass set |
	anonClass := Class new.
	anonClass superclass: Set;
		setFormat: Set format.

	anonClass compile:
		'add: anObject
			Transcript show: ''adding '', anObject printString; cr.
			^ super add: anObject'.

	set := Set new.
	set add: 1.
	self assert: set size equals: 1.

	set primitiveChangeClassTo: anonClass basicNew.
	set add: 2.
	self assert: set size equals: 2.
]
