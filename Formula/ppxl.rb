class Ppxl < Formula
  desc "CLI tool to access AI assistant from your terminal"
  homepage "https://github.com/abhishekbhakat/ppxl"
  version "1.0.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/abhishekbhakat/ppxl/releases/download/v1.0.0/ppxl-1.0.0-arm64"
    sha256 "bb595dd248f36b721d4f777ea0d8d55786aeae98006f6e1b718fe51b167febe9"
  else
    odie "Currently only supports Apple Silicon (M1/M2) Macs. Intel support coming soon."
  end

  def install
    bin.install "ppxl-#{version}-#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "ppxl"
  end

  test do
    assert_match "ppxl version #{version}", shell_output("#{bin}/ppxl version")
  end
end