import 'complex.dart';

// Data Structures to work with Quaternions
class Quaternion extends Complex {
  // Primary Constructor
  Quaternion({
    required num real,
    required num imaginary,
    required num img_j,
    required num img_k,
  })  : _img_k = img_k,
        _img_j = img_j,
        super(real: real, imaginary: imaginary);

  // Named Constructors

  Quaternion.real(num real)
      : this._img_j = 0,
        this._img_k = 0,
        super.real(real);

  Quaternion.oneImaginaryPart(num imaginary)
      : this._img_j = 0,
        this._img_k = 0,
        super.imaginary(0);

  Quaternion.twoImaginaryParts(num imaginary1, num imaginary2)
      : this._img_j = imaginary2,
        this._img_k = 0,
        super.imaginary(imaginary1);

  Quaternion.imaginary(num imaginary1, num imaginary2, num imaginary3)
      : this._img_j = imaginary2,
        this._img_k = imaginary3,
        super.imaginary(imaginary1);

  // Private Fields
  num _img_j;
  num _img_k;

  // Getters
  num get img_j => _img_j;
  num get img_k => _img_k;

  // Setters
  set img_j(num value) => _img_j = value;
  set img_k(num value) => _img_k = value;

  // Addition Operator
  @override
  Quaternion operator +(covariant dynamic other) {
    if (other.runtimeType == Quaternion) {
      return Quaternion(
        real: (this.real + other.real),
        imaginary: (this.imaginary + other.imaginary),
        img_j: (this._img_j + other.img_j),
        img_k: (this._img_k + other.img_k),
      );
    }
    if (other.runtimeType == Complex) {
      return Quaternion(
        real: (this.real + other.real),
        imaginary: (this.imaginary + other.imaginary),
        img_j: this._img_j,
        img_k: this._img_k,
      );
    } else {
      throw TypeError();
    }
  }

  // Equality Operator Overloading
  @override
  bool operator ==(covariant dynamic other) {
    if (identical(this, other)) {
      return true;
    } else if (other.runtimeType == Complex) {
      return this.real == other.real &&
          this.imaginary == other.imaginary &&
          this._img_j == 0 &&
          this._img_k == 0;
    } else if (other.runtimeType == Quaternion) {
      return this.real == other.real &&
          this.imaginary == other.imaginary &&
          this._img_j == other._img_j &&
          this._img_k == other._img_k;
    } else {
      throw TypeError();
    }
  }

  // toString Method Overloading
  @override
  String toString() {
    var realPart = '${this.real} ';
    var img_iPart = this.imaginary >= 0
        ? '+ ${this.imaginary}i '
        : '- ${this.imaginary.abs()}i ';
    var img_jPart =
        this.img_j >= 0 ? '+ ${this.img_j}j ' : '- ${this.img_j.abs()}j ';
    var img_kPart =
        this.img_k >= 0 ? '+ ${this.img_k}k ' : '- ${this.img_k.abs()}k ';
    return '$realPart$img_iPart$img_jPart$img_kPart';
  }
}
