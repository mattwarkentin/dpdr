#' Route of Administration
#'
#' Indicates the part of the body on which, through which or into which the
#'   product is to be introduced (e.g. oral, topical, intramuscular, rectal).
#'
#'   A product can have more than one route of administration
#'   (e.g. intravenous, intramuscular, intra-articular).
#'
#' @inheritParams dpd_active_ingredient
#' @inheritParams dpd_dosage_form
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `route_of_administration_code`: Code assigned to a route of
#'     administration.
#'   - `route_of_administration_name`: Route of administration.
#'
#' @export
#'
#' @examples
#' dpd_route_of_admin(3)
dpd_route_of_admin <- function(id, active = FALSE, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (rlang::is_missing(id)) {
    path <- glue::glue('route/')
  } else {
    id <- check_int_char_scalar(id)
    path <- glue::glue('route/?id={id}')
  }

  req <-
    dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang)

  if (active) {
    req <- httr2::req_url_query(req, active = "yes")
  }

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
