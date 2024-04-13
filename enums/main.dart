/*
Enumerated Types, also called enums are special kind of class used to represent a fixed number of constant values

All enums extends Enum class. They are also sealed, which means that can't be subclassed, implemented, mixed in, or otherwise explicitly instantiated.

Abstract Classes and Mixins can explicitly implement or extend Enum, but unless they are then implemented by or mixed into an enum declaration, no objects can actually implement the type of that class or mixin.
*/

void main() {}

// An enum which  defines two states of rest and motion
enum Status {
  stopped,
  running,
}

// A class that uses enums in the logic.
class Motion {
  Status status;

  Motion(this.status);

  void inertia() {
    switch (status) {
      case Status.stopped:
        print("In rest");
        return;
      case Status.running:
        print("In Motion");
        return;
    }
  }
}
