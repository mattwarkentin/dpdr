# Product Status

The statuses listed below are a direct representation of the status
available in DPD Online Query and the description of each status is
summarized below.

## Usage

``` r
dpd_product_status(id, lang = c("en", "fr"))
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

- `expiration_date`: Latest expiry date of a product distributed in
  Canada, where the product has since been discontinued by the company.

- `external_status_code`: Code assigned to an external drug's status.

- `history_date`: Historical date associated with a drug's status.

- `lot_number`: Latest lot number of a product distributed in Canada,
  where the product has since been discontinued by the company.

- `original_market_date`: Original market date of a product.

## Examples

``` r
dpd_product_status()
#> # A tibble: 57,788 × 7
#>    drug_code status       history_date original_market_date external_status_code
#>        <int> <chr>        <chr>        <chr>                               <int>
#>  1      4264 Cancelled P… 1998-09-25   1978-12-31                              4
#>  2      3460 Cancelled P… 1996-09-09   1979-12-31                              4
#>  3      3466 Cancelled P… 2019-05-27   1979-12-31                              4
#>  4      3776 Cancelled P… 1998-09-25   1980-12-31                              4
#>  5      4343 Cancelled P… 1997-05-30   1981-12-31                              4
#>  6      3797 Cancelled (… 2023-01-09   1979-12-31                              9
#>  7      3509 Cancelled P… 2004-08-16   1979-12-31                              4
#>  8      4079 Cancelled P… 1997-08-13   1963-12-31                              4
#>  9      4083 Cancelled P… 1998-07-09   1981-12-31                              4
#> 10      4084 Cancelled P… 2001-08-02   1963-12-31                              4
#> # ℹ 57,778 more rows
#> # ℹ 2 more variables: expiration_date <chr>, lot_number <chr>
```
