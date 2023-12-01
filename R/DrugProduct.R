#' Drug Product
#'
#' Basic information about the product, such as brand name and Drug
#'   Identification Number.
#'
#' @param id Drug product code.
#' @param name Active ingredient name.
#' @param din Drug Identification Number (DIN).
#' @param brand Brand name.
#' @param status Drug product status. See __Details__ section.
#'
#' @details
#' `status` must be an integer, corresponding to the following statuses:
#'   - `1`: Approved
#'   - `2`: Marketed
#'   - `3`: Cancelled Pre Market
#'   - `4`: Cancelled Post Market
#'   - `6`: Dormant
#'   - `9`: Cancelled (Unreturned Annual)
#'   - `10`: Cancelled (Safety Issue)
#'
#' @return A `tibble` with columns:
#'   - `ai_group_no`: Active Ingredient Group Number.
#'   - `brand_name`: Brand name for the drug product.
#'   - `class_name`: Therapeutic class of a drug product.
#'   - `descriptor`: Additional details or descriptions for a product,
#'     if applicable.
#'   - `drug_code`: Code assigned to each drug product.
#'   - `drug_identification_number`: Drug Identification Number.
#'   - `number_of_ais`: Number of Active Ingredients in a drug product.
#'   - `company_name`: Company name.
#'   - `last_update_date`: Date is updated any time certain, but not all, key
#'     fields are changed.
#'
#' @examples
#' dpd_drug_id(2049)
#'
#' dpd_drug_din('00326925')
#'
#' dpd_drug_status(10)
#'
#' @md
#'
#' @export
dpd_drug_id <- function(id) {
  if (!rlang::is_scalar_integerish(id)) {
    rlang::abort('`id` must be a scalar integer.')
  }
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?id={id}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_din <- function(din) {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?din={din}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_brand <- function(brand) {
  if (!rlang::is_scalar_character(brand)) {
    rlang::abort('`brand` must be a scalar character.')
  }
  brand <- utils::URLencode(brand)
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?brandname={brand}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_status <- function(status) {
  if (!rlang::is_scalar_integerish(status)) {
    rlang::abort('`status` must be a scalar integer.')
  }
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/?status={status}')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_all <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_url_path_append(glue::glue('drugproduct/')) |>
    httr2::req_perform() |>
    httr2::resp_body_string() |>
    jsonlite::fromJSON() |>
    tibble::as_tibble()
}

#' @rdname dpd_drug_id
#' @export
dpd_drug_dins <- function(name) {
  drugs <- dpd_ai_name(name)
  purrr::map(drugs$drug_code, \(x) dpd_drug_id(x)) |>
    purrr::list_rbind()
}
