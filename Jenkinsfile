pipeline {
  agent none
  stages {
    stage('Get dockstore CLI') {
      steps {
        deleteDir()
        sh 'wget https://github.com/ga4gh/dockstore/releases/download/1.5.0-beta.4/dockstore'
        sh 'chmod a+x dockstore'
      }
    }
    stage('entry convert') {
      steps {
        parallel(
          "entry convert": {
            sh './dockstore workflow convert entry2json --entry github.com/HumanCellAtlas/skylab/HCA_SmartSeq2_wdl_checker:dockstore > Dockstore_converted.json'
            
          },
          "wget test parameter file": {
            sh 'wget --header=\'Accept: text/plain\' https://staging.dockstore.org:443/api/api/ga4gh/v2/tools/%23workflow%2Fgithub.com%2FHumanCellAtlas%2Fskylab%2FHCA_SmartSeq2_wdl_checker/versions/dockstore/PLAIN_WDL/descriptor//test/smartseq2_single_sample/pr/dockstore_test_inputs.json -O Dockstore.json'
            
          }
        )
      }
    }
    stage('launch') {
      steps {
        sh './dockstore workflow launch --entry github.com/HumanCellAtlas/skylab/HCA_SmartSeq2_wdl_checker:dockstore --json Dockstore.json'
      }
    }
  }
}