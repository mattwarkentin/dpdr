#' Product Status
#'
#' The statuses listed below are a direct representation of the status available
#'   in DPD Online Query and the description of each status is summarized below.
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_status <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('status/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    purrr::modify_if(rlang::is_null, \(x) NA_character_) |>
    tibble::as_tibble()
}
