
// Example starter JavaScript for disabling form submissions if there are invalid fields


(function () {
    'use strict';
    window.addEventListener('load', function () {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function (form) {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();




//email validation
function echeck(email) {
    var str = document.getElementById(email).value;
    if (str == '') {
        return true
    }
    else {
        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)
        if (str.indexOf(at) == -1) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        if (str.indexOf(" ") != -1) {
            alert("Invalid E-mail ID.Enter like example@xxx.aa")
            return false
        }

        return true
    }


}

function NumberhyphenOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 45) || (AsciiValue == 47))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter NumericValues, '/', '-' Only");
    }
}


function Dates() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 45) || (AsciiValue == 46) || (AsciiValue == 47))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Date Format(DD-MM-yyyy). Use Only Numbers, '.', '/', '-' Only");
    }
}

function NumberCharandHypehn() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 45) || (AsciiValue == 47) || (AsciiValue == 46) || (AsciiValue == 32))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter NumericValues, '/', '-' Only");
    }

}


function ContactNoOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || AsciiValue == 43 || AsciiValue == 45)
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Numerics and + and - Only");
    }
}

function DecimalOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || AsciiValue == 46)
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Decimal Values Only");
    }
}

function CharOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Charcters Only");
    }
}

function CharbarOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue == 97 || AsciiValue == 47 || AsciiValue == 45) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 32) || (AsciiValue == 44) || (AsciiValue == 46))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Alphanumaric,- and / Only");
    }
}

function CharnumOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Alphanumeric Only");
    }
}

function CharnumOnlyAll() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue == 97 || AsciiValue == 47 || AsciiValue == 45) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 32) || (AsciiValue == 44) || (AsciiValue == 46) || (AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 46) || (AsciiValue == 32))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Alphanumeric,.,-,/ and Space Only");
    }
}

//function PhoneNumberOnly() {
//    var AsciiValue = event.keyCode
//    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || (AsciiValue == 45))
//        event.returnValue = true;
//    else {
//        event.returnValue = false;

//        alert("Enter NumericValues Only");
//    }
//}

function PhoneNumberOnly(event) {
    var AsciiValue = event.keyCode;


    if ((AsciiValue >= 48 && AsciiValue <= 57) ||
        AsciiValue == 8 ||
        AsciiValue == 46 ||
        AsciiValue == 45) {

        if (event.target.value.length <= 10) {
            return true;
        } else {
            event.preventDefault();
            return false;
        }
    } else {
        event.preventDefault();
        alert("Enter Numbers Only");
        return false;
    }
}




function Nameandbar() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 46) || (AsciiValue == 47) || (AsciiValue == 32) || (AsciiValue == 47) || (AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127) || AsciiValue == 43 || AsciiValue == 45)
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Alphabets, '.', '/' and Space Only");
    }
}

function Sonof() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 46) || (AsciiValue == 47) || (AsciiValue == 32))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Alphabets, '.', '/' and Space Only");
    }
}



function ValidateForm() {
    var emailID = document.frmClientSetup.aspx.txtEmail

    if ((emailID.value == null) || (emailID.value == "")) {
        alert("Please Enter your Email ID")
        emailID.focus()
        return false
    }
    if (echeck(emailID.value) == false) {
        emailID.value = ""
        emailID.focus()
        return false
    }
    return true

}
function ValidateNumberWithoutSpaceAdhar(evt) {
    //var key = window.event.keyCode;
    var key = (evt.which) ? evt.which : event.keyCode;
    var char = String.fromCharCode(key);

    var v = new Array();
    v = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    var j;
    if (key == 32) {
        return false;
    }
    for (var i = 0; i < v.length; i++) {
        if (char == v[i]) {
            return true;
        }
        else {
            j = j + 1;
        }
    }

    if (j = v.length) {
        return false;
    }
}
function ValidatePAN(evt) {

    var key = (evt.which) ? evt.which : event.keyCode;
    var char = String.fromCharCode(key);

    var Obj = document.getElementById("txtcontact0");
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        if (ObjVal.search(panPat) == -1) {
            alert("Invalid Pan No");
            Obj.focus();
            return false;
        }
    }
}
function ValidateNumberWithoutSpaceOnlyrestrictedNumbers(evt, obj) {
    //var key = window.event.keyCode;

    var key = (evt.which) ? evt.which : event.keyCode;
    var char = String.fromCharCode(key);
    var v = new Array();
    v = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    var j;
    if (key == 32) {
        return false;
    }
    for (var i = 0; i < v.length; i++) {
        if (char == v[i]) {
            return true;
            var tempField = obj.value
            if (tempField > 39) {
                return false;
            }
            else {
                return true;
            }
        }
        else {
            j = j + 1;
        }
    }

    if (j = v.length) {
        return false;
    }

}

