#' Packaging
#'
#' Information about available package sizes for each drug product.
#'
#' @param id Drug product code.
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
dpd_packaging <- function(id) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}
