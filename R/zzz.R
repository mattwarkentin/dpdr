.onLoad <- function(libname, pkgname) {
  rlang::run_on_load()
}

rlang::on_load({
  dpd_active_ingredient <- memoise::memoise(dpd_active_ingredient)
  dpd_company <- memoise::memoise(dpd_company)
  dpd_dosage_form <- memoise::memoise(dpd_dosage_form)
  dpd_drug_product <- memoise::memoise(dpd_drug_product)
  dpd_packaging <- memoise::memoise(dpd_packaging)
  dpd_pharm_standard <- memoise::memoise(dpd_pharm_standard)
  dpd_product_status <- memoise::memoise(dpd_product_status)
  dpd_route_of_admin <- memoise::memoise(dpd_route_of_admin)
  dpd_schedule <- memoise::memoise(dpd_schedule)
  dpd_therapeutic_class <- memoise::memoise(dpd_therapeutic_class)
  dpd_vet_species <- memoise::memoise(dpd_vet_species)
})
