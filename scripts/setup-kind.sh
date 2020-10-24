# Check if the KUBECONFIG is not set
echo $KUBECONFIG
# Check if the .kube directory is created > if not, no need to create it
ls $HOME/.kube
# Create the cluster and give it a name (optional)
kind create cluster --name ${CLUSTER_NAME}
# Check if the .kube has been created and populated with files
ls $HOME/.kube