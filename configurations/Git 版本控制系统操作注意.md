## Git版本控制系统工作流程、操作介绍与注意事项



#### 服务器上常驻的分支有两个： `master` 和 `dev` （develop的简写）。可以这样认为，`master`代表的是生产环境，`dev`代表的是测试环境。


#### 也就是说：
1. `master`分支上的任何一个点检出都稳定的，可以部署到生产环境服务器； 
2. 而`dev`分支上每个点都可以检出部署，能启动运行，但是未经测试，还存在bug。


#### 要特别提出的是： 

_不要在`master`分支上面直接提交代码_   (**现在虽然还没有上线，但是尽量遵守约定哈**)



---

     
<br>
<br>
<br>

### 一、主要的工作流程有

1. 已发布版本（测试环境）bug处理 (**这个暂时不用看**)
1. 未发布版本（测试环境）bug处理
1. 新特性开发
1. 合并请求处理
 
---
#### 详细介绍如下：    

##### 1.已发布版本（测试环境）bug处理:从`master`分支检出，处理完成后双向合并到`master`和`dev`，检出的分支不提交到服务器。

    # 从master分支检出
    git checkout master # 切换到master分支
    git fetch && git rebase # 从服务器下载最新代码，如果本地有修改则合并上去。用 git pull --rebase 也可以，注意别用 git pull，会导致git网络图混乱
    git checkout -b hotfix-Issue#xxx 
    
    # 在{hotfix-Issue#xxx}分支上完成Bug处理，需要一次或多次 git commit
    
    # 合并到master和dev
    git checkout master
    git merge --no-ff ${hotfix-Issue#xxx}
    git push origin master
    git checkout dev
    git merge --no-ff ${hotfix-Issue#xxx}
    git push origin dev
    
    # 删除本地开发分支
    git branch -d ${hotfix-Issue#xxx}

##### 2.未发布版本bug处理：直接在`dev`分支上处理

    git checkout dev # 切换到dev分支
    git fetch && git rebase # 从服务器下载最新代码，并与本地修改合并（如果有）
    # 直接在develop分支上完成Bug处理，一次或多次 git commit
    git push origin dev # 把本地代码提交到服务器的dev分支
    

##### 3.新特性开发：从`dev`分支检出，开发完合并到`dev`分支，检出的新特性分支需要提交到服务器上，便于多人协作

    # 从dev分支检出
    git checkout dev
    git fetch && git rebase # 从服务器下载最新代码，并与本地修改合并（如果有）
    git checkout -b ${feature_name} develop # 分支名用小写英文单词，多个单词以短横线"-"分隔 

    # 提交新特性分支到服务器
    git push origin ${feature_name}

    # 在${feature_name}分支上开发，多次git commit和git push origin ${feature_name}

    #将完成的新特性提交到服务器
    git push origin ${feature_name} 

    # 在gitlab中创建一个pull request
    
##### 4.合并请求处理：主要指新特性开发完成后，合并到`dev`分支

    # 代码审核

    # 合并到dev分支
    git checkout dev
    git merge --no-ff ${feature_name}  

    # 提交dev到服务器，并删除新特性分支
    git push origin dev

    # 删除本地的分支
    git branch -d ${feature_name}
    # 删除服务器上的分支
    git push origin :${feature_name} 


#### 当然还会遇到一些其他情景 ^ @ ^

##### 1.比如，新功能开发时，如果遇到需要将`dev`上面代码合并到自己新功能分支上面的情况

    #首先检出服务器端最新代码
    git fetch origin

    #将最新的dev分支代码合并到新功能分支，这里需要处理冲突
    git rebase origin/dev

	#然后删掉远程仓库的该功能分支
	git push origin :${feature_name}

	#最后，将本地的新的新功能分支推到服务器
	git push origin ${feature_name}
	
##### 2.如果当前分支上有些修改未commit，但此时需要切换到别的分支上工作

	git stash save # 保持当前未提交的内容
	git checkout other_branch # 切换到别的分支工作
	git checkout origin_branch # 完成后切换会原分支
	git stash pop # 回复到未提交内容
	
	
##### 3.当执行 git merge --no-ff ${分支名} 的时候，Mac 用户控制台会跳出Vi编辑器，需在`#`后填写注释。
     
<br>
<br>
<br>

---

### 二、操作介绍

####  下面列出一些常用的命令（如果想学习使用git，可以参考廖雪峰的git教程)

	##检出代码
	git clone ${项目的url}   #下载代码
	git checkout develop  #切换到develop分支

	git status #查看工作区状态

	git add .   #添加到暂存区
	git commit -m "注释"  #将暂存区的代码提交到本地仓库

	git push origin develop  #将本地分支develop提交到服务器中

	git branch -a #查看所有分支

	git remote -v #查看服务器路径

	git branch -d ${feature} #删除本地分支

	git push origin :${feature} #删除服务器上的分支

	#合并分支：把B分支的代码合并到A分支上
	git checkout A  #首先切换到A分支
	git merge --no-ff B #合并

	#git stash 可用来暂存当前正在进行的工作
	git stash
	## do other work
	git stash pop
	
	git stash          # save uncommitted changes
	# pull, edit, etc.
	git stash list     # list stashed changes in this git
	git show stash@{0} # see the last stash 
	git stash pop      # apply last stash and remove it from the list

	git stash --help   # for more info
	
	
---


     
<br>
<br>
<br>


### 三、注意事项
1. _不要在`master`分支上面直接提交代码。_
2. _不要在`master`分支上面直接提交代码。_
3. _不要在`master`分支上面直接提交代码。_ （重要的事情说三遍)
    
    




 