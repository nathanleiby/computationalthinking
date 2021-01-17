### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ c085ba24-554d-11eb-0aa1-6da7f8a23071
v = [1,2,3,4,5]

# ╔═╡ d20c9eca-554d-11eb-3002-1bcc54c1ca69
v[2]=99

# ╔═╡ d538d064-554d-11eb-0a40-7f2541733534
v[3:5] .= 4 # assign 4 "element-wise"

# ╔═╡ e7ae03c2-554d-11eb-378d-8ffee468a36a
md"The original array got modified"

# ╔═╡ e24b68fc-554d-11eb-1741-c5adeabc934f
v

# ╔═╡ 68c62c3c-554e-11eb-2da5-c142149cfde8
md"taking a slice of an array and giving it a name.. creates a COPY"

# ╔═╡ 0d21b298-554e-11eb-2451-1b1e904b2560
w = v[3:5]

# ╔═╡ 5378b606-554e-11eb-0423-53c8742223a9
md"If we don't want a COPY, we can instead make a `view`"

# ╔═╡ 84b57894-554e-11eb-3f6e-df598fe9f7b4
z = view(v, 3:5)

# ╔═╡ 886a0f22-554e-11eb-2b45-5d8d3a854349
z .= 10

# ╔═╡ 960f0fb0-554e-11eb-0242-5b4239da3d46
@show v

# ╔═╡ a092849e-554e-11eb-2e2c-efa70b09216c
md"A view allows reading and writing of the original data"

# ╔═╡ af9a785c-554e-11eb-0255-9db88f445beb
typeof(w), typeof(z) # they are different types

# ╔═╡ b8a092e4-554e-11eb-2d37-8b1c2a48eacf
md"There's also support for using a macro, if you prefer that syntax. `@view v[3:5]` is same as `view(v, 3:5)`"

# ╔═╡ d89631f6-554e-11eb-2170-2729281d9cd6
md"The same idea applies to matricies!"

# ╔═╡ f040b1e6-554e-11eb-2cbf-459a891bb6a8
M = [10i + j for i in 0:5, j in 1:4]

# ╔═╡ fe65cfa4-554e-11eb-3dda-41c116ca59c8
M[3:5, 1:2] # creates a copy

# ╔═╡ 0510f13a-554f-11eb-089e-493509623d5a
view(M, 3:5, 1:2) == @view M[3:5, 1:2] 

# ╔═╡ 1878912e-554f-11eb-2a02-55a6b91acbd2
M2 = reshape(M, 3,8) # take our 6x4 matrix and reshape it into 3x8

# ╔═╡ 3996554e-554f-11eb-38c0-3fedf826a930
M # during reshape, elements are read column-by-column from left-to-right

# ╔═╡ 3b47ad98-554f-11eb-0b34-8b2452da8b5c
M2

# ╔═╡ 3c54344a-554f-11eb-08d8-153f82134d29
M3 = reshape(M, 2,12)

# ╔═╡ 8ecd01fc-554f-11eb-3a4b-ef62008dc398
md"We can also output the Matrix as a Vector, using `vec()`. this is another way of seeing the order that items are being read! It also shows the order the elements are stored on the computer"

# ╔═╡ 6828e386-554f-11eb-18dd-73e1c7a78376
vv = vec(M)

# ╔═╡ 7cb315ce-554f-11eb-36c0-75f460a93281
M3[1,1] = 99

# ╔═╡ ec2bf22c-554f-11eb-3c87-f5f2edf47066
begin
	f = ind -> ind.I 
	f.(CartesianIndices((-2:2, -1:1)))
end

# ╔═╡ 352a9220-5551-11eb-2406-4114ac200f76


# ╔═╡ e0850d5a-554f-11eb-1819-b3029b16a404


# ╔═╡ Cell order:
# ╠═c085ba24-554d-11eb-0aa1-6da7f8a23071
# ╠═d20c9eca-554d-11eb-3002-1bcc54c1ca69
# ╠═d538d064-554d-11eb-0a40-7f2541733534
# ╟─e7ae03c2-554d-11eb-378d-8ffee468a36a
# ╠═e24b68fc-554d-11eb-1741-c5adeabc934f
# ╟─68c62c3c-554e-11eb-2da5-c142149cfde8
# ╠═0d21b298-554e-11eb-2451-1b1e904b2560
# ╟─5378b606-554e-11eb-0423-53c8742223a9
# ╠═84b57894-554e-11eb-3f6e-df598fe9f7b4
# ╠═886a0f22-554e-11eb-2b45-5d8d3a854349
# ╠═960f0fb0-554e-11eb-0242-5b4239da3d46
# ╟─a092849e-554e-11eb-2e2c-efa70b09216c
# ╠═af9a785c-554e-11eb-0255-9db88f445beb
# ╠═b8a092e4-554e-11eb-2d37-8b1c2a48eacf
# ╠═d89631f6-554e-11eb-2170-2729281d9cd6
# ╠═f040b1e6-554e-11eb-2cbf-459a891bb6a8
# ╠═fe65cfa4-554e-11eb-3dda-41c116ca59c8
# ╠═0510f13a-554f-11eb-089e-493509623d5a
# ╠═1878912e-554f-11eb-2a02-55a6b91acbd2
# ╠═3996554e-554f-11eb-38c0-3fedf826a930
# ╠═3b47ad98-554f-11eb-0b34-8b2452da8b5c
# ╠═3c54344a-554f-11eb-08d8-153f82134d29
# ╟─8ecd01fc-554f-11eb-3a4b-ef62008dc398
# ╠═6828e386-554f-11eb-18dd-73e1c7a78376
# ╠═7cb315ce-554f-11eb-36c0-75f460a93281
# ╠═ec2bf22c-554f-11eb-3c87-f5f2edf47066
# ╠═352a9220-5551-11eb-2406-4114ac200f76
# ╠═e0850d5a-554f-11eb-1819-b3029b16a404
