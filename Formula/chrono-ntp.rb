class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "1.0.0" # will be replaced automatically by workflow
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v#{version}/chrono-ntp-darwin-arm64"
      sha256 "REPLACE_WITH_ARM64_MAC_SHA" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v#{version}/chrono-ntp-darwin-amd64"
      sha256 "REPLACE_WITH_AMD64_MAC_SHA" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v#{version}/chrono-ntp-linux-arm64"
      sha256 "REPLACE_WITH_ARM64_LINUX_SHA" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v#{version}/chrono-ntp-linux-amd64"
      sha256 "REPLACE_WITH_AMD64_LINUX_SHA" # will be replaced automatically
    end
  end

  def install
    bin.install "chrono-ntp"
  end

  test do
    system "#{bin}/chrono-ntp", "-help"
  end
end
