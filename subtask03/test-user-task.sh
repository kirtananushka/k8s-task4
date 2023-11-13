#!/bin/bash

echo "Listing current pods in 'user-task' namespace:"
kubectl get pods -n=user-task
echo

POD_NAME=$(kubectl get pod -l app=alpine-user-service -n user-task -o jsonpath="{.items[0].metadata.name}")
echo "Current pod name: $POD_NAME"
echo

echo "Checking if the file exists in the pod, and deleting if it does:"
kubectl exec -it $POD_NAME -n user-task -- //bin/sh -c 'if [ -f //usr/share/alpine-data/file.txt ]; then rm //usr/share/alpine-data/file.txt; fi'
kubectl exec -it $POD_NAME -n user-task -- //bin/ls -l //usr/share/alpine-data/
echo

echo "Creating the file '/usr/share/alpine-data/file.txt' in pod $POD_NAME with the current date and time..."
kubectl exec -it $POD_NAME -n user-task -- //bin/sh -c 'echo "Test file created at $(date)" > //usr/share/alpine-data/file.txt'
echo

echo "Listing contents of /usr/share/alpine-data/ after file creation:"
kubectl exec -it $POD_NAME -n user-task -- //bin/ls -l //usr/share/alpine-data/
echo

echo "Contents of the created file:"
kubectl exec -it $POD_NAME -n user-task -- cat //usr/share/alpine-data/file.txt
echo


echo "Deleting pod \"$POD_NAME\"..."
kubectl delete pod $POD_NAME -n user-task
echo

echo "Listing pods in 'user-task' namespace after deletion:"
kubectl get pods -n user-task
echo

NEW_POD_NAME=$(kubectl get pod -l app=alpine-user-service -n user-task -o jsonpath="{.items[0].metadata.name}")
echo "New pod name: $NEW_POD_NAME"
echo

echo "Checking if the file exists in the new pod $NEW_POD_NAME..."
kubectl exec -it $NEW_POD_NAME -n user-task -- //bin/ls -l //usr/share/alpine-data/
echo

echo "Contents of the file in the new pod:"
kubectl exec -it $NEW_POD_NAME -n user-task -- cat //usr/share/alpine-data/file.txt
echo