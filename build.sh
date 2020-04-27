#!/bin/bash
# env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bazel build //src:bazel
export BAZEL_JAVAC_OPT="-J-Xmx2g "
export JAVAC_OPT="-Xmx2g "
export JAVA_OPT="-Xmx2g "
# AARCH64
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" BASEL_JAVAC_OPT="-J-Xms512m -J-Xmx2g" BASEL_JAVA_OPT="-J-Xms512m -J-Xmx2g" nice bazel --host_jvm_args="-Xmx2g" build --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --copt="-D RASPBERRY_PI=1" --copt="-I/usr/include" --copt="-D PLATFORM_POSIX=1" --linkopt="-latomic" --host_linkopt="-latomic" --config=noaws --config=nohdfs --local_resources 1024,1.0,1.0 --verbose_failures --host_javabase=@local_jdk//:jdk --config=v1 //tensorflow/tools/pip_package:build_pip_package
# env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" BASEL_JAVAC_OPT="-J-Xms512m -J-Xmx2g" BASEL_JAVA_OPT="-J-Xms512m -J-Xmx2g" nice bazel --host_jvm_args="-Xmx2g" build --copt="-funsafe-math-optimizations" --copt="-ftree-vectorize" --copt="-fomit-frame-pointer" --copt="-D RASPBERRY_PI=1" --copt="--sysroot=/home/ivan/projects/web/tensorflow/arm64-sysroot"  --cpu=arm64-v8a --fat_apk_cpu=arm64-v8a --copt="-D PLATFORM_POSIX=1" --linkopt="-latomic" --host_linkopt="-latomic" --config=noaws --config=nohdfs --local_resources 1024,1.0,1.0 --verbose_failures --host_javabase=@local_jdk//:jdk --config=v1 //tensorflow/tools/pip_package:build_pip_package //tensorflow:linux_aarch64
#--crosstool_top=//tools/arm_compiler:toolchain --cpu=armeabi-v7a
#--platforms=//:linux_aarch64

# PIP PACKAGE AFTER ALL
# ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
