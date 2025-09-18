class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202509181634"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181634/chrono-ntp-darwin-arm64"
      sha256 "9d3172f9973093ad3c149d294a9291f6a5e285a413eba7bd8a9f88a2102e794b" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181634/chrono-ntp-darwin-amd64"
      sha256 "62274846f611b2ddbcad643d50f94d80fbadf4b8f61976a3aefbb03451fabb67" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181634/chrono-ntp-linux-arm64"
      sha256 "06d13c566a8471a8b47a3a2ca0d6147ede7ec0d85996365ea318b11969600dd1" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202509181634/chrono-ntp-linux-amd64"
      sha256 "e7efd1402d99ac2e92f6979fe9b9aae874694a432a83069ddcac80d84a1761a8" # will be replaced automatically
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
