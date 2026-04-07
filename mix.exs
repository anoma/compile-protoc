defmodule CompileProtoc.MixProject do
  use Mix.Project

  def version do
    {ver, _} = Code.eval_file("version.exs")
    ver
  end

  def project do
    [
      app: :compile_protoc,
      version: version(),
      build_path: "_build",
      config_path: "config/config.exs",
      package: package(),
      deps_path: "deps",
      lockfile: "mix.lock",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def package do
    [
      maintainers: ["Mariari", " Raymond E. Pasco"],
      name: :compile_protoc,
      licenses: ["MIT"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [] ++ global_deps()
  end

  def global_deps do
    {list, _} = Code.eval_file("global_deps.exs")
    list
  end
end
