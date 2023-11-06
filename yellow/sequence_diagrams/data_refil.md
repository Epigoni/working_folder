

participant Customer
participant "Smart Kiosk" as SK
participant "Smart Kiosk Server" as SKS
participant MADAPI
participant CLM


Customer->SK: 1. Exit Splash Screen

SK->SK: 2. Display Menu

Customer->SK: 3. Select Data subscription Menu

SK->SK: 4. Prompt user to enter \n        MSISDN
loop MSISDN input & Validation
Customer->SK: 5. Enter MSISDN
space -3
SK->SKS: 6. Trigger MSISDN check request
space -3
SKS->MADAPI: 7. Check MSISDN Status
space -3
MADAPI->CLM: 8. Check MSISDN Status

CLM->MADAPI: 9. Respond with validation response
space -3
MADAPI->SKS: 10. Forward response
space -3
SKS->SK: 11. Return response

alt MSISDN Validation successful


SK->SK: 12. Add MSISDN to List

else MSISDN Validation failed  #red

SK->SK: 13. Display Error Message

end


SK->SK: 14. Prompt customer to \n enter more MSISDNs


Customer->SK:    15. Add MSISDN or \n proceed to enter amount
end

Customer->SK: 16. Select Data to subscribe
SK->SK:             17. Display Confirmation page \nPrompting user to select  Payment Channel



