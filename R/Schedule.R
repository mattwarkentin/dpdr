#' Schedule
#'
#' Each drug is assigned one or more schedules, according to the Food and Drug
#'   Regulations, and the Controlled Drugs and Substances Act.
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_schedule <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('schedule/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_schedule
#' @export
dpd_schedule_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('schedule/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
