Package.create(
  name: "30 Days Hotspot Access",
  charged_as: "30 Days WiFi Hotspot",
  price_cents: 8999,
  currency: 'USD',
  description: "30 days of high-speed WiFi on the Summerfell Turbo network.",
  duration_minutes: 30.days.to_i / 60,
  limit_up: 10000,
  limit_down: 10000
)

Package.create(
  name: "1 Week Hotspot Access",
  charged_as: "1 Week WiFi Hotspot",
  price_cents: 2499,
  currency: 'USD',
  description: "1 week of high-speed WiFi on the Summerfell Turbo network.",
  duration_minutes: 1.weeks.to_i / 60,
  limit_up: 10000,
  limit_down: 10000
)

Package.create(
  name: "1 Day Hotspot Access",
  charged_as: "1 Day WiFi Hotspot",
  price_cents: 899,
  currency: 'USD',
  description: "1 day of high-speed WiFi on the Summerfell Turbo network.",
  duration_minutes: 1.days.to_i / 60,
  limit_up: 10000,
  limit_down: 10000
)

Package.create(
  name: "2 Hours Free Trial Hotspot Access",
  charged_as: "2 Hour Free Trial",
  price_cents: 0,
  currency: 'USD',
  description: "2 hours of high-speed WiFi on the Summerfell Turbo network.",
  duration_minutes: 120,
  limit_up: 10000,
  limit_down: 10000
)