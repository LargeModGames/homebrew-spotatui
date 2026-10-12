# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Spotify client for the terminal written in Rust, powered by Ratatui"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.45.0"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "9b81db4c3904080e20a74ba5376320c1d0f000d033bf64ee89a2a497d68d9d0b"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "2b022a43487c9c6a6ee9c02ee5147c9725f2cce23b6c3396e88dcf21ba6ae50e"
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
