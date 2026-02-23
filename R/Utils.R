dpd_request <- function() {
  httr2::request(api_base_url()) |>
    httr2::req_options(ssl_verifypeer = 0)
}

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

check_int_char_scalar <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (rlang::is_scalar_integerish(x)) {
    x <- as.character(x)
  }
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a scalar integer or character'))
  }
  x
}

check_char_scalar <- function(x) {
  var <- rlang::as_label(rlang::enquo(x))
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{var}` must be a scalar character.'))
  }
  x
}

check_scalar_logical <- function(x, x_nm = NULL) {
  if (rlang::is_null(x_nm)) {
    x_nm <- deparse(substitute(x))
  }

  if (rlang::is_scalar_logical(x)) {
    return(TRUE)
  }
  rlang::abort(
    message = glue::glue(
      "`{x_nm}` must be a scalar logical."
    ),
    call = rlang::caller_env()
  )
}
