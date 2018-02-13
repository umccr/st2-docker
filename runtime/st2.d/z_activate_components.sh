#!/bin/bash

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
