#' Product Status
#'
#' The statuses listed below are a direct representation of the status available
#'   in DPD Online Query and the description of each status is summarized below.
#'
#' @param ids Vector of drug product code.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `expiration_date`: Latest expiry date of a product distributed in Canada,
#'     where the product has since been discontinued by the company.
#'   - `external_status_code`: Code assigned to an external drug's status.
#'   - `history_date`: Historical date associated with a drug's status.
#'   - `lot_number`: Latest lot number of a product distributed in Canada, where
#'     the product has since been discontinued by the company.
#'   - `original_market_date`: Original market date of a product.
#'
#' @examples
#' dpd_status(10229)
#'
#' @export
dpd_status <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    httr2::request(api_base_url()) |>
      httr2::req_url_path_append(glue::glue('status/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      purrr::modify_if(rlang::is_null, \(x) NA_character_) |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
