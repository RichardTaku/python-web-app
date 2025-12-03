function loadContact() {
    fetch('/contact')
        .then(res => res.json())
        .then(data => {
            alert("Email: " + data.email);
        });
}
