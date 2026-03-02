# dpdr

The goal of `dpdr` is to provide a programmatic interface to Health
Canada’s Drug Product Database (DPD) REST API to query information about
drugs approved for use in Canada.

More information on the DPD can be found in the API guide
(<https://health-products.canada.ca/api/documentation/dpd-documentation-en.html>).

## Installation

You can install the CRAN version of `dpdr` with:

``` r
install.packages("dpdr")
```

You can install the development version of `dpdr` from
[GitHub](https://github.com/mattwarkentin/dpdr) with:

``` r
# install.packages("remotes")
remotes::install_github("mattwarkentin/dpdr")
```

## Usage

There are 11 API endpoints as part of Health Canada’s Drug Product
Database API. Each of these endpoints will be demonstrated in the
following sections.

``` r
library(dpdr)
```

### Active Ingredient

We can search for active ingredient information based on the drug code…

``` r
dpd_active_ingredient(id = 48905)
#> # A tibble: 23 × 6
#>    dosage_unit dosage_value drug_code ingredient_name     strength strength_unit
#>    <chr>       <chr>            <int> <chr>               <chr>    <chr>        
#>  1 ""          ""               48905 VITAMIN A           1250     UNIT         
#>  2 ""          ""               48905 BETA-CAROTENE (PRO… 2916     UNIT         
#>  3 ""          ""               48905 VITAMIN B1          2.25     MG           
#>  4 ""          ""               48905 VITAMIN B2          3.75     MG           
#>  5 ""          ""               48905 NICOTINAMIDE        20       MG           
#>  6 ""          ""               48905 VITAMIN B6          5        MG           
#>  7 ""          ""               48905 D-PANTOTHENIC ACID  10       MG           
#>  8 ""          ""               48905 FOLIC ACID          0.2      MG           
#>  9 ""          ""               48905 BIOTIN              75       MCG          
#> 10 ""          ""               48905 VITAMIN B12         9        MCG          
#> # ℹ 13 more rows
```

Or based on the name of a drug.

``` r
dpd_active_ingredient(name = "afatinib")
#> # A tibble: 12 × 6
#>    dosage_unit dosage_value drug_code ingredient_name     strength strength_unit
#>    <chr>       <chr>            <int> <chr>               <chr>    <chr>        
#>  1 ""          ""               90027 AFATINIB (AFATINIB… 30       MG           
#>  2 ""          ""               90026 AFATINIB (AFATINIB… 20       MG           
#>  3 ""          ""               90028 AFATINIB (AFATINIB… 40       MG           
#>  4 ""          ""              100203 AFATINIB (AFATINIB… 20       MG           
#>  5 ""          ""              100392 AFATINIB (AFATINIB… 30       MG           
#>  6 ""          ""              100205 AFATINIB (AFATINIB… 40       MG           
#>  7 ""          ""              100391 AFATINIB (AFATINIB… 20       MG           
#>  8 ""          ""              100635 AFATINIB (AFATINIB… 20       MG           
#>  9 ""          ""              100204 AFATINIB (AFATINIB… 30       MG           
#> 10 ""          ""              100393 AFATINIB (AFATINIB… 40       MG           
#> 11 ""          ""              100637 AFATINIB (AFATINIB… 40       MG           
#> 12 ""          ""              100636 AFATINIB (AFATINIB… 30       MG
```

### Company

We can search for information about a drug company:

``` r
dpd_company(10825)
#> # A tibble: 1 × 10
#>   city_name  company_code company_name company_type country_name post_office_box
#>   <chr>             <int> <chr>        <chr>        <chr>        <chr>          
#> 1 Mississau…        10825 PAX-ALL MAN… DIN OWNER    Canada       ""             
#> # ℹ 4 more variables: postal_code <chr>, province_name <chr>,
#> #   street_name <chr>, suite_number <chr>
```

### Drug Product

The family of drug product functions allow us to query information about
drug products based on the drug product code or drug identification
number (DIN).

``` r
dpd_drug_product(id = 2049)
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

``` r
dpd_drug_product(din = '00326925')
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

We can also find the list of drugs based on the drugs product status.

``` r
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

Or, we can find the list of drugs based on the brand names.

``` r
dpd_drug_product(brandname = "cidyl")
#> # A tibble: 3 × 9
#>   drug_code class_name drug_identification_number brand_name         descriptor
#>       <int> <chr>      <chr>                      <chr>              <chr>     
#> 1       225 Human      00000019                   PLACIDYL CAP 200MG ""        
#> 2       226 Human      00000027                   PLACIDYL CAP 500MG ""        
#> 3      1245 Human      00228893                   PLACIDYL CAP 750MG ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

### Dosage Form

The dosage form is form of presentation in which the product is
supplied. We can query dosage form based on the drug product code.

``` r
dpd_dosage_form(10846)
#> # A tibble: 2 × 3
#>   drug_code pharmaceutical_form_code pharmaceutical_form_name
#>       <int>                    <int> <chr>                   
#> 1     10846                       34 Liquid                  
#> 2     10846                       43 Ointment
```

### Packaging

We can query the information about package sizes based on the drug
product code.

``` r
dpd_packaging(11685)
#> # A tibble: 1 × 6
#>   drug_code upc   package_size_unit package_type package_size
#>       <int> <chr> <chr>             <chr>        <chr>       
#> 1     11685 ""    ""                ""           ""          
#> # ℹ 1 more variable: product_information <chr>
```

### Pharmaceutical Standard

We can query the standard to which the drug product is manufactured and
represented, based on the drug product code.

``` r
dpd_pharm_standard(11534)
#> # A tibble: 1 × 2
#>   drug_code pharmaceutical_std
#>       <int> <chr>             
#> 1     11534 MFR
```

### Route of Administration

We can query the route of administration for a drug based on the drug
product code.

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

### Schedule

Each drug is assigned one or more schedules, we can query this based on
the drug product code (see
[`?dpd_schedule`](https://mattwarkentin.github.io/dpdr/reference/dpd_schedule.md)
for more information).

``` r
dpd_schedule(10687)
#> # A tibble: 2 × 2
#>   drug_code schedule_name
#>       <int> <chr>        
#> 1     10687 SCHEDULE D   
#> 2     10687 PRESCRIPTION
```

### Product Status

We can query the product status of a drug product.

``` r
dpd_product_status()
#> # A tibble: 57,818 × 7
#>    drug_code status   history_date original_market_date external_status_code
#>        <int> <chr>    <chr>        <chr>                               <int>
#>  1     89155 Approved 2013-05-23   <NA>                                    1
#>  2     89186 Approved 2013-05-30   <NA>                                    1
#>  3     88986 Approved 2013-04-22   <NA>                                    1
#>  4     89018 Approved 2013-05-01   <NA>                                    1
#>  5     88575 Approved 2013-01-23   <NA>                                    1
#>  6     88859 Approved 2017-05-17   <NA>                                    1
#>  7     89101 Approved 2013-05-08   <NA>                                    1
#>  8     88230 Approved 2014-09-10   <NA>                                    1
#>  9     88324 Approved 2016-01-18   <NA>                                    1
#> 10     88317 Approved 2017-02-16   <NA>                                    1
#> # ℹ 57,808 more rows
#> # ℹ 2 more variables: expiration_date <chr>, lot_number <chr>
```

### Therapeutic Class

We can query the Therapeutic Class according to a drugs main therapeutic
use.

``` r
dpd_therapeutic_class(10564)
#> # A tibble: 1 × 5
#>   drug_code tc_atc_number tc_atc                  tc_ahfs_number tc_ahfs
#>       <int> <chr>         <chr>                   <chr>          <chr>  
#> 1     10564 V07AV         TECHNICAL DISINFECTANTS ""             ""
```

### Veterinary Species

Lastly, we can query the species for a drug product based on the
veterinary drug product code.

``` r
dpd_vet_species(13755)
#> # A tibble: 3 × 2
#>   drug_code vet_species_name
#>       <int> <chr>           
#> 1     13755 Horses          
#> 2     13755 Cats            
#> 3     13755 Dogs
```

## Code of Conduct

Please note that the dpdr project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
