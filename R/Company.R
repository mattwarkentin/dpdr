#' Company
#'
#' In the DPD, a product may have several companies associated with them. Each
#'   product will have a DIN Owner associated with it.
#'
#' @param id Company code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_company <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('company/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
