# quickgen

Quickgen is a Racket DSL designed to help competitive programmers generate test cases quickly and without hassle.
It will have many builtin functions to generate common components of test cases, including:

- Arrays
- Permutations
- Random strings
- Graphs
- Trees
- Queries of multiple types

Quickgen can also easily be extended to add whichever features you find useful.

### Why use Quickgen?

During programming contests, every second counts.
You may want to generate a set of test cases for stress-testing or to find a counterexample, but writing generators is a tedious and repetitive process.
Writing generators in Quickgen is fast, intuitive, and comes batteries-included with everything you need.
You won't waste time during a contest remembering how to generate a random graph or fiddling with configuring queries.

There are problems where generating test cases is non-trivial.
Since Quickgen is essentially an extension of Racket, there is no limit to the complexity of testcases it can generate.
However, if you're not as familiar with Racket, it may be better to stick to writing generators by hand in your usual programming language instead for such cases.