function restrictNumberonly(evt, obj) {
    //var key = window.event.keyCode;
    var tempField = obj.value
    if (tempField > 39) {
        obj.value = "";
        return false;
    }
    else {
        return true;
    }
}



//function validateGST(Obj) {
//    debugger;
//    if (Obj == null) Obj = window.event.srcElement;
//    if (Obj.value != "") {
//        ObjVal = Obj.value;
//        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
//        var code = /([C,P,H,F,A,T,B,L,J,G,c,p,h,f,a,t,b,l,j,g])/;
//        var code_chk = ObjVal.substring(3, 4);
//        if (ObjVal.search(panPat) == -1) {
//            Obj.focus();
//            Obj.value = "";
//            alert("Invalid Pan No");

//            return false;
//        }
//        if (code.test(code_chk) == false) {
//            Obj.value = "";
//            alert("Invaild PAN Card No.");
//            return false;
//        }
//    }
//}
//function validateGST(Obj) {
//    if (Obj == null)
//    { var gstNumber = window.event.srcElement };
//    var regex = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[A-Z]{1}[0-9]{1}$/;
//    if (gstNumber != null || gstNumber != "") {
//        if (!regex.test(gstNumber)) {
//            alert("Enter a valid GST number");
//            event.target.value = "";
//            event.target.focus();
//            return false;
//        }
//    }
//



function Adharcontrol(evt, obj, dd, mm, yyyy) {

    //debugger                        
    //var fieldkey = window.event.keyCode;
    var fieldkey = (evt.which) ? evt.which : event.keyCode;
    var tempField = obj.value.split('');
    var flag = false;
    var bck = false;
    //var fieldkey = window.event.keyCode;
    var fieldkey = (evt.which) ? evt.which : event.keyCode;
    switch (fieldkey) {
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
            flag = true;
            break;
        case 8:
            bck = true;
            break;
    }

    if (parseInt(tempField.length, 10) >= 4 && flag == true) {
        if (obj.id == document.getElementById(dd).id) {
            document.getElementById(mm).focus();
        }
    }
    if (parseInt(tempField.length, 10) >= 4 && flag == true) {
        if (obj.id == document.getElementById(mm).id) {
            document.getElementById(yyyy).focus();
        }
    }
    return false;
}

function ValidateDecimal(field, ff) {
    fieldvalue = ff.value;
    // alert(fieldvalue);
    // var fieldkey = window.event.keyCode;
    var fieldkey = (field.charCode) ? field.which : event.keyCode
    var fieldchar = String.fromCharCode(fieldkey);
    if (fieldkey == 32) {
        return false;
    }
    if (fieldkey == 46) {
        var dot = fieldvalue.concat(fieldchar);
        fieldvalue = new String(dot);
        dotfirstpos = dot.indexOf(".");
        dot2ndpos = dot.lastIndexOf(".");
        if (dotfirstpos == dot2ndpos) {
            return true;
        }
        else {

            return false;
        }
    }
    var ArrNumeric = new Array();
    ArrNumeric = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    var Numpos;
    for (var intNumPos = 0; intNumPos < ArrNumeric.length; intNumPos++) {
        if (fieldchar == ArrNumeric[intNumPos]) {
            return true;
        }
        else {
            Numpos = Numpos + 1;
        }
    }

    if (Numpos = ArrNumeric.length) {

        return false;
    }

}



//function validateEmail(email) {
//    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//    return emailPattern.test(email);
//}

//function validateEmail(mail) {
//    var pattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

//    if (pattern.test(mail)) {

//    } else {
//        mail.focus();
//        mail.value = "";
//        alert("Invalid mail id");

//        return false;
//    }


//}

function validateAmount(event) {
    var charCode = event.charCode || event.keyCode;
    var inputElement = event.target;


    if ((charCode >= 48 && charCode <= 57) ||
        charCode == 46 ||
        charCode == 8 ||
        charCode == 127) {
        // Check the overall format
        var inputValue = inputElement.value + String.fromCharCode(charCode);
        var isValidAmount = /^\d+(\.\d{0,2})?$/.test(inputValue);

        if (!isValidAmount) {
            event.preventDefault();
            alert("Enter a valid amount");
            return false;
        }
    } else {
        event.preventDefault();
        return false;
    }
    return true;
}

