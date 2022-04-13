// enter a numerator and divisor, and the function will return an int that can divide both of them
int simplify(int n, int d) {
  // loops through numbers and sees if there's any remainder when diving them
  for (int i = d; i > 0; i--) {
    // if the both remainders are 0 , then the number is divisible
    if (n % i == 0 && d % i == 0) {
      return i;
    }
  }
  return 1;
}
