loCfg = CREATEOBJECT("CDO.Configuration")
WITH loCfg.Fields
  .Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.mail.com"
  .Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
  .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
  .Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "kleinehassler@yahoo.com"
  .Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "lieselotte45444"
  .Update
ENDWITH

loMsg = CREATEOBJECT ("CDO.Message")
WITH loMsg
  .Configuration = loCfg
  .From = "kleinehassler@yahoo.com"
  .To = "kleinehassler@hotmail.com"
  .Subject = "Prueba desde VFP"
  .TextBody = "Este es un mensaje de prueba con CDO desde Visual FoxPro."
  .Send()
ENDWITH