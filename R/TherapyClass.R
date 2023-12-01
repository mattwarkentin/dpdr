#' Therapeutic Class
#'
#' A drug's Therapeutic Classification (Class) is assigned according to its main
#'   therapeutic use.
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_class <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('therapeuticclass/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
