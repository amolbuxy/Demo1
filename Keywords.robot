
*** Settings ***
Library    SeleniumLibrary  
Resource    Test_Data.robot


*** Variables ***
${browser}                    chrome
${url}                        http://demowebshop.tricentis.com
${REGISTER}                   //a[@class='ico-register']
${FIRST_NAME_TEXTBOX}                 //input[@id='FirstName']
${LAST_NAME_TEXTBOX}                  //input[@id='LastName']
${EMAIL_TEXTBOX}                      //input[@id='Email']
${PASSWORD_TEXTBOX}                   //input[@id='Password']
${CONFIRM_PASSWORD_TEXTBOX}           //input[@id='ConfirmPassword']
${REGISTRATION_DONE_BUTTON}          //input[@id='register-button']
${LOGIN_PAGE_LINK}                 //a[@class='ico-login']   
${ENTER_EMAIL_TEXTBOX}                //input[@id='Email']
${ENTER_PASSWORD_TEXTBOX}             //input[@id='Password']
${LOGIN_BUTTON}               //input[@value='Log in']
${BOOKS_LINK}                      //a[contains(text(),'Books')]
${COMPUTERS_LINK}                  //a[contains(text(),'Computers')]
${ELECTRONICS_LINK}                //a[contains(text(),'Electronics')]
${APPAREL_SHOES_LINK}              //a[contains(text(),'Apparel & Shoes')]
${DIGITAL_DOWNLOADS_LINK}          //a[contains(text(),'Digital downloads')]
${JEWELRY_LINK}                    //a[contains(text(),'Jewelry')]
${GIFT_CARDS_LINK}                 //a[contains(text(),'Gift Cards')]
# ${nan}                        //strong[contains(text(),'${replacableText}')]
${CATEGORIES_LINK}                 //strong[contains(text(),'Categories')] 
${MANUFACTURERS_LINK}              //strong[contains(text(),'Manufacturers')]
${POPULAR_TAGS_LINK}               //strong[contains(text(),'Popular tags')]
${NEWSLETER_LINK}                  //strong[contains(text(),'Newsletter')]
${COMMUNITY_POLL_LINK}             //strong[contains(text(),'Community poll')]
${FEATURED_PRODUCTS_LINK}          //strong[contains(text(),'Featured products')]
${DESKTOP}                    //img[@title='Show products in category Desktops']
${CELL_PHONES}                //img[@title='Show products in category Cell phones']
${ADD_TO_CART_BOOK_BUTTON}           //a[text()='Fiction']/ancestor::div[contains(@class,'details')]//input
${ADD_TO_CART_COMPUTER_BUTTON}       //input[@type='button' and @value='Add to cart']
${ADD_TO_CART_COMPUTER2_BUTTON}      //input[@id='add-to-cart-button-72' and @value='Add to cart']
${ADD_TO_CART_CELLPHONES_BUTTON}     //a[text()='Smartphone']/ancestor::div[contains(@class,'details')]//input
${ADD_TO_CART_APPAREL_BUTTON}        (//input[@value='Add to cart'])[3]
${ADD_TO_CART_DOWNLOAD_BUTTON}       //a[contains(text(),'3rd Album')]/ancestor::div[contains(@class,'details')]//input
${ADD_TO_CART_JEWELRY_BUTTON}        //img[@alt='Picture of Black & White Diamond Heart']
${ADD-TO_CART_JEWELRY2_BUTTON}       //input[contains(@id,'add-to-cart-button-14')]
${ADD_TO_CART_GIFTCARD_BUTTON}       //a[contains(text(),'$25 Virtual Gift Card')]/ancestor::div[contains(@class,'details')]//input
${ADD_TO_CART_GIFTCARD2_BUTTON}      //input[contains(@value,'Add to cart')]
${CART_LINK}                       //a[contains(text(),'Shopping cart')]
${Notebook}                   //img[@alt='Picture for category Notebooks']
${RECIPIENT_NAME_TEXTBOX}             //input[@id='giftcard_2_RecipientName']
${RECIPIENT_EMAIL_TEXTBOX}            //input[@id='giftcard_2_RecipientEmail']
${SENDER_NAME_TEXTBOX}                //input[@id='giftcard_2_SenderName']
${SENDER_EMAIL_TEXTBOX}               //input[@id='giftcard_2_SenderEmail']
${MESSAGE_TEXTBOX}                    //textarea[@id='giftcard_2_Message']



*** Keywords ***

Registration On Portal
    Open Browser            ${url}               ${browser}
    Maximize Browser Window
    Click Element           ${REGISTER}  
    Select Radio Button     Gender               M   
    Input Text              ${FIRST_NAME_TEXTBOX}        X  
    Input Text              ${LAST_NAME_TEXTBOX}         Y
    Input Text              ${EMAIL_TEXTBOX}             g007@gmail.com
    Input Password          ${PASSWORD_TEXTBOX}          xyz123
    Input Password          ${CONFIRM_PASSWORD_TEXTBOX}  xyz123  
    Click Button            ${REGISTRATION_DONE_BUTTON}  
    Log To Console          Registration Successful       
    
LogIn On Portal
   
    Open Browser            ${url}               ${browser}
    Maximize Browser Window
    Click Element           ${LOGIN_PAGE_LINK}
    Input Text              ${ENTER_EMAIL_TEXTBOX}      g007@gmail.com    
    Input Text              ${ENTER_PASSWORD_TEXTBOX}   xyz123    
    Click Button            ${LOGIN_BUTTON}
    
    Log To Console          LogIn Successful  
    
Verifying Elements
    
    LogIn On Portal
    #
    Page Should Contain Element    ${CATEGORIES_LINK}   
    Page Should Contain Element    ${MANUFACTURERS_LINK}
    Page Should Contain Element    ${POPULAR_TAGS_LINK}
    Page Should Contain Element    ${NEWSLETER_LINK}    
    Page Should Contain Element    ${COMMUNITY_POLL_LINK}    
    Page Should Contain Element    ${FEATURED_PRODUCTS_LINK}   
    Log To Console                 Verification Done Successfully       
    
Validating Elements
    LogIn On Portal
    #use forloop and list concept
    Page Should Contain Element    ${BOOKS_LINK}
    Page Should Contain Element    ${COMPUTERS_LINK}
    Page Should Contain Element    ${ELECTRONICS_LINK}
    Page Should Contain Element    ${APPAREL_SHOES_LINK}
    Page Should Contain Element    ${DIGITAL_DOWNLOADS_LINK}
    Page Should Contain Element    ${JEWELRY_LINK}
    Page Should Contain Element    ${GIFT_CARDS_LINK}                            
    Log To Console                 Validation Done Successfully
    
Add to Cart
    
    LogIn On Portal
    Click Element                  ${BOOKS_LINK}    
    Click Element                  ${ADD_TO_CART_BOOK_BUTTON}
    Click Element                  ${COMPUTERS_LINK}
    Click Image                    ${Notebook}  
    Click Element                  ${ADD_TO_CART_COMPUTER_BUTTON}
    Click Element                  ${ELECTRONICS_LINK}    
    Click Element                  ${CELL_PHONES}
    Click Element                  ${ADD_TO_CART_CELLPHONES_BUTTON}
    Click Element                  ${APPAREL_SHOES_LINK}      
    Click Element                  ${ADD_TO_CART_APPAREL_BUTTON}
    Click Element                  ${DIGITAL_DOWNLOADS_LINK}         
    Click Element                  ${ADD_TO_CART_DOWNLOAD_BUTTON}  
    Click Element                  ${JEWELRY_LINK}   
    Click Image                    ${ADD_TO_CART_JEWELRY_BUTTON}
    Click Element                  ${ADD-TO_CART_JEWELRY2_BUTTON}
    Wait Until Element Is Visible  ${GIFT_CARDS_LINK}    
    Click Element                  ${GIFT_CARDS_LINK}   
    Wait Until Element Is Visible  ${ADD_TO_CART_GIFTCARD_BUTTON}     
    Click Element                  ${ADD_TO_CART_GIFTCARD_BUTTON}  
    Wait Until Element Is Visible  ${RECIPIENT_NAME_TEXTBOX}
    Input Text                     ${RECIPIENT_NAME_TEXTBOX}    RECIPIENT    
    Input Text                     ${RECIPIENT_EMAIL_TEXTBOX}    RECIPIENT@gmail.com
    Input Text                     ${SENDER_NAME_TEXTBOX}    Sender    
    Input Text                     ${SENDER_EMAIL_TEXTBOX}    sender@gmail.com    
    Input Text                     ${MESSAGE_TEXTBOX}    HELLO          
    Click Element                  ${ADD_TO_CART_GIFTCARD2_BUTTON}        
    Click Element                  ${CART_LINK}            
    Log To Console                 ADD TO CART SUCCESSFUL 
    
         
*** Test Cases ***

TC_01
    Registration On Portal
TC_02
    LogIn On Portal
TC_03
    Verifying Elements
TC_04
    Validating Elements
TC_05
    Add to Cart  
