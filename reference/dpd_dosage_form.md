# Dosage Form

The dosage form is the form of presentation in which the product is
supplied, for example, tablet, capsule, powder, etc.

## Usage

``` r
dpd_dosage_form(id, active = FALSE, lang = c("en", "fr"))
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

- `pharmaceutical_form_code`: Code assigned to a dosage form.

- `pharmaceutical_form_name`: Dosage form.

## Details

A product can have more than one dosage form when it is a kit (e.g.
tablet, capsule).

## Examples

``` r
dpd_dosage_form(10846)
#> # A tibble: 2 × 3
#>   drug_code pharmaceutical_form_code pharmaceutical_form_name
#>       <int>                    <int> <chr>                   
#> 1     10846                       34 Liquid                  
#> 2     10846                       43 Ointment                
```
