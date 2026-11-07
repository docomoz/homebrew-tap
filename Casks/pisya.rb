# frozen_string_literal: true

cask "pisya" do
  version "0.4.73"
  sha256 "d3516ae5551e84e57e2fe13a79b4ca1c94b34cdc86fe7e7c4d9b404cb47ab3ff"

  url "https://github.com/docomoz/pisya/releases/download/v#{version}/Pisya-#{version}-arm64.dmg"
  name "Pisya"
  desc "Meeting recorder with local transcription"
  homepage "https://github.com/docomoz/pisya"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Pisya.app"

  uninstall quit: "com.docomoz.pisya"

  caveats <<~EOS
    This build has not been notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Pisya.app"
  EOS
end
