/*
 * 
 *
 * Javascript implementation of the RSA Data Security, Inc. MD5
 * Message-Digest Algorithm.
 *
 * Copyright (c) 1996 Henri Torgemane. All Rights Reserved.
 *
 * Permission to use, copy, modify, and distribute this software
 * and its documentation for any purposes and without
 * fee is hereby granted provided that this copyright notice
 * appears in all copies. 
 *
 * Of course, this soft is provided "as is" without express or implied
 * warranty of any kind.
 */



function array(n) {
    for (i = 0; i < n; i++) this[i] = 0;
    this.length = n;
}

/* Some basic logical functions had to be rewritten because of a bug in
 * Javascript.. Just try to compute 0xffffffff >> 4 with it..
 * Of course, these functions are slower than the original would be, but
 * at least, they work!
 */

function integer(n) { return n % (0xffffffff + 1); }

function shr(a, b) {
    a = integer(a);
    b = integer(b);
    if (a - 0x80000000 >= 0) {
        a = a % 0x80000000;
        a >>= b;
        a += 0x40000000 >> (b - 1);
    } else
        a >>= b;
    return a;
}

function shl1(a) {
    a = a % 0x80000000;
    if (a & 0x40000000 == 0x40000000) {
        a -= 0x40000000;
        a *= 2;
        a += 0x80000000;
    } else
        a *= 2;
    return a;
}

function shl(a, b) {
    a = integer(a);
    b = integer(b);
    for (var i = 0; i < b; i++) a = shl1(a);
    return a;
}

function and(a, b) {
    a = integer(a);
    b = integer(b);
    var t1 = (a - 0x80000000);
    var t2 = (b - 0x80000000);
    if (t1 >= 0)
        if (t2 >= 0)
            return ((t1 & t2) + 0x80000000);
        else
            return (t1 & b);
    else
        if (t2 >= 0)
            return (a & t2);
        else
            return (a & b);
}

function or(a, b) {
    a = integer(a);
    b = integer(b);
    var t1 = (a - 0x80000000);
    var t2 = (b - 0x80000000);
    if (t1 >= 0)
        if (t2 >= 0)
            return ((t1 | t2) + 0x80000000);
        else
            return ((t1 | b) + 0x80000000);
    else
        if (t2 >= 0)
            return ((a | t2) + 0x80000000);
        else
            return (a | b);
}

function xor(a, b) {
    a = integer(a);
    b = integer(b);
    var t1 = (a - 0x80000000);
    var t2 = (b - 0x80000000);
    if (t1 >= 0)
        if (t2 >= 0)
            return (t1 ^ t2);
        else
            return ((t1 ^ b) + 0x80000000);
    else
        if (t2 >= 0)
            return ((a ^ t2) + 0x80000000);
        else
            return (a ^ b);
}

function not(a) {
    a = integer(a);
    return (0xffffffff - a);
}

/* Here begin the real algorithm */

var state = new array(4);
var count = new array(2);
count[0] = 0;
count[1] = 0;
var buffer = new array(64);
var transformBuffer = new array(16);
var digestBits = new array(16);

var S11 = 7;
var S12 = 12;
var S13 = 17;
var S14 = 22;
var S21 = 5;
var S22 = 9;
var S23 = 14;
var S24 = 20;
var S31 = 4;
var S32 = 11;
var S33 = 16;
var S34 = 23;
var S41 = 6;
var S42 = 10;
var S43 = 15;
var S44 = 21;

function F(x, y, z) {
    return or(and(x, y), and(not(x), z));
}

function G(x, y, z) {
    return or(and(x, z), and(y, not(z)));
}

function H(x, y, z) {
    return xor(xor(x, y), z);
}

function I(x, y, z) {
    return xor(y, or(x, not(z)));
}

function rotateLeft(a, n) {
    return or(shl(a, n), (shr(a, (32 - n))));
}

function FF(a, b, c, d, x, s, ac) {
    a = a + F(b, c, d) + x + ac;
    a = rotateLeft(a, s);
    a = a + b;
    return a;
}

function GG(a, b, c, d, x, s, ac) {
    a = a + G(b, c, d) + x + ac;
    a = rotateLeft(a, s);
    a = a + b;
    return a;
}

function HH(a, b, c, d, x, s, ac) {
    a = a + H(b, c, d) + x + ac;
    a = rotateLeft(a, s);
    a = a + b;
    return a;
}

