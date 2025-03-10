#' Pharmaceutical Standard
#'
#' The standard to which a drug product is manufactured and represented.
#'
#' @param ids Vector of drug product codes.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: code assigned to each drug product.
#'   - `pharmaceutical_std`: Pharmaceutical_std
#'
#' @examples
#' dpd_pharm_std(11534)
#'
#' @export
dpd_pharm_std <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    .dpd_request() |>
      httr2::req_url_path_append(glue::glue('pharmaceuticalstd/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
