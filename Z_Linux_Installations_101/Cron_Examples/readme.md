* <https://jalcocert.github.io/Linux/docs/debian/useful_tools/#crontab-tasks>

* v1 - hardcoded repositories
* v2 - listed repositories

```sh
chmod +x /home/jalcocert/Desktop/GIT_SYNC/git_sync_v2.sh
/home/jalcocert/Desktop/GIT_SYNC/git_sync_v2.sh http://192.168.3.200:3033/fossengineer/FOSSENGINEER FOSSENGINEER http://192.168.3.200:3033/fossengineer/Py_Stocks Py_Stocks
```


@reboot /home/jalcocert/Desktop/GIT_SYNC/git_sync_v2.sh http://192.168.3.200:3033/fossengineer/BachataMeetv2-Astro BachataMeetv2-Astro http://192.168.3.200:3033/fossengineer/CyclingThere2 CyclingThere2 >> /home/jalcocert/Desktop/GIT_SYNC/git_sync_v2.log 2>&1
