\l solve.q

test_compare: {[w1;w2;expected]
  show w1," vs ",w2,", expected: ",expected;
  res: compare_2[w1;w2];
  show "result: ",res;
  show $[o:res~expected;"PASS";"FAIL"];
  :o
  };

run_tests: {[test_inputs]
  res: {test_compare[x 0;x 1;x 2]}each test_inputs;
  $[any not res; show "FAILED TESTS"; show "PASSED TESTS"]
  };

test_data: (
  ("abcde";"fghij";"bbbbb");
  ("abcde";"abcde";"ggggg");
  ("abcde";"adhij";"gobbb");
  ("bbxxb";"aabba";"bboob");
  ("bbxxx";"aabbb";"bboob");
  ("aabba";"xbbbx";"bbggb");
  ("aabba";"bxbxb";"obgbb");
  ("aabba";"bxxbx";"obbgb");
  ("abaaa";"bbxxx";"bgbbb"));

run_tests[test_data];