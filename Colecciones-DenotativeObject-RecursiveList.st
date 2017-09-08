!classDefinition: #EmptyList category: #'Colecciones-DenotativeObject-RecursiveList'!
DenotativeObject subclass: #EmptyList
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Colecciones-DenotativeObject-RecursiveList'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyList class' category: #'Colecciones-DenotativeObject-RecursiveList'!
EmptyList class
	instanceVariableNames: ''!

!EmptyList class methodsFor: 'comparing' stamp: 'MAP 9/7/2017 15:26:01'!
isEqualTo: aList 
	^self isSiblingOf: aList ! !


!EmptyList class methodsFor: 'testing' stamp: 'MAP 9/7/2017 18:44:37'!
anySatisfy: aBlockClosure 
	^false! !

!EmptyList class methodsFor: 'testing' stamp: 'MAP 9/7/2017 18:11:42'!
includes: anObject 
	^false! !

!EmptyList class methodsFor: 'testing' stamp: 'MAP 9/7/2017 13:27:33'!
isEmpty
	^true! !


!EmptyList class methodsFor: 'adding' stamp: 'MAP 9/7/2017 14:38:08'!
add: anObject 
	^self addLast: anObject ! !

!EmptyList class methodsFor: 'adding' stamp: 'MAP 9/7/2017 14:48:18'!
addFirst: anObject 
	^self add: anObject ! !

!EmptyList class methodsFor: 'adding' stamp: 'MAP 9/7/2017 17:03:13'!
addLast: anObject 
	| newList |
	
	newList := List head: anObject tail: EmptyList replicate.
		
	self becomeForward: newList.
		
	^anObject ! !


!EmptyList class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:36:42'!
first
	self signalErrorListIsEmpty ! !

!EmptyList class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:35:15'!
last
	self signalErrorListIsEmpty! !

!EmptyList class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:01:45'!
size
	^0! !


!EmptyList class methodsFor: 'private-accessing' stamp: 'MAP 9/7/2017 14:18:32'!
lastFor: aList 
	^aList first! !


!EmptyList class methodsFor: 'error-descriptions' stamp: 'MAP 9/7/2017 18:03:06'!
errorDescriptionCannotRemoveFromAnEmptyList
	^'Cannot remove from an empty list'! !

!EmptyList class methodsFor: 'error-descriptions' stamp: 'MAP 9/7/2017 18:54:38'!
errorDescriptionElementNotFound
	^'Element not found'! !

!EmptyList class methodsFor: 'error-descriptions' stamp: 'MAP 9/7/2017 14:31:14'!
errorDescriptionListIsEmpty
	^'The list is empty'! !


!EmptyList class methodsFor: 'error-signaling' stamp: 'MAP 9/7/2017 18:04:44'!
signalErrorCannotRemoveFromAnEmptyList
	self error: self errorDescriptionCannotRemoveFromAnEmptyList! !

!EmptyList class methodsFor: 'error-signaling' stamp: 'MAP 9/7/2017 18:55:38'!
signalErrorElementNotFound
	self error: self errorDescriptionElementNotFound ! !

!EmptyList class methodsFor: 'error-signaling' stamp: 'MAP 9/7/2017 14:35:30'!
signalErrorListIsEmpty
	self error: self errorDescriptionListIsEmpty ! !


!EmptyList class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 20:01:53'!
detect: aBlockClosure 
	^self detect: aBlockClosure ifNone: [ self signalErrorElementNotFound ]! !

!EmptyList class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 20:00:04'!
detect: aBlockClosure ifNone: exceptionBlock 
	
	^exceptionBlock value! !

!EmptyList class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 17:33:25'!
do: aBlockClosure 
	! !


!EmptyList class methodsFor: 'removing' stamp: 'MAP 9/7/2017 18:04:05'!
removeFirst
	self signalErrorCannotRemoveFromAnEmptyList! !

!EmptyList class methodsFor: 'removing' stamp: 'MAP 9/7/2017 18:05:15'!
removeLast
	self signalErrorCannotRemoveFromAnEmptyList ! !


