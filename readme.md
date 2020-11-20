# Red Hat Actions - Spring Pet Clinic Sample

This is a fork of the [Spring Pet Clinic](https://github.com/spring-projects/spring-petclinic) which uses Red Hat's GitHub Actions to build an image and deploy it to OpenShift.

[The example workflow](./.github/workflows/e2e-petclinic-buildah.yml) uses the following Red Hat Actions:

- [buildah-action](https://github.com/redhat-actions/buildah-action)
- [push-to-registry](https://github.com/redhat-actions/push-to-registry)
- [oc-login](https://github.com/redhat-actions/oc-login)

It demos an end-to-end workflow which:
- Compiles a Java Spring web application
- Builds a container image
- Pushes that image to a registry
- Logs in to an OpenShift cluster
- Creates a Deployment, Service and Route to start a container and expose it to the internet
- Checks that the app is running successfully
- Tears down the test resources

## Try it yourself!

1. Fork this repository.
2. Enable actions on your fork by navigating to the Actions tab and allowing actions to run.
3. Replace the environment variable values in the workflow yaml with your own.
    - The environment variables you must edit are at the top of the workflow file.
    - Edit the REGISTRY_USER and TEST_REGISTRY to point to your container registry.
        - For example, if you want to push to Dockerhub as `john`:
            - Set `IMAGE_REGISTRY` to `docker.io`.
            - Set `REGISTRY_USER` to `john`.
            - The password is stored in a secret called `REGISTRY_PASSWORD` - see below.
    - Edit the `TEST_NAMESPACE` to the namespace you want the workflow to issue `oc` commands against. The namespace must exist before the workflow runs.
        - You can also remove the `TEST_NAMESPACE` and the workflow will use the default for your cluster user.
4. [Add the necessary secrets](https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) in your forked repository's Settings.
    - Create a secret called `REGISTRY_PASSWORD` which contains the password, encrypted password, or token for the `REGISTRY_USER` you set up above.
    - See the [oc-login Getting Started](https://github.com/redhat-actions/oc-login#getting-started-with-the-action-or-see-example) to determine the values for `OPENSHIFT_URL` and `OPENSHIFT_TOKEN`.
        - The easiest way to retrieve these, if you're already logged in locally:
            - `oc whoami --show-server` for the `OPENSHIFT_URL`.
            - `oc whoami --show-token` for the `OPENSHIFT_TOKEN`.
5. Commit your changes and push to your fork.
6. The workflow should run, create the petclinic, and delete it. Comment out the 'Clean up' step if you want it to stay deployed.