function validateNumbersOnly(event) {
    var charCode = event.charCode || event.keyCode;
    if ((charCode >= 48 && charCode <= 57) ||
        charCode == 8 ||
        charCode == 127) {
        return true;
    } else {
        event.preventDefault();
        return false;
    }
}


function validatePincode(event) {
    var charCode = event.charCode || event.keyCode;
    var inputElement = event.target;
    if ((charCode >= 48 && charCode <= 57) ||
        charCode == 8 ||
        charCode == 127) {
        if (inputElement.value.length <= 6) {
            return true;
        } else {
            event.preventDefault();
            return false;
        }
    } else {
        event.preventDefault();
        alert("Enter only numeric values");
        return false;
    }
}

function validateNameAndNumbers(event) {
    var charCode = event.charCode || event.keyCode;
    var inputElement = event.target;


    if ((charCode >= 48 && charCode <= 57) ||
        (charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122) ||
        charCode === 45 ||
        charCode === 32) {
        return true;
    } else {
        alert("Please enter only alphabets and numbers.");
        event.preventDefault();
        return false;
    }
}

function validateNumberAndDot(event) {
    var charCode = event.charCode || event.keyCode;


    if ((charCode >= 48 && charCode <= 57) ||
        charCode == 46) {
        return true;
    } else {
        alert("Please enter only numbers and dot (.)");
        event.preventDefault();
        return false;
    }
}



function ValidatePAN(evt) {

    var key = (evt.which) ? evt.which : event.keyCode;
    var char = String.fromCharCode(key);

    var Obj = document.getElementById("txtApplPAN");
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        if (ObjVal.search(panPat) == -1) {
            alert("Invalid Pan No");
            Obj.focus();
            return false;
        }
    }
}

function validateAadhar(event) {
    var charCode = event.charCode || event.keyCode;
    var aadharNumber = event.target.value;

    if ((charCode >= 48 && charCode <= 57)) {
        if (aadharNumber.length >= 12) {
            alert("Aadhar number should have exactly 12 digits.");
            event.preventDefault();
            return false;
        }
        return true;
    } else {
        alert("Please enter only numeric values.");
        event.preventDefault();
        return false;
    }
}

function validateAadharOnBlur(event) {
    var aadharNumber = event.target.value.trim();
    if (aadharNumber.length !== 12) {
        alert("Aadhar number should have exactly 12 digits.");
        event.target.focus();
    }
}

function validateNames(event) {
    var input = event.target;
    var name = input.value;
    var charCode = event.charCode || event.keyCode;

    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
        return true;
    } else {
        alert("Enter only alphabets (A-Z, a-z)");
        input.value = "";
        return false;
    }
}



function ValidatePANS(evt) {

    var key = (evt.which) ? evt.which : event.keyCode;
    var char = String.fromCharCode(key);

    var Obj = document.getElementById("txtPAN");
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        if (ObjVal.search(panPat) == -1) {
            alert("Invalid Pan No");
            Obj.focus();
            return false;
        }
    }
}
//sowjanya 20-07-2024
function validateCharandNumberinput() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 65 && AsciiValue <= 90) ||
        (AsciiValue >= 97 && AsciiValue <= 122))
        event.returnValue = true;
    //allowing 0-9 A-Z a-z   8=backspace 127=delete

    else {
        event.returnValue = false;
        //alert("Enter Numeric Values Only");
    }
}
function fnValidatePAN(Obj) {

    if (Obj == null) Obj = window.event.srcElement;
    if (Obj.value != "") {
        ObjVal = Obj.value;
        var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
        var code = /([C,P,H,F,A,T,B,L,J,G,c,p,h,f,a,t,b,l,j,g])/;
        var code_chk = ObjVal.substring(3, 4);
        if (ObjVal.search(panPat) == -1) {
            Obj.focus();
            Obj.value = "";
            alert("Invalid Pan No");

            return false;
        }
        if (code.test(code_chk) == false) {
            Obj.value = "";
            alert("Invaild PAN Card No.");
            return false;
        }
    }
}
// Function to validate Indian mobile number using ASCII values
function validateIndianMobileNumber(mobileNumber) {
    var value = mobileNumber.value;
    if (value != "") {
        if (value.length != 10) {
            mobileNumber.focus();
            mobileNumber.value = "";
            return alert('Mobile number should be 10 digits');
        }
        else {
            var firstChar = value.charCodeAt(0)
            if (firstChar < 54 || firstChar > 57) {
                mobileNumber.value = "";
                alert("Please enter valid Mobile number");
                return false;
            }
        }
    }
}
function validateEmailInput() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 65 && AsciiValue <= 90) ||
        (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 95) || (AsciiValue == 64) ||
        (AsciiValue == 46) || (AsciiValue == 42) ||
        (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    //allowing 0-9 A-Z a-z  specl 95=_ 64=@  46=. 8=backspace 127=delete

    else {
        event.returnValue = false;
        //alert("Enter Numeric Values Only");
    }
}
function validatePasswordInput() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue >= 65 && AsciiValue <= 90) ||
        (AsciiValue >= 97 && AsciiValue <= 122) || (AsciiValue == 95) || (AsciiValue == 64) ||
        (AsciiValue == 46) || (AsciiValue == 42) || (AsciiValue == 35) || (AsciiValue == 36) ||
        (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    //allowing 0-9 A-Z a-z  specl 95=_ 64=@  46=.  35=# 36=$ -  8=backspace 127=delete

    else {
        event.returnValue = false;
        //alert("Enter Numeric Values Only");
    }
}

