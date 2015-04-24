# Print a Shipping Label using EasyPost API

##Assignment
Use the EasyPost API (https://www.easypost.com/) to implement a web page where a user

can print a USPS Shipping Label in order to mail packages.

<b>Inputs​:</b>

● From Address and Destination Address

● Package attributes such as weight and dimensions

<b>Output​:</b>

● A USPS Shipping Label suitable for printing.

##My Approach

1. The first thing is to read EasyPost documentation about their API(30min)
2. Install gem 'figaro' and 'pusher' to keep my secret keys private and hidden from my repo on github(10min)
3. Generate a controller for EasyPosts(30min)
4. Generate a view for Easy post that will contain a form where a user can enter to and from addresses(30 min)
5. Perform necessary testing to ensure the form displays required input fields (20min)
6. Test the form to ensure the API works and returns a shipping label(20min)
7. Add Necessary styling for the form (40min)
