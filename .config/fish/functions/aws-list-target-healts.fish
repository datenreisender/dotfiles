function aws-list-target-healts
	aws elbv2 describe-target-groups \
    | jq --raw-output '.TargetGroups[].TargetGroupArn' \
    | while read arn
        echo $arn
        aws elbv2 describe-target-health --target-group-arn $arn | jq .TargetHealthDescriptions[].TargetHealth.State
      end
end
