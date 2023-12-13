#' Company
#'
#' Company information associated with a company code.
#'
#' @param ids Vector of company codes.
#'
#' @return A `tibble` with columns:
#'   - `city_name`: City name.
#'   - `company_code`: Code assigned to a company.
#'   - `company_name`: Company name.
#'   - `company_type`: Company type.
#'   - `country_name`: Country name.
#'   - `post_office_box`: P.O. box number (if applicable).
#'   - `postal_code`: Postal code.
#'   - `province_name`: Province name.
#'   - `street_name`: Street name.
#'   - `suite_number`: Suite number.
#'
#' @examples
#' dpd_company(10825)
#'
#' @export
dpd_company <- function(ids) {
  ids <- check_int_char_vec(ids)
  .f <- function(id) {
    httr2::request(api_base_url()) |>
      httr2::req_url_path_append(glue::glue('company/?id={id}')) |>
      httr2::req_perform() |>
      httr2::resp_body_string() |>
      jsonlite::fromJSON() |>
      tibble::as_tibble()
  }
  purrr::map(ids, .f) |>
    purrr::list_rbind()
}
