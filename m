Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC570
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jun 2021 15:39:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id f20so4126610wmg.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Jun 2021 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tXVK6dmsPKFlxVGsnju6Gmzr7jy3YZ4iKuNuKJOxdWw=;
        b=JOvuaADx3aNM3K94Mgv7uoshwLFoOBBxt+pdTzvdBBN2//CSdNpWIIsYmwg2dvQ/Ex
         DGIHYa91NfPNIMRutxQawEBgMJJ/Uiuwzvw3uywKGw6woRT6pn/3Ahn3P+Z6T2TeyFQO
         Ppyjx7DAmMPpsHvwz3sLNMoK2NaCu6+ORaml+9s1IDyjT4rT3TgAfZSFwYqAdqMSbYYN
         2+9Vsh/5639do0hlzWgfzGD/uoRDjLSKqZVFXUJZ3DA0qRRoPknbtrvawyODg9NF6xku
         RUcE7lVj4u1RpcIkFNZKfxGfkHcXvEi0608OrAGbYUH6zONN/xtob1pE65sPVDCkuZn7
         t3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tXVK6dmsPKFlxVGsnju6Gmzr7jy3YZ4iKuNuKJOxdWw=;
        b=GuAGfA66Jw2O7NAzY/DQ0mbBX1SbgkPinopsySFXkqEZ1vdE+KckcvrXayjRuQLbiS
         oUrKXu/b0VTWzrHNBxllgZ+85RjdmaLfgHHPczQhVjInEt2JJU8Fn/nJ1tl+dN/CdxgV
         PDFvkp0/OfZPL41tE4rFCCChbmZo/af48eSpO+sCwBL2kHdpiytqDu7p5vhBOiLVDj+n
         Y23zYNIYr8o0QeqHVnGKYej8Kpii0oi2bBGMM6HBaHCLindOXo7r3Zej67DeGDWB1zcW
         eJjgEHt8Ty74eYJnmzm0TfIeB6UlUj96wuwC3rVEIdGOchHNoLlRBGH1u6+D7CXxxhdi
         HTLw==
X-Gm-Message-State: AOAM530hJVFqHGhXyQkJOiw1PYqpAqymXHq4f1e5vlT2mhhAZqj5sj3V
	jTE6gTX7n6Bos7HF+zWAL0E=
X-Google-Smtp-Source: ABdhPJzk5jC8DWCQBqX+x/UEE4Ml4TK5R3j6VYfcijR+eC1lozRFL3EB2lxSBndsOMBtKoSQPka6UA==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr11781738wmk.69.1622993953117;
        Sun, 06 Jun 2021 08:39:13 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id 3sm14203074wmi.7.2021.06.06.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 08:39:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>, wens@csie.org, maxime@cerno.tech, Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com, Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>, wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>, LABBE Corentin <clabbe.montjoie@gmail.com>, Michael Walle <michael@walle.cc>, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH v2 11/11] riscv: soc: Allwinner D1 GMAC driver only for temp use
Date: Sun, 06 Jun 2021 17:39:09 +0200
Message-ID: <49182865.cm8dGOVcTj@jernej-laptop>
In-Reply-To: <CAJF2gTQgaJFW9knuVmW8J8zMAt_Gtq3KJ9gsGKg6=xLBuq0=uA@mail.gmail.com>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org> <20210606115027.5c715e64@slackpad.fritz.box> <CAJF2gTQgaJFW9knuVmW8J8zMAt_Gtq3KJ9gsGKg6=xLBuq0=uA@mail.gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne nedelja, 06. junij 2021 ob 17:32:22 CEST je Guo Ren napisal(a):
>  ,
> 
> On Sun, Jun 6, 2021 at 6:50 PM Andre Przywara <andre.przywara@arm.com> 
wrote:
> > On Sun,  6 Jun 2021 09:04:09 +0000
> > guoren@kernel.org wrote:
> > 
> > Hi,
> > 
> > > From: liush <liush@allwinnertech.com>
> > > 
> > > This is a temporary driver, only guaranteed to work on allwinner
> > > D1. In order to ensure the developer's demand for network usage.
> > 
> > That looks like some Allwinner BSP driver, please don't endorse code
> > of this quality (just look at all that commented code and the attempt
> > for compile-time configuration).
> > 
> > > It only could work at 1Gps mode.
> > > 
> > > The correct gmac driver should follow (I guess)
> > > drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> > > 
> > > If anyone is familiar with it and can help porting, I would be
> > > very grateful.
> > 
> > Have you tried compiling and using that driver? Ideally it should just
> > work, Linux drivers are meant to be portable, by design. And the driver
> > is already enabled by COMPILE_TEST.
> 
> It still needs some work with dwmac-sun8i.c glue layer, eg:
> tx/rx-delay setting, clk & pinmux drivers.
> 
> The patch is just to help people using D1 with GMAC temporarily with
> network function.

It should be marked "DO NOT MERGE" or similar then.

Best regards,
Jernej

> 
> > But I guess you need some extra care to make the non-coherent DMA work?
> > I haven't looked in detail, but are those new CMOs hooked into the
> > generic DMA framework?
> 
> Yes, we have the simliar principle with arm & csky for non-coherent:
>  - Using PTE attributes setting Using PTE attributes to support
> _PAGE_IOREMAP & _PAGE_WRITECOMBINE
>  - Using CMO instructions deal SYNC_DMA_FOR_CPU/DEVICE.
> 
> > Cheers,
> > Andre
> > 
> > > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > > Tested-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Corentin Labbe <clabbe@baylibre.com>
> > > Cc: Samuel Holland <samuel@sholland.org>
> > > Cc: Icenowy Zheng <icenowy@aosc.io>
> > > Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
> > > Cc: Michael Walle <michael@walle.cc>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Wei Fu <wefu@redhat.com>
> > > Cc: Wei Wu <lazyparser@gmail.com>
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>



