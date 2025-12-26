class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202512241422"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512241422/chrono-ntp-darwin-arm64"
      sha256 "cadf30748abf2438a6303ad242e79a32bcd1340abe2eb44a69356eb58cdee9ff" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512241422/chrono-ntp-darwin-amd64"
      sha256 "88c8105a33c167a5f48cce0776b2887c30c86e05c43939a763c1c0b5618c96a3" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512241422/chrono-ntp-linux-arm64"
      sha256 "7d28dac3093122a04a5095fc1ea14c5e28577d3ce37c4e31a5b9d88b2bfc63dc" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512241422/chrono-ntp-linux-amd64"
      sha256 "c0e08579efc59ea62cec96fc7f4b5c2bf1b0902ea9ff9d13eeefc1b2497687c0" # will be replaced automatically
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "chrono-ntp-darwin-arm64" : "chrono-ntp-darwin-amd64"
    else
      Hardware::CPU.arm? ? "chrono-ntp-linux-arm64" : "chrono-ntp-linux-amd64"
    end

    bin.install binary_name => "chrono-ntp"
  end

  test do
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "chrono-ntp-darwin-arm64" : "chrono-ntp-darwin-amd64"
    else
      Hardware::CPU.arm? ? "chrono-ntp-linux-arm64" : "chrono-ntp-linux-amd64"
    end

    system "#{bin}/#{binary_name}", "-help"
  end
end
