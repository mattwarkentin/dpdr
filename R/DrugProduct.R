#' Drug Product
#'
#' Basic information about the product, such as brand name and Drug
#'   Identification Number.
#'
#' @param id Drug product code.
#' @param din Drug Identification Number (DIN).
#' @param brandname Brand name.
#' @param status Drug product status. See __Details__ section.
#' @inheritParams dpd_active_ingredient
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
#'   - `11`: Authorized By Interim Order
#'   - `12`: Authorization By Interim Order Revoked
#'   - `13`: Restricted Access
#'   - `14`: Authorization By Interim Order Expired
#'   - `15`: Cancelled (Transitioned to Biocides)
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
#' @md
#'
#' @export
#'
#' @examples
#' dpd_drug_product(id = 2049)
#'
#' dpd_drug_product(din = '00326925')
#'
#' dpd_drug_product(brandname = "cidyl")
#'
#' dpd_drug_product(status = 1)
dpd_drug_product <- function(id, din, brandname, status, lang = c("en", "fr")) {
  rlang::check_exclusive(id, din, brandname, status, .require = FALSE)
  lang <- rlang::arg_match(lang)

  params <- list(lang = lang)

  if (!rlang::is_missing(id)) {
    params[["id"]] <- check_int_char_scalar(id)
  } else if (!rlang::is_missing(din)) {
    params[["din"]] <- check_int_char_scalar(din)
  } else if (!rlang::is_missing(brandname)) {
    params[["brandname"]] <- check_char_scalar(brandname)
  } else if (!rlang::is_missing(status)) {
    params[["status"]] <- check_int_char_scalar(status)
  }

  req <- build_dpd_request("drugproduct/", params = params)

  resp <- httr2::req_perform(req)

  process_dpd_response(resp)
}
