#' Packaging
#'
#' Information about available package sizes for each drug product.
#'
#' @param ids Vector of drug product code.
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `package_size`: Size of package.
#'   - `package_size_unit`: Unit for package size.
#'   - `package_type`: Type of package.
#'   - `product_information`: Additional product information.
#'   - `upc`: Universal Product Code.
#'
#' @examples
#' dpd_packaging(11685)
#'
#' @export
dpd_packaging <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    .dpd_request() |>
      httr2::req_url_path_append(glue::glue('packaging/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
