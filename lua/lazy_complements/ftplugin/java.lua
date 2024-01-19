local config = {
  -- '/usr/lib/jvm/java-21-jdk/bin/java',
  cmd = { '/home/luc/.local/share/nvim/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(
    vim.fs.find({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }, { upward = true })[1]
  ),
}
require('jdtls').start_or_attach(config)
