actor Agent
participant Channel
participant ESF
participant CLM

Agent-->Channel: Enters SIM Swap details
Channel-->Agent: Confirm entered details
Agent-->Channel: Verifies and submits \nSIM swap request
Channel-->ESF: Submit SIM swap request
ESF-->CLM: Forwards request \n to CLM
CLM-->CLM: Perform SIM swap eligibility check
alt Threshold excedded
CLM-->CLM: Deny request submission \n for eyeballing
else Threshold not excedded
CLM-->CLM: Proceed with submission\n for eyeballing
end

CLM-->ESF:  \n Submission response 
ESF-->Channel: Forwards SIM swap\n submission response 

alt Submitted succcessfully 
Channel-->Agent: Display Success message
else Submission Denied
Channel-->Agent: Display submission \n denied message
end