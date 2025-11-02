class ChronoNtp < Formula
  desc "Minimal terminal clock synced via NTP; ideal for setting mechanical watches"
  homepage "https://github.com/ingk/chrono-ntp"
  version "202511021833"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511021833/chrono-ntp-darwin-arm64"
      sha256 "b3793bbdd43016150e5bac5e2fd85a41faeb580fc7ec627ba69b4fb11fe10f29" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511021833/chrono-ntp-darwin-amd64"
      sha256 "53a639785e0fca201259aa1edca322a761331054ad84fba8bec846a865b425b7" # will be replaced automatically
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511021833/chrono-ntp-linux-arm64"
      sha256 "ba04b2c6aaeeb9ae47f1530bb67e65cb39a02aa364c518d79a0600a623e20997" # will be replaced automatically
    else
      url "https://github.com/ingk/chrono-ntp/releases/download/v202511021833/chrono-ntp-linux-amd64"
      sha256 "796de057785f7620ebc297b0112103848433a10ec42129afa8634c76fdc5aad8" # will be replaced automatically
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
