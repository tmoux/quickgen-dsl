Declarative DSL

Initially, s-exp syntax (can configure this later)

Designed to be easy to learn, fast to write, and declarative (easily representing most simple input formats)

Designed to be extensible via libraries

- Declaring variables (desugar to regular racket syntax)
- Include regular racket syntax via splices
- Should use indentation and whitespace over brackets

- Core functionality:
- add-to-output indicates that the expression should be added to the final output
- array creates an array of size n
- permutation creates a permutation of size n
- testcases creates T separate test cases