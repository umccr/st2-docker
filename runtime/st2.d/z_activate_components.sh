#!/bin/bash

##### set data store key-value pairs
### Production
st2 key set runfolder.base.path '/storage/shared/raw/Baymax'
st2 key set bcl2fastq.output.base.path '/storage/shared/bcl2fastq_output'
st2 key set pipeline.data.base.path '/g/data/gx8/data/Pipeline'
st2 key set hpc.host 'raijin5.nci.org.au'
st2 key set hpc.user 'rg3930'
st2 key set slack.channel '#arteria-dev' #change once in production!

### Development
#st2 key set runfolder.base.path '/storage/shared/raw/Baymax_dev' #proposal
#st2 key set bcl2fastq.output.base.path '/storage/shared/bcl2fastq_output_dev' #proposal
#st2 key set pipeline.data.base.path '/data/cephfs/punim0010/data/Pipeline_dev' #proposal
#st2 key set hpc.host 'spartan.hpc.unimelb.edu.au'
#st2 key set hpc.host.user 'brainstorm'
#st2 key set slack.channel '#arteria-dev'

### Other/global (same for production and development)
st2 key set novastor.ssh.host '172.19.0.1'
st2 key set novastor.ssh.user 'limsadmin'
st2 key set novastor.ssh.port '2222'
st2 key set novastor.ssh.key.path '/home/stanley/.ssh/stanley_rsa'
st2 key set samplesheet.check.script '/opt/arteria/runfolder-samplesheet-check.py'
st2 key set bcl2fastq.run.script '/opt/arteria/run-bcl2fastq.sh'


##### define active sensors
st2 sensor enable arteria.IncomingSensor

##### define active rules
st2 rule enable umccr.umccr-runfolder-notify
st2 rule enable umccr.on_bcl2fastq_success
st2 rule enable umccr.on_bcl2fastq_failure
st2 rule enable umccr.action_notify_slack_forwarder
st2 rule enable pcgr.on_pcgr_s3_upload
st2 rule disable examples.notify_slack
st2 rule disable examples.sample_rule_file_watch
st2 rule disable examples.sample_rule_with_actiontrigger
st2 rule disable examples.sample_rule_with_webhook

##### define active actions/workflows
st2 action enable umccr.sync2hpc
st2 action enable umccr.bcl2fastq_start
st2 action enable umccr.samplesheet_check
st2 action enable umccr.novastor_incoming
