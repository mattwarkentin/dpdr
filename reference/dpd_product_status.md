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
#> # A tibble: 57,818 × 7
#>    drug_code status   history_date original_market_date external_status_code
#>        <int> <chr>    <chr>        <chr>                               <int>
#>  1     89155 Approved 2013-05-23   NA                                      1
#>  2     89186 Approved 2013-05-30   NA                                      1
#>  3     88986 Approved 2013-04-22   NA                                      1
#>  4     89018 Approved 2013-05-01   NA                                      1
#>  5     88575 Approved 2013-01-23   NA                                      1
#>  6     88859 Approved 2017-05-17   NA                                      1
#>  7     89101 Approved 2013-05-08   NA                                      1
#>  8     88230 Approved 2014-09-10   NA                                      1
#>  9     88324 Approved 2016-01-18   NA                                      1
#> 10     88317 Approved 2017-02-16   NA                                      1
#> # ℹ 57,808 more rows
#> # ℹ 2 more variables: expiration_date <chr>, lot_number <chr>
```
