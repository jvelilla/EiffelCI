# Eiffel CI Tutorial: Getting Started

We know that we need to test our applications thoroughly to catch problems before they affect our users. Eiffel Developers has the advantages of Design by Contract, but we also need to double check our code. Forgetting to test can result in complications, endless debugging session, money, etc, but remembering to run test cases before each commit, pull-request or merge can be can be difficult if you have to do it manually.

## Continuous Integration
Continuous Integration, often abbreviated to just CI, is the process of automatically building and running tests whenever a change is committed.
In this tutorial we will cover [Travis.CI](http://travis.ci/) 

	Note:
	You need to sign up for a GitHub account if you do not already have one.
	
## Getting-Started with Travis CI

### What is Travis CI?
It's a Continuous Integration service that is free for open-source projects and has a monthly fee for closed-source projects based on how many simultaneous builds you want to run.

## What does it do?
Travis sets up hooks with GitHub to automatically run tests at specified times. By default, these are set up to run after a pull request is created or when code is pushed up to GitHub.

In this tutorial, we will use a public GitHub repo and the free version of Travis to set up tests that run every time you try to merge new changes into the repository.

* Go to GitHub and fork the [EiffelCI](https://github.com/jvelilla/EiffelCI) example
* [Sign in](https://travis-ci.org/auth) to [Travis CI](travis-ci.org) with your GitHub account, [accepting the GitHub access permissions confirmation](https://docs.travis-ci.com/user/github-oauth-scopes).
* Once you’re signed in,Travis synchronized your repositories from GitHub, go to your profile page and enable Travis CI builds for your fork of the EiffelCI  repository.  Take a look at _.travis.yml_, the file which tells Travis CI what to do: 
```
language: eiffel
before_script:
  - export current_dir=$PWD ; echo current_dir=$current_dir ; cd ..
  - export ISE_EIFFEL=$PWD/Eiffel_17.11; 
  - export ISE_PLATFORM=linux-x86-64
  - curl -sSL https://ftp.eiffel.com/pub/beta/nightly/Eiffel_17.11_gpl_100608-linux-x86-64.tar.bz2 | tar -x --bzip2
  - export PATH=$PATH:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin:$PATH:$ISE_EIFFEL/tools/spec/$ISE_PLATFORM/bin
  - echo `ec -version`
  - cd $current_dir
script: 
  #compile code
  - compile_all -ecb -melt -list_failures -log_verbose -clean -options dotnet=false
````
In this file we tell Travis-CI we are using `Eiffel`, since Eiffel is not supported by default before to run the script we download the EiffelStudio compiler, install it and then we compile the code

* Edit the file `Application.e`  for example: id: STRING, commit and push, to trigger a Travis CI build 
```
>git commit -m 'Testing Eiffel with Travis CI'
>git push
```

	Note: Travis only runs a build on the commits you push after adding the repository to Travis.

* Fix the code by making sure that  variable  ‘id’ of type STRING’ is properly set. commit and push to GitHub. This time, the build does not fail.

That’s basically a simple configuration, now you know how to add a GitHub repository to Travis and learnt the basics of configuring builds and testing code for your `Eiffel` projects.
