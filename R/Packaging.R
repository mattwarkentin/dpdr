#' Packaging
#'
#' Information about available package sizes for each drug product.
#'
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `package_size`: Size of package.
#'   - `package_size_unit`: Unit for package size.
#'   - `package_type`: Type of package.
#'   - `product_information`: Additional product information.
#'   - `upc`: Universal Product Code.
#'
#' @export
#'
#' @examples
#' dpd_packaging(11685)
dpd_packaging <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (rlang::is_missing(id)) {
    path <- glue::glue('packaging/')
  } else {
    id <- check_int_char_scalar(id)
    path <- glue::glue('packaging/?id={id}')
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_url_query(lang = lang) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
