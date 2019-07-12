Channel.fromPath("$baseDir/data/lorem.txt").dump(tag: 'lorem').set { LoremChannel }

println """
========================
CONTAINER ..... : $workflow.container
ENGINE ........ : $workflow.containerEngine
========================
""".stripIndent()


process testProcess {
  echo true
  label 'scratchyScratch'

  input:
    file lorem_in from LoremChannel

  output:
    file lorem_out

  script:
  println """
  ========================
  EXECUTOR ... : ${task.executor}
  SCRATCH .... : ${task.scratch}
  CONTAINER .. : ${task.container}
  ========================
  """.stripIndent()

  """
  echo "hostname: "\$(hostname)
  echo "This is PWD : "$PWD
  echo "This is \\PWD (escaped) : "\$PWD
  echo "This is pwd (from subshell) : \$(pwd)"
  echo "TMPDIR : $TMPDIR"
  echo "\\TMPDIR (escaped) : \$TMPDIR"
  cat ${lorem_in} > lorem_out
  """
}