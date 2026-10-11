# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.44.0"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "a9e91860c42519c5e71a4f9b465e8408b21f327cd3cadfb48d28da0d080ec709"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "bba95a4a6596659d15e9596b75312d3be2cefb0c844cc07f15f3f04a5b6ffe22"
  end

  def install
    bin.install "spotatui"
  end

  def caveats
    <<~EOS
      Spotify in spotatui needs a Spotify Premium account. Run `spotatui`,
      pick Spotify, and confirm the code it shows on Spotify's pairing page.

      Note: Native streaming on macOS requires 'portaudio' (installed as a dependency).

      More info: https://github.com/LargeModGames/spotatui
    EOS
  end

  test do
    assert_match "spotatui", shell_output("#{bin}/spotatui --version")
  end
end
