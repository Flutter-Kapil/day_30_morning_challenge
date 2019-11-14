import 'dart:math';

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
  numbersList.forEach((subList) => subList.sort());
  numbersList
      .where((subList) => subList.length > 1)
      .forEach((subList) => subList.removeRange(1, subList.length - 1));
  print(numbersList);
  return !numbersList
      .any((subList) => !canListBeNestedInAnyOtherList(subList, numbersList));
}

compare2Lists4Nesting(List<int> a, List<int> b) =>
    (a.reduce(min) > b.reduce(min) && a.reduce(max) < b.reduce(max)) ||
    (b.reduce(min) > a.reduce(min) && b.reduce(max) < a.reduce(max));
canListBeNestedInAnyOtherList(List<int> a, List<List<int>> numbersList) =>
    numbersList.any((subList) => compare2Lists4Nesting(subList, a));

main() {
  //two lists
  print(matryoshka([
    [2, 3, 9, 5],
    [10, 2, 1]
  ]));
  //multiple lists
//  matryoshka([
//    [4, 9, 8, 14, 11],
//    [12, 3, 9, 8],
//    [9, 2, 6, 8]
//  ]);
}
