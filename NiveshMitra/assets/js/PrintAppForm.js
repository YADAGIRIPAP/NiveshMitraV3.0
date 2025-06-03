$(document).ready(function () {
    getRecord();
});
function getRecord() {
    $.ajax({
        url: '/PrintApplicationForm/getRecord',
        method: 'POST',
        //data: { value: 'Hello from JS' },
        data: {},
        success: function (response) {
            alert(response.message);
        },
        error: function (xhr) {
            alert('Error: ' + xhr.statusText);
        }
    });
}