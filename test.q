\l solve.q

test_compare: {[w1;w2;expected]
  show w1," vs ",w2,", expected: ",expected;
  res: compare1[w1;w2];
  show "result: ",res;
  show $[res~expected;"PASS";"FAIL"];
  };

test_compare["abcde";"fghij";"bbbbb"];
test_compare["abcde";"adhij";"gobbb"];
test_compare["aabba";"bbxxb";"bboob"];
test_compare["aabbb";"bbxxx";"bboob"];
test_compare["abaaa";"bbxxx";"bgbbb"];
