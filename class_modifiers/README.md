// Following docs and the code borrows heavily from official docs: https://dart.dev/language/class-modifiers#combining-modifiers and the API Reference: https://dart.dev/language/modifier-reference

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

### Valid Combinations

| Declaration               | Construct? | Extend? | Implement? | Mixin? | Exhaustive? |
|:--------------------------|:-----------|:--------|------------|:-------|:------------|
| class                     | Yes        | Yes     | Yes        | No     | No          |
| base class                | Yes        | Yes     | No         | No     | No          |
| interface class           | Yes        | No      | Yes        | No     | No          |
| final class               | Yes        | No      | No         | No     | No          |
| sealed class              | No         | No      | No         | No     | Yes         |
| abstract class            | No         | Yes     | Yes        | No     | No          |
| abstract base class       | No         | Yes     | No         | No     | No          |
| abstract interface class  | No         | No      | Yes        | No     | No          |
| abstract final class      | No         | No      | No         | No     | No          |
| mixin class               | Yes        | Yes     | Yes        | Yes    | No          | 
| base mixin class          | Yes        | Yes     | No         | Yes    | No          |
| abstract mixin class      | No         | Yes     | Yes        | Yes    | No          |
| abstract base mixin class | No         | Yes     | No         | Yes    | No          |
| mixin                     | No         | No      | Yes        | Yes    | No          |
| base mixin                | No         | No      | No         | Yes    | No          |

### Invalid Combinations

| Combination                           | Reasoning                                                                                                                                     |
|:--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| base, interface, and final            | All control the same two capabilities(extend and implement), so are mutually exclusive                                                        |
| sealed and abstract                   | Neither can be constructed, so are redundant together.                                                                                        |
| sealed with base, interface, or final | sealed types already cannot be mixed in, extended or implemented from another library, so are redundant to combine with the listed modifiers. |
| mixin and abstract                    | ANeither can be constructed, so are redundant together.                                                                                       |
| mixin and interface, final, or sealed | A mixin or mixin class declaration is intended to be mixed in, which the listed modifiers prevent.                                            |
| enum and any modifiers                | enum declarations can't be extended, implemented, mixed in, and can always be instantiated, so no modifiers apply to enum declarations.       |
| extension type and any modifiers      | extension type declarations can't be extended or mixed in, and can only be implemented by other extension type declarations.                  |

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

### Combining Modifiers

You can combine modifiers for layered restrictions. A class declaration can be, in order -
  1. (Optional) `abstract`, describing whether the class can contain abstract member and prevents instantiation. 
  2. (Optional) One of `base`, `interface`, `final`, or `sealed`, describing whether the class can be extended or implemented outside of its own library.
  3. (Optional) `mixin`, describing whether the class can be mixed in.
  4. `class` keyword itself 

You can't combine some modifiers because they are contradictory, or redundant, or otherwise mutually exclusive: 
  - `abstract` with `sealed`. A `sealed class` is implicitly `abstract`.
  - `interface`. `final` or `sealed` with `mixin`. These access modifiers prevent mixing in.
