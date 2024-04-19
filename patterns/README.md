> This borrows heavily from Dart [Pattern](https://dart.dev/language/patterns) and [Pattern Types](https://dart.dev/language/pattern-types) docs. 
> Just like one writes the exact same code while studying from YouTube or a blog, I write these exact same lines just for the purpose of spending more time with theory and understanding the details I might have missed while just giving docs a read. 

# Patterns in Dart 

Patterns are syntactic category in the Dart Language, like statements and expressions. A pattern represents the shape of a set of values that it may match against actual values. 

## What they do??

A **Pattern** may - 
1. match a value 
2. destructure a value

**First**, _Pattern Matching_ allows you to check whether a given value:
- has a certain shape 
- Is a certain constant 
- Is equal to something else
- has a certain type

**Then**, _Pattern Destructuring_ provides you with a convenient declarative syntax to break that value into its constituent parts. It allows you to:
- access composing parts of pattern
- define variables using values of those de-structured parts. 

The same pattern can also let you bind variables to some or all of those parts in the process. 

### Matching 

A Pattern always test against a value to determine if the value has the form you expect. Iow, you check if the value matches the pattern. 

What constitutes the match depends on what kind of pattern you are using. 

For eg, a constant pattern matches if the value is equal to the pattern's constant. 
```dart
switch(number) {
  // Constant pattern matches if number == 1. 
  case 1:
    print('"1" Matched');
} 
```

Many patterns make use of sub-patterns, sometimes called _outer_ or _inner_ patterns, respectively. Patterns match recursively on on their sub-patterns. 

For example, individual fields of any `collection-type` pattern could be `variable patterns` or `constant patterns`. 
```dart
const a = 'a';
const b = 'b';

switch(obj) {
  // List pattern [a, b] matches obj first if obj is a list of two fields,
  // then if its fields match the constant sub-patterns 'a' and 'b'
  case [a, b]:
    print('$a, $b');
}
```

- To ignore parts of a matched value, use a `wildcard pattern` as a placeholder
- In the case of list patterns, use `rest element`

### Destructuring 

When an object and pattern match, the pattern can then access the object's data and extract it in parts. 

```dart
var numList = [1, 2, 3];

// List pattern [a, b, c] destructures the three elements from numList 
var [a, b, c] = numList;
// ... and assigns them to new variables. 
print(a + b + c);
```

You can nest any kind of pattern inside a destructuring pattern. For eg, following case pattern matches and destructures a two-element list whose first element is 'a' or 'b'
```dart
switch(list) {
  case ['a' || 'b', var c]:
    print(c);
}
```

## Places Patterns can appear 

Patterns can appear at following instances in Dart - 
1. Variable Declaration and Assignments 
2. `for` and `for-in` loops
3. `if-case` and `switch-case`
4. Control flow in collection literal

### Variable Declaration 

You can use a _pattern variable declaration_ anywhere Dart allows local variable declaration. 

The pattern matches against the value on the right side of the declaration. Once matched, it destructures the value and binds it to new local variables. 

```dart
// Declares new variables a, b and c.
var (a, [b, c]) = ('str', [1, 2]);
```

A pattern variable declaration must start with either `var` or `final`, followed by a pattern. 

### Variable Assignment 

A _variable assignment pattern_ falls on the left side of an assignment. 
- First, it destructures the matched object. 
- Then, it assigns the values to the _existing_ variables, instead of binding new ones. 

Use a variable assignment pattern to swap the values of two variables without declaring a third temporary one: 
```dart
var (a, b) = ('left', 'right');
(b, a) = (a, b); // Swap
print('$a $b');  // prints "right left"
```

### Switch statements and expressions 

Every case clause contains a pattern. This applies to **switch statement** and **expressions**, as well as **if-case statements**. You can use any kind of pattern in a case. 

Case patterns are refutable(_Refutable Pattern_ is a pattern that can be tested against a value to determine if the pattern matches the value or not. If not, pattern _refutes_, or _denies_, the match. Refutable patterns appear in the _matching contexts_.). They allow control flow to either - 
- Match and destructure the object being switched on 
- Continue execution if the object doesn't match. 

















































































_
