title Frontend Validation Feedback
actor Customer
actor Agent
participant Biosmart
participant ESF
participant CLM
participant NIMC

Customer->Agent:Request for Sim Registration 

Agent->Biosmart: Login to Biosmart
Biosmart --> Agent: Displays Biosmart \nWelcome page

Agent->Biosmart:           Select either \n New Registration MSISDN \n or New Registration Serial
Agent->Biosmart: Enter MSISDN or Serial Number
group SIM validation
Biosmart-->ESF: Sends request to validate \n    MSISDN or SIM Serial
ESF-->CLM:  Forwards request to validate \n    MSISDN or SIM Serial
CLM-->ESF: Returns validation response
ESF-->Biosmart: Forwards validation response
Biosmart--#red>Agent:    SIM VALIDATION \nDisplays feedback to Agent
end


Agent->Biosmart:Enter NIN / vNIN



group NIN verification/eligibility checks #green


Biosmart->NIMC: NIN Verification check
NIMC-->Biosmart: Returns Realtime response 

alt  1. NIN VERIFICATION - Failed
Biosmart--#red>Agent:  Displays feedback to Agent &\n      end registration flow
else  NIN VERIFICATION - Passed
Biosmart--#green>Agent:       Continue  Registration Flow
end

Biosmart->ESF:  NIN Eligibility check
ESF-->CLM:  Forwards request to check eligibility \n   
CLM-->ESF: Returns eligibility response
ESF-->Biosmart: Realtime response 


alt  2. NIN ELIGIBILITY - Failed
Biosmart--#red>Agent:  Displays feedback to Agent &\n      end registration flow
else  NIN ELIGIBILITY - Passed
Biosmart--#green>Agent:       Continue  Registration Flow
end

Biosmart-->>Biosmart: Underage NIN verification \n with realtime feedback

alt  3. < AGE CHECK - Failed
Biosmart--#red>Agent:  Displays feedback to Agent &\n      end registration flow
else  < AGE CHECK - Passed
Biosmart--#green>Agent:       Continue  Registration Flow
end

Biosmart->Biosmart: Check for maximum allowable 4 SIMs


alt  4.  MAX 4 CHECK - Failed
Biosmart--#red>Agent: Displays feedback to Agent &\n      end registration flow
else  LIVELINESS CHECK - Passed
Biosmart--#green>Agent:      Continue  Registration Flow
end

end

Agent-->Customer: Request Customer to \n pose for liveliness check
Customer->>Biosmart: Poses for liveliness check
group Biometric validation #green

Biosmart-->>Biosmart: Request for liveliness check
Biosmart-->>Biosmart: Process \n Request
Biosmart-->>Biosmart: Return response based on liveliness check
alt  5. LIVELINESS CHECK - Failed
Biosmart--#red>Agent:      Displays feedback to Agent
else  LIVELINESS CHECK - Passed
Biosmart--#green>Agent:        Continue  Registration Flow
end
Agent->Biosmart: Capture customer live image
Biosmart-->Biosmart: Performs LIVE/NIMC image matching
Biosmart--#red>Agent:        5b: IMAGE MATCHING \n Displays feedback to Agent 
Customer-->>Biosmart: Places finger for biometric capturing
Agent-->Customer: Request Customer to \n place fingers for capturing
Biosmart->Biosmart: Performs Fingerprint Capture

alt  6.  FINGERPRINT CAPTURE - Failed
Biosmart--#red>Agent: Displays feedback to Agent &\n      end registration flow
else  FINGERPRINT CAPTURE - Passed
Biosmart--#green>Agent:      Continue  Registration Flow
end

end

Biosmart--> Agent: Displays electronic KYC form with \n populated and greyed-out \n Biodata fields
Agent->Biosmart: Verify Biodata fields
note over Agent: Locked NIN returned details (FN, LN & DoB

Agent->Biosmart: Fill other textual details \nnot returned by MINC
Agent->Biosmart: Upload supporting documents
note over Biosmart: Optional for National and \n mandatory for Foreigner
Agent->Biosmart: Submit SIM Registration record \n for eyeballing
Biosmart->CLM: Submit Customer Registration Data