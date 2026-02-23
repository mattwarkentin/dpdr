# Schedule

Each drug is assigned one or more schedules, according to the Food and
Drug Regulations, and the Controlled Drugs and Substances Act.

## Usage

``` r
dpd_schedule(id, lang = c("en", "fr"))
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

- `schedule_name`: Drug schedule according to the Food and Drug
  Regulations and the Controlled Drugs and Substances Act.

## Details

Each drug is assigned one or more schedules, according to the Food and
Drug Regulations, and the Controlled Drugs and Substances Act.

- Prescription (prescription drugs included in the Prescription Drug
  List)

- Prescription Recommended (drugs that are recommended to be listed on
  the Prescription Drug List)

- Schedule G (control drugs)

- Schedule G (Controlled Drugs and Substances Act (CDSA) III)

- Schedule G (CDSA IV)

- Schedule C (drugs listed in Schedule C of the Food and Drugs Act, for
  example, radiopharmaceutical drugs)

- Schedule D (drugs listed in Schedule D of the Food and Drugs Act, ie.
  biological products)

- Narcotic (Narcotic Control Act)

- Narcotic (CDSA I)S

- Narcotic (CDSA II)

- Targeted (CDSA IV)

- CDSA Recommended- Undergoing Regulatory Amendment to add this new
  substance to Controlled Drugs Substances Act

- OTC (over the counter drugs that do not appear on a schedule or are
  not recommended to appear on any schedule)

- Ethical: a drug that, in accordance with Federal Legislation, does not
  require a prescription, but that is generally prescribed by a medical
  practitioner. Ethical products are unscheduled non-prescription
  professional use products (e.g. MRI contrast agents, hemodialysis
  solutions) and a few emergency use products (e.g. nitroglycerine)

## Examples

``` r
dpd_schedule(10687)
#> # A tibble: 2 × 2
#>   drug_code schedule_name
#>       <int> <chr>        
#> 1     10687 SCHEDULE D   
#> 2     10687 PRESCRIPTION 
```
