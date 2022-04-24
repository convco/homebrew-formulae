class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.10.tar.gz"
  sha256 "d7ba520881ecea39dad3103561953bad36a8d10e8b9e2a641fe09d82748cfe3f"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.9"
    sha256 cellar: :any_skip_relocation, big_sur:      "8cd56d6d34ac11b80d775f0aa4dd0cbb28b44dc8fff51f974ed3c1fc273da9c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82de50d1b55d06ff0d74c77c7d135d22d1af30184dbb7769aad23b974c3d32ce"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bash_completion.install "target/completions/convco.bash" => "convco"
    zsh_completion.install  "target/completions/_convco" => "_convco"
    fish_completion.install "target/completions/convco.fish" => "convco.fish"
  end

  test do
    system "#{bin}/convco", "--version"
  end
end
