

participant Customer
participant "Smart Kiosk" as SK
participant "Smart Kiosk Server" as SKS
participant ESF
participant MADAPI
participant CLM
participant OWC
participant "Biometric Server" as BS
participant NIMC
participant EDA


Customer->SK: 1. Exit Splash Screen

SK->SK: 2. Display Menu

Customer->SK: 3. Select SIM Upgrade Menu

SK->SK: 4. Prompt user to enter \n        MSISDN

Customer->SK: 5. Enter MSISDN
space-3
SK->SKS: Check DN Status
space-4
SKS->ESF:Forward DN Status Request
space-4
ESF->CLM: Request DN Status
space-2
CLM->ESF: Return Response
space-4
ESF->SKS: Forward Response
space-4
SKS->SK: Return response
SK->SKS: Trigger OTP
SK->SK: Display OTP validation\npage
SKS->Customer: Sends OTP to customer
Customer->SK: Enter OTP
SK->SKS: Validate OTP
SKS->SKS: validation successful
SKS->MADAPI: Check 4G status
MADAPI->CLM: Check 4G Status
CLM->MADAPI: Return 4G Status
MADAPI->SKS: Forwards 4G Status
SKS->SK: Forwards 4G Status
SK->SK: Select SIM serial from pool
SK->Customer: Prompt for NIN
Customer->SK: Enter NIN
SK->SKS: Validate NIN/VNIN
SKS->MADAPI: Validate NIN/VNIN
MADAPI->NIMC: Validate vNIN
NIMC->MADAPI: Return validation response
MADAPI->SKS: Forwards validation response
SKS->SK: Return vlidation response
SK->Customer: Display Facial capture widget
Customer->SK: Provides Facial Capture
SK->SKS: Request LIVE/NIMC Image Matching
SKS->SK: Return success match response 
SK->SK: Display payment channel menu
Customer->SK: Makes Payment
SK->SKS: Complete SIM SWAP
SKS->MADAPI: Upload Images 
MADAPI->OWC: Forwards Upload Image Request
OWC->OWC: Generate Ref Id
OWC->MADAPI: Return Response with RefId
MADAPI->SKS: Return RefId with response
SKS->MADAPI: Submit SIM SWAP request
MADAPI->CLM: Submit SIM SWAP request
CLM->MADAPI: Respond with Acknowledgement
MADAPI->SKS: Respond with Acknoledgement
CLM->CLM: Provision for eyeballing
CLM->CLM: Eyeballing successful
CLM->EDA: Send SIM activation request
EDA->CLM: Return successful activation response