#' Pharmaceutical Standard
#'
#' The standard to which a drug product is manufactured and represented.
#'
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: code assigned to each drug product.
#'   - `pharmaceutical_std`: Pharmaceutical_std
#'
#' @export
#'
#' @examples
#' dpd_pharm_standard(11534)
dpd_pharm_standard <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)
  params <- list(lang = lang)

  if (!rlang::is_missing(id)) {
    params[["id"]] <- check_int_char_vec(id)
  }

  req <- build_dpd_request("pharmaceuticalstd/", params = params)

  resp <- httr2::req_perform(req)

  process_dpd_response(resp)
}