!EmptyList class methodsFor: 'private-removing' stamp: 'MAP 9/7/2017 18:19:19'!
removeLastFrom: aList 
	^aList removeFirst ! !


!EmptyList class methodsFor: 'private-enumerating' stamp: 'MAP 9/7/2017 19:42:43'!
collect: aBlockClosure on: aList 
	! !

!EmptyList class methodsFor: 'private-enumerating' stamp: 'MAP 9/7/2017 19:09:24'!
select: aBlockClosure on: aList 
	! !


!classDefinition: #List category: #'Colecciones-DenotativeObject-RecursiveList'!
DenotativeObject subclass: #List
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Colecciones-DenotativeObject-RecursiveList'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'List class' category: #'Colecciones-DenotativeObject-RecursiveList'!
List class
	instanceVariableNames: 'head tail'!

!List class methodsFor: 'replicating' stamp: 'MAP 9/7/2017 13:27:06'!
emptyReplicant
	^EmptyList replicate ! !


!List class methodsFor: 'private-accessing' stamp: 'MAP 9/7/2017 13:54:33'!
head: anObject 
	head := anObject ! !

!List class methodsFor: 'private-accessing' stamp: 'MAP 9/7/2017 14:44:24'!
lastFor: aList 
	^tail lastFor: self! !

!List class methodsFor: 'private-accessing' stamp: 'MAP 9/7/2017 13:55:02'!
tail: aList 
	tail := aList ! !


!List class methodsFor: 'testing' stamp: 'MAP 9/7/2017 18:44:10'!
anySatisfy: aBlockClosure 
	^( aBlockClosure value: head ) or: [ tail anySatisfy: aBlockClosure ]! !

!List class methodsFor: 'testing' stamp: 'MAP 9/7/2017 13:58:19'!
includes: anObject 
	^head = anObject or: [ tail includes: anObject ]! !

!List class methodsFor: 'testing' stamp: 'MAP 9/7/2017 13:55:40'!
isEmpty
	^false! !


!List class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:05:45'!
first
	^head ! !

!List class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:10:17'!
last
	^tail lastFor: self! !

!List class methodsFor: 'accessing' stamp: 'MAP 9/7/2017 14:01:17'!
size
	^tail size + 1! !


!List class methodsFor: 'adding' stamp: 'MAP 9/7/2017 15:08:30'!
add: anObject 
	^self addLast: anObject ! !

!List class methodsFor: 'adding' stamp: 'MAP 9/7/2017 17:01:35'!
addFirst: anObject 
	| newList |
	
	newList := self head: anObject tail: self copy.
		
	self becomeForward: newList.
	
	^anObject ! !

!List class methodsFor: 'adding' stamp: 'MAP 9/7/2017 14:40:52'!
addLast: anObject 
	^tail addLast: anObject ! !


!List class methodsFor: 'comparing' stamp: 'MAP 9/7/2017 15:27:52'!
hasSameElementsInSameOrderAs: aList 
	^( aList headIsEqualTo: head ) and: [ aList tailIsEqualTo: tail ]! !

!List class methodsFor: 'comparing' stamp: 'MAP 9/7/2017 15:21:57'!
headIsEqualTo: anObject 
	^head = anObject ! !

!List class methodsFor: 'comparing' stamp: 'MAP 9/7/2017 15:28:35'!
isEqualTo: aList 
	^( self isSiblingOf: aList ) and: [ self hasSameElementsInSameOrderAs: aList ]! !

!List class methodsFor: 'comparing' stamp: 'MAP 9/7/2017 15:23:05'!
tailIsEqualTo: aList 
	^tail isEqualTo: aList ! !


!List class methodsFor: 'creating' stamp: 'MAP 9/7/2017 17:00:06'!
head: anObject tail: aList
	
	^self originalSibling replicate 
		head: anObject;
		tail: aList ! !


!List class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 19:33:12'!
collect: aBlockClosure 
	| collected |
	
	collected := EmptyList replicate.
	
	self collect: aBlockClosure on: collected.
	
	^collected ! !

