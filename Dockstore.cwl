#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "helloworld-checker"
label: "Hello world output validator"

cwlVersion: v1.0

$namespaces:
  dct: http://purl.org/dc/terms/
  foaf: http://xmlns.com/foaf/0.1/

dct:creator:
  "@id": "http://orcid.org/0000-0001-9758-0176"
  foaf:name: James Eddy
  foaf:mbox: "mailto:james.a.eddy@gmail.com"

requirements:
- class: DockerRequirement
  dockerPull: quay.io/jaeddy/dockstore-tool-helloworld-checker:1.1.0

inputs:
  knowngood_file:
    type: File
    inputBinding:
      position: 1

  helloworld_file:
    type: File
    inputBinding:
      position: 2

outputs:
  output:
    type: File
    outputBinding:
      glob: "results.json"

baseCommand: ["python", "/usr/local/bin/helloworld_check"]
