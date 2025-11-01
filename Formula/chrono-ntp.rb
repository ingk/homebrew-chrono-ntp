class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202511011311"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511011311/chrono-ntp-darwin-arm64"
      sha256 "a69892148f36907847eff0b68bae58114d543544d9a585068529f80b441be1f0" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511011311/chrono-ntp-darwin-amd64"
      sha256 "0cd52927187c9cac72d48a5d2a874bf44fb29d5fa8e189301eaecae5ba42f102" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511011311/chrono-ntp-linux-arm64"
      sha256 "a745dd1f247741182c95082164c85ea0bae11273cfb9410cb04b5aff9e1bc355" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511011311/chrono-ntp-linux-amd64"
      sha256 "c019a11b437560b60a83100ebe5ac4d6f80d7b6bf26fae0dd8ea8d11276563b3" # will be replaced automatically
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
