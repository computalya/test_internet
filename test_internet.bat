:: COMPUTALYA BİLİŞİM HİZMETLERİ TARAFINDAN HAZIRLANMIŞTIR
:: Facebook : facebook.com/computalya
:: İnternet : www.computalya.com
:: MSN		: info@computalya.com
:: E-Posta	: info@computalya.com

:: Program	: test_internet_v0_1.bat
:: Sürüm	: 0.1 beta
:: Tarih	: 29.03.2011
:: Desteklenen İşletim Sistemleri
::			- Windows 7
:: 			- Windows XP

:: Sürüm Notları
:: 0.1 beta
::	Ip octet 3'ün bulunması
:: YAPILACAKLAR
:: - IP adresinin bulunması
:: - ADSL Modemin pinglenmesi
:: - Google DNS'in pinglenmesi
:: - google.com.tr'nin pinglenmesi
:: - tüm açıklama ve değişkenlerin türkçeleştirilmesi
:: - IP adresi yoksa! computalya teknik servisini arayın mesajı!
:: - Hangisi kullanılıyor? 192.168.2.* / 192.168.1.*

@echo off

ping 192.168.2.1 > nul
echo %ERRORLEVEL%
PAUSE

::Clear variables
Set Count=

::Get all ip addresses (includes additional text)
ipconfig | find "IP" > TEMP_MyIPAddress.txt

::get all ip addresses, no additional text
for /f "tokens=1-2 delims=:" %%i in (TEMP_MyIPAddress.txt) do echo %%j >> TEMP_MyIPAddress2.txt

::process each ip address to find 3rd octet
for /f "tokens=1-3 delims=." %%i in (TEMP_MyIPAddress2.txt) do call :IPAddressFound %%k

::Delete temp files
del TEMP_MyIPAddress.txt
del TEMP_MyIPAddress2.txt

::Check for multiple IP Addresses
if %Count%==Y goto Only1
echo Multiple IP Addresses
goto :eof 

:Only1
echo Only 1 IP Address
goto :eof

:IPAddressFound
Set Count=%Count%Y
echo Address found, third octet is %1
goto :eof
