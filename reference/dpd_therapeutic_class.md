# Therapeutic Class

A drug's Therapeutic Classification (Class) is assigned according to its
main therapeutic use.

## Usage

``` r
dpd_therapeutic_class(id, lang = c("en", "fr"))
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

- `tc_atc_number`: Anatomical Therapeutic Chemical Code.

- `tc_atc`: Description of the Anatomical Therapeutic Chemical Code.

- `tc_ahfs_number`: American Hospital Formulary Service code.

- `tc_ahfs`: Description of the American Hospital Formulary Service.

## Examples

``` r
dpd_therapeutic_class(10564)
#> # A tibble: 1 × 5
#>   drug_code tc_atc_number tc_atc                  tc_ahfs_number tc_ahfs
#>       <int> <chr>         <chr>                   <chr>          <chr>  
#> 1     10564 V07AV         TECHNICAL DISINFECTANTS ""             ""     
```
