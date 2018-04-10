#!/bin/bash

##### set data store key-value pairs

### pipeline configuration
# general
st2 key set slack.channel '#biobots'
# st2 key set slack.channel '#arteria-dev'

# HPC (SPARTAN)
st2 key set hpc.id 'SPARTAN'
st2 key set hpc.host 'spartan.hpc.unimelb.edu.au'
st2 key set hpc.copy.host 'spartan.hpc.unimelb.edu.au'
st2 key set hpc.user 'brainstorm'
st2 key set hpc.copy.user 'brainstorm'
st2 key set pipeline.data.base.path '/data/cephfs/punim0010/data/Pipeline/dev'
# # HPC (NCI)
# st2 key set hpc.id 'NCI'
# st2 key set hpc.host 'raijin5.nci.org.au'
# st2 key set hpc.copy.host 'r-dm.nci.org.au'
# st2 key set hpc.user 'rg3930'
# st2 key set hpc.copy.user 'rg3930'
# st2 key set pipeline.data.base.path '/g/data/gx8/data/Pipeline/dev'

# novastor general
st2 key set novastor.ssh.host '172.19.0.1'
st2 key set novastor.ssh.user 'limsadmin'
st2 key set novastor.ssh.port 2222
st2 key set novastor.ssh.key.path '/home/stanley/.ssh/stanley_rsa'
# novastor production
st2 key set runfolder.base.path '/storage/shared/raw/Baymax'
st2 key set bcl2fastq.output.base.path '/storage/shared/bcl2fastq_output'
st2 key set samplesheet.check.script '/opt/Pipeline/prod/scripts/runfolder-samplesheet-check.py'
st2 key set bcl2fastq.run.script '/opt/Pipeline/prod/scripts/run-bcl2fastq.sh'
st2 key set checksum.script '/opt/Pipeline/prod/scripts/create-checksums.sh'
st2 key set rsync.script '/opt/Pipeline/prod/scripts/rsync-to-hpc.sh'
# # novastor development
# st2 key set runfolder.base.path '/storage/shared/dev/Baymax'
# st2 key set bcl2fastq.output.base.path '/storage/shared/dev/bcl2fastq_output'
# st2 key set samplesheet.check.script '/opt/Pipeline/dev/scripts/runfolder-samplesheet-check.py'
# st2 key set bcl2fastq.run.script '/opt/Pipeline/dev/scripts/run-bcl2fastq.sh'
# st2 key set checksum.script '/opt/Pipeline/dev/scripts/create-checksums.sh'
# st2 key set rsync.script '/opt/Pipeline/dev/scripts/rsync-to-hpc.sh'



##### define active sensors
st2 sensor enable arteria.IncomingSensor
st2 sensor disable examples.EchoFlaskSensor
st2 sensor disable examples.FibonacciSensor
st2 sensor disable examples.SamplePollingSensor
st2 sensor disable examples.SampleSensor

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
st2 action enable umccr.bcl2fastq_checksums
st2 action enable umccr.bcl2fastq_start
st2 action enable umccr.incoming_wf
st2 action enable umccr.ready_link
st2 action enable umccr.rsync2hpc
st2 action enable umccr.runfolder_checksums
st2 action enable umccr.samplesheet_check
