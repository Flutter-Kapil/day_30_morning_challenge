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
  if (numbersList.length == 1) {
    return false;
  }
  numbersList.forEach((subList) => subList.sort());
  numbersList
      .where((subList) => subList.length > 1)
      .forEach((subList) => subList.removeRange(1, subList.length - 1));
  numbersList.sort((a, b) => a[0].compareTo(b[0]));
  for (int i = 0; i < numbersList.length - 1; i++) {
    if (!compare2Lists4Nesting(numbersList[i], numbersList[i + 1])) {
      return false;
    }
  }
  return true;
}

compare2Lists4Nesting(List<int> a, List<int> b) =>
    (b.first > a.first && b.last < a.last);

main() {
  //two lists
  matryoshka([
    [2, 3, 9, 5],
    [10, 2, 1],
    [3],
  ]);
  //multiple lists
//  matryoshka([
//    [4, 9, 8, 14, 11],
//    [12, 3, 9, 8],
//    [9, 2, 6, 8]
//  ]);
}
