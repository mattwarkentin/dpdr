#' Active Ingredient
#'
#' An Active Ingredient is any component that has medicinal properties, and
#'   supplies pharmacological activity or other direct effect in the diagnosis,
#'   cure, mitigation, treatment or prevention of disease, or to affect the
#'   structure or any function of the body of a human or an animal.
#'
#' @param id Drug product code.
#' @param name Ingredient name.
#' @param lang Language of the response. One of `"en"` or `"fr"` for English or
#'   French, respectively.
#'
#' @details
#' The name and strength of each active ingredient contained in the product is
#'   listed. Information enclosed within brackets represents the salt and
#'   identifies how the ingredient is supplied. This information is only
#'   included for some ingredients. The number in the strength field refers to
#'   the active portion of the drug. For example, for calcium (calcium
#'   carbonate) 200 milligram (mg) - 200 mg is the strength of elemental
#'   calcium, not calcium carbonate.
#'
#'   Health Canada has a reference text hierarchy for ingredient nomenclature.
#'   The International Non Proprietary Names (INN) is used as Health Canada's
#'   standard to assign the preferred name to ingredients. There are other
#'   standards such as the United States Adopted Names (USAN), Martindale,
#'   Merck Index, etc., that are used to code ingredients if they are not
#'   listed in the INN.
#'
#' @return A `tibble` with columns:
#'   - `dosage_unit`: Active ingredient dosage unit.
#'   - `dosage_value`: Quantitative value of the active ingredient dosage.
#'   - `drug_code`: Code assigned to each drug product.
#'   - `ingredient_name`: Ingredient name.
#'   - `strength`: Quantitative value of the active ingredient strength.
#'   - `strength_unit`: Active ingredient strength unit.
#'
#' @import jsonlite
#'
#' @export
#'
#' @examples
#' dpd_active_ingredient(id = 48905)
#'
#' dpd_active_ingredient(name = "afatinib")
dpd_active_ingredient <- function(id, name, lang = c("en", "fr")) {
  rlang::check_exclusive(id, name, .require = FALSE)
  lang <- rlang::arg_match(lang)

  if (rlang::is_missing(id) & rlang::is_missing(name)) {
    path <- glue::glue("activeingredient/")
  } else if (rlang::is_missing(name)) {
    id <- check_int_char_scalar(id)
    path <- glue::glue("activeingredient/?id={id}")
  } else if (rlang::is_missing(id)) {
    name <- check_char_scalar(name)
    path <- glue::glue("activeingredient/?ingredientname={name}")
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
