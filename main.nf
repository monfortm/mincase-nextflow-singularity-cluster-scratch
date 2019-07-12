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


  println "scratch: ${task.scratch}"
  println "container: ${task.container}"
  """
  echo "This is PWD : "$PWD
  echo "This is \\PWD : "\$PWD
  hostname
  echo "PWD  :: $PWD"
  echo "\\PWD :: \$PWD"
  echo "pwd :: \$(pwd)"
  echo "TMPDIR :: $TMPDIR"
  echo "\\TMPDIR :: \$TMPDIR"
  cat ${lorem_in} > lorem_out
  sleep 400
  """
}