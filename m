Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24104416
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 19:01:45 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id ot12so5975124ejb.1
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Oct 2022 12:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqWLroX/XqkgzeOrlJN1iOfF6saezPXoUff4VZqP+Sw=;
        b=ZFG2fqviYEaCgu+r4KArp/M17GkBncIAhVOHR++KJzTQrmq3+k0gr5bkPRmcDTCqbH
         MTnSiysyn3P+Edfktnyp5ACx7eZfFXKySeucz6Bvkfwr8kr6GS41TieFf3ed3mnhkVzp
         +hvSR1eUNYmn9EGQyCEqSOAbkZrNi+FrudW3Lb24eiKDUhNc8vX4e5yFy/BdGa8746Up
         mCzBoFE5qaiMY1mWFU+PlqJmcMKxx/nPwpdOtLh0xCFD98/A7YVtmikAvNnx+OoB/SHa
         HbxPelr8VOdiLMN2P0dJBORSxUIHs9YLh94bWViKs6UbphgpMSytLcLNf/igpJM0WluD
         mAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqWLroX/XqkgzeOrlJN1iOfF6saezPXoUff4VZqP+Sw=;
        b=FsywcJaFCPLMs3FBOjr+cX2eYmRQheuqlZCrIVZsLByO1TxvBaciiuolHOeLJ3qOTf
         T1/+nt24egpSXq+Rn9cyU9Xqu46csP9y7ALrhnFs9WxgjWfxsefIl7ZHE+KU7vWIbVYp
         AIh6mZD2xQuuB3KqXY+Tv8Zg1tGiZwVU9aWezeLsbIHyKobBKv3ZsL99tTcfJ37i9Q4j
         8X8GgaXROzs/5caL1K9rLyJ+xWEvYQV+trT62yxbJTk7R5dUValbnQuxoGZ4da9AKMKs
         +QiTLRBj+y28SIf0gqx5AN2WNU0PALGBT2iFzZ4udj3JDawtoaQBjElxKNy1ChucXjmu
         OA7Q==
X-Gm-Message-State: ACrzQf3Wh6AE5WifCsyUFajydo4sRU+r8NJitOoVhqo7VfFcE/D26kXu
	h2a3EQO+r+qh3f/YqdV+d8qBTGmXyaRlKfS9
X-Google-Smtp-Source: AMsMyM5R8UKxO3EMF5J5VV5c9/S+TazIBOSR+J3U14Wb//78s5PhGsnVdK+/1IPSPevt97yOoBTxSw==
X-Received: by 2002:a17:907:daa:b0:78d:9bc9:7d7a with SMTP id go42-20020a1709070daa00b0078d9bc97d7amr842284ejc.567.1665687704090;
        Thu, 13 Oct 2022 12:01:44 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id hx15-20020a170906846f00b0074134543f82sm272620ejc.90.2022.10.13.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:01:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Samuel Holland <samuel@sholland.org>, Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>
Subject: Re: Re: [PATCH 0/2] sunxi: update devicetree files from the kernel
Date: Thu, 13 Oct 2022 21:01:42 +0200
Message-ID: <2167316.72vocr9iq0@kista>
In-Reply-To: <20220926113438.65b64a06@donnerap.cambridge.arm.com>
References: <20220913234004.24850-1-andre.przywara@arm.com> <20220926113438.65b64a06@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 26. september 2022 ob 12:34:38 CEST je Andre Przywara 
napisal(a):
> On Wed, 14 Sep 2022 00:40:02 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> Hi,
> 
> can someone please have a look and confirm that this is legit? Could be as
> easy as just diff'ing against what's in the kernel tree and checking that
> the differences are just due to the r_intc change.
> 
> I would like to push the DT update still into the release, so that we live
> up to the promise of providing a good experience with $fdtcontroladdr.

I checked that all files are either equal or have r_int difference.

