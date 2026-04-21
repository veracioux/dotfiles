# General guidelines
- Do not modify any files outside of this repository
- For any change I request, there is likely already a literate-programming
  .org file where the change best fits. Put the change in the best such file if
  possible, otherwise request clarification before making any changes.
- If there is a schema URL related to the code you are about to modify, respect it
- After making changes to an .org file, always tangle it immediately using the
  `tangle <file>` command. Do not ask first. After tangling, you don't have to
  verify the content of the file, the output of the tangle command should suffice.
- When updating user-level Claude Code settings (`~/.claude/settings.json`),
  make the change in `ai.org` (under the `* CLI tools / ** Claude Code` section)
  instead of editing the destination file directly.
