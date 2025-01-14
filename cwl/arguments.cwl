cwlVersion: v1.0
class: CommandLineTool
baseCommand: javac
hints:
  - class: DockerRequirement
    dockerPull: openjdk:17
baseCommand: javac
arguments:
  - prefix: "-d"
    valueFrom: $(runtime.outdir)
inputs:
  - id: src
    type: File
    inputBinding:
      position: 1
outputs:
  - id: classfile
    type: File
    outputBinding:
      glob: "*.class"
