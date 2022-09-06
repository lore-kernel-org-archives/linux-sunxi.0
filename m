Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E12F2F
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 20:29:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id l14so2377811eja.7
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XVGUqqzM3n2D/4jJV0ZKcJTbVHjL4eVdejQAA4KKYRk=;
        b=H7ZInpF2UhWzzqrCBfmLLea7RMaRc0IsqTMdPjIoCV1dXteLuEZBPlQdCtrM6GRXoR
         z5SBRgeL0CsNRhmwTOlQLCTOluaJwA9GbW9p+eMbx3M4UdIS2eNmqyA9acjEis1earyB
         zdzagIbpXgK4GubL47JJjwenXNMMK2GmLT+RzZTqADNemTR9KVZQV0SnXZFH4uTeUSit
         kF50jBT/hTurNyat3APUOfcRLe8s3tFloDtyzmMKuusTxds7H32K89qYfhzsLsth3+hT
         T+umwiaem8KGg4A7Qgb3pFYsTU3xKRBPr+JyQnwVUCL/dECBqxqIHc07rFvExPTiHVBe
         owxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XVGUqqzM3n2D/4jJV0ZKcJTbVHjL4eVdejQAA4KKYRk=;
        b=X9tcjQJodg5e+tD43HRkC/Layl9Aa5s985fWiIS3CsXj+/XbxrWjT/FGNtkVFvuRsC
         hs9x1R25WXAMTmvOylHWqsX3IFAph0pcRRwr182FuXky/UY6MrY4SRqr+2i0AAQqDVNa
         vTsFOJmnW3cCNdGN+YTe2c6+XYFJ2kp/2LZWyvWLXGyX+vkLVARJxgd1M6zc4RUmJz5K
         z9MzHZM59+HSYi34lZFd3MVCoFYeMSZwlVydBSFze6/sNAoXxD83J3pZtc7RY611+BgD
         Ch1dqbgSTho/ox/eMUamLAS7hLrHq1Cesqd8iCkhAZMBUPCdBcrs/8jFjh+oZU1VkAFf
         0zKA==
X-Gm-Message-State: ACgBeo2aTNtZAad5N2GJCMbOq6mE5C4MJ5Z6ICchsI4i1/fYuelv7WXE
	SEccu8s+btkCL+bSWHxmIlo=
X-Google-Smtp-Source: AA6agR5FzHvOY7Bnao9g05Gz0yuvtXm27oREQpQ1b11WFGKhTmMQYjJTsyqae2G6XuQedGzvSAP07A==
X-Received: by 2002:a17:906:ef8c:b0:73d:db10:8825 with SMTP id ze12-20020a170906ef8c00b0073ddb108825mr139433ejb.445.1662496162405;
        Tue, 06 Sep 2022 13:29:22 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id da8-20020a056402176800b004477c582ffdsm5585194edb.80.2022.09.06.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:29:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, Palmer Dabbelt <palmer@dabbelt.com>
Cc: wens@csie.org, linux-sunxi@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org
Subject: Re: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
Date: Tue, 06 Sep 2022 22:29:20 +0200
Message-ID: <7423117.EvYhyI6sBW@kista>
In-Reply-To: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
References: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 01. september 2022 ob 20:10:13 CEST je Palmer Dabbelt nap=
isal(a):
> On Sun, 14 Aug 2022 22:08:03 PDT (-0700), samuel@sholland.org wrote:
> > This series adds the Kconfig/defconfig plumbing and devicetrees for a
> > range of Allwinner D1-based boards. Many features are already enabled,
> > including USB, Ethernet, and WiFi.
> >=20
> > The SoC devicetree uses bindings from the following series which have
> > not yet been merged:
> >=20
> > - SRAM controller:
> >   https://lore.kernel.org/lkml/20220815041248.53268-1-samuel@sholland.o=
rg/
> >=20
> > - NVMEM cell bits property change:
> >   https://lore.kernel.org/lkml/20220814173656.11856-1-samuel@sholland.o=
rg/
> >=20
> > - In-package LDO regulators:
> >   https://lore.kernel.org/lkml/20220815043436.20170-1-samuel@sholland.o=
rg/
> >=20
> > All three of these are required to set the correct I/O domain voltages
> > in the pin controller, which I would consider important to have in the
> > initial version of the devicetree.
> >=20
> > The SoC devicetree does contain one small hack to avoid a dependency on
> > the audio codec binding, since that is not ready yet: the codec node
> > uses a bare "simple-mfd", "syscon" compatible.
> >=20
> > Samuel Holland (12):
> >   MAINTAINERS: Match the sun20i family of Allwinner SoCs
> >   dt-bindings: riscv: Add T-HEAD C906 and C910 compatibles
> >   dt-bindings: vendor-prefixes: Add Allwinner D1 board vendors
> >   dt-bindings: riscv: Add Allwinner D1 board compatibles
> >   riscv: Add the Allwinner SoC family Kconfig option
> >   riscv: dts: allwinner: Add the D1 SoC base devicetree
> >   riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
> >   riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
> >   riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
> >   riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
> >   riscv: dts: allwinner: Add ClockworkPi and DevTerm devicetrees
> >   riscv: defconfig: Enable the Allwinner D1 platform and drivers
> > =20
> >  .../devicetree/bindings/riscv/cpus.yaml       |   2 +
> >  .../devicetree/bindings/riscv/sunxi.yaml      |  64 ++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
> >  MAINTAINERS                                   |   2 +-
> >  arch/riscv/Kconfig.socs                       |   9 +
> >  arch/riscv/boot/dts/Makefile                  |   1 +
> >  arch/riscv/boot/dts/allwinner/Makefile        |  10 +
> >  .../allwinner/sun20i-d1-clockworkpi-v3.14.dts | 242 +++++
> >  .../sun20i-d1-common-regulators.dtsi          |  51 +
> >  .../dts/allwinner/sun20i-d1-devterm-v3.14.dts |  37 +
> >  .../sun20i-d1-dongshan-nezha-stu.dts          | 114 +++
> >  .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
> >  .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
> >  .../sun20i-d1-lichee-rv-86-panel.dtsi         |  92 ++
> >  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  74 ++
> >  .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  84 ++
> >  .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 128 +++
> >  .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 171 ++++
> >  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  | 900 ++++++++++++++++++
> >  arch/riscv/configs/defconfig                  |  23 +-
> >  20 files changed, 2045 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
> >  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
> >  create mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-clockworkpi-v3.14.dts create
> >  mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-common-regulators.dtsi create
> >  mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
> >  create mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts create
> >  mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
> >  create mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
> >  create mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi create
> >  mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
> >  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.d=
ts
> >  create mode 100644
> >  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts create mode
> >  100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts create mode
> >  100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>=20
> I'm assuming these are aimed at the RISC-V tree?  I'm generally OK with
> that, though the DT folks have pointed out a handful of issues that look
> pretty reasonable to me.

DT changes for Allwinner ARM SoCs go trough sunxi tree. Should this be hand=
led=20
differently for RISC-V?

Best regards,
Jernej

>=20
> I can't find a v2, not sure if I missed it.  No rush on my end, just
> want to make sure I'm not dropping the ball on anything.
>=20
> Thanks!


