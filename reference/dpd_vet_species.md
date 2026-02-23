# Veterinary Species

The type of species for a certain veterinary product (e.g. sheep, dog,
cattle, and poultry).

## Usage

``` r
dpd_vet_species(id, lang = c("en", "fr"))
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

- `vet_species_name`: Animal species.

## Examples

``` r
dpd_vet_species(13755)
#> # A tibble: 3 × 2
#>   drug_code vet_species_name
#>       <int> <chr>           
#> 1     13755 Horses          
#> 2     13755 Cats            
#> 3     13755 Dogs            
```
