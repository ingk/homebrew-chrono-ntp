class ChronoNtp < Formula
  desc "chrono-ntp is a simple command-line tool that synchronizes with an NTP (Network Time Protocol) server to account for any difference between your computer’s clock and the actual time, displaying the precise date and time in your terminal."
  homepage "https://github.com/ingk/chrono-ntp"
  version "202508111939"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508111939/chrono-ntp-darwin-arm64"
      sha256 "8767b1effdbf1343022280fc2b553eb4ca482a2c8cce27f3f3f1b80b80918a90" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508111939/chrono-ntp-darwin-amd64"
      sha256 "921a2459bba0561c063167b4d2c617cbf405fc71440a9fd33c909f1fcf4d30a6" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508111939/chrono-ntp-linux-arm64"
      sha256 "5c65a955a30cec246fe412ad1bd000581136076dd4f8a6cc04c805a74a266403" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202508111939/chrono-ntp-linux-amd64"
      sha256 "1685f52cb88c03a40d6eae6ed53adb6d6150120edf85036dcaac5027e849d406" # will be replaced automatically
    end
  end

  def install
    bin.install "chrono-ntp"
  end

  test do
    system "#{bin}/chrono-ntp", "-help"
  end
end
