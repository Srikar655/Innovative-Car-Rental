function payNow(orderId, amount, name, email) {
    var options = {
        "key": "rzp_test_Nq9wgoGXvlRLyt", // Enter the Key ID generated from the Dashboard
        "amount": amount, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise or INR 500.
        "currency": "INR",
        "name": "Acme Corp",
        "description": "Test Transaction",
        "image": "https://example.com/your_logo",
        "order_id": orderId, // Pass the order_id generated in the server-side code
        "handler": function (response) {
            alert("Payment successful. Razorpay Payment ID: " + response.razorpay_payment_id);
            alert("Razorpay Order ID: " + response.razorpay_order_id);
            alert("Razorpay Signature: " + response.razorpay_signature);
        },
        "prefill": {
            "name": name,
            "email": email,
        },
        "notes": {
            "address": "Razorpay Corporate Office"
        },
        "theme": {
            "color": "#3399cc"
        }
    };
    var rzp1 = new Razorpay(options);
    rzp1.open();
}