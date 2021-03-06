
tol <- 0.1

data(data_rec, package = "rmdcev")
data_rec

data_rec <- mdcev.data(data_rec, subset = id <= 100,
					  id.var = "id",
					   alt.var = "alt",
					   choice = "quant")

test_that("MLE hybrid0 unconditional", {

	output <- mdcev( ~ alt - 1,
				   data = data_rec,
				   model = "hybrid0",
				   psi_ascs = 0,
				   algorithm = "MLE",
					 std_errors = "mvn",
					 n_draws = 2,
				   print_iterations = FALSE)

	npols <- 1
	policies <- CreateBlankPolicies(npols, output, price_change_only = TRUE)
	df_sim <- PrepareSimulationData(output, policies, nsims = 2)

	# Test welfare
	wtp <- mdcev.sim(df_sim$df_indiv, df_common = df_sim$df_common, sim_options = df_sim$sim_options,
					 cond_err = 0, nerrs = 1, sim_type = "welfare")
	sum_wtp <- summary(wtp)

	expect_true(sum(abs(sum_wtp$CoefTable$mean)) < tol)
})

context("MLE hybrid unconditional")

test_that("MLE hybrid unconditional", {

	output <- mdcev( ~ alt - 1,
					 data = data_rec,
					 model = "hybrid0",
					 psi_ascs = 0,
					 algorithm = "MLE",
					 std_errors = "mvn",
					 n_draws = 2,
					 print_iterations = FALSE)

	npols <- 1
	policies <- CreateBlankPolicies(npols, output, price_change_only = TRUE)
	df_sim <- PrepareSimulationData(output, policies, nsims = 2)

	# Test welfare
	wtp <- mdcev.sim(df_sim$df_indiv, df_common = df_sim$df_common, sim_options = df_sim$sim_options,
					 cond_err = 0, nerrs = 1, sim_type = "welfare")
	sum_wtp <- summary(wtp)

	expect_true(sum(abs(sum_wtp$CoefTable$mean)) < tol)
})


context("MLE gamma unconditional")

test_that("MLE gamma unconditional", {
	output <- mdcev( ~ alt - 1,
				 data = data_rec,
				 model = "gamma",
				 psi_ascs = 0,
				 algorithm = "MLE",
				 std_errors = "mvn",
				 n_draws = 2,
				 print_iterations = FALSE)

	npols <- 1
	policies <- CreateBlankPolicies(npols, output, price_change_only = TRUE)
	df_sim <- PrepareSimulationData(output, policies, nsims = 2)

	# Test welfare
	wtp <- mdcev.sim(df_sim$df_indiv, df_common = df_sim$df_common, sim_options = df_sim$sim_options,
				 cond_err = 0, nerrs = 1, sim_type = "welfare")
	sum_wtp <- summary(wtp)

	expect_true(sum(abs(sum_wtp$CoefTable$mean)) < tol)
})


context("MLE alpha unconditional")

test_that("MLE alpha unconditional", {

output <- mdcev( ~ alt - 1,
				 data = data_rec,
				 model = "alpha",
				 psi_ascs = 0,
				 algorithm = "MLE",
				 std_errors = "mvn",
				 n_draws = 2,
				 print_iterations = FALSE)

npols <- 1
policies <- CreateBlankPolicies(npols, output, price_change_only = TRUE)
df_sim <- PrepareSimulationData(output, policies, nsims = 2)

# Test welfare
wtp <- mdcev.sim(df_sim$df_indiv, df_common = df_sim$df_common, sim_options = df_sim$sim_options,
				 cond_err = 0, nerrs = 1, sim_type = "welfare")
sum_wtp <- summary(wtp)

expect_true(sum(abs(sum_wtp$CoefTable$mean)) < tol)
})

context("MLE kt_ee specification")

test_that("MLE kt_ee", {

	data_rec$beach = ifelse(data_rec$alt == "beach", 1, 0)

	output <- mdcev( ~ ageindex | 0 | beach,
					 data = data_rec,
					 gamma_ascs = 0,
					 model = "kt_ee",
					 std_errors = "mvn",
					 n_draws = 30,
					 algorithm = "MLE",
					 print_iterations = FALSE)

	npols <- 1
	policies <- CreateBlankPolicies(npols, output, price_change_only = TRUE)
	df_sim <- PrepareSimulationData(output, policies, nsims = 1)

	# Test welfare
	wtp <- mdcev.sim(df_sim$df_indiv, df_common = df_sim$df_common, sim_options = df_sim$sim_options,
					 cond_err = 0, nerrs = 1, sim_type = "welfare")
	sum_wtp <- summary(wtp)

	expect_true(sum(abs(sum_wtp$CoefTable$mean)) < tol)
})
