
# dpdr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mattwarkentin/dpdr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mattwarkentin/dpdr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `dpdr` is to provide a programmatic interface to the Health
Canada Drug Product Database API.

## Installation

You can install the development version of `dpdr` from
[GitHub](https://github.com/) with:

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
dpd_ai_id(48905)
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
dpd_ai_name('afatinib')
#> # A tibble: 12 × 6
#>    dosage_unit dosage_value drug_code ingredient_name     strength strength_unit
#>    <chr>       <chr>            <int> <chr>               <chr>    <chr>        
#>  1 ""          ""               90026 AFATINIB (AFATINIB… 20       MG           
#>  2 ""          ""               90027 AFATINIB (AFATINIB… 30       MG           
#>  3 ""          ""               90028 AFATINIB (AFATINIB… 40       MG           
#>  4 ""          ""              100203 AFATINIB (AFATINIB… 20       MG           
#>  5 ""          ""              100204 AFATINIB (AFATINIB… 30       MG           
#>  6 ""          ""              100205 AFATINIB (AFATINIB… 40       MG           
#>  7 ""          ""              100391 AFATINIB (AFATINIB… 20       MG           
#>  8 ""          ""              100392 AFATINIB (AFATINIB… 30       MG           
#>  9 ""          ""              100393 AFATINIB (AFATINIB… 40       MG           
#> 10 ""          ""              100635 AFATINIB (AFATINIB… 20       MG           
#> 11 ""          ""              100636 AFATINIB (AFATINIB… 30       MG           
#> 12 ""          ""              100637 AFATINIB (AFATINIB… 40       MG
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
drug products based on the drug id or drug identification number (DIN).

``` r
dpd_drug_id(2049)
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

``` r
dpd_drug_din('00326925')
#> # A tibble: 1 × 9
#>   drug_code class_name drug_identification_number brand_name descriptor
#>       <int> <chr>      <chr>                      <chr>      <chr>     
#> 1      2049 Human      00326925                   SINEQUAN   ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

We can also find the list of drugs based on the drugs product status
(see `?dpd_drug_status` for more information).

``` r
dpd_drug_status(6)
#> # A tibble: 2,770 × 9
#>    drug_code class_name drug_identification_number brand_name         descriptor
#>        <int> <chr>      <chr>                      <chr>              <chr>     
#>  1       209 Human      00001686                   XYLOCAINE VISCOUS… ""        
#>  2       157 Human      00010332                   ENTROPHEN 325MG T… ""        
#>  3       468 Human      00010340                   ENTROPHEN ECT 650… ""        
#>  4      1184 Human      00015547                   KEFLEX             ""        
#>  5      1212 Human      00035645                   KEFLEX             ""        
#>  6      1748 Human      00037958                   DEXTROSE INJECTIO… ""        
#>  7      1751 Human      00038873                   5% DEXTROSE AND 0… ""        
#>  8      2575 Human      00038881                   3.33% DEXTROSE AN… ""        
#>  9      1548 Human      00039306                   LACTATE 1-2-3 INJ… ""        
#> 10      1739 Human      00039489                   NORMOSOL-M & 5% D… "SINGLE-D…
#> # ℹ 2,760 more rows
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

Lastly, we can find all possible DINs associated with a drug name.

``` r
dpd_drug_dins('afatinib')
#> # A tibble: 12 × 9
#>    drug_code class_name drug_identification_number brand_name      descriptor
#>        <int> <chr>      <chr>                      <chr>           <chr>     
#>  1     90026 Human      02415666                   GIOTRIF         ""        
#>  2     90027 Human      02415674                   GIOTRIF         ""        
#>  3     90028 Human      02415682                   GIOTRIF         ""        
#>  4    100203 Human      02512777                   SANDOZ AFATINIB ""        
#>  5    100204 Human      02512785                   SANDOZ AFATINIB ""        
#>  6    100205 Human      02512793                   SANDOZ AFATINIB ""        
#>  7    100391 Human      02514591                   TEVA-AFATINIB   ""        
#>  8    100392 Human      02514605                   TEVA-AFATINIB   ""        
#>  9    100393 Human      02514613                   TEVA-AFATINIB   ""        
#> 10    100635 Human      02517019                   MAR-AFATINIB    ""        
#> 11    100636 Human      02517027                   MAR-AFATINIB    ""        
#> 12    100637 Human      02517035                   MAR-AFATINIB    ""        
#> # ℹ 4 more variables: number_of_ais <chr>, ai_group_no <chr>,
#> #   company_name <chr>, last_update_date <chr>
```

### Dosage Form

The dosage form is form of presentation in which the product is
supplied. We can query dosage form based on the drug product code.

``` r
dpd_dosage(10846)
#> # A tibble: 2 × 3
#>   drug_code pharmaceutical_form_code pharmaceutical_form_name
#>       <int>                    <int> <chr>                   
#> 1     10846                       43 Ointment                
#> 2     10846                       34 Liquid
```

### Packaging

We can query the information about package sizes based on the drug
product code.

``` r
dpd_packaging(11685)
#> # A tibble: 1 × 6
#>   drug_code upc          package_size_unit package_type package_size
#>       <int> <chr>        <chr>             <chr>        <chr>       
#> 1     11685 055599047240 Ea                Blister Pack 24          
#> # ℹ 1 more variable: product_information <chr>
```

### Pharmaceutical Standard

We can query the standard to which the drug product is manufactured and
represented, based on the drug product code.

``` r
dpd_pharm_std(11534)
#> # A tibble: 1 × 2
#>   drug_code pharmaceutical_std
#>       <int> <chr>             
#> 1     11534 MFR
```

### Route of Administration

We can query the route of administration for a drug based on the drug
product code.

``` r
dpd_route(3)
#> # A tibble: 5 × 3
#>   drug_code route_of_administration_code route_of_administration_name
#>       <int>                        <int> <chr>                       
#> 1         3                           34 Intrapleural                
#> 2         3                           10 Intra-Articular             
#> 3         3                           33 Intraperitoneal             
#> 4         3                           49 Intravenous                 
#> 5         3                           31 Intrathecal
```

### Schedule

Each drug is assigned one or more schedules, we can query this based on
the drug product code (see `?dpd_schedule` for more information).

``` r
dpd_schedule(10687)
#> # A tibble: 2 × 2
#>   drug_code schedule_name
#>       <int> <chr>        
#> 1     10687 Prescription 
#> 2     10687 Schedule D
```

### Product Status

We can query the status of a drug product based on the drug product
code.

``` r
dpd_status(10229)
#> # A tibble: 1 × 7
#>   drug_code status        history_date original_market_date external_status_code
#>       <int> <chr>         <chr>        <chr>                               <int>
#> 1     10229 Cancelled Po… 1997-10-15   1989-12-31                              4
#> # ℹ 2 more variables: expiration_date <chr>, lot_number <chr>
```

### Therapeutic Class

We can query the Therapeutic Class according to a drugs main therapeutic
use.

``` r
dpd_class(10564)
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
