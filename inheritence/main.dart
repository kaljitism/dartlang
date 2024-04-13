import 'complex.dart';
import 'quaternion.dart';

void main() {
  Complex complex = Complex(real: 2, imaginary: 1);
  Quaternion quaternion1 =
      Quaternion(real: -1, imaginary: -2, img_j: 3, img_k: -4);
  Quaternion quaternion2 =
      Quaternion(real: -2, imaginary: 5, img_j: 5, img_k: 3);
  print(quaternion1 + quaternion2);
  print(quaternion1 + complex);
}
