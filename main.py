from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/book-flight")
def book_flight():
    return {"message": "Find the best flight deals and book your tickets online."}

@app.route("/hotel_reservation")
def hotel_reservation():
    return render_template("hotel_reservation.html") #{"message": "Book your stay at top-rated hotels."}

@app.route("/contact")
def contact():
    return {
        "email": "info@microserviceapp.com",
   }

@app.route("/about")
def about():
    return {
        "message": "We are a travel microservice platform providing seamless booking experiences."
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)