function II(a, b, c, d, x, s, ac) {
    a = a + I(b, c, d) + x + ac;
    a = rotateLeft(a, s);
    a = a + b;
    return a;
}

function transform(buf, offset) {
    var a = 0, b = 0, c = 0, d = 0;
    var x = transformBuffer;

    a = state[0];
    b = state[1];
    c = state[2];
    d = state[3];

    for (i = 0; i < 16; i++) {
        x[i] = and(buf[i * 4 + offset], 0xff);
        for (j = 1; j < 4; j++) {
            x[i] += shl(and(buf[i * 4 + j + offset], 0xff), j * 8);
        }
    }

    /* Round 1 */
    a = FF(a, b, c, d, x[0], S11, 0xd76aa478); /* 1 */
    d = FF(d, a, b, c, x[1], S12, 0xe8c7b756); /* 2 */
    c = FF(c, d, a, b, x[2], S13, 0x242070db); /* 3 */
    b = FF(b, c, d, a, x[3], S14, 0xc1bdceee); /* 4 */
    a = FF(a, b, c, d, x[4], S11, 0xf57c0faf); /* 5 */
    d = FF(d, a, b, c, x[5], S12, 0x4787c62a); /* 6 */
    c = FF(c, d, a, b, x[6], S13, 0xa8304613); /* 7 */
    b = FF(b, c, d, a, x[7], S14, 0xfd469501); /* 8 */
    a = FF(a, b, c, d, x[8], S11, 0x698098d8); /* 9 */
    d = FF(d, a, b, c, x[9], S12, 0x8b44f7af); /* 10 */
    c = FF(c, d, a, b, x[10], S13, 0xffff5bb1); /* 11 */
    b = FF(b, c, d, a, x[11], S14, 0x895cd7be); /* 12 */
    a = FF(a, b, c, d, x[12], S11, 0x6b901122); /* 13 */
    d = FF(d, a, b, c, x[13], S12, 0xfd987193); /* 14 */
    c = FF(c, d, a, b, x[14], S13, 0xa679438e); /* 15 */
    b = FF(b, c, d, a, x[15], S14, 0x49b40821); /* 16 */

    /* Round 2 */
    a = GG(a, b, c, d, x[1], S21, 0xf61e2562); /* 17 */
    d = GG(d, a, b, c, x[6], S22, 0xc040b340); /* 18 */
    c = GG(c, d, a, b, x[11], S23, 0x265e5a51); /* 19 */
    b = GG(b, c, d, a, x[0], S24, 0xe9b6c7aa); /* 20 */
    a = GG(a, b, c, d, x[5], S21, 0xd62f105d); /* 21 */
    d = GG(d, a, b, c, x[10], S22, 0x2441453); /* 22 */
    c = GG(c, d, a, b, x[15], S23, 0xd8a1e681); /* 23 */
    b = GG(b, c, d, a, x[4], S24, 0xe7d3fbc8); /* 24 */
    a = GG(a, b, c, d, x[9], S21, 0x21e1cde6); /* 25 */
    d = GG(d, a, b, c, x[14], S22, 0xc33707d6); /* 26 */
    c = GG(c, d, a, b, x[3], S23, 0xf4d50d87); /* 27 */
    b = GG(b, c, d, a, x[8], S24, 0x455a14ed); /* 28 */
    a = GG(a, b, c, d, x[13], S21, 0xa9e3e905); /* 29 */
    d = GG(d, a, b, c, x[2], S22, 0xfcefa3f8); /* 30 */
    c = GG(c, d, a, b, x[7], S23, 0x676f02d9); /* 31 */
    b = GG(b, c, d, a, x[12], S24, 0x8d2a4c8a); /* 32 */

    /* Round 3 */
    a = HH(a, b, c, d, x[5], S31, 0xfffa3942); /* 33 */
    d = HH(d, a, b, c, x[8], S32, 0x8771f681); /* 34 */
    c = HH(c, d, a, b, x[11], S33, 0x6d9d6122); /* 35 */
    b = HH(b, c, d, a, x[14], S34, 0xfde5380c); /* 36 */
    a = HH(a, b, c, d, x[1], S31, 0xa4beea44); /* 37 */
    d = HH(d, a, b, c, x[4], S32, 0x4bdecfa9); /* 38 */
    c = HH(c, d, a, b, x[7], S33, 0xf6bb4b60); /* 39 */
    b = HH(b, c, d, a, x[10], S34, 0xbebfbc70); /* 40 */
    a = HH(a, b, c, d, x[13], S31, 0x289b7ec6); /* 41 */
    d = HH(d, a, b, c, x[0], S32, 0xeaa127fa); /* 42 */
    c = HH(c, d, a, b, x[3], S33, 0xd4ef3085); /* 43 */
    b = HH(b, c, d, a, x[6], S34, 0x4881d05); /* 44 */
    a = HH(a, b, c, d, x[9], S31, 0xd9d4d039); /* 45 */
    d = HH(d, a, b, c, x[12], S32, 0xe6db99e5); /* 46 */
    c = HH(c, d, a, b, x[15], S33, 0x1fa27cf8); /* 47 */
    b = HH(b, c, d, a, x[2], S34, 0xc4ac5665); /* 48 */

    /* Round 4 */
    a = II(a, b, c, d, x[0], S41, 0xf4292244); /* 49 */
    d = II(d, a, b, c, x[7], S42, 0x432aff97); /* 50 */
    c = II(c, d, a, b, x[14], S43, 0xab9423a7); /* 51 */
    b = II(b, c, d, a, x[5], S44, 0xfc93a039); /* 52 */
    a = II(a, b, c, d, x[12], S41, 0x655b59c3); /* 53 */
    d = II(d, a, b, c, x[3], S42, 0x8f0ccc92); /* 54 */
    c = II(c, d, a, b, x[10], S43, 0xffeff47d); /* 55 */
    b = II(b, c, d, a, x[1], S44, 0x85845dd1); /* 56 */
    a = II(a, b, c, d, x[8], S41, 0x6fa87e4f); /* 57 */
    d = II(d, a, b, c, x[15], S42, 0xfe2ce6e0); /* 58 */
    c = II(c, d, a, b, x[6], S43, 0xa3014314); /* 59 */
    b = II(b, c, d, a, x[13], S44, 0x4e0811a1); /* 60 */
    a = II(a, b, c, d, x[4], S41, 0xf7537e82); /* 61 */
    d = II(d, a, b, c, x[11], S42, 0xbd3af235); /* 62 */
    c = II(c, d, a, b, x[2], S43, 0x2ad7d2bb); /* 63 */
    b = II(b, c, d, a, x[9], S44, 0xeb86d391); /* 64 */

    state[0] += a;
    state[1] += b;
    state[2] += c;
    state[3] += d;

}

