title Frontend Validation Feedback
actor Customer
actor Agent
participant Biosmart
participant CLM
participant NIMC

Customer->Agent:Request for Sim Registration 


Agent->Biosmart: Login to Biosmart
Biosmart --> Agent: Displays Biosmart \nWelcome page

Agent->Biosmart:           Select either \n New Registration MSISDN \n or New Registration Serial
Agent->Biosmart: Enter MSISDN or Serial Number
group SIM validation
Biosmart-->CLM: System validates \nMSISDN or SIM Serial
CLM-->Biosmart: Returns result 
Biosmart--#red>Agent:   1:  SIM VALIDATION \nDisplays feedback to Agent
end


Agent->Biosmart:Enter NIN / vNIN

group NIN verification/validation checks #green
Biosmart->CLM: NIN Eligibility check
CLM-->Biosmart: Realtime response 
Biosmart--#red>Agent:  2: NIN ELIGIBILITY \n Displays feedback to Agent
Biosmart-->>Biosmart: Underage NIN verification \n with realtime feedback
Biosmart--#red>Agent:   3: < AGE CHECK \nDisplays feedback to Agent
Biosmart->CLM: Check for maximum allowable 4 SIMs
CLM-->Biosmart: Realtime response
Biosmart--#red>Agent:    4: MAX 4 CHECK \n Displays feedback to Agent
end

Agent-->Customer: Request Customer to \n pose for liveliness check
Customer->>Biosmart: Poses for liveliness check
group Biometric validation #green

Biosmart-->>Biosmart: Request for liveliness check
Biosmart-->>Biosmart: Process \n Request
Biosmart-->>Biosmart: Return response based on liveliness check
Biosmart--#red>Agent:        5a: LIVELINESS CHECK \nDisplays feedback to Agent
Agent->Biosmart: Capture customer live image
Biosmart-->Biosmart: Performs LIVE/NIMC image matching
Biosmart--#red>Agent:        5b: IMAGE MATCHING \n Displays feedback to Agent 
Customer-->>Biosmart: Places finger for biometric capturing
Agent-->Customer: Request Customer to \n place fingers for capturing
Biosmart->Biosmart: Performs Fingerprint Capture
Biosmart--#red>Agent:  6: FINGERPRINT CAPTURE \n Displays feedback to Agent
end

Biosmart--> Agent: Displays electronic KYC form with \n populated and greyed-out \n Biodata fields
Agent->Biosmart: Verify Biodata fields
note over Agent: Locked NIN returned details (FN, LN & DoB

Agent->Biosmart: Fill other textual details \nnot returned by MINC
Agent->Biosmart: Upload supporting documents
note over Biosmart: Optional for National and \n mandatory for Foreigner
Agent->Biosmart: Submit SIM Registration record \n for eyeballing
Biosmart->CLM: Submit Customer Registration Data