function validateEmail(email) {
    var email = event.target.value;
    if (email != "") {
        var isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

        if (!isValidEmail) {
            event.target.value = "";
            event.target.focus();
            alert("Enter a valid email address");
        }
    }
}
function PhoneNumberOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Numeric Values Only");
    }
}
function NumberOnly() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 48 && AsciiValue <= 57) || (AsciiValue == 8 || AsciiValue == 127))
        event.returnValue = true;
    else {
        event.returnValue = false;

        alert("Enter Numbers Only");
    }
}

function validateNameAndNumbers(event) {
    var charCode = event.charCode || event.keyCode;
    var inputElement = event.target;

    if ((charCode >= 48 && charCode <= 57) ||
        (charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122) ||
        charCode === 45 ||
        charCode === 32) { // hyphen (-)
        return true;
    } else {
        alert("Please enter only alphabets, numbers, or hyphen.");
        event.preventDefault();
        return false;
    }
}
function validateNumberAndHyphen(event) {
    var charCode = event.charCode || event.keyCode;
    if ((charCode >= 48 && charCode <= 57) || charCode === 45) {
        return true;
    } else {
        event.preventDefault();
        return false;
    }
}
function validateNames(input) {
    var name = input.value;
    var charCode = event.charCode || event.keyCode;
    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
        return true;
    } else {
        alert("Enter only alphabets (A-Z, a-z)");
        input.value = "";
        return false;
    }
}
function Names() {
    var AsciiValue = event.keyCode
    if ((AsciiValue >= 65 && AsciiValue <= 90) || (AsciiValue >= 97 && AsciiValue <= 122)
        || (AsciiValue == 46) || (AsciiValue == 32))
        event.returnValue = true;
    else {
        event.returnValue = false;
        event.focus()
        event.value = ""
        alert("Enter Alphabets and Space Only");
    }
}
function validateGST(event) {
    var gstNumber = event.target.value.trim();
    var regex = /^[0-9]{2}[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}$/;
    if (gstNumber != "") {
        if (!regex.test(gstNumber)) {
            event.target.value = "";
            event.target.focus();
            alert("Enter a valid GST number");
            return false;
        }
    }
}
function Address(event) {
    var charCode = event.charCode || event.keyCode;


    if ((charCode >= 48 && charCode <= 57) ||
        (charCode >= 65 && charCode <= 90) ||
        (charCode >= 97 && charCode <= 122) ||
        charCode === 45 || // Hyphen (-)
        charCode === 47 || // Slash (/)
        charCode === 44 || // Comma (,)
        charCode === 46 || // Dot (.)
        charCode === 32) { // Space
        return true;
    } else {
        event.preventDefault();
        dot.value == "";
        alert("Please enter only alphabets, numbers, hyphen, dot, slash, or comma.");
        return false;
    }
}
function validateDateFormat(input) {
    var datePattern = /^\d{2}-\d{2}-\d{4}$/;
    if (input.value != "") {
        if (!datePattern.test(input.value)) {
            alert("Please enter the date in dd-mm-yyyy format.");
            input.value = "";
            input.target.focus();
            return false;
        }
        return true;
    }

}
function validateNameInput(event) {
    var asciiValue = event.keyCode || event.which;

    // Check if the key pressed is a letter (A-Z, a-z), a number (0-9), or a space (32)
    if ((asciiValue >= 65 && asciiValue <= 90) ||   // Uppercase letters
        (asciiValue >= 97 && asciiValue <= 122) ||  // Lowercase letters
        (asciiValue >= 48 && asciiValue <= 57) ||   // Digits 0-9
        asciiValue == 32) {                         // Space
        return true;
    } else {
        event.preventDefault();
        alert("Enter only alphabets, numbers, and spaces.");
        return false;
    }
}