function init() {
    count[0] = count[1] = 0;
    state[0] = 0x67452301;
    state[1] = 0xefcdab89;
    state[2] = 0x98badcfe;
    state[3] = 0x10325476;
    for (i = 0; i < digestBits.length; i++)
        digestBits[i] = 0;
}

function update(b) {
    var index, i;

    index = and(shr(count[0], 3), 0x3f);
    if (count[0] < 0xffffffff - 7)
        count[0] += 8;
    else {
        count[1]++;
        count[0] -= 0xffffffff + 1;
        count[0] += 8;
    }
    buffer[index] = and(b, 0xff);
    if (index >= 63) {
        transform(buffer, 0);
    }
}

function finish() {
    var bits = new array(8);
    var padding;
    var i = 0, index = 0, padLen = 0;

    for (i = 0; i < 4; i++) {
        bits[i] = and(shr(count[0], (i * 8)), 0xff);
    }
    for (i = 0; i < 4; i++) {
        bits[i + 4] = and(shr(count[1], (i * 8)), 0xff);
    }
    index = and(shr(count[0], 3), 0x3f);
    padLen = (index < 56) ? (56 - index) : (120 - index);
    padding = new array(64);
    padding[0] = 0x80;
    for (i = 0; i < padLen; i++)
        update(padding[i]);
    for (i = 0; i < 8; i++)
        update(bits[i]);

    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            digestBits[i * 4 + j] = and(shr(state[i], (j * 8)), 0xff);
        }
    }
}

/* End of the MD5 algorithm */

function hexa(n) {
    var hexa_h = "0123456789abcdef";
    var hexa_c = "";
    var hexa_m = n;
    for (hexa_i = 0; hexa_i < 8; hexa_i++) {
        hexa_c = hexa_h.charAt(Math.abs(hexa_m) % 16) + hexa_c;
        hexa_m = Math.floor(hexa_m / 16);
    }
    return hexa_c;
}


