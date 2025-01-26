# Load the DiagrammeR package
library(DiagrammeR)

# Create the decision tree diagram with vertical orientation and white font color
decision_tree_vertical <- grViz("
digraph DecisionTree {
  rankdir=TB;
  node [shape=rectangle, style=filled, color=lightblue, fontcolor=black];
  
  // Root Decision Node: Conduct Market Research?
  Decision_MR [label='Decision: Conduct Market Research?', color=lightblue, fontcolor=black];
  
  // Decision: Do Not Conduct Market Research
  Decision_NoMR [label='Decision: Bid or Not Bid?', color=lightblue, fontcolor=black];
  Decision_MR -> Decision_NoMR [label='Do Not Conduct', style=bold];
  
  // Decision: Conduct Market Research
  MR_Chance [label='Market Research Prediction', shape=diamond, color=lightblue, fontcolor=black];
  Decision_MR -> MR_Chance [label='Conduct', style=bold];
  
  // Market Research Outcomes
  MR_PredictApproval [label='Predict Approval\\n(P=41%)', shape=rectangle, style=filled, color=lightyellow, fontcolor=black];
  MR_PredictRejection [label='Predict Rejection\\n(P=59%)', shape=rectangle, style=filled, color=lightyellow, fontcolor=black];
  MR_Chance -> MR_PredictApproval;
  MR_Chance -> MR_PredictRejection;
  
  // Decisions After Market Research Predictions
  Decision_AfterMR_Approval [label='Decision: Bid or Not Bid?', color=lightblue, fontcolor=black];
  Decision_AfterMR_Rejection [label='Decision: Bid or Not Bid?', color=lightblue, fontcolor=black];
  MR_PredictApproval -> Decision_AfterMR_Approval;
  MR_PredictRejection -> Decision_AfterMR_Rejection;
  
  // Decision Paths After Predict Approval
  Decision_AfterMR_Approval -> Outcome_Bid_PredictApproval [label='Bid', style=bold];
  Decision_AfterMR_Approval -> Outcome_NoBid [label='Do Not Bid', style=bold];
  
  // Decision Paths After Predict Rejection
  Decision_AfterMR_Rejection -> Outcome_Bid_PredictRejection [label='Bid', style=bold];
  Decision_AfterMR_Rejection -> Outcome_NoBid [label='Do Not Bid', style=bold];
  
  // Outcome Node: Do Not Bid
  Outcome_NoBid [label='Outcome: Do Not Bid\\nEMV = $0', shape=oval, color=lightgrey, fontcolor=black];
  
  // Chance Nodes for Bidding Outcomes
  Chance_HighestBidder_PA [label='Chance: Highest Bidder?\\n(P=20%)', shape=diamond, color=lightblue, fontcolor=black];
  Outcome_Bid_PredictApproval -> Chance_HighestBidder_PA;
  
  Chance_HighestBidder_PR [label='Chance: Highest Bidder?\\n(P=20%)', shape=diamond, color=lightblue, fontcolor=black];
  Outcome_Bid_PredictRejection -> Chance_HighestBidder_PR;
  
  Chance_HighestBidder_NoMR [label='Chance: Highest Bidder?\\n(P=20%)', shape=diamond, color=lightblue, fontcolor=black];
  Decision_NoMR -> Outcome_NoBid_NoMR [label='Do Not Bid', style=bold];
  Decision_NoMR -> Chance_HighestBidder_NoMR [label='Bid', style=bold];
  
  // Outcome Node: Do Not Bid (No Market Research)
  Outcome_NoBid_NoMR [label='Outcome: Do Not Bid\\nEMV = $0', shape=oval, color=lightgrey, fontcolor=black];
  
  // Chance Nodes for Zoning Referendum Outcomes (Predict Approval)
  Chance_Zoning_PA [label='Chance: Zoning Referendum', shape=diamond, color=lightblue, fontcolor=black];
  Chance_HighestBidder_PA -> Outcome_NotHighestBidder_PA [label='Not Highest Bidder\\n(P=80%)'];
  Chance_HighestBidder_PA -> Chance_Zoning_PA [label='Highest Bidder\\n(P=20%)'];
  
  // Zoning Outcomes (Predict Approval)
  Outcome_ZoningApproved_PA [label='Zoning Approved\\nProfit = $2,000,000', shape=oval, color=lightgrey, fontcolor=black];
  Outcome_ZoningRejected_PA [label='Zoning Rejected\\nLoss = -$500,000', shape=oval, color=lightgrey, fontcolor=black];
  Chance_Zoning_PA -> Outcome_ZoningApproved_PA [label='P=65.85%'];
  Chance_Zoning_PA -> Outcome_ZoningRejected_PA [label='P=34.15%'];
  
  // Chance Nodes for Zoning Referendum Outcomes (Predict Rejection)
  Chance_Zoning_PR [label='Chance: Zoning Referendum', shape=diamond, color=lightblue, fontcolor=black];
  Chance_HighestBidder_PR -> Outcome_NotHighestBidder_PR [label='Not Highest Bidder\\n(P=80%)'];
  Chance_HighestBidder_PR -> Chance_Zoning_PR [label='Highest Bidder\\n(P=20%)'];
  
  // Zoning Outcomes (Predict Rejection)
  Outcome_ZoningApproved_PR [label='Zoning Approved\\nProfit = $2,000,000', shape=oval, color=lightgrey, fontcolor=black];
  Outcome_ZoningRejected_PR [label='Zoning Rejected\\nLoss = -$500,000', shape=oval, color=lightgrey, fontcolor=black];
  Chance_Zoning_PR -> Outcome_ZoningApproved_PR [label='P=5.08%'];
  Chance_Zoning_PR -> Outcome_ZoningRejected_PR [label='P=94.92%'];
  
  // Chance Nodes for Zoning Referendum Outcomes (No Market Research)
  Chance_Zoning_NoMR [label='Chance: Zoning Referendum', shape=diamond, color=lightblue, fontcolor=black];
  Chance_HighestBidder_NoMR -> Outcome_NotHighestBidder_NoMR [label='Not Highest Bidder\\n(P=80%)'];
  Chance_HighestBidder_NoMR -> Chance_Zoning_NoMR [label='Highest Bidder\\n(P=20%)'];
  
  // Zoning Outcomes (No Market Research)
  Outcome_ZoningApproved_NoMR [label='Zoning Approved\\nProfit = $2,000,000', shape=oval, color=lightgrey, fontcolor=black];
  Outcome_ZoningRejected_NoMR [label='Zoning Rejected\\nLoss = -$500,000', shape=oval, color=lightgrey, fontcolor=black];
  Chance_Zoning_NoMR -> Outcome_ZoningApproved_NoMR [label='P=30%'];
  Chance_Zoning_NoMR -> Outcome_ZoningRejected_NoMR [label='P=70%'];
  
  // Bidding Outcomes Nodes
  Outcome_Bid_PredictApproval [label='Outcome: Bid', color=lightblue, fontcolor=black];
  Outcome_Bid_PredictRejection [label='Outcome: Bid', color=lightblue, fontcolor=black];
  
  // Outcome Nodes for Not Highest Bidder
  Outcome_NotHighestBidder_PA [label='Outcome: Not Highest Bidder\\nEMV = $0', shape=oval, color=lightgrey, fontcolor=black];
  Outcome_NotHighestBidder_PR [label='Outcome: Not Highest Bidder\\nEMV = $0', shape=oval, color=lightgrey, fontcolor=black];
  Outcome_NotHighestBidder_NoMR [label='Outcome: Not Highest Bidder\\nEMV = $0', shape=oval, color=lightgrey, fontcolor=black];
  
  // Labels and graph attributes
  labelloc = 't';
  label = 'Decision Tree for Oceanview Development Corporation';
}
")

# Render the decision tree
print(decision_tree_vertical)

