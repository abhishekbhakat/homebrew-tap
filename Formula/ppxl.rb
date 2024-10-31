class Ppxl < Formula
  desc "CLI tool to query Perplexity AI from your terminal"
  homepage "https://github.com/abhishekbhakat/ppxl"
  version "1.0.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/abhishekbhakat/ppxl/releases/download/v1.0.0/ppxl-1.0.0-arm64"
    sha256 "bb595dd248f36b721d4f777ea0d8d55786aeae98006f6e1b718fe51b167febe9"
  else
    url "https://github.com/abhishekbhakat/ppxl/releases/download/v1.0.0/ppxl-1.0.0-x86_64"
    sha256 "REPLACE_WITH_X86_64_SHA256" # Will be updated when x86_64 binary is available
  end

  def install
    bin.install "ppxl-#{version}-#{Hardware::CPU.arm? ? "arm64" : "x86_64"}" => "ppxl"
  end

  test do
    assert_match "ppxl version #{version}", shell_output("#{bin}/ppxl version")
  end
end