var ascii = "01234567890123456789012345678901" +
          " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
          "[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

function MD5(entree) {
    var l, s, k, ka, kb, kc, kd;

    init();
    for (k = 0; k < entree.length; k++) {
        l = entree.charAt(k);
        update(ascii.lastIndexOf(l));
    }
    finish();
    ka = kb = kc = kd = 0;
    for (i = 0; i < 4; i++) ka += shl(digestBits[15 - i], (i * 8));
    for (i = 4; i < 8; i++) kb += shl(digestBits[15 - i], ((i - 4) * 8));
    for (i = 8; i < 12; i++) kc += shl(digestBits[15 - i], ((i - 8) * 8));
    for (i = 12; i < 16; i++) kd += shl(digestBits[15 - i], ((i - 12) * 8));
    s = hexa(kd) + hexa(kc) + hexa(kb) + hexa(ka);
    return s;
}

/* This implement the MD5 test suite */
var testOk = false;
function teste() {
    if (testOk) return;
    document.test.o1.value = MD5(document.test.i1.value);
    document.test.o2.value = MD5(document.test.i2.value);
    document.test.o3.value = MD5(document.test.i3.value);
    document.test.o4.value = MD5(document.test.i4.value);
    document.test.o5.value = MD5(document.test.i5.value);
    document.test.o6.value = MD5(document.test.i6.value);
    document.test.o7.value = MD5(document.test.i7.value);
    testOk = true;
}

function formSubmit() {
    var pass;
    passObj = document.getElementById('edit-pass');
    chalObj = document.getElementById('edit-challenge');
    pass = MD5(MD5(passObj.value) + chalObj.value);
    passObj.value = pass;
    chalObj.value = "";
}

function ValidateEmail(email) {
    var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    return expr.test(email);
};

function validateUser() {
    var pass;
    $("#spnMsg").html("");
    passObj = document.getElementById('Password');
    hashObj = document.getElementById('hdnHash');
    seedObj = document.getElementById('hdnSeed');
    captchaObj = document.getElementById('clientCaptcha');

    if (document.getElementById('UserName').value.length == 0) {
        alert("User name is required, please provide"); document.getElementById('UserName').focus();
        return false;
    }
    else if (passObj.value.length == 0) {
        alert("Password is required, please provide"); passObj.focus();
        return false;
    }
    else if (captchaObj.value.length == 0) {
        alert("Please enter captcha as displayed above"); captchaObj.focus();
        return false;
    }
    else {
        pass = MD5(MD5(passObj.value) + seedObj.value);
        hashObj.value = pass;
        passObj.value = pass;
        return true;
    }
}

//Added by Abhay For Forgot Password


function ValidateFetchDetails() {
   
    $("#ContentPlaceHolder1_spnMsg").html("");

    if (document.getElementById('txtUserName').value.length == 0) {
        alert("Please provide user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (checkMinimumLength(document.getElementById('txtUserName').value, 4)) {
        alert("Please Enter User name With Minimum 6 Characters");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById('txtUserName').value))) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById('txtUserName'), 'Char,Number', 'Check')) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
  
    else {
        return true;
    }
}


function ValidateForgotPassword()
{
    
    $("#ContentPlaceHolder1_spnMsg").html("");

    if (document.getElementById('txtUserName').value.length == 0) {
        alert("Please provide user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (checkMinimumLength(document.getElementById('txtUserName').value, 4)) {
        alert("Please Enter User name With Minimum 6 Characters");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById('txtUserName').value))) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById('txtUserName'), 'Char,Number', 'Check')) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (document.getElementById('txtPasswordHintAnswer').value.length == 0) {
        alert("Please provide your answer to selected security question");
        document.getElementById('txtPasswordHintAnswer').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById('txtPasswordHintAnswer').value))) {
        alert("This is for password recovery, please enter valid answer");
        document.getElementById('txtPasswordHintAnswer').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById('txtPasswordHintAnswer'), 'Char,Number,AT,AND,DOT', 'Check')) {
        alert("This is for password recovery, please enter valid answer");
        document.getElementById('txtPasswordHintAnswer').focus();
        return false;
    }
    else {
        return true;
    }
}


//Added By Abhay For User Profile

