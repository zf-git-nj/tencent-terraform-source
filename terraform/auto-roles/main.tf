#I hate this very much

#few tencent bug
#resource * not working, need to be array
#ccs removed

#Role needed to enable basic operations
resource "tencentcloud_cam_role" "my_TKE_QCSRole" {
  name          = "TKE_QCSRole"
  console_login = false
  description   = "The current role is the TKE service role, which will access your other service resources within the scope of the permissions of the associated policy."
  document      ="{\"version\":\"2.0\",\"statement\":[{\"action\":\"name/sts:AssumeRole\",\"effect\":\"allow\",\"principal\":{\"service\":\"ccs.qcloud.com\"}}]}"
}

resource "tencentcloud_cam_role" "my_TCR_QCSRole" {
  name          = "TCR_QCSRole"
  console_login = false
  description   = "TCR permissions (including but not limited to): COS (create bucket, read/write/delete/copy object, initiate multiple upload); VPC (query VPC and subnet)."
  document      = "{\"version\":\"2.0\",\"statement\":[{\"action\":\"name/sts:AssumeRole\",\"effect\":\"allow\",\"principal\":{\"service\":\"tcr.cloud.tencent.com\"}}]}"
}   

resource "tencentcloud_cam_role" "my_AS_QCSRole" {
  name          = "AS_QCSRole"
  console_login = false
  description   = "The current role is the AS service role, which will access your other service resources within the scope of the permissions of the associated policy."
  document      = "{\"version\":\"2.0\",\"statement\":[{\"action\":\"name/sts:AssumeRole\",\"effect\":\"allow\",\"principal\":{\"service\":\"as.cloud.tencent.com\"}}]}"
}

#Policies for roles
resource "tencentcloud_cam_policy" "my_TKE_QCSRole_QcloudAccessForTKERoleInOpsManagement" {
  name          = "my_TKE_QCSRole_QcloudAccessForTKERoleInOpsManagement"
  description   = "my downloaded policy file"
  document      = <<EOF
{
    "version": "2.0",
    "statement": [
        {
            "action": [
                "cls:listTopic",
                "cls:getTopic",
                "cls:createTopic",
                "cls:modifyTopic",
                "cls:deleteTopic",
                "cls:listLogset",
                "cls:getLogset",
                "cls:createLogset",
                "cls:modifyLogset",
                "cls:deleteLogset",
                "cls:listMachineGroup",
                "cls:getMachineGroup",
                "cls:createMachineGroup",
                "cls:modifyMachineGroup",
                "cls:deleteMachineGroup",
                "cls:getMachineStatus",
                "cls:pushLog",
                "cls:searchLog",
                "cls:downloadLog",
                "cls:getCursor",
                "cls:getIndex",
                "cls:modifyIndex",
                "cls:agentHeartBeat",
                "cls:CreateChart",
                "cls:ModifyChart",
                "cls:DeleteChart",
                "cls:CreateDashboard",
                "cls:ModifyDashboard",
                "cls:DeleteDashboard",
                "cls:GetChart",
                "cls:ListChart",
                "cls:ListDashboard",
                "cls:GetDashboard",
                "cls:getConfig",
                "cls:CreateConfig",
                "cls:DeleteConfig",
                "cls:ModifyConfig",
                "cls:DescribeConfigs",
                "cls:DescribeMachineGroupConfigs",
                "cls:DeleteConfigFromMachineGroup",
                "cls:ApplyConfigToMachineGroup",
                "cls:DescribeConfigMachineGroups",
                "cls:ModifyTopic",
                "cls:DeleteTopic",
                "cls:CreateTopic",
                "cls:DescribeTopics",
                "cls:CreateLogset",
                "cls:DeleteLogset",
                "cls:DescribeLogsets",
                "cls:CreateIndex",
                "cls:ModifyIndex",
                "cls:CreateMachineGroup",
                "cls:DeleteMachineGroup",
                "cls:DescribeMachineGroups",
                "cls:ModifyMachineGroup"
            ],
            "resource": ["*"],
            "effect": "allow"
        }
    ]
}
EOF
}

