#' Dosage Form
#'
#' The dosage form is the form of presentation in which the product is supplied,
#'   for example, tablet, capsule, powder, etc.
#'
#'   A product can have more than one dosage form when it is a kit
#'   (e.g. tablet, capsule).
#'
#' @param active Only return dosage forms that are active? Default is `FALSE`.
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `pharmaceutical_form_code`: Code assigned to a dosage form.
#'   - `pharmaceutical_form_name`: Dosage form.
#'
#' @export
#'
#' @examples
#' dpd_dosage_form(10846)
dpd_dosage_form <- function(id, active = FALSE, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)
  check_scalar_logical(active)

  params <- list(lang = lang)

  if (!rlang::is_missing(id)) {
    params[["id"]] <- check_int_char_scalar(id)
  }

  req <- build_dpd_request("form/", params = params)

  if (active) {
    req <- httr2::req_url_query(req, active = "yes")
  }

  resp <- httr2::req_perform(req)

  process_dpd_response(resp)
}