function ValidateUserProfile()
{
    $("#ContentPlaceHolder1_spnMsg").html("");

    if (document.getElementById(clientid + 'txtFirstName').value.length == 0) {
        alert("Please provide first name");
        document.getElementById(clientid + 'txtFirstName').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtLastName').value.length == 0) {
        alert("Please provide last name");
        document.getElementById(clientid + 'txtLastName').focus();
        return false;
    }
   else if (document.getElementById(clientid + 'txtEmail').value.length == 0) {
    alert("Please provide Email Address");
    document.getElementById(clientid + 'txtEmail').focus();
    return false;
}
    else if (!ValidateEmail(document.getElementById(clientid + 'txtEmail').value)) {
    alert("This email address is invalid, please provide a valid email ID.");
    document.getElementById(clientid + 'txtEmail').focus();
    return false; 
    }

    else if (document.getElementById(clientid + 'txtCurrentAddress').value.length == 0) {
        alert("Please provide Current Address");
        document.getElementById(clientid + 'txtCurrentAddress').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById(clientid + 'txtCurrentAddress').value))) {
        alert("Please enter valid Address");
        document.getElementById(clientid + 'txtCurrentAddress').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtCurrentAddress'), 'Address', 'Check')) {
        alert("Please enter valid Address");
        document.getElementById(clientid + 'txtCurrentAddress').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtCity').value.length == 0) {
        alert("Please provide City Name");
        document.getElementById(clientid + 'txtCity').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtCity'), 'Char,Space', 'Check')) {
        alert("Please enter valid City Name");
        document.getElementById(clientid + 'txtCity').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtState').value.length == 0) {
        alert("Please provide State Name");
        document.getElementById(clientid + 'txtState').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtState'), 'Char,Space', 'Check')) {
        alert("Please enter valid State Name");
        document.getElementById(clientid + 'txtState').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtPINCode').value.length == 0) {
        alert("Please provide Pin code");
        document.getElementById(clientid + 'txtPINCode').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtPINCode'), 'Number', 'Check')) {
        alert("Please enter valid PinCode");
        document.getElementById(clientid + 'txtPINCode').focus();
        return false;
    }
    else if (checkExactLength(document.getElementById(clientid + 'txtPINCode').value, 6)) {
        alert("Please enter valid Pin code");
        document.getElementById(clientid + 'txtPINCode').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtDOB').value.length == 0) {
        alert("Please select Date of Birth");
        document.getElementById(clientid + 'txtDOB').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtMobileNo').value.length == 0) {
        alert("Please provide Mobile Number");
        document.getElementById(clientid + 'txtMobileNo').focus();
        return false;
    }
    else if (checkExactLength(document.getElementById(clientid + 'txtMobileNo').value, 10)) {
        alert("Please enter valid mobile no");
        document.getElementById(clientid + 'txtMobileNo').focus();
        return false;
    }
    else if (!ValidateMobileNumber(document.getElementById(clientid + 'txtMobileNo').value)) {
        alert("Please enter valid mobile no");
        document.getElementById(clientid + 'txtMobileNo').focus();
        return false;
    }
    else if (checkExactLength(document.getElementById(clientid + 'txtLandLine').value, 0) && checkExactLength(document.getElementById(clientid + 'txtLandLine').value, 11)) {
        alert("Please enter valid land-line no");
        document.getElementById(clientid + 'txtLandLine').focus();
        return false;
    }

}