!List class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 19:54:25'!
detect: aBlockClosure 
	
	^self detect: aBlockClosure ifNone: [ EmptyList signalErrorElementNotFound ]! !

!List class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 19:57:07'!
detect: aBlockClosure ifNone: exceptionBlock 
	
	( aBlockClosure value: head ) ifTrue: [ ^head ].
	
	^tail detect: aBlockClosure ifNone: exceptionBlock ! !

!List class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 17:33:02'!
do: aBlockClosure 

	aBlockClosure value: head.
	
	tail do: aBlockClosure ! !

!List class methodsFor: 'enumerating' stamp: 'MAP 9/7/2017 19:31:00'!
select: aBlockClosure 
	| selected |
	
	selected := EmptyList replicate.
	
	self select: aBlockClosure on: selected.
	
	^selected ! !


!List class methodsFor: 'printing' stamp: 'MAP 9/7/2017 20:08:58'!
printOn: aStream

	aStream 
		nextPutAll: self name;
		space;
		nextPutAll: '('.
		
	self do: [ :each | 
		aStream space.
		each printOn: aStream.
		aStream space ].
	
	aStream nextPutAll: ')'! !


!List class methodsFor: 'removing' stamp: 'MAP 9/7/2017 18:00:39'!
removeAll
	self becomeForward: self emptyReplicant ! !

!List class methodsFor: 'removing' stamp: 'MAP 9/7/2017 18:10:53'!
removeFirst
	| removed |
	
	removed := head.
	
	self becomeForward: tail.
	
	^removed ! !

!List class methodsFor: 'removing' stamp: 'MAP 9/7/2017 18:17:38'!
removeLast
	^tail removeLastFrom: self! !


!List class methodsFor: 'private-removing' stamp: 'MAP 9/7/2017 18:22:23'!
removeLastFrom: aList 
	^tail removeLastFrom: self! !


!List class methodsFor: 'initializing' stamp: 'MAP 9/7/2017 18:36:41'!
initialize
	tail := self emptyReplicant ! !



!List class methodsFor: 'private-enumerating' stamp: 'MAP 9/7/2017 19:42:28'!
collect: aBlockClosure on: aList 
	
	aList add: ( aBlockClosure value: head ).
	
	tail collect: aBlockClosure on: aList ! !

!List class methodsFor: 'private-enumerating' stamp: 'MAP 9/7/2017 19:08:55'!
select: aBlockClosure on: aList 
	
	( aBlockClosure value: head ) ifTrue: [ aList add: head ].
	
	tail select: aBlockClosure on: aList ! !

List instVarNamed: 'head' put: nil!
List instVarNamed: 'tail' put: 'a replicant of EmptyList'!

!classDefinition: #ListTest category: #'Colecciones-DenotativeObject-RecursiveList'!
DenotativeObject subclass: #ListTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Colecciones-DenotativeObject-RecursiveList'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ListTest class' category: #'Colecciones-DenotativeObject-RecursiveList'!
ListTest class
	instanceVariableNames: ''!

!ListTest class methodsFor: 'factory' stamp: 'MAP 9/7/2017 13:25:57'!
emptyList
	^ EmptyList replicate! !

!ListTest class methodsFor: 'factory' stamp: 'MAP 9/7/2017 14:27:35'!
notEmptyList

	^self emptyList
		add: 'anObject';
		yourself ! !


!ListTest class methodsFor: 'tests-adding' stamp: 'MAP 9/7/2017 18:26:55'!
test002CanAddElementAtTheBeginingOfAnEmptyList
	| element aList addedElement |
	
	element _ 'new element'.
	aList _ self emptyList.
	
	addedElement _ aList addFirst: element.
	
	Assert isTrue: ( aList includes: element ).
	Assert isFalse: aList isEmpty.
	Assert that: aList size isEqualTo: 1.
	Assert that: aList first isEqualTo: element.
	Assert that: aList last isEqualTo: element.
	Assert that: addedElement isEqualTo: element.! !

