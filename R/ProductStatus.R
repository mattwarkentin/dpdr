#' Product Status
#'
#' The statuses listed below are a direct representation of the status available
#'   in DPD Online Query and the description of each status is summarized below.
#'
#' @inheritParams dpd_active_ingredient
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
#' @export
#'
#' @examples
#' dpd_product_status()
dpd_product_status <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (!rlang::is_missing(id)) {
    id <- check_int_char_vec(id)
    path <- glue::glue('status/?id={id}')
  } else {
    path <- glue::glue('status/')
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
