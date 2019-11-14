// Challenge
// Matryoshka dolls are traditionally wooden dolls that can be nested by fitting
// smaller dolls into larger ones. Suppose arrays can be nested similarly,
// placing smaller arrays into larger ones, in the following sense:
//
//// Array A can be nested inside Array B if:
//// 1. min(array A) > min(array B)
//// 2. max(array A) < max(array B)

//// For example, if A = [2, 3, 9, 5] and B = [10, 2, 1], then A can be nested inside B, since:
////  - min(A) = 2 > 1 = min(B) and
////   - max(A) = 9 < 10 = max(B)

/// Create a function that returns true if every single sub-array inside an array
/// can be nested Matroyshka style, and false otherwise.
bool matryoshka(List<List<int>> numbersList) {
  for (var listItem in numbersList) {
    if (!canListBeNestedInAnyOtherList(listItem, numbersList)) {
      return false;
    }
  }
  return true;
}

compare2Lists4Nesting(List a, List b) {
  a.sort();
  b.sort();
  int aMin = a.first;
  int aMax = a.last;
  int bMin = b.first;
  int bMax = b.last;
  // min(array A) > min(array B) and  max(array A) < max(array B)
  return (aMin > bMin && aMax < bMax) || (bMin > aMin && bMax < aMax);
}

canListBeNestedInAnyOtherList(List<int> a, List<List<int>> numbersList) {
  a.sort();
  int aMin = a.first;
  int aMax = a.last;
  for (var x in numbersList) {
    if (compare2Lists4Nesting(a, x)) {
      return true;
    }
  }
  return false;
}

main() {
  //two lists
  print(matryoshka([
    [2, 3, 9, 5],
    [10, 2, 1]
  ]));
  //multiple lists
  print(matryoshka([
    [8, 10],
    [7, 11],
    [6, 12],
    [5, 13]
  ]));
  //just one list
  print(matryoshka([
    [2, 3, 9, 5],
  ]));
  //two same lists
  print(matryoshka([
    [2, 3, 9, 5],
    [2, 3, 9, 5],
  ]));
  //just one item in a oen of the list
  print(matryoshka([
    [
      2,
    ],
    [1, 2, 3],
  ]));
  //one item in both lists
  print(matryoshka([
    [
      2,
    ],
    [2],
  ]));
  print(matryoshka([
    [
      2,
    ],
    [3],
  ]));
}