function validateRegistration() {
    var pass;
    $("#spnMsg").html("");
    passObj = document.getElementById('txtPassword');
    passObj1 = document.getElementById('txtConfirmPassword');
    hashObj = document.getElementById(clientid + 'hdnHash');
    hashObj1 = document.getElementById(clientid + 'hdnHash1');
    captchaObj = document.getElementById('txtCaptcha');

    if (captchaObj.value.length == 0) {
        alert("Please enter captcha as displayed above"); captchaObj.focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtUsername').value.length == 0) {
        alert("Please provide user name");
        document.getElementById(clientid + 'txtUsername').focus();
        return false;
    }
    else if (checkMinimumLength(document.getElementById(clientid + 'txtUsername').value,4)) {
        alert("Please Enter User name With Minimum 6 Characters");
        document.getElementById(clientid + 'txtUsername').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById(clientid + 'txtUsername').value))) {
        alert("Please enter valid user name");
        document.getElementById(clientid + 'txtUsername').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtUsername'), 'Char,Number','Check')) {
        alert("Please enter valid user name");
        document.getElementById(clientid + 'txtUsername').focus();
        return false;
    }
    else if (passObj.value.length == 0) {
        alert("Please provide password"); passObj.focus();
        return false;
    }
    else if (inputKeyuplimiter (passObj, 'Char,Number,AT,DOLLAR,QUEST', 'Check')) {
        alert("Please Provide Valid Password");
        passObj.focus();
        return false;
    }
    else if (passObj1.value.length == 0) {
        alert("Please Confirm password"); passObj1.focus(); 
        return false;
    }
    else if (passObj.value != passObj1.value) {
        alert("Password entries do not match, please provide valid entries"); passObj1.focus();
        return false;
    }   
    else if (document.getElementById(clientid + 'ddlPasswordHint').value == 0) {
        alert("Please select Security Question");
        document.getElementById(clientid + 'ddlPasswordHint').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtPasswordHintAnswer').value.length == 0) {
        alert("Please provide your answer to selected security question");
        document.getElementById(clientid + 'txtPasswordHintAnswer').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById(clientid + 'txtPasswordHintAnswer').value))) {
        alert("This is for password recovery, please enter valid answer");
        document.getElementById(clientid + 'txtPasswordHintAnswer').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtPasswordHintAnswer'), 'Char,Number,AT,AND,DOT', 'Check')) {
        alert("This is for password recovery, please enter valid answer");
        document.getElementById(clientid + 'txtPasswordHintAnswer').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtFirstName').value.length == 0) {
        alert("Please provide First Name");
        document.getElementById(clientid + 'txtFirstName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtFirstName'), 'Char,Space', 'Check')) {
        alert("Please enter valid First Name");
        document.getElementById(clientid + 'txtFirstName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtMiddleName'), 'Char,Space', 'Check')) {
        alert("Please enter valid Middle Name");
        document.getElementById(clientid + 'txtMiddleName').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtLastName').value.length == 0) {
        alert("Please provide Last Name");
        document.getElementById(clientid + 'txtLastName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtLastName'), 'Char,Space', 'Check')) {
        alert("Please enter valid Last Name");
        document.getElementById(clientid + 'txtLastName').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtEmailId').value.length == 0) {
        alert("Please provide Email Address");
        document.getElementById(clientid + 'txtEmailId').focus();
        return false;
    }
    else if (!ValidateEmail(document.getElementById(clientid + 'txtEmailId').value)) {
        alert("This email address is invalid, please provide a valid email ID.");
        document.getElementById(clientid + 'txtEmailId').focus();
        return false; 
    }
    else if (document.getElementById(clientid + 'txtAddress').value.length == 0) {
        alert("Please provide Current Address");
        document.getElementById(clientid + 'txtAddress').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById(clientid + 'txtAddress').value))) {
        alert("Please enter valid Address");
        document.getElementById(clientid + 'txtAddress').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtAddress'), 'Address', 'Check')) {
        alert("Please enter valid Address");
        document.getElementById(clientid + 'txtAddress').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtCity').value.length == 0) {
        alert("Please provide City Name");
        document.getElementById(clientid + 'txtCity').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtCity'), 'Char,Space', 'Check')) {
        alert("Please enter valid City Name");
        document.getElementById(clientid + 'txtCity').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtState').value.length == 0) {
        alert("Please provide State Name");
        document.getElementById(clientid + 'txtState').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtState'), 'Char,Space', 'Check')) {
        alert("Please enter valid State Name");
        document.getElementById(clientid + 'txtState').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtPinCode').value.length == 0) {
        alert("Please provide Pin code");
        document.getElementById(clientid + 'txtPinCode').focus();
        return false;
    }
    else if (checkExactLength(document.getElementById(clientid + 'txtPinCode').value,6)) {
        alert("Please enter valid Pin code");
        document.getElementById(clientid + 'txtPinCode').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById(clientid + 'txtPinCode'), 'Number', 'Check')) {
        alert("Please enter valid Pin code");
        document.getElementById(clientid + 'txtPinCode').focus();
        return false;
    }
    else if ($('input:radio[name=optGender]:checked').val() == undefined) {
        alert("Please select Gender");
        document.getElementById(clientid + 'txtDateofBirth').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtDateofBirth').value.length == 0) {
        alert("Please select Date of Birth");
        document.getElementById(clientid + 'txtDateofBirth').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtMobileNumber').value.length == 0) {
        alert("Please provide Mobile Number");
        document.getElementById(clientid + 'txtMobileNumber').focus();
        return false;
    }    
    else if (checkExactLength(document.getElementById(clientid + 'txtMobileNumber').value, 10)) {
        alert("Please enter valid mobile no");
        document.getElementById(clientid + 'txtMobileNumber').focus();
        return false;
    }
    else if (!ValidateMobileNumber(document.getElementById(clientid + 'txtMobileNumber').value)) {
        alert("Please enter valid mobile no");
        document.getElementById(clientid + 'txtMobileNumber').focus();
        return false;
    }
    else if (checkExactLength(document.getElementById(clientid + 'txtlandLineNumber').value, 0) && checkExactLength(document.getElementById(clientid + 'txtlandLineNumber').value, 11)) {
        alert("Please enter valid land-line no");
        document.getElementById(clientid + 'txtlandLineNumber').focus();
        return false;
    }
    else if ($("#chkDeclaration").prop('checked') != true) {
        alert("Please accept the declaration to Sign-up");
        return false;
    }
    else {
        if (checkPasswordPolicy(passObj1.value)) {
            pass = MD5(passObj.value);
            pass1 = MD5(passObj1.value);

            hashObj.value = pass;
            passObj.value = pass;

            hashObj1.value = pass1;
            passObj1.value = pass1;

            return true;
        }
        else {
            alert("Password Doesn't Meet Password Policy")
            return false;
        }
    }
}
//Added By Abhay 
function ValidateResetPwd() {
    //$("#ContentPlaceHolder1_spnMsg").html("");
    //debugger;
    var pass;
    passObj = document.getElementById('txtNewPassword');
    conPassObj = document.getElementById('txtConfirmPassword');
    hashObj = document.getElementById('hdnHash');
    seedObj = document.getElementById('hdnSeed'); 

    if (passObj.value != conPassObj.value)
    {
        alert("Your confirm password doesn’t match,please provide valid input");
        passObj.focus();
        return false;
    }
    else if (passObj.value.length == 0) {
        alert("Please Provide Password"); passObj.focus();
        return false;
    }

    else if (inputKeyuplimiter(passObj, 'Char,Number,AT,DOLLAR,QUEST', 'Check')) {
        alert("Please Provide Valid Password");
        passObj.focus();
        return false;
    }
 
    else
    {
        if (checkPasswordPolicy(passObj.value))
        {
            pass = MD5(passObj.value);// + seedObj.value);
            hashObj.value = pass;
            passObj.value = pass;

            pass1 = MD5(passObj.value);
            pass2 = MD5(conPassObj.value);

            hashObj.value = pass1;
            passObj.value = pass1;

            hashObj.value = pass2;
            conPassObj.value = pass2;
            return true;
        }
        else {
            alert("Password Doesn't Meet Password Policy")
            return false;
        }



      
       
    }
}
//end
function ChangePassword(type) {
    var pass;
    $("#ContentPlaceHolder1_spnMsg").html("");
    seedObj = document.getElementById('hdnSeed');
    passObj = document.getElementById('txtCurPassword');
    passObj1 = document.getElementById('txtNewPassword');
    passObj2 = document.getElementById('txtConfirmPassword');

    hashObj = document.getElementById('hdnHash');
    hashObj1 = document.getElementById('hdnHash1');
    hashObj2 = document.getElementById('hdnHash2');
   
    if (document.getElementById('txtUserName').value.length == 0) {
        alert("Please provide user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (checkMinimumLength(document.getElementById('txtUserName').value, 4)) {
        alert("Please Enter User name With Minimum 4 Characters");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (!(checkMinimumOneChar(document.getElementById('txtUserName').value))) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById('txtUserName'), 'Char,Number', 'Check')) {
        alert("Please enter valid user name");
        document.getElementById('txtUserName').focus();
        return false;
    }
    else if (type=="set" && document.getElementById('ddlPasswordHint').value == 0) {
        alert("Please select Security Question");
        document.getElementById('ddlPasswordHint').focus();
        return false;
    }
    else if (passObj.value.length == 0) {
        alert("Please provide password"); passObj.focus();
        return false;
    }


    else if (passObj.value.length > 10) {
        alert("Password Should not be More Than 10 Characters"); passObj.focus();
        return false;
    }
    //else if (document.getElementById('txtPasswordHint').value.length == 0) {
    //    alert("Please provide your answer to selected security question");
    //    document.getElementById('txtPasswordHint').focus();
    //    return false;
    //}
    else if (!(checkMinimumOneChar(document.getElementById('txtAnswer').value))) {
        alert("Your answer to hint question is invalid");
        document.getElementById('txtAnswer').focus();
        return false;
    }
    else if (inputKeyuplimiter(document.getElementById('txtAnswer'), 'Char,Number,AT,AND,DOT', 'Check')) {
        alert("Your answer to hint question is invalid");
        document.getElementById('txtAnswer').focus();
        return false;
    }
    else if (passObj1.value.length == 0) {
        alert("Please provide new password"); passObj1.focus();
        return false;
    }
    else if (inputKeyuplimiter(passObj1, 'Char,Number,AT,DOLLAR,QUEST', 'Check')) {
        alert("Please Provide Valid Password");
        passObj1.focus();
        return false;
    }

    else if (passObj2.value.length == 0) {
        alert("Please Confirm new Password"); passObj2.focus();
        return false;
    }
    else if (passObj.value == passObj1.value) {
        alert("For security reasons we do not allow the previously used password, please provide valid password"); passObj2.focus();
        return false;
    }
    else if (passObj1.value != passObj2.value) {
        alert("your confirm password doesn’t match , please provide valid input"); passObj2.focus();
        return false;
    }
    else {
        if (checkPasswordPolicy(passObj1.value)) {
            pass = MD5(MD5(passObj.value) + seedObj.value);
            pass1 = MD5(passObj1.value);
            pass2 = MD5(passObj2.value);

            hashObj.value = pass;
            passObj.value = pass;

            hashObj1.value = pass1;
            passObj1.value = pass1;

            hashObj2.value = pass2;
            passObj2.value = pass2;
            return true;
        }
        else {
            alert("Please provide valid password, Please see the password policy")
            passObj1.focus();
            return false;
        }
    }
}


