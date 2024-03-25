function kubeconf -a ENV REGION CLUSTER;
    if test -n "$ENV"
        and test -n "$REGION"
        and test -n "$CLUSTER"
        set -l CONF_PATH "$HOME/.kube/configs/$ENV/$REGION/$CLUSTER"
        mkdir -p $CONF_PATH
        echo "$CONF_PATH/config"
    else
        echo "Usage: kubeconf ENV REGION CLUSTER"
    end

    end;