!ListTest class methodsFor: 'tests-adding' stamp: 'MAP 9/7/2017 18:27:18'!
test004CanAddElementAtTheBeginingOfANotEmptyList
	| element aList addedElement originalSize originalLast |
	
	element _ 'new element'.
	aList _ self notEmptyList.
	originalSize _ aList size.
	originalLast _ aList last.
	
	addedElement _ aList addFirst: element.
	
	Assert isTrue: ( aList includes: element ).
	Assert that: aList size isEqualTo: originalSize + 1.
	Assert that: aList first isEqualTo: element.
	Assert that: aList last isEqualTo: originalLast.
	Assert that: addedElement isEqualTo: element.! !

!ListTest class methodsFor: 'tests-adding' stamp: 'MAP 9/7/2017 18:27:43'!
test007CanAddElementAtTheEndOfAnEmptyList
	| element aList addedElement |
	
	element _ 'new element'.
	aList _ self emptyList.
	
	addedElement _ aList addLast: element.
	
	Assert isTrue: ( aList includes: element ).
	Assert isFalse: aList isEmpty.
	Assert that: aList size isEqualTo: 1.
	Assert that: aList first isEqualTo: element.
	Assert that: aList last isEqualTo: element.
	Assert that: addedElement isEqualTo: element.! !

!ListTest class methodsFor: 'tests-adding' stamp: 'MAP 9/4/2017 07:08:12'!
test009CanAddElementAtTheEndOfANotEmptyList
	| element aList addedElement originalSize originalFirst |
	
	element _ 'new element'.
	aList _ self notEmptyList.
	originalSize _ aList size.
	originalFirst := aList first.
	
	addedElement _ aList addLast: element.
	
	Assert isTrue: (aList includes: element).
	Assert that: aList size isEqualTo: originalSize + 1.
	Assert that: aList first isEqualTo: originalFirst.
	Assert that: aList last isEqualTo: element.
	Assert that: addedElement isEqualTo: element.! !


!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 8/31/2017 23:30:33'!
test001AListCanEmptyItself
	| aList |
	
	aList _ self notEmptyList.
	
	aList removeAll.
	
	Assert isTrue: aList isEmpty! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/7/2017 18:28:29'!
test003CanRemoveAndReturnElementFromTheBeginingOfAListWithMoreThanOneElement
	| element aList originalFirst originalLast sizeBeforeRemoving removed |
	
	aList _ self notEmptyList.
	originalFirst _ aList first.
	originalLast _ aList last.
	element _ 'new element'.
	
	aList addFirst: element.
	sizeBeforeRemoving _ aList size.
	
	removed _ aList removeFirst.
	
	Assert isFalse: ( aList includes: element ).
	Assert that: removed isEqualTo: element .
	Assert that: aList size isEqualTo: sizeBeforeRemoving - 1.
	Assert that: aList first isEqualTo: originalFirst.
	Assert that: aList last isEqualTo: originalLast.! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/7/2017 18:28:48'!
test008CanRemoveAndReturnElementFromTheEndOfAListWithMoreThanOneElement
	| element aList originalFirst originalLast sizeBeforeRemoving removed |
	
	aList _ self notEmptyList.
	originalFirst _ aList first.
	originalLast _ aList last.
	element _ 'new element'.
	
	aList addLast: element.
	sizeBeforeRemoving _ aList size.
	
	removed _ aList removeLast.
	
	Assert isFalse: ( aList includes: element ).
	Assert that: removed isEqualTo: element .
	Assert that: aList size isEqualTo: sizeBeforeRemoving - 1.
	Assert that: aList first isEqualTo: originalFirst.
	Assert that: aList last isEqualTo: originalLast.! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/7/2017 13:12:33'!
test012CannotRemoveAnElementFromTheBegginingOfAnEmptyList
	| aList |
	
	aList _ self emptyList.
	
	Assert
		should: [ aList removeFirst ]
		signal: Error
		withDescription: aList errorDescriptionCannotRemoveFromAnEmptyList.! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/4/2017 10:06:36'!
test013CannotRemoveAnElementFromTheEndOfAnEmptyList
	| aList |
	
	aList _ self emptyList.
	
	Assert
		should: [ aList removeLast ]
		signal: Error
		withDescription: aList errorDescriptionCannotRemoveFromAnEmptyList.! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/5/2017 17:40:15'!
