# Lecture 7 - 3: DataFrames

Bootstrap via

```julia
csv_data = CSV.File("file.csv")
data = DataFrame(csv_data)
```

Dataframe is a standard way to store and manipulate heterogenous table (different types per column)

You can do string interpolation in your markdown, like:

```julia
md"$(Text(countries[i]))"
```

Whoa, crazy syntax for `==(x)` function, but kinda cool too!
Gotta get used to symbolic function names...

```julia
US_row = findfirst(==("US"), all_countries)
```

--

- `names(df)` gives a vector of column names
