class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508241929"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508241929/chrono-ntp-darwin-arm64"
      sha256 "4846113f9b1bdb39910fb55e289022f035506b22b23d65c260fa13ccd67189fe" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508241929/chrono-ntp-darwin-amd64"
      sha256 "a8d24020ecc7798f46788f1243001051fb6bb39406fbbb7d333da5a17565c37e" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508241929/chrono-ntp-linux-arm64"
      sha256 "e43591f21e9603710e8fa9f2c6049b00cd13c2c326df7b5382d2b3a61bb3da96" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508241929/chrono-ntp-linux-amd64"
      sha256 "d6f53a051b1b0fa9f306188b952d01697d23f41fd8491b6b9990c8d8bb09c0b0" # will be replaced automatically
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
