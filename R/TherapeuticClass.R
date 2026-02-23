#' Therapeutic Class
#'
#' A drug's Therapeutic Classification (Class) is assigned according to its main
#'   therapeutic use.
#'
#' @inheritParams dpd_active_ingredient
#'
#' @return A `tibble` with columns:
#'   - `drug_code`: Code assigned to each drug product.
#'   - `tc_atc_number`: Anatomical Therapeutic Chemical Code.
#'   - `tc_atc`: Description of the Anatomical Therapeutic Chemical Code.
#'   - `tc_ahfs_number`: American Hospital Formulary Service code.
#'   - `tc_ahfs`: Description of the American Hospital Formulary Service.
#'
#' @export
#'
#' @examples
#' dpd_therapeutic_class(10564)
dpd_therapeutic_class <- function(id, lang = c("en", "fr")) {
  lang <- rlang::arg_match(lang)

  if (!rlang::is_missing(id)) {
    id <- check_int_char_vec(id)
    path <- glue::glue('therapeuticclass/?id={id}')
  } else {
    path <- glue::glue('therapeuticclass/')
  }

  dpd_request() |>
    httr2::req_url_path_append(path) |>
    httr2::req_perform() |>
    httr2::resp_body_json(simplifyVector = TRUE) |>
    tibble::as_tibble()
}
