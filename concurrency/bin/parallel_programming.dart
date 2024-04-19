import 'dart:isolate';

void main() {
  Isolate.spawn((obj) {}, "");
}

// Received an order from customer - Ordering Service
void orderReceived(String order) => print("$order placed!");

// Someone Posted a bad review - Customer Service
void reviewHandler(String badReview) =>
    print("forwarded $badReview to Customer Satisfaction Team");

// Someone requested refund - Payment Service
void refundProcessor(double refundAmount) =>
    print("${refundAmount.toString()} processed");

// Order Delivered - Ordering Service
void addToCart(String order) => print("$order added to cart");
