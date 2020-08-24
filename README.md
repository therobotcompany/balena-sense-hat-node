Forked from https://github.com/balena-io-playground/sense-hat-base-application
    - There are new commits to merge

**NOTE 1:** *This application communicates with the Sense Hat using the NodeJS library `node-sense-hat`*

**NOTE 2:** *It only works with `resin/raspberrypi3-node-6`*
   - It works with base image `resin/raspberrypi3-node-6`, but not with `...-node-8`
   - It doesn't work with `balenalib/raspberrypi3-node-6,10,12`
   - It doesn't work with `balenalib/raspberrypi3-debian-node-12`
   - POSSIBLE CAUSES:
        - NO: npm `nodeimu` requires `node-gyp@6.1.0`
        - TESTING: Outdated version of npm

Current Python error with `balenalib/%%BALENA_MACHINE_NAME%%-node:10`:
```
[main]     gyp ERR! find Python
[main]     gyp ERR! find Python Python is not set from command line or npm configuration
[main]     gyp ERR! find Python Python is not set from environment variable PYTHON
[main]     gyp ERR! find Python checking if "python" can be used
[main]     gyp ERR! find Python - "python" is not in PATH or produced an error
[main]     gyp ERR! find Python checking if "python2" can be used
[main]     gyp ERR! find Python - "python2" is not in PATH or produced an error
[main]     gyp ERR! find Python checking if "python3" can be used
[main]     gyp ERR! find Python - "python3" is not in PATH or produced an error
[main]     gyp ERR! find Python
[main]     gyp ERR! find Python **********************************************************
[main]     gyp ERR! find Python You need to install the latest version of Python.
[main]     gyp ERR! find Python Node-gyp should be able to find and use Python. If not,
[main]     gyp ERR! find Python you can try one of the following options:
[main]     gyp ERR! find Python - Use the switch --python="/path/to/pythonexecutable"
[main]     gyp ERR! find Python   (accepted by both node-gyp and npm)
[main]     gyp ERR! find Python - Set the environment variable PYTHON
[main]     gyp ERR! find Python - Set the npm configuration variable python:
[main]     gyp ERR! find Python   npm config set python "/path/to/pythonexecutable"
[main]     gyp ERR! find Python For more information consult the documentation at:
[main]     gyp ERR! find Python https://github.com/nodejs/node-gyp#installation
[main]     gyp ERR! find Python **********************************************************
[main]     gyp ERR! find Python
[main]     gyp ERR! configure error
[main]     gyp ERR! stack Error: Could not find any Python installation to use
[main]     gyp ERR! stack     at PythonFinder.fail (/usr/local/lib/node_modules/npm/node_modules/node-gyp/lib/find-python.js:307:47)
[main]     gyp ERR! stack     at PythonFinder.runChecks (/usr/local/lib/node_modules/npm/node_modules/node-gyp/lib/find-python.js:136:21)
[main]     gyp ERR! stack     at PythonFinder.<anonymous> (/usr/local/lib/node_modules/npm/node_modules/node-gyp/lib/find-python.js:179:16)
[main]     gyp ERR! stack     at PythonFinder.execFileCallback (/usr/local/lib/node_modules/npm/node_modules/node-gyp/lib/find-python.js:271:16)
[main]     gyp ERR! stack     at exithandler (child_process.js:301:5)
[main]     gyp ERR! stack     at ChildProcess.errorhandler (child_process.js:313:5)
[main]     gyp ERR! stack     at ChildProcess.emit (events.js:198:13)
[main]     gyp ERR! stack     at Process.ChildProcess._handle.onexit (internal/child_process.js:246:12)
[main]     gyp ERR! stack     at onErrorNT (internal/child_process.js:415:16)
[main]     gyp ERR! stack     at process._tickCallback (internal/process/next_tick.js:63:19)
[main]     gyp ERR! System Linux 4.15.0-45-generic
[main]     gyp ERR! command "/usr/local/bin/node" "/usr/local/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js" "rebuild"
[main]     gyp ERR! cwd /usr/src/app/node_modules/ioctl
[main]     gyp ERR! node -v v10.22.0
[main]     gyp ERR! node-gyp -v v5.1.0
[main]     gyp ERR! not ok
```

