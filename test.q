\l solve.q

test_compare: {[w1;w2;expected]
  show w1," vs ",w2,", expected: ",expected;
  res: compare[w1;w2];
  show "result: ",res;
  show $[o:res~expected;"PASS";"FAIL"];
  :o
  };

run_compare_tests: {[test_inputs]
  res: {test_compare[x 0;x 1;x 2]}each test_inputs;
  show $[any not res;
    "FAILED COMPARE TESTS";
    "PASSED COMPARE TESTS"
    ];
  };

compare_test_data: (
  ("abcde";"fghij";"bbbbb");
  ("abcde";"abcde";"ggggg");
  ("abcde";"adhij";"gobbb");
  ("bbxxb";"aabba";"bboob");
  ("bbxxx";"aabbb";"bboob");
  ("aabba";"xbbbx";"bbggb");
  ("aabba";"bxbxb";"obgbb");
  ("aabba";"bxxbx";"obbgb");
  ("abaaa";"bbxxx";"bgbbb"));

run_compare_tests[compare_test_data];

show $["pearl"~find_best_choice[("canes";"ample";"adept");("bobob";"obooo";"oboob")];
  "PASSED BEST CHOICE TEST";
  "FAILED BEST CHOICE TEST"
  ];