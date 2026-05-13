class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202605131920"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605131920/chrono-ntp-darwin-arm64"
      sha256 "30b65f58b282786a37abe97c1fcae4d3b6458e5ad702ace29110eb98ad5d8922" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605131920/chrono-ntp-darwin-amd64"
      sha256 "8dd2f9bf07a79ed927dd135b375b579b6c87d974ca39a5af4fb7a8e8d34dc58c" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605131920/chrono-ntp-linux-arm64"
      sha256 "c7edd11765108a48870f8e0ed6b9fa12d58a52f50a8a24cc7d7bb8d9e3f2b188" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202605131920/chrono-ntp-linux-amd64"
      sha256 "8d51164e6ec0429532c32f0550050b1a8bb1878aff503a753f8dfefb50498719" # will be replaced automatically
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
