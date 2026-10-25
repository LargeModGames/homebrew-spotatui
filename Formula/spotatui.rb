# typed: false
# frozen_string_literal: true

# This formula is automatically updated by the CD workflow on each release.
# Manual changes will be overwritten.

class Spotatui < Formula
  desc "Terminal music player for Spotify, local files, Subsonic, radio, YouTube, Qobuz"
  homepage "https://spotatui.com"
  version "0.47.0"
  license "MIT"

  depends_on :macos
  depends_on "portaudio"
  depends_on "openssl@3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "ea7c2175321e1b0094cb61bf62bf0d2db4b69a959f7e9c0fcd0c37c66e20b013"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "88fe26c4441f0a5290f673326836fb479780b85033bd804a09bc1cd9220eead1"
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
