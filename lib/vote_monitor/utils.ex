defmodule Utils do
    
    def fullpath(env, filename), do: Path.join(Path.dirname(env.file), filename)

end 