function ForgotPassword() {

    var pass;

    seedObj = document.getElementById(clientid + 'hdnSeed');

    passObj1 = document.getElementById('txtNewPassword');
    passObj2 = document.getElementById('txtConfirmPassword');

    hashObj1 = document.getElementById(clientid + 'hdnHash1');
    hashObj2 = document.getElementById(clientid + 'hdnHash2');
    if (document.getElementById(clientid + 'txtUsername').value.length == 0) {
        alert("Invalid User name");
        document.getElementById(clientid + 'txtUsername').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtAnswer').value.length == 0) {
        alert("Please Enter Your Answer");
        document.getElementById(clientid + 'txtAnswer').focus();
        return false;
    }
    else if (document.getElementById(clientid + 'txtMobileNumber').value.length == 0) {
        alert("Please Enter Your Mobile Number");
        document.getElementById(clientid + 'txtMobileNumber').focus();
        return false;
    }
    else if (passObj1.value.length == 0) {
        alert("Please Enter New Password"); passObj1.focus();
        return false;
    }
    else if (passObj2.value.length == 0) {
        alert("Please Enter Confirm Password"); passObj2.focus();
        return false;
    }
    else if (passObj1.value != passObj2.value) {
        alert("New Password And Confirm Password not Matching"); passObj2.focus();
        return false;
    }
    else {
        if (checkPasswordPolicy(passObj1.value)) {
            pass1 = MD5(passObj1.value);
            pass2 = MD5(passObj2.value);

            hashObj1.value = pass1;
            passObj1.value = pass1;

            hashObj2.value = pass2;
            passObj2.value = pass2;
            return true;
        }
        else {
            alert("Password Doesn't Meet Password Policy")
            return false;
        }
    }
}

function checkPasswordPolicy(str) {
    // at least one number, one lowercase and one uppercase letter
    // at least six characters that are letters, numbers or the underscore
    var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@$?*])[a-zA-Z0-9@$?*]{6,10}$/;
    return re.test(str);
}
//Added by Abhay-diler added functionality
function setMaxLength(obj, len, e) {
   
    var k = document.all ? parseInt(e.keyCode) : parseInt(e.which);
    if (k != 13 && k != 8 && k != 0) {
        return (obj.value.length < len);
    } else {
        return true;
    }
}


// Disbaling Right Click on full Page 
$(document).ready(function () {
    //$("body").on("contextmenu", function (e) {
    //    return false;
    //});
});
