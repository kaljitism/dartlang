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

  // Getters
  num get real => _real;
  num get imaginary => _imaginary;

  // Setters
  void set real(num real) => _real = real;
  void set imaginary(num imaginary) => _imaginary = imaginary;

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

  // Addition Operator
  Complex operator +(Complex other) {
    return Complex(
      real: (this._real + other.real),
      imaginary: (this._imaginary + other.imaginary),
    );
  }

  // toString Method Overloading
  @override
  String toString() {
    return _imaginary >= 0
        ? "$_real + ${_imaginary}i"
        : "$_real - ${_imaginary.abs()}i";
  }
}

void main() {
  Complex complex_num1 = Complex(real: 3, imaginary: 9);
  Complex complex_num2 = Complex(real: 6, imaginary: -4);
  print(complex_num1 + complex_num2);
}
