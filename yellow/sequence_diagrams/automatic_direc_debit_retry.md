participant DCBS
space 5
participant MADAPI
space -4
participant CPG
space -4
participant "Card Platform" as CP
participant Bank
space -4
participant "SMSC/SMTP" as Notify
space -3
actor Customer

DCBS->Bank: Trigger payment
Bank->Bank:Payment failed
Bank->CP: Response
CP-->CPG: Response
CPG-->MADAPI: Notify of failed Transaction
 MADAPI--> DCBS: Notify of failed Transaction
 DCBS->DCBS: Update **payment status** \n **time** and **retry count**
DCBS-->DCBS: Run payment retry Job \n based on schedule
DCBS->DCBS: Get all failed invoices \n based on defined condition
alt #green Successful Debit #green
DCBS->MADAPI:   Retry payment for \n each failed invoice
 MADAPI-->CPG: Call Payment Gateway API
 CPG->CPG: Check Tokenized Card
 CPG-> CP: Trigger Payment
CP->Bank: Trigger Payment
Bank->Bank:Payment failed
Bank->CP: Response
CP-->CPG: Response
CPG-->MADAPI: Notify of successful Transaction
 MADAPI--> DCBS: Notify of successful Transaction
 DCBS->DCBS: Clear specific invoice
 DCBS->DCBS: Update payment status \n time and retry count
 DCBS->Notify: Send Transaction success notification via SMS
 Notify->Customer: Notify via SMS or email
 end 
 alt #red Failed Debit
 Bank-->DCBS: Notify of failed transaction
  DCBS->DCBS: Update **payment status** \n **time** and **retry count**
 end