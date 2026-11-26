# frozen_string_literal: true

cask "pisa" do
  version "0.4.427"
  sha256 "a9e2f262f6ffe20db734d8904338451f1ed46a56695cc7c383d7a7a0f1bc179d"

  url "https://github.com/docomoz/pisa/releases/download/v#{version}/Pisa-#{version}-arm64.dmg"
  name "Pisa"
  desc "Meeting recorder with local transcription"
  homepage "https://getpisa.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pisa.app"

  uninstall quit: "com.docomoz.pisa"

  caveats <<~EOS
    This build has not been notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pisa.app"
  EOS
end
