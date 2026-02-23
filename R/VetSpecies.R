#' Veterinary Species
#'
#' The type of species for a certain veterinary product (e.g. sheep, dog,
#'   cattle, and poultry).
#'
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `vet_species_name`: Animal species.
#'
#' @export
#'
#' @examples
#' dpd_vet_species(13755)
dpd_vet_species <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (rlang::is_missing(id)) {
    path <- glue::glue('veterinaryspecies/')
  } else {
    id <- check_int_char_scalar(id)
    path <- glue::glue('veterinaryspecies/?id={id}')
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
