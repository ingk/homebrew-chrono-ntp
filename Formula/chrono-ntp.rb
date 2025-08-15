class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508151936"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508151936/chrono-ntp-darwin-arm64"
      sha256 "d9a5419c63e503c0fdadfa98e25761f8d4d34a81d050d5677ddff2d72b7a20a5" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508151936/chrono-ntp-darwin-amd64"
      sha256 "2b874abcb0399e208fa6087fa00d01d0db4ca864a32f672f88573ef08586f204" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508151936/chrono-ntp-linux-arm64"
      sha256 "407038cc197bfbc36c30a7a079174adca921374e41244bd767d6bfeac24983e3" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508151936/chrono-ntp-linux-amd64"
      sha256 "0249b88df8bfaf3281d58aedd4293006016ca3cdefacb371056994616438c178" # will be replaced automatically
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
