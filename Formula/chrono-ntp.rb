class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202512041630"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512041630/chrono-ntp-darwin-arm64"
      sha256 "0955b7b713db3f4903509e6f46d1582b3b32489f51f2be0af6e5d8f142d13dce" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512041630/chrono-ntp-darwin-amd64"
      sha256 "340baf9cfab06c54cb58dbd632adeae9bcaf0eda87958a1041bdf7966eadb861" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512041630/chrono-ntp-linux-arm64"
      sha256 "95e4cb13100238c7fcf219263608e47d9eb6ffae2bff131fa4d763c791ab4260" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512041630/chrono-ntp-linux-amd64"
      sha256 "ec43df8e8b82e632ae615f467e5b03dc30defae5164df2135ebfaa5f3f5da93b" # will be replaced automatically
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
