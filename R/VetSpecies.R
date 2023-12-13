#' Veterinary Species
#'
#' The type of species for a certain veterinary product (e.g. sheep, dog,
#'   cattle, and poultry).
#'
#' @param ids Vector of drug product codes.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `vet_species_name`: Animal species.
#'
#' @examples
#' dpd_vet_species(13755)
#'
#' @export
dpd_vet_species <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    httr2::request(api_base_url()) |>
      httr2::req_url_path_append(glue::glue('veterinaryspecies/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
