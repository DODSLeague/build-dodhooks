# escape=`

FROM debian:bullseye-slim AS builder
ARG SMVERSION=1.10
ARG MMVERSION=1.10
ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified

LABEL com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://dodsleague.eu" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="DODSLeague" `
      org.label-schema.description="DODSLeague dodhooks build container" `
      org.label-schema.vcs-url="https://github.com/DODSLeague/build-dodhooks"


RUN apt-get update && apt-get install -y `
    wget git python3 gcc-multilib g++-multilib python3-pip &&`
    apt-get clean &&`
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*;

WORKDIR /WORKDIR

RUN git clone https://github.com/alliedmodders/ambuild && git clone -b $SMVERSION-dev --recurse-submodules https://github.com/alliedmodders/sourcemod.git
RUN pip install ./ambuild && ./sourcemod/tools/checkout-deps.sh && rm -rf hl2sdk-csgo && rm -rf hl2sdk-nucleardawn && rm -rf hl2sdk-l4d2 && rm -rf hl2sdk-l4d && rm -rf hl2sdk-css && rm -rf hl2sdk-tf2 && rm -rf hl2sdk-insurgency && rm -rf hl2sdk-sdk2013 && rm -rf hl2sdk-doi && rm -rf hl2sdk-orangebox && rm -rf hl2sdk-blade && rm -rf hl2sdk-episode1 && rm -rf hl2sdk-bms

COPY /dist /app


VOLUME /WORKDIR/dodhooks


RUN chmod +x /app/linux/*.sh;


CMD ["/app/linux/buildscript.sh"]
