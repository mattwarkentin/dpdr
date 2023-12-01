#' Packaging
#'
#' Information about available package sizes for each drug product.
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_packaging <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