```app.js```: start script -> playing with a ball using the Sense Hat joystick
```pixel.js``` : sample test, coloring a pixel of the led matrix


Using the Sense HAT in resin.io
===============================

Start by downloading [Etcher](https://etcher.io).  You will use Etcher to write resinOS to an SD card to boot your Raspberry Pi.

You will follow the [getting started guide](https://docs.resin.io/raspberrypi3/nodejs/getting-started/) for the beginning of this project up through the "Deploying code" section.  Specifically,
- [set up an SSH key](https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-an-ssh-key)
- [create an application](https://docs.resin.io/raspberrypi3/nodejs/getting-started/#creating-an-application)
- [Add your first device](https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device) (download resinOS)
- using Etcher, [create a bootable SD card](https://docs.resin.io/raspberrypi3/nodejs/getting-started/#create-a-bootable-sd-card)
- [set up your device](https://docs.resin.io/raspberrypi3/nodejs/getting-started/#setting-up-your-device)

If you haven't cloned this git repository (i.e. you're reading these instructions on GitHub), do that now by typing this into a terminal:

```
git clone https://github.com/resin-io-projects/sense-hat-base-application
```

Once the repo is cloned, you’ll change directory into the newly created *sense-hat-base-application* directory:

```
cd sense-hat-base-application
```

Next you'll connect your local copy of the application to resin by running the command shown in the top-right corner of your application page. You can use the clipboard button to copy this line from the resin.io dashboard page.  (Be sure to copy the `git remote add` line from the top right corner of your application page rather than from here -- it will include your username and application name!)
![resin.io dashboard](https://user-images.githubusercontent.com/3144447/31838605-8c47e538-b5ab-11e7-9475-aee6978a1776.png)

It looks like this:
```
git remote add resin <USERNAME>@git.resin.io:<USERNAME>/<APPNAME>.git
```

So now you have set up a reference in your local git repository (the one on your development computer) to the resin.io application remote repository. So when you push new changes to this remote repository it will get compiled and built on the resin.io servers and deployed to every device in the application fleet.

Now to deploy this code to all device(s) in the application just run the command:

```
git push resin master
```

You may see a warning that says
>The authenticity of host ‘git.resin.io (54.165.162.194)’ can’t be established.
ECDSA key fingerprint is SHA256:NfwmqnKId5cx1RWpebbEuuM87bCJbdyhzRnqFES9Nnw.
Are you sure you want to continue connecting (yes/no)?

Type `yes` and hit return to accept. Your machine is asking you to verify the SSH host. You should only see this the first time you connect to resin.

It should only take about two minutes to build your code (and subsequent builds will be quicker because of caching). You'll know your code has been successfully compiled and built when our friendly unicorn mascot appears in your terminal:

![unicorn](https://user-images.githubusercontent.com/3144447/31838641-b8fca76c-b5ab-11e7-92ee-dd49a0652bac.png)

This means your code is safely built and stored on our image registry.

Your application will now be downloaded and executed by the device you have connected in your application fleet. This may take a few minutes, and you can watch the status of the download in your application dashboard.  Optionally, you can speed this up for subsequent builds using resin.io's [container deltas](https://docs.resin.io/runtime/delta/) if you want!

You’ll know the code is deployed when the device changes from "Downloading" to "Online" in the dashboard, and you’ll know it’s running on the device when one of the LEDs on the Sense HAT lights up. You'll be able to move the light with the Sense HAT joystick.

### Ready to go beyond a single lit LED?
The Sense HAT measures temperature, humidity, pressure, and orientation, which you can show on the LED matrix. You can find more ideas of what to do with the HAT in [this library](https://github.com/resin-io-playground/node-sense-hat).

You can also use the Sense HAT in other languages, such as [Python](http://pythonhosted.org/sense-hat/).
