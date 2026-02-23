#' Company
#'
#' Company information associated with a company code.
#'
#' @param id Company code.
#' @inheritParams dpd_active_ingredient
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
#' @details
#' In the DPD, a product may have several companies associated with them. Each
#'   product will have a DIN Owner associated with it. If a DIN Owner has
#'   designated another company to receive their mailing, their name and
#'   address will also be included and can be identified with a 'Y' flag in the
#'   ADDRESS_MAILING_FLAG field.
#'
#'   The company contact information is not included in the API (ATTENTION_TO,
#'   LANGUAGE, TELEPHONE_NUMBER, FAX_NUMBER, EMAIL_ADDRESS). The contact
#'   information in the database is generally a representative from the
#'   Regulatory Affairs department. It has come to our attention that some
#'   users are contacting these individuals to make general inquiries, we would
#'   like to recommend not doing so.
#'
#' @export
#'
#' @examples
#' dpd_company(10825)
dpd_company <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)
  params <- list(lang = lang)

  if (!rlang::is_missing(id)) {
    params[["id"]] <- check_int_char_scalar(id)
  }

  req <- build_dpd_request("company/", params = params)

  resp <- httr2::req_perform(req)

  process_dpd_response(resp)
}
