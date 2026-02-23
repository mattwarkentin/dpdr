# Packaging

Information about available package sizes for each drug product.

## Usage

``` r
dpd_packaging(id, lang = c("en", "fr"))
```

## Arguments

- id:

  Drug product code.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `drug_code`: Code assigned to each drug product.

- `package_size`: Size of package.

- `package_size_unit`: Unit for package size.

- `package_type`: Type of package.

- `product_information`: Additional product information.

- `upc`: Universal Product Code.

## Examples

``` r
dpd_packaging(11685)
#> # A tibble: 1 × 6
#>   drug_code upc   package_size_unit package_type package_size
#>       <int> <chr> <chr>             <chr>        <chr>       
#> 1     11685 ""    ""                ""           ""          
#> # ℹ 1 more variable: product_information <chr>
```
