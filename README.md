# qwordle
Worlde solver written in q

Gives best guess given your results.
Input by creating a text file with your guesses and results first line being your guesses and second line being results, all comma separated.
Results as a string with g being green, o being orange and b being black.

Example
```
canes,ample,adept
bobob,obooo,oboob
```

Run solve.q with argument as path to your input file.
Example
`q solve.q input.txt`
