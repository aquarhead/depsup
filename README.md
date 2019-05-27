# DepSup

**Dep**endency **Sup**ervisor.

This is basically (in its current scope) a wrapper around Elixir's (>= 1.6) `DynamicSupervisor`. However, making `DepSup` as a seperate library helps in situations where you need to "break" out of the dependency graph.

For example, when wrapping `ejabberd` within an Elixir project and extends it through "Modules", it's tricky to have runtime dependencies (i.e. other processes that the module code depends on) because `ejabberd` will start first before the Elixir wrapper application, so putting extra processes in the application's root supervisor is not enough, you have to wait for them to be started - again, because `ejabberd` modules will be started before the wrapper application. By extracting this `DepSup` concept to a separate library we can arrange it to make sure it starts up before `ejabberd`, which provides many support for managing any runtime dependencies that later applications (or "modules") might require.
