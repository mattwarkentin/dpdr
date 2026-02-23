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
  params <- list(lang = lang)

  if (!rlang::is_missing(id)) {
    params[["id"]] <- check_int_char_scalar(id)
  }

  req <- build_dpd_request("veterinaryspecies/", params = params)

  resp <- httr2::req_perform(req)

  process_dpd_response(resp)
}
