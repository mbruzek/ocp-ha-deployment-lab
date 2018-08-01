#/bin/bash
set -x
echo "4. Create a HorizontalPodAutoscaler for the hello-openshift deployment."
oc autoscale dc/hello-openshift --min 1 --max 5 --cpu-percent=80
echo "5. List the status of the autoscaler."
oc get horizontalpodautoscalers
echo "6. Review the autoscaler information."
oc describe hpa/hello-openshift -n test-hpa
echo "7. Fix the error by rolling out the latest deployment configuration."
oc rollout latest hello-openshift -n test-hpa
