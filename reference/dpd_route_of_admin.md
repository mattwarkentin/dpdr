# Route of Administration

Indicates the part of the body on which, through which or into which the
product is to be introduced (e.g. oral, topical, intramuscular, rectal).

## Usage

``` r
dpd_route_of_admin(id, active = FALSE, lang = c("en", "fr"))
```

## Arguments

- id:

  Drug product code.

- active:

  Only return dosage forms that are active? Default is `FALSE`.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `drug_code`: Code assigned to each drug product.

- `route_of_administration_code`: Code assigned to a route of
  administration.

- `route_of_administration_name`: Route of administration.

## Details

A product can have more than one route of administration (e.g.
intravenous, intramuscular, intra-articular).

## Examples

``` r
dpd_route_of_admin(3)
#> # A tibble: 5 × 3
#>   drug_code route_of_administration_code route_of_administration_name
#>       <int>                        <int> <chr>                       
#> 1         3                           33 Intraperitoneal             
#> 2         3                           49 Intravenous                 
#> 3         3                           31 Intrathecal                 
#> 4         3                           34 Intrapleural                
#> 5         3                           10 Intra-Articular             
```
