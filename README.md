# CourierApps: A CMSC 127 Final Project 
>by - Alyssa Mae Lim :hospital:
    - Jezza Vinalon :boat:
    - Candace Madelo :kissing_closed_eyes:
    - Nigell Alfeche :mount_fuji:

This is a "sort of" clone site to <<lalamove.com>> which is a business delivery service website. 
You can learn more about the site here https://www.lalamove.com/about-us.

## What is in the clone website:
>The clone website only has it's base integration which handles delivery transactions linked to the facebook or google accounts of the users. You are instantly created a profile upon registering and can instantly create delivery transactions with easy to fill-up forms. All transactions in the site are instantly recorded into the database and can be viewed by all other users. Users can like and share the transactions made by others, and also have the option to add comments. 

## Notes:
>1. Login page is not very defined due to time constraints, so several buttons on the top of the screen only redirect back to the login page.
>2. Problems with the built-in calendar widget made the option unusable and you must manually input the date by yyyy-mm-dd. 
>3. The site uses mail verification integration in it's database, so you are required to verify the email address input for registration. An easier alternative would be to login via Google for easier login to the website.

## What was used to make this clone website:
>We used MySQL, Php, and Xamp to create the website. 

## Special Thanks:
We'd like to extend our deepest gratitude to Hernan John Alipio for helping us in connecting our MySQL queries using Xamp in order to smoothly run the website.

## How to access the website in localhost:
- You must first download XAMPP here at https://www.apachefriends.org/index.html.
- Make sure to install it into the C: directory by default.

Copy the "courier" folder to c:\xamp\htdocs

1. Edit C:\xampp\apache\conf\httpd.conf
```
   #LoadModule vhost_alias_module modules/mod_vhost_alias.so
      to
   LoadModule vhost_alias_module modules/mod_vhost_alias.so
```
   
   >simply locate it inside http.conf and remove the # in front


2. Edit C:\xampp\apache\conf\extra\httpd-vhosts.conf

   Add this line at the end of the file:
```
<VirtualHost *:80>
	DocumentRoot "C:\xampp\htdocs\courier\public"
	ServerName local.courier.dev
	ServerAdmin alipiohernanjohn@caloocan.sti.edu
	
	<Directory "C:\xampp\htdocs\courier">
		Options Indexes FollowSymLinks
		AllowOverride All
		Require all granted
		</Directory>
</VirtualHost>
```

3. Right-Click on Notepad then click 'Run as Administrator'
```
   Click File Menu -> Open

   Go to C:\Windows\System32\drivers\etc\hosts

   Note: Make sure That All Files (*.*) is selected to appear the hosts file

   Then add this line among the hosts:

     127.0.0.1	local.courier.dev
```

   >Once this is done, you can access the website using: http://local.courier.dev
   

