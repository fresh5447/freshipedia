Rails.configuration.stripe = {
  :publishable_key => 'pk_test_ZEyFuASWlkl9xnicMUiF6AyR',
  :secret_key      => 'sk_test_8Jh1QKJspMXbI8Wq4avW1ZcE'
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]

# Test secret key sk_test_8Jh1QKJspMXbI8Wq4avW1ZcE
# Test publish key pk_test_ZEyFuASWlkl9xnicMUiF6AyR
# Live secret key sk_live_TmDNDOWgUaAuf0H0PDnwCe9C
# Live publish key pk_live_N069aelYPNq5m1qjLotweXTB