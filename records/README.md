Lets say you want to return two values of Latitude and Longitude while returning a Location Object.

What would you do??

Create a Location class to encapsulate the Data -

```
class Location {}
```

Define x and y coordinate -
```
  final int x;
  final int y;
```

Create a constructor -
```
  Location(this.x, this.y);
```

Override the toString() method for printing the value in your desired format -
```
  @override
  String toString() {
    return "[Latitude: $x, Longitude: $y]";
  }
```

Create a getLocation to encapsulate the logic -
```
  Location getLocation() {
    return Location(1, 2);
  }
```

Write code to access and print -
```
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

```
var records = ('first', a: 2, b: true, 'last', 3.13);
```

Record type annotations are comma-delimited lists of types enclosed in parentheses. You can use record type annotations to define return types and parameter types. For example: 

```
(int, int) swap((int, int) record){
  var (a, b) = record;
  return (b, a);
}
```

Fields in record expressions and type annotations mirror how parameters and arguments work in functions. Positional fields go directly inside the parentheses. 

```
// Record type annotation in a variable declaration: 
(String, int) record;

// Initialize it with a record expression: 
record = ('some string', 12);
```

In a record type annotation, named fields go inside a curly brace-delimited section type-and-name pairs, after all positional fields. In a record expression, the names go before each field value with a colon after:

```
// Record type annotation in a variable declaration: 
({int a, bool b}) record;

// Initialize it with a record expression: 
record = (a: 123, b: true);
```

The names of named fields in a record type are part of the record's type definition, or its shape. Two records with named fields with different names have different types: 


```
({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 1, y: 2);

({int a, int b}) someRecordAB = (a: 2, b: 32);

// Compile Error: Records dont have same type
recordAB = recordXY;

// No compile time error
recordAB = someRecordAB;
```

In a record type annotation, you can also name the positional fields, but these names are purely for documentation and don't affect the record's type: 

```
(int a, int b) recordAB = (1, 2);
(int x, int y) recordXY = (3, 4);

recordAB = recordAB; // No error
```

This is similar to how positional parameters in a function declaration or function typedef can have names but those names don't affect the signature of the function. 

### Record Fields

Record fields are accessible through built-in getters. Records are immutable, so fields do not have setters. 

- Named fields expose getters of same name.
- Positional fields expose getters of name `$<position>`, skipping named fields: 
