The workflow build-website-with-jekyll.yml is used to generated a website with jekyll.

Installation instructions:

1. Add a personal access token for your account and set it as a secret to your new repository. (https://www.youtube.com/watch?v=mBLMAFw3Fqw)
2. Use the environment variables in the file build-website-with-jekyll.yml for configuration.
3. Put the file build-website-with-jekyll.yml to the folder .github/workflows.
4. Put the files Dockerfile and entrypoint.sh to the root directory of your repository.
5. Configure GitHub Pages of your repository to use the branch gh-pages.