# dpdr

The goal of `dpdr` is to provide a programmatic interface to Health
Canada’s Drug Product Database (DPD) REST API to query information about
drugs approved for use in Canada.

More information on the DPD can be found in the API guide
(<https://health-products.canada.ca/api/documentation/dpd-documentation-en.html>).

## Installation

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
#>  1 ""          ""               48905 FOLIC ACID          0.2      MG           
#>  2 ""          ""               48905 BIOTIN              75       MCG          
#>  3 ""          ""               48905 VITAMIN B12         9        MCG          
#>  4 ""          ""               48905 ASCORBIC ACID       125      MG           
#>  5 ""          ""               48905 VITAMIN D2 (VITAMI… 200      UNIT         
#>  6 ""          ""               48905 VITAMIN E           200      UNIT         
#>  7 ""          ""               48905 CHOLINE             5        MG           
#>  8 ""          ""               48905 INOSITOL            5        MG           
#>  9 ""          ""               48905 COPPER (CUPRIC OXI… 1.5      MG           
#> 10 ""          ""               48905 IODINE (POTASSIUM … 0.075    MG           
#> # ℹ 13 more rows
```

Or based on the name of a drug.

``` r
dpd_active_ingredient(name = "afatinib")
#> # A tibble: 12 × 6
#>    dosage_unit dosage_value drug_code ingredient_name     strength strength_unit
#>    <chr>       <chr>            <int> <chr>               <chr>    <chr>        
#>  1 ""          ""               90026 AFATINIB (AFATINIB… 20       MG           
#>  2 ""          ""              100392 AFATINIB (AFATINIB… 30       MG           
#>  3 ""          ""              100203 AFATINIB (AFATINIB… 20       MG           
#>  4 ""          ""              100393 AFATINIB (AFATINIB… 40       MG           
#>  5 ""          ""              100637 AFATINIB (AFATINIB… 40       MG           
#>  6 ""          ""              100636 AFATINIB (AFATINIB… 30       MG           
#>  7 ""          ""               90027 AFATINIB (AFATINIB… 30       MG           
#>  8 ""          ""              100205 AFATINIB (AFATINIB… 40       MG           
#>  9 ""          ""              100204 AFATINIB (AFATINIB… 30       MG           
#> 10 ""          ""              100391 AFATINIB (AFATINIB… 20       MG           
#> 11 ""          ""              100635 AFATINIB (AFATINIB… 20       MG           
#> 12 ""          ""               90028 AFATINIB (AFATINIB… 40       MG
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
#> # A tibble: 3,960 × 9
#>    drug_code class_name   drug_identification_number brand_name       descriptor
#>        <int> <chr>        <chr>                      <chr>            <chr>     
#>  1      1705 Human        00270644                   SEPTRA PEDIATRI… ""        
#>  2      3724 Veterinary   00455423                   COOL CAST        ""        
#>  3      3312 Veterinary   00455431                   ICE O GEL        ""        
#>  4      3297 Veterinary   00455458                   FREEZEX HOOF FR… ""        
#>  5      6248 Veterinary   00651583                   WIND-AID         ""        
#>  6      6249 Veterinary   00651591                   CHOATES VETERIN… ""        
#>  7     45666 Human        00654493                   PMS-AMITRIPTYLI… ""        
#>  8     21854 Disinfectant 01931814                   NUGEN R-82       ""        
#>  9     21855 Disinfectant 01931822                   NUGEN S-18       ""        
#> 10     25876 Disinfectant 02008459                   NUGEN S-21       ""        
#> # ℹ 3,950 more rows
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