FWIW:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> Cheers,
> Andre
> 
> > This syncs the .dts and .dtsi files from the Linux kernel repository
> > as of v6.0-rc4 into U-Boot. As before, we skip the r_intc change, as
> > this breaks older kernels.
> > The first patch handles the 64-bit parts, the second one the 32-bit
> > SoCs.
> > 
> > Thanks,
> > Andre
> > 
> > Andre Przywara (2):
> >   sunxi: dts: arm64: update devicetree files
> >   sunxi: dts: arm: update devicetree files
> >  
> >  arch/arm/dts/Makefile                         |   3 +-
> >  arch/arm/dts/sun4i-a10-inet9f-rev03.dts       |  40 +--
> >  arch/arm/dts/sun4i-a10-pcduino.dts            |   6 +-
> >  arch/arm/dts/sun50i-a64-amarula-relic.dts     |   2 +-
> >  arch/arm/dts/sun50i-a64-bananapi-m64.dts      |   4 +-
> >  arch/arm/dts/sun50i-a64-nanopi-a64.dts        |   2 +-
> >  arch/arm/dts/sun50i-a64-olinuxino.dts         |  30 ++
> >  arch/arm/dts/sun50i-a64-orangepi-win.dts      |   6 +-
> >  arch/arm/dts/sun50i-a64-pinebook.dts          |   4 +-
> >  arch/arm/dts/sun50i-a64-pinephone-1.0.dts     |   4 +
> >  arch/arm/dts/sun50i-a64-pinephone-1.1.dts     |   4 +
> >  arch/arm/dts/sun50i-a64-teres-i.dts           |   8 +
> >  arch/arm/dts/sun50i-a64.dtsi                  |  10 +-
> >  arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts      |   4 +-
> >  arch/arm/dts/sun50i-h5-orangepi-pc2.dts       |   4 +-
> >  arch/arm/dts/sun50i-h5-orangepi-prime.dts     |   4 +-
> >  arch/arm/dts/sun50i-h6-orangepi-3.dts         |   4 +-
> >  arch/arm/dts/sun50i-h6-orangepi-lite2.dts     |   4 +-
> >  arch/arm/dts/sun50i-h6-tanix.dtsi             |   2 +-
> >  arch/arm/dts/sun50i-h6.dtsi                   |  12 +-
> >  arch/arm/dts/sun50i-h616-orangepi-zero2.dts   |  55 +---
> >  arch/arm/dts/sun50i-h616-x96-mate.dts         | 177 +++++++++++
> >  arch/arm/dts/sun50i-h616.dtsi                 | 286 +++++-------------
> >  arch/arm/dts/sun5i-a13-licheepi-one.dts       |   6 +-
> >  arch/arm/dts/sun6i-a31.dtsi                   |  13 +-
> >  arch/arm/dts/sun7i-a20-pcduino3.dts           |   6 +-
> >  arch/arm/dts/sun8i-a23-a33.dtsi               |   9 +-
> >  arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts      |  74 +----
> >  arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts        |  74 +----
> >  arch/arm/dts/sun8i-a33-et-q8-v1.6.dts         |  58 +---
> >  arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts      |  58 +---
> >  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    |   8 +-
> >  arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts  |   2 +-
> >  arch/arm/dts/sun8i-h3-beelink-x2.dts          |   6 +-
> >  arch/arm/dts/sun8i-h3-mapleboard-mp130.dts    |   6 +-
> >  arch/arm/dts/sun8i-h3-nanopi-duo2.dts         |   8 +-
> >  arch/arm/dts/sun8i-h3-nanopi-neo-air.dts      |   2 +-
> >  arch/arm/dts/sun8i-h3-nanopi-r1.dts           |   4 +-
> >  arch/arm/dts/sun8i-h3-nanopi.dtsi             |   5 +-
> >  arch/arm/dts/sun8i-h3-orangepi-2.dts          |   6 +-
> >  arch/arm/dts/sun8i-h3-orangepi-lite.dts       |   4 +-
> >  arch/arm/dts/sun8i-h3-orangepi-one.dts        |   4 +-
> >  arch/arm/dts/sun8i-h3-orangepi-pc.dts         |   4 +-
> >  arch/arm/dts/sun8i-r16-bananapi-m2m.dts       |   4 +-
> >  arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts  |   5 +
> >  arch/arm/dts/sun8i-r40-cpu-opp.dtsi           |  52 ++++
> >  arch/arm/dts/sun8i-r40-feta40i.dtsi           |   5 +
> >  arch/arm/dts/sun8i-r40.dtsi                   |  44 ++-
> >  arch/arm/dts/sun8i-t3-cqa3t-bv3.dts           |   5 +
> >  arch/arm/dts/sun8i-v3s.dtsi                   |   6 +-
> >  arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts  |   5 +
> >  arch/arm/dts/sun9i-a80.dtsi                   |   1 -
> >  arch/arm/dts/sunxi-bananapi-m2-plus.dtsi      |   8 +-
> >  arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi    |   4 +-
> >  arch/arm/dts/sunxi-h3-h5.dtsi                 |  13 +-
> >  arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi   |   4 +-
> >  include/dt-bindings/clock/sun50i-h6-r-ccu.h   |   1 +
> >  include/dt-bindings/clock/sun50i-h616-ccu.h   |   1 +
> >  include/dt-bindings/clock/sun6i-rtc.h         |  10 +
> >  59 files changed, 562 insertions(+), 638 deletions(-)
> >  create mode 100644 arch/arm/dts/sun50i-h616-x96-mate.dts
> >  mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
> >  mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
> >  mode change 100644 => 120000 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
> >  mode change 100644 => 120000 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
> >  create mode 100644 arch/arm/dts/sun8i-r40-cpu-opp.dtsi
> >  create mode 100644 include/dt-bindings/clock/sun6i-rtc.h


