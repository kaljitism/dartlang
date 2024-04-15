> **_Note:_** This markdown file borrows heavily from [Robert Burnhage's video on Records](https://www.youtube.com/watch?v=aWOyc3HG9XM) and [Official Docs](https://dart.dev/language/records) 

Lets say you want to return two values of Latitude and Longitude while returning a Location Object.

What would you do??

Create a Location class to encapsulate the Data -

```dart
class Location {}
```

Define x and y coordinate -
```dart
  final int x;
  final int y;
```

Create a constructor -
```dart
  Location(this.x, this.y);
```

Override the toString() method for printing the value in your desired format -
```dart
  @override
  String toString() {
    return "[Latitude: $x, Longitude: $y]";
  }
```

Create a getLocation to encapsulate the logic -
```dart
  Location getLocation() {
    return Location(1, 2);
  }
```

Write code to access and print -
```dart
void main() {   
  final location = getLocation();
  print(location);
}
```

This a tedious process and contains a lot of boilerplate for something simple. 

## Records 

Records are an anonymous, immutable, aggregate type. They let you bundle multiple objects into a single object. Unlike Collection Types, records are fixed size, heterogeneous , and typed. 

Records are real values. You can - 
1. Store them in variables. 
2. Nest them. 
3. Pass them to and from functions. 
4. Store them in a Data Structures such as Lists, Maps, and Sets. 

### Syntax 

Record expressions are comma-delimited lists of named or positional fields, enclosed in parentheses: 

```dart
var records = ('first', a: 2, b: true, 'last', 3.13);
```

Record type annotations are comma-delimited lists of types enclosed in parentheses. You can use record type annotations to define return types and parameter types. For example: 

```dart
(int, int) swap((int, int) record){
  var (a, b) = record;
  return (b, a);
}
```

Fields in record expressions and type annotations mirror how parameters and arguments work in functions. Positional fields go directly inside the parentheses. 

```dart
// Record type annotation in a variable declaration: 
(String, int) record;

// Initialize it with a record expression: 
record = ('some string', 12);
```

In a record type annotation, named fields go inside a curly brace-delimited section type-and-name pairs, after all positional fields. In a record expression, the names go before each field value with a colon after:

```dart
// Record type annotation in a variable declaration: 
({int a, bool b}) record;

// Initialize it with a record expression: 
record = (a: 123, b: true);
```

The names of named fields in a record type are part of the record's type definition, or its shape. Two records with named fields with different names have different types: 


```dart
({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 1, y: 2);

({int a, int b}) someRecordAB = (a: 2, b: 32);

// Compile Error: Records dont have same type
recordAB = recordXY;

// No compile time error
recordAB = someRecordAB;
```

In a record type annotation, you can also name the positional fields, but these names are purely for documentation and don't affect the record's type: 

```dart
(int a, int b) recordAB = (1, 2);
(int x, int y) recordXY = (3, 4);

recordAB = recordAB; // No error
```

This is similar to how positional parameters in a function declaration or function typedef can have names but those names don't affect the signature of the function. 

### Record Fields

Record fields are accessible through built-in getters. Records are immutable, so fields do not have setters. 

- Named fields expose getters of same name.
- Positional fields expose getters of name `$<position>`, skipping named fields. 
```dart
var record = ('Aditya', age: 21, isDeveloper: true, 'Flutter');
print(record.$1);          // prints 'Aditya'
print(record.age);         // prints 21
print(record.isDeveloper); // prints true
print(record.$2);          // prints 'Flutter'
```

To streamline record field access even more, use Patterns. 

### Record Types

- There is no type declaration for individual record types. 
- Records are structurally typed based on the types of their fields. 
- A record's shape(the set of its fields, the fields' types and their names, if any) uniquely determines the type of a record. 

- Each field in a record has its own type. 
- Field types can differ within the same record. 
- The type system is aware of each field's type wherever its accessed from the record. 

```dart
(num, Object) pair = (42, 'a');
var first = pair.$1; // Static-Type 'num', Runtime-Type: 'int'
var second = pair.$2; // Static-Type 'Object', Runtime-Type:
```
Consider two unrelated libraries that create records with the same set of fields. The type system understands that those records are of same type even though the libraries are not coupled together.

### Record Equality 

Two records are equal if - 
- they have the same shape(set of fields),
- their corresponding fields have same values. 
The order of named fields doesn't affect equality, since, named field _order_ is not part of a record's shape

For eg, 

```dart
// Positional parameters have same type and value. 
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);
  print(point == color); // prints true
```

```dart
// Different Named parameters thus different types. 
  ({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color = (r: 1, g: 2, b: 3);
  print(point == color); // prints 'false'. Lint: Equals on unrelated types.
```

Records automatically define `hashCode` and `==` methods based on the structure of their fields. 

### Multiple Returns

Records allow functions to return multiple values bundled together. To retrieve record values from a return destructure the values into local variables using **pattern matching**

For example, 

Lets create a json data to work with - 
```dart
final json = <String, dynamic>{
  'name': 'Dash',
  'age': 10,
  'color': 'blue',
};
```

Create a function userInfo to take the json and return values. 
```dart
// Returns multiple values in a record:
(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}
```

Destructure the return value using a record pattern with positional fields:
```dart
var (name, age) = userInfo(json);
```
Above code is equivalent to - 
```dart
  var info = userInfo(json);
  var name = info.$1;
  var age = info.$2;
```
but achieves the similar with some nice syntactic sugar. 

You can also destructure a record using its named fields, using the colon `:` syntax - 

```dart
({String name, int age}) userInfo(Map<String, dynamic> json) {
// ..
// Destructure using a record pattern with named fields: 
final (:name, :age) = userInfo(json);
```

We'll learn more about this approach in Pattern Matching.
