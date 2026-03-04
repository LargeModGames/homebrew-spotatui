# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.37.2"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "b6e96a4351433b0c97b62ac68992123d5304162c8e5643bd2f60b56b51e01aac"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "878b736d4a98200caf8bfef5c016bcf267555157c2632d7789f1f18d82f9ab7d"
  end

  def install
    bin.install "spotatui"
  end

  def caveats
    <<~EOS
      To use spotatui, you need a Spotify Premium account and must set up
      Spotify API credentials. Run `spotatui` for first-time setup instructions.

      For native streaming support, ensure you have a Spotify Premium subscription.
      Note: Native streaming on macOS requires 'portaudio' (installed as a dependency).

      More info: https://github.com/LargeModGames/spotatui
    EOS
  end

  test do
    assert_match "spotatui", shell_output("#{bin}/spotatui --version")
  end
end
