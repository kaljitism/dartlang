// Following docs and the code borrows heavily from official docs: https://dart.dev/language/class-modifiers#combining-modifiers

A command-line application created with intent to understand Class Modifiers with an entrypoint in `bin/`.

**Class Modifiers** control how a class or mixin can be used. Modifier keywords come before a class or mixin declaration. Full set of Modifiers in Dart include -

- `abstract` 
- `base`
- `final` 
- `interface`
- `sealed`
- `mixin`

Modifiers don't apply to other declarations such as `enum`, `typedef`, or `extension` and can only appear before `class` or `mixin`. Only `base` can appear before `mixin` Class. 

Without any modifier, a class/mixin is `concrete` and can be instantiated and extended. By default, you can: 
- Construct new instances of the class. 
- Extend a class to create new subtype. 
- Implement a class or mixin's interface. 
- Mix in a mixin or mixin  class. 

#### abstract
- A class that doesn't require a a full, concrete implementation of its entire interface. 
- Abstract classes can't be instantiated directly. They need factory constructors to be constructed.
- Abstract classes can be subclassed ie. you can `extend` or `implement` an abstract class.
- They often have abstract methods

Look into `bin/abstract.dart` for code. 

#### base
- `base` modifier is used to enforce inheritance of a class/ mixin's implementation. Base Class disallows implementation outside of its own library.
- Base class constructor is called whenever an instance of a subtype of the class is created. 
- A new implemented member in a base class does not break subtypes, since all subtypes inherit the new member, unless the subtype already declares a member with the same name and an incompatible signature.
- You must mark any class which implements or extends a base class as `base`, `final`, or `sealed`. This prevents outside libraries from breaking  the base class guarantees.  

Look into `bin/base.dart` for code. 

#### interface
- Libraries outside of the interface's own defining library can implement the interface, but not extend it. This guarantees - 
  - When one of the class's instance methods calls another instance method on this, it will always invoke a known implementation of the method from the same library. 
  - Other libraries can't override methods that the interface class's own methods might later call in unexpected ways. This reduces the fragile base class problem.

- Most common use for the interface modifier is to define a pure interface. Combine the `interface` and `abstract` modifiers for an `abstract interface` class. 

Look into `bin/interface/` for code.

#### final
- To close the type hierarchy, use the final modifier. This prevents subtyping from a class outside of the current library. Disallowing both inheritance and implementation prevents subtyping entirely. This guarantees: 
  - You can safely add incremental changes to the API. 
  - You can call instance methods knowing that they haven't been overwritten in a third-party subclass. 

- Final classes can be extended or implemented within the same library. The `final` modifier encompasses the effects of `base`, and therefore any subclasses must also be marked `base`, `final` or `sealed`. 

Look into `bin/final/` for code. 

#### sealed
- To create a known, enumerable set of subtypes, use the `sealed` modifier. 
- This allows you to create a switch over those subtypes that is statically ensured to be exhaustive(a compile time check that tells makes sure all cases are implemented in a `switch` block to ensure that it shouldn't be possible for a value to enter a switch but  not match any of the cases).
- The `sealed` modifier prevents a class from being extended or implemented outside of its own library. 
- Sealed classes are implicitly `abstract`.
  - They cannot be constructed themselves. 
  - They can have `factory` constructors. 
  - They can define constructors for their subclasses to use. 

- Subclasses of sealed classes are, however, not implicitly abstract. 
- Since compiler is aware of any possible direct subtypes because they can only exist in the same library, it can alert you when a switch does not exhaustively handle all possible subtypes in its cases. 

- If you dont want exhaustive switching, or want to be able to add subtypes later without breaking the API, use the `final` modifier.

Look into `bin/sealed.dart` for code.












































```dart
