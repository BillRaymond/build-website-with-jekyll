# Build website with Jekyll
This is a GitHub Action (workflow) that builds a Jekyll site without the need for using the limited GitHub Pages build. You can use custom themes and plugins.

## Purpose
If you are using GitHub Pages, then you are probably pointing to the main branch or gh-pages. When you make a change, GitHub Pages rebuilds your site for you.

Unfortunately, GitHub Pages has some limitations. I suggest you start reading [hear](https://docs.github.com/en/free-pro-team@latest/github/working-with-github-pages/about-github-pages).

What this action does is create a CI/CD pipeline where you edit the Jekyll code in one branch, then run a GitHub Action (workflow) that builds the site -- even with unsupported GitHub Pages components -- and then places the newly built site in another branch of your repo.

By default, my code is built on the main branch and then copies over to another branch called gh-pages. The workflow also tells GitHub to avoid re-building the site, so it is not built twice.

## Installation
0. Go to GitHub settings and create a personal access token (PAT). As of this writing, the steps are Settings->Developer Settings->Personal Access Tokens->Generate New Token. For the _note_, just type something like `build-website-with-jekyll` and select the _repo_ option, which will automatically select all the sub-items under _repo_. Generate the token and that is all you need to do to move on to the next step (no need to copy the token details unless you want to).
1. Create a Jekyll site and make sure you sync it with GitHub as a repo.
2. Create a .github folder at the root of your repo on the main (master) branch.
3. Create a workflows subfolder under the .github folder.
4. Copy the contents of the .github/workflows folder in the main branch of this repo to your repo.
5. Rename the file `build-website-with-jekyll.rename-to-yml` to `build-website-with-jekyll.yml`.
6. Copy `dockerfile` and `entrypoint.sh` to the root of your repo's main branch.
7. Create a new branch that will be the place for your live website. In my case, it is gh-pages, but as of this writing, it can be any branch name. Configure the settings of your repo to point GitHub Pages to that branch.
7. Edit the `env` elements in the `build-website-with-jekyll.yml` file. If you are using a custom domain, uncomment the CNAME and add that (it should match how you set up GitHub Pages).
8. Commit all your changes and if developing locally, sync the changes back up to GitHub.
9. The workflow uses a CRON job that builds during certain times. If you want to change that, go to the `build-website-with-jekyll.yml` file and modify it there. If you do not know what to type, I recommend starting with [crontab guru's Examples page](https://crontab.guru/examples.html) to get started.


## About the workflow code
I did not write this code. It was written for me by a very nice developer I found on Fiverr, so please use him for your GitHub Actions (workflow) needs. He is great.

Check out [Cyberjumper's profile here](https://www.fiverr.com/cyberjumper).

That said, I am happy to accept pull requests and issues if needed. I am not a professional at GitHub Actions, so keep in mind I may or may not be that helpful. I am mostly keeping this code up so others can use it.

## License (or lack thereof)
This code has no license, so just use it as you see fit. I would appreciate it if you link back to [me](https://github.com/BillRaymond)] (I wrote the spec and tested) and [Cyberjumper](https://www.fiverr.com/cyberjumper) because he wrote the code.

## Don't know Jekyll or GitHub pages?
You will need a Jekyll site. For instructions on how to do that, check out my [YouTube Playlist](https://www.youtube.com/playlist?list=PLWzwUIYZpnJuT0sH4BN56P5oWTdHJiTNq) (please subscribe and comment if you like what you see).

Or, just start here and work your way through 

<iframe width="560" height="315" src="https://www.youtube.com/embed/EvYs1idcGnM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
