## LineageOS 15.1 for the BQ Aquaris M8 (aquaris_m8)

An unofficial port of LineageOS 15.1 for the BQ Aquaris M8. This project is currently a work in progress.

### Building

The build process is quite long and requires fair knowledge of Linux and its command line.

#### 1. Install Google's repo tool

```bash
# Add binary folder
mkdir -p ~/bin
# Add folder to path
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
source ~/.profile
```

Further reading: https://source.android.com/setup/build/downloading

#### 2. Download the Lineage OS 15.1 source code

You may have to restart your shell after Step 1 to refresh the PATH variable.

*Please note that this can take a very long time. At around 3 MB/s, it can take upwards of 1 hour!*

```bash
# Create soruce directory and cd into it
mkdir -p ~/android/lineage
cd <folder to contain source>
# Initialise repo tool
repo init -u git://github.com/LineageOS/android.git -b lineage-15.2
repo sync
```

#### 3. Clone BQ device repositories

```bash
git clone https://github.com/mt8163/android_device_bq_aquaris_m8 -b lineage-15.1 device/bq/aquaris_m8
git clone https://github.com/mt8163/android_vendor_bq_aquaris_m8 -b lineage-15.1 vendor/bq/aquaris_m8
```

**Ensure you have `adb` and `fastboot` installed and in your path before continuing!**
Learn how to do this here: https://wiki.lineageos.org/devices/bacon/build#build-lineageos-and-lineageos-recovery

```bash
# Ubuntu 16.04 and newer
apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev

# Older than Ubuntu 16.04
apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk2.8-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev

# For can build for aquaris_m8 you have to make this
mkdir out && mkdir out/target && mkdir out/target/product && mkdir out/target/product/aquaris_m8
mv device/bq/aquaris_m8/prebuilt/kernel out/target/product/aquaris_m8


# All versions
croot
source ./build/envsetup.sh
brunch lineage_aquaris_m8-userdebug (eng for debug)
```

### Improving build times

To speed up subsequent builds, you can enable ccache support. You can do this by running this command before each build:
```bash
export USE_CCACHE=1
```
You can also add this line to your `~/.bashrc` file. After, you need to specify the maximum disk space ccache can use:
```bash
# 25 GB
ccache -M 25G
# 50 GB (recommended)
ccache -M 50G
# 75 GB
ccache -M 75G
```
> This needs to be run once. Anywhere from 25GB-100GB will result in very noticeably increased build speeds (for instance, a typical 1hr build time can be reduced to 20min). **If you’re only building for one device, 25GB-50GB is fine.** If you plan to build for several devices that do not share the same kernel source, aim for 75GB-100GB. This space will be permanently occupied on your drive, so take this into consideration.
>
> [*From Lineage OS Wiki*](https://wiki.lineageos.org/devices/bacon/build#turn-on-caching-to-speed-up-build)
