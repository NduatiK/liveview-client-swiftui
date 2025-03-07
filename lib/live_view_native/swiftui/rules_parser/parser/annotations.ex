defmodule LiveViewNative.SwiftUI.RulesParser.Parser.Annotations do
  alias LiveViewNative.SwiftUI.RulesParser.Parser.Context
  # Helpers

  def context_to_annotation(%Context{annotations: true} = context, line) do
    source = Enum.at(context.source_lines, line - context.source_line, "")
    [file: context.file, line: line, module: context.module, source: String.trim(source)]
  end

  def context_to_annotation(_, _) do
    []
  end
end
