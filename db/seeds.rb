[
  {
    id: (Figaro.env.free_package_id || SecureRandom.uuid),
    name: "2 Hours of Free Turbo WiFi",
    description: "Two hours of free Turbo WiFi",
    charged_as: "SUMMERFELL.COM FREE WiFi HOTSPOT",
    price_cents: 0,
    duration_minutes: (2.hours / 60),
    limit_up: 10000,
    limit_down: 10000,
    currency: 'USD'
  },
  {
    name: "8 Hours of Turbo WiFi",
    description: "8 hours of Turbo WiFi (10Mbps/10Mbps, no quotas)",
    charged_as: "SUMMERFELL.COM 8-hour WiFi HOTSPOT",
    price_cents: 799,
    duration_minutes: (8.hours / 60),
    limit_up: 10000,
    limit_down: 10000,
    currency: 'USD'
  },
  {
    name: "24 hours of Turbo WiFi",
    description: "24 hours of Turbo WiFi (10Mbps/10Mbps, no quotas)",
    charged_as: "SUMMERFELL.COM 24-hour WiFi HOTSPOT",
    price_cents: 1299,
    duration_minutes: (24.hours / 60),
    limit_up: 10000,
    limit_down: 10000,
    currency: 'USD'
  },
  {
    name: "1 Week of Turbo WiFi",
    description: "7 days of Turbo WiFi (10Mbps/10Mbps, no quotas)",
    charged_as: "SUMMERFELL.COM 1-Week WiFi HOTSPOT",
    price_cents: 2495,
    duration_minutes: (24.hours * 7 / 60),
    limit_up: 10000,
    limit_down: 10000,
    currency: 'USD'
  }
].each do |params|
  if package = Package.find_by(name: params[:name])
    package.update(params)
  else
    Package.create(params)
  end
end
