

function validateForm(theForm)
{

  
  

  if (theForm.title.value == "")
  {
    alert("Please enter a Title for the billing address");
    theForm.title.focus();
    return (false);
  }

  if (theForm.christianname.value == "")
  {
    alert("Please enter a First Name for the billing address.");
    theForm.christianname.focus();
    return (false);
  }

  if (theForm.surname.value == "")
  {
    alert("Please enter a Last Name for the billing address.");
    theForm.surname.focus();
    return (false);
  }

 

  if (theForm.addressline1.value == "")
  {
    alert("Please enter an Address for the billing address.");
    theForm.addressline1.focus();
    return (false);
  }

  if (theForm.addressline3.value == "")
  {
    alert("Please enter a Town/City for the billing address.");
    theForm.addressline3.focus();
    return (false);
  }

  if (theForm.addressline4.value == "")
  {
    alert("Please enter a State/County for the billing address.");
    theForm.addressline4.focus();
    return (false);
  }

  
  if (theForm.postcode.value == "")
  {
    alert("Please enter a Postal/Zip code for the billing address.");
    theForm.postcode.focus();
    return (false);
  }
  

 
  if (theForm.emailaddress.value == "")
  {
	alert("Please enter an Email address for the billing address.");
	theForm.emailaddress.focus();
	return (false);
  }
  
  if (theForm.emailaddress.value > "")
  {
    if (!emailCheck(theForm.emailaddress.value))
    {
	theForm.emailaddress.focus();
    	return (false);
    }
  }
  
  
  
 

  

  return (true);
}
