A command-line application created with intent to understand Class Modifiers with an entrypoint in `bin/`.

**Class Modifiers** control how a class or mixin can be used. Modifier keywords come before a class or mixin declaration. Full set of Modifiers in Dart include -

- `abstract` 
- `base`
- `final` 
- `interface`
- `sealed`
- `mixin`

Modifiers don't apply to other declarations such as `enum`, `typedef`, or `extension` and can only appear before `Class` or `mixin`. Only `base` can appear before `mixin` Class. 

Without any modifier, a class/mixin is `concrete` and can be instantiated and extended. By default, you can: 
- Construct new instances of the class. 
- Extend a class to create new subtype. 
- Implement a class or mixin's interface. 
- Mix in a mixin or mixin  class. 

#### abstract

A class that doesn't require a a full, concrete implementation of its entire interface. Abstract classes can't be instantiated directly. They are designed to be subclassed. They can not be constructed/ instantiated. They often have abstract methods. 



```dart
