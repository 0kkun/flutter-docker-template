# build時に使用するARGを定義している部分
ARG timezone
ARG web_server_port
ARG app_code_path_container

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=ja_JP.UTF-8
ENV LC_CTYPE=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:jp
ENV TZ $timezone
ENV WEB_SERVER_PORT $web_server_port
ENV APP_CODE_PATH_CONTAINER $app_code_path_container

# Ubuntu base setting (locale と timezone と デバッグによく使用するものを入れる)
RUN apt-get update \
    && apt-get -y -q install \
    # Lang ja
    language-pack-ja-base language-pack-ja apt-transport-https \
    # devtool
    vim netcat vim git curl wget zip unzip make sudo gcc libc-dev clang net-tools \
    xserver-xorg pkg-config libgtk-3-dev cmake ninja-build gnupg software-properties-common \
    && locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP.utf8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "${TZ}" > /etc/timezone \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# requisites software（Flutter関連で使用するものを入れる）
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && add-apt-repository ppa:maarten-fonville/android-studio
RUN apt-get update && \
    apt-get -y -q install \
    xz-utils libglu1-mesa openjdk-8-jdk google-chrome-stable android-studio \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#######################
# Install Android SDK #
#######################
WORKDIR /usr/local
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /usr/local/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
RUN cd Android/sdk/tools/bin && ./sdkmanager --install "cmdline-tools;latest"
ENV PATH=$PATH:/usr/local/Android/sdk/platform-tools

###################
# Install Dart    #
###################
ARG DART_VERSION=3.0.5
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && apt-get install -y --no-install-recommends tzdata && \
    apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates clang cmake curl file git libglu1-mesa libgtk-3-dev ninja-build pkg-config unzip xz-utils zip && \
    curl https://storage.googleapis.com/dart-archive/channels/stable/release/$DART_VERSION/sdk/dartsdk-linux-x64-release.zip -o /tmp/dart-sdk.zip && \
    unzip /tmp/dart-sdk.zip -d /usr/lib && rm /tmp/dart-sdk.zip

###################
# Install Flutter #
###################
ARG PATH=/usr/lib/dart-sdk/bin:$PATH
ARG PATH=/root/.pub-cache/bin:$PATH
ARG FLUTTER_VERSION=3.10.5
RUN dart pub global activate fvm --verbose && \
    fvm --version && \
    fvm doctor --verbose && \
    fvm install $FLUTTER_VERSION --verbose && \
    fvm use --force $FLUTTER_VERSION --verbose && \
    fvm flutter config --enable-web --enable-linux-desktop --enable-macos-desktop --enable-windows-desktop --enable-android --enable-ios --enable-fuchsia && \
    # 初回ビルドの時のみ
    # fvm flutter precache --verbose && \
    fvm flutter doctor --verbose

# Clean up
RUN apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Set paths
ENV FVM_ROOT=/root/.pub-cache
ENV PATH=$FVM_ROOT/bin:$PATH

EXPOSE ${WEB_SERVER_PORT}