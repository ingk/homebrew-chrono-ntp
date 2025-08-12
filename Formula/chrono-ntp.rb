class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508121741"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121741/chrono-ntp-darwin-arm64"
      sha256 "2cd6aa9608d4183337d203dc944d938547bef3a7eec48ccaadca9eec9c172244" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121741/chrono-ntp-darwin-amd64"
      sha256 "60faaacf7009442249a536df96c3323500ba95330af7571d4b47b4044045564d" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121741/chrono-ntp-linux-arm64"
      sha256 "1df56fd3e95bc3a26f7cec5fc54f58543e500033fc1ddf06c3317d30421d796e" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508121741/chrono-ntp-linux-amd64"
      sha256 "2f8914f5e5c44bbd57a9125184970ae0736350f9868ce987d142b8d951a7b52b" # will be replaced automatically
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
