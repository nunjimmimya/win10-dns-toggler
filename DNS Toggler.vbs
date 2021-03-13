' Mohammad Najmi bin Harun
' Copyright 2021 nunjimmimya Niaga
'
' DNS Toggler.vbs
'
' Skrip ini adalah suis untuk menghidupkan / mematikan fungsi Internet 
' sesuai dengan kehendak pengurusan KOJUTA ar-Rahnu

' Pastikan arahan ini berada dalam mode "Run As Administrator"
If Not WScript.Arguments.Named.Exists("elevate") Then
  CreateObject("Shell.Application").ShellExecute WScript.FullName _, """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
  WScript.Quit
End If

' Semak Status DNS
' Tukar kepada automatik sekiranya DNS adalah localhost
' Tukar kepada localhost sekiranya DNS adalah automatik
localHost = "127.0.0.1"

'To-do; masukkan arahan Command CreateObject
ipAdd = Get-DnsClientServerAddress -InterfaceAlias wifi -AddressFamily IPv4

Select case ipAdd
	case localhost
		'Set DNS IP kepada automatik
		Set-DnsClientServerAddress -InterfaceAlias wifi -ResetServerAddresses
	case !localhost
		'Set DNS IP kepada localhost
		Set-DnsClientServerAddress -InterfaceAlias wifi -ServerAddress localhost
	case Else
		'Salah!!!
End Select
