var starttime;
var total;

function OnRequestStart(ajaxPanel, eventArgs)
{
//	time = new Date();
//	starttime = time.getTime();
//	
//	UpdateLog(eventArgs.EventTarget + ": Request started.");	
//	UpdateStatusLabel("Processing... please wait.", "red");
//	
//	// clear data from previous request
//	var confirmationLabel = document.getElementById("ConfirmationLabel");
//	confirmationLabel.innerHTML = "";
}

function OnRequestSent(ajaxPanel, eventArgs)
{
//	UpdateLog(eventArgs.EventTarget + ": Request sent.");
	DisableControls();	
}

function OnResponseReceived(ajaxPanel, eventArgs)
{					
//	UpdateLog(eventArgs.EventTarget + ": Response received.");
	EnableControls();		
}

function OnResponseEnd(ajaxPanel, eventArgs)
{
//	UpdateLog(eventArgs.EventTarget + ": Response completed.");
//	UpdateStatusLabel("Your request has been processed successfully.", "green");
}

function DisableControls()
{
	for (var i=0; i<document.forms[0].elements.length; i++)
	{			
		var obj = document.forms[0].elements[i];
		obj.disabled = true;
	}
}

function EnableControls()
{
	for (var i=0; i<document.forms[0].elements.length; i++)
	{		
		var obj = document.forms[0].elements[i];
		obj.disabled = false;
	}
}

var output;
function UpdateLog(text)
{					
	if (!output)
	{
		output = document.getElementById("eventLog");
	}
	
	if (output)
	{
		test = new Date();
		dt = test.getTime() - starttime;
		var str = text + " Elapsed time: " + dt + "ms.";					
		starttime = test.getTime();										                                
		output.innerHTML = output.innerHTML + (output.innerHTML ? "<br />" : "") + str;
		output.scrollTop = 10000000;						
	}							
}

function UpdateStatusLabel(text, fontColor)
{
//	var label = document.getElementById("StatusLabel");
//	label.innerHTML = text;
//	label.style.color = fontColor;
//	label.style.fontWeight = "bold";
}
