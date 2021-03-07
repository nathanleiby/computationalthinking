# Discussion items:
- HW7
- HW6
  - [x] `return h * fprime(a+h) + fa` ... `# TODO: why a + h` .. needs better context to explain. e.g. could average two adjacent values instead
  - [x] why small `h`
  - [x] stopping condition? on the right track, perhaps can
  - [x] 3d viz wasn't working for me .. installed `PlotlyBase` based on error messages. Then also `sudo pacman -S pdf2svg`. fixed!
- L12
  - This math and the derivations were most challenging for me, as I haven't done calculus in a long time and never studied differential equations
- L11
  - Nouns and verbs.. how did he draw that nice type hierarchy? look into the code in that Pluto notebook..
- L10
  - Julia reply has several special modes
    - `?` for help
    - `]` for package manager
    - `;` for shell
- Lecture 7
  - When to use symbol `:country` or string `"country"`?
- Is there a magical way to discover methods from a package more easily? e.g. how can I know all the useful functions I might apply to a dataframe? autocompletion to discover functionality (or simply remember a method name) seemsharder in Julia
- Discuss idea of a "reflected Kernel" (see `convolve` fn in HW2). Why reflected?
  - also, discuss why the function name is `filter`.. the function commit actually has a nice explainer under "Details"!
  - @n to learn more about fourier transforms.. will this class cover or can we find/make a Pluto notebook to learn more?
- How much more efficient is the storage of the SVD version of the image vs the source image (216x384)?

# TODO


- [ ] PRs to ComputationalThinking Github
  - clarify `least_energy` vs `energies` in HW.
  - add Lecture 7.2, 7.3: add a `head` function or use `first(df, 10)`
- [ ] HW2: Rewrite a shrink_n that doesn't recompute least_energy matrix (the expensive part!) on each iteration.
- [ ] use broadcast `.` more. E.g. `noisify.(image, s)` to broadcast a function.
- [ ] try writing docstrings for my own functions and see if they appear in Pluto
- [x] is it possible to write assertions or tests within a Pluto notebook?
  - Yes! In HW2, they use an `@assert` within a function.
  ```julia
  function remove_in_each_row_views(img, column_numbers)
	  @assert size(img, 1) == length(column_numbers) # same as the number of rows
    ...
  end
  ```
- [ ] Learn keyboard shortcuts for Pluto (https://github.com/fonsp/Pluto.jl/issues/65#issue-595782206)
- [ ] Setup a `juliarc.jl` file with convenience functions and prefs
  - [ ] e.g. can support more math chars via https://stackoverflow.com/questions/36358017/subscript-multiple-characters-in-julia-variable-name
  - a starter: `head(x) = first(x, 10)`
- [ ] L5: review eigenvalues: https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors
- [ ] L5: review SVD: https://en.wikipedia.org/wiki/Singular_value_decomposition
- [ ] Explore writing Julia within VSCode. How is that vs Pluto?
  - How is the feedback loop for viewing plots and playing with images? (https://www.julia-vscode.org/)
  - Is there a Pluto binding so I can edit code in VSCode but otherwise render in Pluto? (https://github.com/fonsp/Pluto.jl/issues/303)
- Math / theory review
  - https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors
  - https://en.wikipedia.org/wiki/Singular_value_decomposition
    - SVD paper: http://languagelog.ldc.upenn.edu/myl/Moler1983.pdf
  - https://en.wikipedia.org/wiki/Law_of_large_numbers
  - https://en.wikipedia.org/wiki/Central_limit_theorem
- [ ] Read (or skim) this book on Julia lang: https://syl1.gitbook.io/julia-language-a-concise-tutorial/language-core/getting-started
