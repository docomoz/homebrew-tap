# frozen_string_literal: true

cask "pisya" do
  version "0.4.164"
  sha256 "48cce9c16e09cbf27eb1a721fc7a004db6f32d16ae8298b98f362605e52425f8"

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
