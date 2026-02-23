#' Pharmaceutical Standard
#'
#' The standard to which a drug product is manufactured and represented.
#'
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: code assigned to each drug product.
#'   - `pharmaceutical_std`: Pharmaceutical_std
#'
#' @export
#'
#' @examples
#' dpd_pharm_standard(11534)
dpd_pharm_standard <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (!rlang::is_missing(id)) {
    id <- check_int_char_vec(id)
    path <- glue::glue('pharmaceuticalstd/?id={id}')
  } else {
    path <- glue::glue('pharmaceuticalstd/')
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
