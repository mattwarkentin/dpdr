# Active Ingredient

An Active Ingredient is any component that has medicinal properties, and
supplies pharmacological activity or other direct effect in the
diagnosis, cure, mitigation, treatment or prevention of disease, or to
affect the structure or any function of the body of a human or an
animal.

## Usage

``` r
dpd_active_ingredient(id, name, lang = c("en", "fr"))
```

## Arguments

- id:

  Drug product code.

- name:

  Ingredient name.

- lang:

  Language of the response. One of `"en"` or `"fr"` for English or
  French, respectively.

## Value

A `tibble` with columns:

- `dosage_unit`: Active ingredient dosage unit.

- `dosage_value`: Quantitative value of the active ingredient dosage.

- `drug_code`: Code assigned to each drug product.

- `ingredient_name`: Ingredient name.

- `strength`: Quantitative value of the active ingredient strength.

- `strength_unit`: Active ingredient strength unit.

## Details

The name and strength of each active ingredient contained in the product
is listed. Information enclosed within brackets represents the salt and
identifies how the ingredient is supplied. This information is only
included for some ingredients. The number in the strength field refers
to the active portion of the drug. For example, for calcium (calcium
carbonate) 200 milligram (mg) - 200 mg is the strength of elemental
calcium, not calcium carbonate.

Health Canada has a reference text hierarchy for ingredient
nomenclature. The International Non Proprietary Names (INN) is used as
Health Canada's standard to assign the preferred name to ingredients.
There are other standards such as the United States Adopted Names
(USAN), Martindale, Merck Index, etc., that are used to code ingredients
if they are not listed in the INN.

## Examples

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
