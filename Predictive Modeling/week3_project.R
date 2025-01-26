# Probabilities
P_s1 <- 0.3  # Zoning approved
P_s2 <- 0.7  # Zoning rejected

# Market research accuracies
P_A_given_s1 <- 0.9  # Predict Approval given Approval
P_N_given_s1 <- 0.1  # Predict Rejection given Approval
P_A_given_s2 <- 0.2  # Predict Approval given Rejection
P_N_given_s2 <- 0.8  # Predict Rejection given Rejection

# Total probabilities
P_A <- P_A_given_s1 * P_s1 + P_A_given_s2 * P_s2  # Probability Predict Approval
P_N <- 1 - P_A  # Probability Predict Rejection

# Posterior probabilities using Bayes' theorem
P_s1_given_A <- (P_A_given_s1 * P_s1) / P_A  # Probability Approval given Predict Approval
P_s1_given_N <- (P_N_given_s1 * P_s1) / P_N  # Probability Approval given Predict Rejection

# Expected Monetary Value calculations

# EMV without market research
EMV_no_research <- 0.2 * (0.3 * 2000000 + 0.7 * (-500000))

# EMV with market research
# If market research predicts approval
EMV_predict_approval <- 0.2 * (P_s1_given_A * 2000000 + (1 - P_s1_given_A) * (-500000))

# If market research predicts rejection
EMV_predict_rejection <- 0.2 * (P_s1_given_N * 2000000 + (1 - P_s1_given_N) * (-500000))

# Expected EMV with market research before cost
EMV_with_research_before_cost <- P_A * EMV_predict_approval + P_N * EMV_predict_rejection

# Net EMV after subtracting the cost of market research
EMV_with_research <- EMV_with_research_before_cost - 15000

# Expected Value of Sample Information
EVSI <- EMV_with_research - EMV_no_research

# Output the results
cat("EMV without market research: $", EMV_no_research, "\n")
cat("EMV with market research: $", EMV_with_research, "\n")
cat("Expected Value of Sample Information (EVSI): $", EVSI, "\n")