#' Route of Administration
#'
#' Indicates the part of the body on which, through which or into which the
#'   product is to be introduced (e.g. oral, topical, intramuscular, rectal).
#'
#'   A product can have more than one route of administration
#'   (e.g. intravenous, intramuscular, intra-articular).
#'
#' @param id Drug product code.
#'
#' @return A `tibble`.
#'
#' @export
dpd_route <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('route/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_route
#' @export
dpd_route_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('route/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
