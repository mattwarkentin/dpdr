# Pharmaceutical Standard

The standard to which a drug product is manufactured and represented.

## Usage

``` r
dpd_pharm_standard(id, lang = c("en", "fr"))
```

## Arguments

- id:

  Drug product code.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `drug_code`: code assigned to each drug product.

- `pharmaceutical_std`: Pharmaceutical_std

## Examples

``` r
dpd_pharm_standard(11534)
#> # A tibble: 1 × 2
#>   drug_code pharmaceutical_std
#>       <int> <chr>             
#> 1     11534 MFR               
```
