Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650C02F83
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Apr 2021 03:17:32 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id l22so30302239ljc.9
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 20:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=b1Esi1WD3INsXc8Mpz0AJivayvHJYCQXopFXhNta98w=;
        b=I7g41yPDePKvGpxfv6D/4LEkW1BOr3KElyB8fnTQNmZIlPWJ6sY5y6tU/Sxx9lzdYu
         7p5hmVFgzT7bw6lD7SSuvuxCbwbM5OvyKvN0siTB4AivRCADe+IrUC1CYIgUFMxvULW3
         Him1k2/BRniACFCCsmdaKHCm2n1E76aIhQAZyAkWzzb0X4S4ddjomCWPoIL/rmxl1eji
         TAUeMdWiR36Uc86daQhkJMBLmbsvByS7xQFSNVwwXxBUrgi3GrNcPGX6tAz9hZU64jgT
         ZarREdKDEGKv2KaAgeY78LzQLX5g5OfOX3roje10VcI2hJBYHPQ0RYAjmbAtsXseZCzy
         bKdQ==
X-Gm-Message-State: AOAM5308KEWfod7ivRl44HCkh6sPezVPmO75CSJpg1UQQZ4uBhbKxsKC
	GIQqx7UNbzCqgzwl7d3VU31TEyWB+2w8lQ==
X-Google-Smtp-Source: ABdhPJw0pq5/CyL/fjTbt2GVwH+sVAkxuV11I7dGJ28b5A79YeLKi06aEBDaSY55+PG27Xid+sql8A==
X-Received: by 2002:a2e:b4f2:: with SMTP id s18mr10093470ljm.138.1618802250467;
        Sun, 18 Apr 2021 20:17:30 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id j8sm1061424ljg.111.2021.04.18.20.17.29
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 20:17:30 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id z13so36628914lfd.9
        for <linux-sunxi@lists.linux.dev>; Sun, 18 Apr 2021 20:17:29 -0700 (PDT)
X-Received: by 2002:a05:6512:3e0a:: with SMTP id i10mr10803227lfv.496.1618802249832;
 Sun, 18 Apr 2021 20:17:29 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210419025246.21722-1-samuel@sholland.org>
In-Reply-To: <20210419025246.21722-1-samuel@sholland.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 Apr 2021 11:17:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v642Z3iH7fUWa31Rb5j+nWdZ=sXn2BYw3_dyE9P6iuL0Cg@mail.gmail.com>
Message-ID: <CAGb2v642Z3iH7fUWa31Rb5j+nWdZ=sXn2BYw3_dyE9P6iuL0Cg@mail.gmail.com>
Subject: Re: [PATCH 0/2] sunxi: Enforce consistent MMC numbering
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Apr 19, 2021 at 10:52 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Dealing with the inconsistent numbering has been a major pain, and
> there is a solution with (as far as I can tell) no tangible downsides.
> So let's use it.
>
> Yes, I know the kernel supports UUIDs for root=. But UUIDs do not help
> when referencing the whole, unpartitioned device, like is needed for
> updating the bootloader and firmware. So for the use case of "write a
> bootloader to the SD card, regardless of where the board is currently
> booted from", I know of two options:
>   - Dig around in sysfs to find the mmc number from the MMIO address,
>     which means I have to know the MMIO addresses for every SoC, or
>   - Apply patches like these.
>
> Samuel Holland (2):
>   ARM: dts: sunxi: h3/h5: Enforce consistent MMC numbering
>   arm64: dts: allwinner: Enforce consistent MMC numbering
>
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            | 6 ++++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 ++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 6 ++++++

At least with Rockchip this is now done at the board level. IIRC it was
a request from other people to not do it at the SoC level. I don't recall
exactly who though.

ChenYu


>  3 files changed, 18 insertions(+)
>
> --
> 2.26.3
>
>
