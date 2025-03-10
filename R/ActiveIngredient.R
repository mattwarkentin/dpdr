#' Active Ingredient
#'
#' An Active Ingredient is any component that has medicinal properties, and
#'   supplies pharmacological activity or other direct effect in the diagnosis,
#'   cure, mitigation, treatment or prevention of disease, or to affect the
#'   structure or any function of the body of a human or an animal.
#'
#' @param ids Vector of drug product codes.
#' @param names Vector of active ingredient names.
#'
#' @return A `tibble` with columns:
#'   - `dosage_unit`: Active ingredient dosage unit.
#'   - `dosage_value`: Quantitative value of the active ingredient dosage.
#'   - `drug_code`: Code assigned to each drug product.
#'   - `ingredient_name`: Ingredient name.
#'   - `strength`: Quantitative value of the active ingredient strength.
#'   - `strength_unit`: Active ingredient strength unit.
#'
#' @examples
#' dpd_ai_id(48905)
#'
#' dpd_ai_name('afatinib')
#'
#' @export
dpd_ai_id <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    .dpd_request() |>
      httr2::req_url_path_append(glue::glue('activeingredient/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}

#' @rdname dpd_ai_id
#' @export
dpd_ai_name <- function(names) {
  names <- check_char_vec(names)
  .f <- function(name) {
    name <- utils::URLencode(name)
    .dpd_request() |>
      httr2::req_url_path_append(glue::glue('activeingredient/?ingredientname={name}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(names, .f) |>
    purrr::list_rbind()
}

#' @rdname dpd_ai_id
#' @export
dpd_ai_all <- function() {
  .dpd_request() |>
    httr2::req_url_path_append(glue::glue('activeingredient/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
