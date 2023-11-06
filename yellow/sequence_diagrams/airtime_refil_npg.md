

participant Customer
participant "Smart Kiosk" as SK
participant MADAPI
participant CLM
participant NPG
participant Bank
participant "Air Server" as AS


space-3
Customer->SK: Exit Splash Screen
space-4
SK->SK: Display Menu
space-3
Customer->SK: Display Airtime Menu
space-3
SK->SK: Prompt user to enter \n        MSISDN
space-3
Customer->SK: Enter MSISDN
space-3
SK->MADAPI: Check MSISDN Status
space-3
MADAPI->CLM: Check MSISDN Status
space-3
CLM->MADAPI: Return Success
space-3
MADAPI-->SK: Return Success
space-3
Customer->SK: Enter amount to recharge
space-3
SK->SK:        Prompt use to \n enter more MSISDNs
space-3
Customer->SK:    Repeat process or \n proceed to checkout
space-3
SK->NPG: Request Payment widget from NPG
space-3
NPG->SK: Return Payment page
space-3
SK->SK: Display payment page
space-3
Customer->SK: Select mode of payment
space-3
SK->Customer: Display payment confirmation page
space-3
Customer->SK: Submit Request
space-3
SK->NPG: Make Payment request
space-3
NPG->Bank: Send Debit request
space-3
Bank->NPG: Return succesful response
space-3
NPG->SK: Return success response
space-3
SK-->AS: Send Airtime refill request
space-3
AS-->Customer: Refill customer's account