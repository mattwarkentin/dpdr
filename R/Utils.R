api_base_url <- function() {
  'https://health-products.canada.ca/api/drug/'
}

check_int_char_vec <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (rlang::is_integerish(x)) {
    x <- as.character(x)
  }
  if (!rlang::is_character(x)) {
    rlang::abort(glue::glue('`{var}` must be an integer or character vector.'))
  }
  x
}

check_char_vec <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (!rlang::is_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a character vector.'))
  }
  x
}
