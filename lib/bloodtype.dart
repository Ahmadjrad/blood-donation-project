
class Type {
   String type;
   String description;

  Type( this.type,  this.description);

}

List<Type> Types = [
  Type('', ''),
  Type('A+', 'Universal donor. Can donate to A+, AB+.'),
  Type('A-', 'Can donate to A+, A-, AB+, AB-.'),
  Type('B+', 'Can donate to B+, AB+.'),
  Type('B-', 'Can donate to B+, B-, AB+, AB-.'),
  Type('O+', 'Universal donor. Can donate to A+, B+, AB+, O+.'),
  Type('O-', 'Universal donor. Can donate to A+, A-, B+, B-, AB+, AB-, O+, O-.'),
  Type('AB+', 'Universal recipient. Can receive from A+, A-, B+, B-, AB+, AB-, O+, O-.'),
  Type('AB-', 'Can receive from A-, B-, AB-, O-.'),



];