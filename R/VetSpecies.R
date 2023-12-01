#' Veterinary Species
#'
#' The type of species for a certain veterinary product (e.g. sheep, dog,
#'   cattle, and poultry).
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_species <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('veterinaryspecies/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
