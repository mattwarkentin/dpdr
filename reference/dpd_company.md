# Company

Company information associated with a company code.

## Usage

``` r
dpd_company(id, lang = c("en", "fr"))
```

## Arguments

- id:

  Company code.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `city_name`: City name.

- `company_code`: Code assigned to a company.

- `company_name`: Company name.

- `company_type`: Company type.

- `country_name`: Country name.

- `post_office_box`: P.O. box number (if applicable).

- `postal_code`: Postal code.

- `province_name`: Province name.

- `street_name`: Street name.

- `suite_number`: Suite number.

## Details

In the DPD, a product may have several companies associated with them.
Each product will have a DIN Owner associated with it. If a DIN Owner
has designated another company to receive their mailing, their name and
address will also be included and can be identified with a 'Y' flag in
the ADDRESS_MAILING_FLAG field.

The company contact information is not included in the API
(ATTENTION_TO, LANGUAGE, TELEPHONE_NUMBER, FAX_NUMBER, EMAIL_ADDRESS).
The contact information in the database is generally a representative
from the Regulatory Affairs department. It has come to our attention
that some users are contacting these individuals to make general
inquiries, we would like to recommend not doing so.

## Examples

``` r
dpd_company(10825)
#> # A tibble: 1 × 10
#>   city_name  company_code company_name company_type country_name post_office_box
#>   <chr>             <int> <chr>        <chr>        <chr>        <chr>          
#> 1 Mississau…        10825 PAX-ALL MAN… DIN OWNER    Canada       ""             
#> # ℹ 4 more variables: postal_code <chr>, province_name <chr>,
#> #   street_name <chr>, suite_number <chr>
```
