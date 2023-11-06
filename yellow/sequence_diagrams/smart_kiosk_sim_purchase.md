title SIM Registration

actor Customer
participant KIOSK
participant SPP
participant Biometric
participant "Payment Gateway" as Payment
participant MADAPI
participant CLM
participant NIMC

Customer->KIOSK : Proceeds to the KIOSK \n     to perform self \n SIM REGISTRATION
KIOSK-->KIOSK : Displays Self service Menu
Customer->KIOSK : Selects SIM registration \n              Menu item
KIOSK-->KIOSK:      Pick SIM Serial and MSISDN \n Details from pool of preloaded SIMs
KIOSK->SPP: Validate SIM serial/msisdn for\n          availability status
SPP->CLM: Forwards request to CLM for validation
CLM-->SPP:Returns SIM serial validation result
SPP-->KIOSK: Returns with availaibility\n result
KIOSK-->KIOSK :    Transitions to SIM \n registration form / flow
Customer->KIOSK : Enters NIN detail
KIOSK->SPP: Validate NIN details
SPP->CLM: Perform NIN eligibility check
CLM-->SPP: Returns the eligibility check response
SPP->MADAPI: Validate and fetch NIN Details (including Biodata and Image)
MADAPI-->SPP: Returns NIN details
SPP-->SPP:   Perform NIN  \n underage Check
SPP-->SPP: Save NIN Image
SPP->KIOSK: Return NIN validation result
KIOSK->KIOSK: Transition to Biometric Capture
KIOSK-->KIOSK: Display prompt \n to perform facial capture
Customer->KIOSK: Performs facial capture
KIOSK-->SPP: Perform liveliness check
SPP->MADAPI: Validate live image
MADAPI-->SPP: Returns validation result
SPP-->KIOSK: Validate liveliness and
KIOSK->KIOSK: Capture image
KIOSK->SPP: Perform image matching \n with LIVE/NIMC image
SPP->MADAPI: Match LIVE/NIMC Images
MADAPI-->SPP: Returns matching result
SPP-->KIOSK: Returns the match result
KIOSK->KIOSK: Interpretes match result \n and decide to proceed
KIOSK->KIOSK: Display disabled Biodata form
KIOSK-->Customer: Prompt customer to \n enter location details
Customer->KIOSK: Enters location details\n (Address, Origin)
Customer->KIOSK: Submits data for final \n processing
KIOSK->SPP: Saves Data for payment
KIOSK-->Customer: Displays Payment prompt
Customer ->KIOSK: Enters payment details\n and makes payment
KIOSK->Payment: Processes Payment for SIM
Payment->KIOSK: Response with payment processing result
KIOSK-> CLM: Submits Customer SIM details
CLM-->KIOSK: Returns with successful response
SPP->Customer: Send Notification of successful transaction
KIOSK-->KIOSK: Dispenses SIM pack
Customer->KIOSK: Picks up SIM pack for use
