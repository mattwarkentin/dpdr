#' Route of Administration
#'
#' Indicates the part of the body on which, through which or into which the
#'   product is to be introduced (e.g. oral, topical, intramuscular, rectal).
#'
#'   A product can have more than one route of administration
#'   (e.g. intravenous, intramuscular, intra-articular).
#'
#' @param ids Vector of drug product codes.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `route_of_administration_code`: Code assigned to a route of
#'     administration.
#'   - `route_of_administration_name`: Route of administration.
#'
#' @examples
#' dpd_route(3)
#'
#' @export
dpd_route <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    .dpd_request() |>
      httr2::req_url_path_append(glue::glue('route/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}

#' @rdname dpd_route
#' @export
dpd_route_all <- function() {
  .dpd_request() |>
    httr2::req_url_path_append(glue::glue('route/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
