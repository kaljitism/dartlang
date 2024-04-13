// Data Structure to work with Complex Numbers
class Complex {
  // Primary Constructors
  Complex({
    required num real,
    required num imaginary,
  })  : _imaginary = imaginary,
        _real = real;

  // Named Constructors
  Complex.real(this._real) : this._imaginary = 0;
  Complex.imaginary(this._imaginary) : this._real = 0;

  // Private Fields
  num _real;
  num _imaginary;

  // Public Static Fields
  static final int i_squared = -1;

  // Getters
  num get real => _real;
  num get imaginary => _imaginary;

  // Setters
  void set real(num real) => _real = real;
  void set imaginary(num imaginary) => _imaginary = imaginary;

  // Addition Operator
  Complex operator +(Complex other) {
    return Complex(
      real: (this._real + other.real),
      imaginary: (this._imaginary + other.imaginary),
    );
  }

  // multiply Method
  Complex multiply(Complex other) {
    num realPart = (this._real * other.real) +
        (this._imaginary * other.imaginary * i_squared);
    num imaginaryPart =
        (this._real * other.imaginary) + (this._imaginary * other.real);
    return Complex(real: realPart, imaginary: imaginaryPart);
  }

  // Static/ Class Method subtract
  static Complex subtract(Complex complex1, Complex complex2) {
    return Complex(
      real: complex1.real - complex2.real,
      imaginary: complex1.imaginary - complex2.imaginary,
    );
  }

  // Equality Operator Overloading
  @override
  bool operator ==(covariant other) {
    if (other.runtimeType != Complex) {
      return false;
    } else if (identical(this, other)) {
      return true;
    }
    return other is Complex &&
        this._real == other._real &&
        this._imaginary == other._imaginary;
  }

  // toString Method Overloading
  @override
  String toString() {
    return _imaginary >= 0
        ? "$_real + ${_imaginary}i"
        : "$_real - ${_imaginary.abs()}i";
  }
}
