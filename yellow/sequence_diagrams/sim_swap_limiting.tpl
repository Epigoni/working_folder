actor Customer
participant Channel
participant ESF
participant CLM

Customer-->Channel: Request for SIM Swap
Channel-->ESF: Request for user \n SIM swap access
ESF-->CLM: Forwards request \n to CLM
CLM-->CLM: Fetches SIM Swap threshold
CLM-->CLM: Fetches SIM Swap performed \n             today
alt Normal Request
CLM-->CLM: Compares Today swap \n with Swap Threshold
else Bypass Request
CLM-->CLM: Skip comparing Today swap \n   with Swap Threshold
end
CLM-->ESF: Returns SIM swap access \n response 
space -6
note right of CLM: Response should include \n - Message: Swap Submission Limit Exceeded \n - Day SIM Swap Count \n - Configured SIM Swap threshold \n - Boolean field - allow (true or false)
ESF-->Channel: Forwards SIM swap response 

alt Access Granted : Today swap < Swap Threshold
Channel-->Channel: Display SIM Swap Page
else Access Denied : Today swap >= Swap Threshold
Channel-->Channel: Display access denied\n message
Channel-->Channel: End Process 
end