test030CanRemoveAndReturnElementFromTheBeginingOfAListWithOnlyOneElement
	| element aList removed |
	
	aList _ self emptyList.
	element _ 'sole element'.
	aList add: element.
	
	removed _ aList removeFirst.
	
	Assert that: removed isEqualTo: element.
	Assert isTrue: aList isEmpty.
	Assert that: aList size isEqualTo: 0! !

!ListTest class methodsFor: 'tests-removing' stamp: 'MAP 9/5/2017 17:40:34'!
test031CanRemoveAndReturnElementFromTheEndOfAListWithOnlyOneElement
	| element aList removed |
	
	aList _ self emptyList.
	element _ 'sole element'.
	aList add: element.
	
	removed _ aList removeLast.
	
	Assert that: removed isEqualTo: element.
	Assert isTrue: aList isEmpty.
	Assert that: aList size isEqualTo: 0! !


!ListTest class methodsFor: 'tests-comparing' stamp: 'MAP 9/7/2017 18:31:38'!
test014ListsAreEqualWhenTheyHaveTheSameElementsInTheSameOrder
	| aList anotherList |
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2.
		
	anotherList _ self emptyList.
	anotherList
		add: 1;
		add: 2.
		
	Assert that: aList isEqualTo: anotherList! !

!ListTest class methodsFor: 'tests-comparing' stamp: 'MAP 9/7/2017 18:32:57'!
test015ListsAreNotEqualWhenTheyDontHaveTheSameElementsOrNotInTheSameOrder
	| aList anotherList yetAnotherList |
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2.
		
	anotherList _ self emptyList.
	anotherList
		add: 2;
		add: 1.

	yetAnotherList _ self emptyList.
	yetAnotherList 
		add: 1;
		add: 20.
				
	Assert that: aList isNotEqualTo: anotherList .
	Assert that: aList isNotEqualTo: yetAnotherList! !


!ListTest class methodsFor: 'tests-testing' stamp: 'MAP 9/4/2017 07:55:21'!
test005AListDoesNotIncludeAnObject
	| element aList |
	
	element _ 'not included'.
	
	aList _ self emptyList.
	aList 
		add: 1;
		add: 2.
	
	Assert isFalse: ( aList includes: element )! !

!ListTest class methodsFor: 'tests-testing' stamp: 'MAP 9/4/2017 07:58:22'!
test006AListIncludesAnObject
	| element aList |
	
	element _ 'included'.
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2;
		add: element.
		
	Assert isTrue: ( aList includes: element )! !

!ListTest class methodsFor: 'tests-testing' stamp: 'MAP 9/4/2017 08:02:10'!
test017AListCanIncludeAnotherList
	| includedList aList |
	
	includedList _ self notEmptyList.
	aList _ self notEmptyList.
	
	aList add: includedList.
	
	Assert isTrue: (aList includes: includedList).! !

!ListTest class methodsFor: 'tests-testing' stamp: 'MAP 9/4/2017 21:27:58'!
test032AListDoesNotHaveAnyElementsSatisfyingACondition
	| aList |
	
	aList _ self emptyList.
	aList 
		add: 1;
		add: 2.
	
	Assert isFalse: ( aList anySatisfy: [ :each | each > 2 ] )! !

!ListTest class methodsFor: 'tests-testing' stamp: 'MAP 9/4/2017 21:33:35'!
test033AListHasAtLeastOneElementsSatisfyingACondition
	| aList |
	
	aList _ self emptyList.
	aList 
		add: 1;
		add: 2.
	
	Assert isTrue: ( aList anySatisfy: [ :each | each > 1 ] )! !


!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/4/2017 10:07:28'!
test010AListDetectsFirstElementSatisfyingACondition
	| aList detected |
	
	aList _ self emptyList.
	
	aList
		add: 1;
		add: 2;
		add: 3.
		
	detected := aList detect: [ :each | each > 1 ].
		
	Assert that: detected isEqualTo: 2! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/7/2017 20:04:56'!
