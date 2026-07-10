# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.40.2"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "8c1483f42141022384efdbf9769ffa67dea0c2324cef56a01c5a3cbb5806e7ba"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "b62a2dede6264e6b0da592093543adef380d56f073ecb5e9d7711d5b8204f371"
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
