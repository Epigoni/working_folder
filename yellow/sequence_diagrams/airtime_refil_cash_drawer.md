participant Customer
participant "Smart Kiosk" as SK
participant "Smart Kiosk Server" as SKS
participant "Air Server" as AS

Customer->SK: 18. Select Cash Payment
SK->SK: 19. Open Cash Drawer
SK->SK: 20. Prompts Customer to \n enter appropriate cash denomination for payment
Customer->SK: 21. Customer puts in appropriate \n             denominations
SK->SK: 22. Confirm Amount Paid
SK->SK: Prints Customer Receipt
SK->SKS: 23. Submit payment ledger to Server

SKS->SK: 24. Return acknowledgment response


SK-->AS: 25. Send Airtime refill request

AS-->Customer: 26. Refill customer's account