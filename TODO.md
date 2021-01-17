# Discussion items:
- where is this GPU notebook from lecture 3? I wasn't able to find it on the site or in the Github repo.
- Discuss idea of a "reflected Kernel" (see `convolve` fn in HW2). Why reflected?
  - also, discuss why the function name is `filter`.. the function commit actually has a nice explainer under "Details"!
  - @n to learn more about fourier transforms.. will this class cover or can we find/make a Pluto notebook to learn more?
- My environment seems to be quite slow when running `shrink_n(img, 200, ...)` ... previously I thought it was my Seam Carving implementation, but now I'm wondering if something else might be going on, as even the `seam_from_precomputed_least_energy` efficient implementation is failing (perhaps I have a bug in my efficient implementation)

# TODO

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
- [ ] Learn keyboard shortcuts for Pluto
- [ ] Setup a `juliarc.jl` file with convenience functions and prefs
  - [ ] e.g. can support more math chars via https://stackoverflow.com/questions/36358017/subscript-multiple-characters-in-julia-variable-name