test011AListDoesNotDetectAnElementSatisfyingACondition
	| aList |
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2;
		add: 3.
		
	Assert
		should: [ aList detect: [ :each | each > 3 ] ]
		signal: Error
		withDescription: EmptyList errorDescriptionElementNotFound! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/7/2017 19:23:51'!
test016AListSelectsAllElementsSatisfyingACondition
	| aList selected expected |
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2.
		
	expected _ self emptyList.
	expected add: 2.
		
	selected _ aList select: [ :each |each > 1 ].
	
	Assert that: selected isEqualTo: expected! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/7/2017 19:34:14'!
test018AListCollectsTheResultsOfEvaluatingABlockForEachElement
	| aList collected expected |
	
	aList _ self emptyList.
	aList
		add: 1;
		add: 2.
		
	expected _ self emptyList.
	expected
		add: 4;
		add: 8.
		
	collected _ aList collect: [ :each | each * 4 ].
	
	Assert that: collected isEqualTo: expected! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/7/2017 19:51:48'!
test019WhenAListDoesNotDetectAnElementSatisfyingAConditionEvaluatesAnExceptionBlock
	| aList exceptionResult result |
	
	aList _ self emptyList.
	aList add: 1.
	exceptionResult _ 'element not detected'.
	
	result _ aList detect: [ :each | each < 1 ] ifNone: [ exceptionResult ].
		
	Assert that: result isEqualTo: exceptionResult.! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/4/2017 08:24:10'!
test020AListCanEvaluateABlockForEachElement
	| aList expected result |
	
	aList _ self emptyList.
	aList 
		add: 1; 
		add: 2.

	expected _ self emptyList.
	expected 
		add: 2; 
		add: 4.
		
	result := self emptyList.
	
	aList do: [ :each | result add: each * 2].
		
	Assert isTrue: ( result isEqualTo: expected )! !

!ListTest class methodsFor: 'tests-enumerating' stamp: 'MAP 9/7/2017 18:53:59'!
test032AnEmptyListDoesNotDetectAnElementSatisfyingACondition
	| aList |
	
	aList _ self emptyList.
	
	Assert
		should: [ aList detect: [ :each | each > 3 ] ]
		signal: Error
		withDescription: aList errorDescriptionElementNotFound.! !


!ListTest class methodsFor: 'tests-replicating' stamp: 'MAP 8/25/2017 20:33:47'!
test021AListCanProvideAnEmptyReplicant
	
	Assert isTrue: List emptyReplicant isEmpty.! !


!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 9/4/2017 08:28:07'!
test022CanReturnLastElementOfANotEmptyList
	| aList element |
	
	element _ 'last'.
	aList _ self notEmptyList.
	
	aList addLast: element.
	
	Assert that: aList last isEqualTo: element ! !

!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 9/7/2017 13:10:15'!
test023CannotReturnLastElementOfAnEmptyList
	| aList |
	
	aList _ self emptyList.
	
	Assert 
		should: [ aList last ] 
		signal: Error
		withDescription: aList errorDescriptionListIsEmpty ! !

!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 9/4/2017 08:57:20'!
test024CanReturnFirstElementOfANotEmptyList
	| aList element |
	
	element _ 'first'.
	aList _ self notEmptyList.
	
	aList addFirst: element.
	
	Assert that: aList first isEqualTo: element! !

!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 9/7/2017 13:10:24'!
test025CannotReturnFirstElementOfAnEmptyList
	| aList |
	
	aList := self emptyList.
	
	Assert 
		should: [ aList first ] 
		signal: Error
		withDescription: aList errorDescriptionListIsEmpty ! !

!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 9/4/2017 08:58:53'!
test026TheSizeOfAnEmptyListIsZero
	| aList |
	
	aList _ self emptyList.
	
	Assert that: aList size isEqualTo: 0.! !

!ListTest class methodsFor: 'tests-accessing' stamp: 'MAP 8/29/2017 22:31:08'!
test027TheSizeOfANotEmptyListIsGreaterThanZero
	| aList |
	
	aList _ self notEmptyList.
	
	Assert isTrue: aList size > 0! !

List initialize!