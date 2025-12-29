class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202512291244"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512291244/chrono-ntp-darwin-arm64"
      sha256 "2cbde6c3b6388ce0083236f4e343ed40a5ba34540224558e374698b95eaef1be" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512291244/chrono-ntp-darwin-amd64"
      sha256 "83717f1caf180881b50aedf877220790533b283fdd88ec828fa2aff8986e8257" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512291244/chrono-ntp-linux-arm64"
      sha256 "9287a62fda93c21ff22814234c1cb9de51be44840764bb6683ded985a5c521dd" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202512291244/chrono-ntp-linux-amd64"
      sha256 "96cf89e3c90756e9ac84a5fc1734ca7bfdc645c7505bc5b16d6e60fd57c94ab4" # will be replaced automatically
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
