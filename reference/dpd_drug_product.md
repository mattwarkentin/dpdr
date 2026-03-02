# Drug Product

Basic information about the product, such as brand name and Drug
Identification Number.

## Usage

``` r
dpd_drug_product(id, din, brandname, status, lang = c("en", "fr"))
```

## Arguments

- id:

  Drug product code.

- din:

  Drug Identification Number (DIN).

- brandname:

  Brand name.

- status:

  Drug product status. See **Details** section.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `ai_group_no`: Active Ingredient Group Number.

- `brand_name`: Brand name for the drug product.

- `class_name`: Therapeutic class of a drug product.

- `descriptor`: Additional details or descriptions for a product, if
  applicable.

- `drug_code`: Code assigned to each drug product.

- `drug_identification_number`: Drug Identification Number.

- `number_of_ais`: Number of Active Ingredients in a drug product.

- `company_name`: Company name.

- `last_update_date`: Date is updated any time certain, but not all, key
  fields are changed.

## Details

`status` must be an integer, corresponding to the following statuses:

- `1`: Approved

- `2`: Marketed

- `3`: Cancelled Pre Market

- `4`: Cancelled Post Market

- `6`: Dormant

- `9`: Cancelled (Unreturned Annual)

- `10`: Cancelled (Safety Issue)

- `11`: Authorized By Interim Order

- `12`: Authorization By Interim Order Revoked

- `13`: Restricted Access

- `14`: Authorization By Interim Order Expired

- `15`: Cancelled (Transitioned to Biocides)

## Examples

``` r
dpd_drug_product(id = 2049)
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>

dpd_drug_product(din = '00326925')
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>

dpd_drug_product(brandname = "cidyl")
#> # A tibble: 3 × 9
#>   drug_code class_name drug_identification_number brand_name         descriptor
#>       <int> <chr>      <chr>                      <chr>              <chr>     
#> 1       225 Human      00000019                   PLACIDYL CAP 200MG ""        
#> 2       226 Human      00000027                   PLACIDYL CAP 500MG ""        
#> 3      1245 Human      00228893                   PLACIDYL CAP 750MG ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>

dpd_drug_product(status = 1)
#> # A tibble: 3,970 × 9
#>    drug_code class_name   drug_identification_number brand_name       descriptor
#>        <int> <chr>        <chr>                      <chr>            <chr>     
#>  1      3724 Veterinary   00455423                   COOL CAST        ""        
#>  2      3312 Veterinary   00455431                   ICE O GEL        ""        
#>  3      3297 Veterinary   00455458                   FREEZEX HOOF FR… ""        
#>  4      6248 Veterinary   00651583                   WIND-AID         ""        
#>  5      6249 Veterinary   00651591                   CHOATES VETERIN… ""        
#>  6     45666 Human        00654493                   PMS-AMITRIPTYLI… ""        
#>  7     21854 Disinfectant 01931814                   NUGEN R-82       ""        
#>  8     21855 Disinfectant 01931822                   NUGEN S-18       ""        
#>  9     25876 Disinfectant 02008459                   NUGEN S-21       ""        
#> 10     25882 Disinfectant 02008505                   NUGEN S-38       ""        
#> # ℹ 3,960 more rows
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```
