### Static website generator <gohugo.io>

By static, we refer to webs created with:
* html
* css
* js

Available themes <https://themes.gohugo.io/>

#### Windows
Download the binary files.
Edit the system environment variables.
Add to user variables -> C:\Users\reisi w10\Desktop\GH\hugo\
Use the path to the folder containing the .exe


#### Ubuntu

```
apt-get update -y

#https://github.com/gohugoio/hugo/releases #choose and adapt the link below
wget https://github.com/gohugoio/hugo/releases/download/v0.87.0/hugo_0.87.0_Linux-64bit.deb
sudo dpkg -i hugo_0.87.0_Linux-64bit.deb #extract and install
#apt-get install -f #if dependency errors
hugo version 
```


hugo new site fossengineer.com #the content will be generated in a new folder with the name of your chosen domain
ls fossengineer.com #one of the folder is for the themes

```
#https://themes.gohugo.io/themes/hugo-papermod/ #mind the minimal hugo version required to run the theme that you like
#https://github.com/adityatelange/hugo-PaperMod/wiki/Installation
git clone https://github.com/adityatelange/hugo-PaperMod ./fossengineer.com/themes/PaperMod --depth=1
#https://github.com/adityatelange/hugo-PaperMod/wiki/Installation 
#to activate the theme, we have to edit the config.yml
sudo nano ./fossengineer.com/config.toml
```

```
baseURL= "/"
ageCode = "en-us"
title = "Demo fossengineer"
theme= "PaperMod"
```

```
hugo server #opens a development server, compiling in real time the changes #you need to be in the folder where the config.yml file is located
#localhost:1313 in your browser
```

### content folder - where your post, pages, articles will be hosted

```
sudo mkdir ./content/posts
sudo hugo new ./content/posts/first.md 
sudo nano ./content/posts/first.md #it already contains some information -> CHANGE DRAFT TO FALSE TO DISPLAY IT
#posts are written in markdown, review the syntax: <https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax>

hugo server
```

### layouts - usually the themes overwrite this one

```
#static - for images for example
sudo mkdir ./static/post1_content #put your images here
sudo cp ~/lambda.png ./static/post1_content/lambda.png
```

Then, you can adapt the post config file to read from that path:

```
sudo hugo new ./content/posts/second.md 
sudo nano ./content/posts/second.md 
```

```
---
title: "Second"
date: 2022-10-23T15:44:13+02:00
draft: false
cover:
    image: post1_content/lambda.png
    alt: "this is a post image"
    caption: "and this is the caption"
---
```

```
hugo server #check the changes
```

### How to further customize the config file:


#### If you want a *Menu*, you need to add to the config file:

- YML files:
menu:
  main:
    - identifier= "categories"
      name= "Categories"
      url= "/categories/"
      weight= 10
    - identifier= "tags"
      name= "Tags"
      url= "/tags/"
      weight= 20

- .TOML files (Thanks https://github.com/digitalocean/sample-hugo/blob/main/config.toml):

[menu]
  [[menu.main]]
    identifier = "categories"
    name = "categories"
    url = "/categories/"
    weight = 1
  [[menu.main]]
    identifier = "tags"
    name = "tags"
    url = "/tags/"
    weight = 10

And in the post you can do now:

---
title: "Second"
date: 2022-10-23T15:44:13+02:00
draft: false
cover:
    image: post1_content/lambda.png
    alt: "this is a post image"
    caption: "and this is the caption"
tags: ["Self-Hosting", "R", "Porco"]
categories: ["Tech"]
---


#### If you want to add share *social icons*, add to the config file:

- In yml:
```
params:
  ShowShareButtons: true
```


- In .toml:

```
[params]
  ShowShareButtons: "true"
```