#removed 
#"ccs:DescribeCluster",
#"ccs:DescribeClusterInstances",
resource "tencentcloud_cam_policy" "my_TKE_QCSRole_QcloudAccessForTKERole" {
  name          = "my_TKE_QCSRole_QcloudAccessForTKERole"
  description   = "my downloaded policy file"
  document      = <<EOF
{
    "version": "2.0",
    "statement": [
        {
            "action": [
                "cvm:DescribeInstances",
                "tag:*",
                "clb:*",
                "cvm:*Cbs*",
                "cls:pushLog",
                "cls:searchLog",
                "cls:listLogset",
                "cls:getLogset",
                "cls:listTopic",
                "cls:getTopic",
                "cls:agentHeartBeat",
                "cls:getConfig",
                "vpc:DescribeSubnet",
                "vpc:DescribeSubnetEx",
                "vpc:DescribeCcnAttachedInstances",
                "cvm:AllocateAddresses",
                "cvm:DescribeAddresses",
                "vpc:DescribeNetworkInterfaces",
                "cvm:AssociateAddress",
                "cvm:DisassociateAddress",
                "cvm:ReleaseAddresses",
                "ssl:DescribeCertificateDetail",
                "ssl:UploadCertificate",
                "cvm:DescribeSnapshots",
                "cvm:CreateSnapshot",
                "cvm:DeleteSnapshot",
                "cvm:BindAutoSnapshotPolicy",
                "cvm:CreateSecurityGroupPolicy",
                "cvm:DeleteSecurityGroupPolicy",
                "cvm:DescribeSecurityGroupPolicys",
                "vpc:DetachNetworkInterface",
                "vpc:DeleteNetworkInterface",
                "monitor:DescribeStatisticData",
                "vpc:DescribeBandwidthPackages",
                "cam:ListMaskedSubAccounts",
                "cam:GetUserBasicInfo"
            ],
            "resource": ["*"],
            "effect": "allow"
        }
    ]
}
EOF
}

resource "tencentcloud_cam_policy" "my_TCR_QCSRole_QcloudAccessForTCRRole" {
  name          = "my_TCR_QCSRole_QcloudAccessForTCRRole"
  description   = "my downloaded policy file"
  document      = <<EOF
{
    "version": "2.0",
    "statement": [
        {
            "effect": "allow",
            "action": [
                "cos:GetService",
                "cos:PutBucket",
                "cos:GetBucket",
                "cos:HeadBucket",
                "cos:DeleteBucket",
                "cos:GetBucketObjectVersions",
                "cos:PutObject",
                "cos:PutObjectCopy",
                "cos:PostObject",
                "cos:GetObject",
                "cos:HeadObject",
                "cos:DeleteObject",
                "cos:DeleteMultipleObjects",
                "cos:OptionsObject",
                "cos:PostObjectRestore",
                "cos:PutObjectACL",
                "cos:GetObjectACL",
                "cos:InitiateMultipartUpload",
                "cos:UploadPart",
                "cos:UploadPartCopy",
                "cos:CompleteMultipartUpload",
                "cos:AbortMultipartUpload",
                "cos:ListMultipartUploads",
                "cos:ListParts",
                "vpc:DescribeVpcEx",
                "vpc:DescribeSubnetEx",
                "cos:DeleteBucketReplication",
                "cos:GetBucketReplication",
                "cos:PutBucketReplication",
                "cos:GetBucketVersioning",
                "cos:PutBucketVersioning",
                "cos:PutBucketTagging",
                "monitor:GetMonitorData"
            ],
            "resource": ["*"]
        }
    ]
}
EOF
}


resource "tencentcloud_cam_policy" "my_AS_QCSRole_QcloudAccessForASRole" {
  name          = "my_AS_QCSRole_QcloudAccessForASRole"
  description   = "my downloaded policy file"
  document      = <<EOF
{
    "version": "2.0",
    "statement": [
        {
            "effect": "allow",
            "action": [
                "cvm:RunInstances",
                "cvm:TerminateInstances",
                "cvm:StopInstances",
                "cvm:Describe*",
                "cvm:Inquiry*",
                "clb:*",
                "monitor:*",
                "vpc:Describe*",
                "cmqtopic:GetTopicAttributes",
                "cmqtopic:PublishMessage",
                "cmqtopic:BatchPublishMessage",
                "cmqtopic:ListTopic",
                "cmqqueue:GetQueueAttributes",
                "cmqqueue:SendMessage",
                "cmqqueue:BatchSendMessage",
                "cmqqueue:ListQueue"
            ],
            "resource": ["*"]
        }
    ]
}
EOF
}

#Policy attachment
resource "tencentcloud_cam_role_policy_attachment" "TKE_att1" {
  role_id   = tencentcloud_cam_role.my_TKE_QCSRole.id
  policy_id = tencentcloud_cam_policy.my_TKE_QCSRole_QcloudAccessForTKERoleInOpsManagement.id
}

resource "tencentcloud_cam_role_policy_attachment" "TKE_att2" {
  role_id   = tencentcloud_cam_role.my_TKE_QCSRole.id
  policy_id = tencentcloud_cam_policy.my_TKE_QCSRole_QcloudAccessForTKERole.id
}

resource "tencentcloud_cam_role_policy_attachment" "TCR_att" {
  role_id   = tencentcloud_cam_role.my_TCR_QCSRole.id
  policy_id = tencentcloud_cam_policy.my_TCR_QCSRole_QcloudAccessForTCRRole.id
}

resource "tencentcloud_cam_role_policy_attachment" "AS_att" {
  role_id   = tencentcloud_cam_role.my_AS_QCSRole.id
  policy_id = tencentcloud_cam_policy.my_AS_QCSRole_QcloudAccessForASRole.id
}