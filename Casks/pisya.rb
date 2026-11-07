# frozen_string_literal: true

cask "pisya" do
  version "0.4.69"
  sha256 "b0ae7aa3a987e8eac1a8c265eac05d4c9f3f843e7adc76d01c54711d8b456a55"

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
