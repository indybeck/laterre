docker run --name linkerd -p 9990:9990 -v $PWD/linkerd.yaml:/config.yaml buoyantio/linkerd:0.9.1 /config.yaml
