class Lf < Formula
  desc "Terminal file manager"
  homepage "https://godoc.org/github.com/gokcehan/lf"
  url "https://github.com/gokcehan/lf/archive/r26.tar.gz"
  sha256 "dccd1ad67d2639e47fe0cbc93d74f202d6d6f0c3759fb0237affb7b1a2b1379e"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "f16e27a50a509db35453fcd2de41c4973da8f1b37131c7de5ef2a8097ea9219b"
    sha256 cellar: :any_skip_relocation, big_sur:       "e76f4582df73496e7957136782b809d450ccac55337b7040776dd6ad48c51d6b"
    sha256 cellar: :any_skip_relocation, catalina:      "a9ed31146b0ebbd0662b78e58bed48344774a485302ddf080ca1f1aea7cdc7bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6cc327c457adb1387fbecb627c2adef0de39c18cbcbf0848e0b6b8869a39280d"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w -X main.gVersion=#{version}"
    man1.install "lf.1"
    zsh_completion.install "etc/lf.zsh" => "_lf"
    fish_completion.install "etc/lf.fish"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/lf -version").chomp
    assert_match "file manager", shell_output("#{bin}/lf -doc")
  end
end
