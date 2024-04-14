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


```dart













































hel
