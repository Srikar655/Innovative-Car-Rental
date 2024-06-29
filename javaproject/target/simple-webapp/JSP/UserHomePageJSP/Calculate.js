function calculateDaysAndRate() {
    var startDate = new Date(document.getElementById('startdate').value);
    var endDate = new Date(document.getElementById('enddate').value);
    var ratePerDay = parseFloat(document.getElementById('rate').value);

    if (startDate && endDate && !isNaN(ratePerDay)) {
        var timeDiff = endDate - startDate;
        var days = Math.ceil(timeDiff / (1000 * 3600 * 24));
        if (days > 0) {
            var totalRate = days * ratePerDay;
            document.getElementById('days').value = days;
            document.getElementById('total').value = totalRate.toFixed(2); // Adjust to display two decimal places
        } else {
            document.getElementById('days').value = '';
            document.getElementById('total').value = '';
        }
    }
}