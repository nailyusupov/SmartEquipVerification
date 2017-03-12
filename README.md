# SmartEquipVerification

***************************************************************************************************
HOW TO START THE SmartEquip Verify Service
***************************************************************************************************

1. UNZIP jetty-distribution-9.4.2.v20170220.zip in your C:\ drive

2. launch start.bat in the main (jetty-distribution-9.4.2.v20170220) folder

service is running on localhost:8080


***************************************************************************************************
HOW TO STOP THE SmartEquip Verify Service
***************************************************************************************************

1. close the batch window

service is stopped


***************************************************************************************************
HOW TO CHANGE THE DEFAULT PORT
***************************************************************************************************

1. open start.bat with a text editor

2. change last 4 digits (by default 8080) to a desired port

3. save the start.bat file

4. restart the service

port is changed


***************************************************************************************************
SERVICE DETAILS
***************************************************************************************************

1. CLIENT REQUEST index.jsp

2. document ready jquery.ajax request to /generate (com.smartEquip.verify.GenerateServlet.java)

3. /generate response with 'signature' and 'question'

	3.1 signature contains a 'salt' which is a static string that could potentially be a session id
	    or a complex encryption key, it aslo contains the original message in format 'Please sum the numbers n1,n2,n3'
	    where n1,n2,n3 are random 1 digit numbers 0-9 along with the sum itself appended at the end
	    the 'signature' is encrypted with md5 hash	

	3.2 question contains the user requested verification question in format 'Please sum the numbers n1,n2,n3' 
	    where n1,n2,n3 are random 1 digit numbers 0-9

4. upon the submission of index.jsp to /verify servlet (com.smartEquip.verify.VerifyServlet.java)
   the /verify servlet makes sure all required parameters are present in the request and 
   the signature md5 hash matches the md5 hash of submitted question and answer after applying the same 
   static string 'salt' from 3.1 
	
	4.1 The 'salt' ensures that even if both the signature and the original question are 
	    modified by the user, there is no chance of authentication unless the 'salt' is disclosed to the
	    client in case of the security breach of the source code. In that case a more complex encryption algorithm
	    is required
	
	4.2 The SmartEquip Verify Service is a very light and simplified version of what an actual anti-bot verification 
	    system should carry, however it implements all necessary function and is suitable for production environment
	    and is completely server state independent.
