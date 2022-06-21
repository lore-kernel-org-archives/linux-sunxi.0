Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CF1A20
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Jun 2022 04:13:02 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so6591668wme.0
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 21:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gWNf4zISviT0O075eMDft6o66p0iSBmP3yoC2k9L30s=;
        b=f3qrhg5kivwoN62pkQbcd4DuX9n8K9cZ9BP+ptY1tWJ7tZgQg2er1cSs3AjXP+UnYt
         6cRh3QvedL01Pw75eXfsUtFhueMSqxX6taL4E1ArDFBhODwSRhIgog7UVQhkPn3J8AQp
         zNN0wastumrL5Gq5bfrcqREF5fOFhezoDvKrdUlYlGK5bX42VKGqBdTBaP9jztvuKQfG
         a4AtS9szMHVcLXh7b+ClVSoLfANQKtf6voqXV4k1sQcynXBCA8WwIkaoaNWpZ7u6INe6
         jyuTWFAxheiqlEEnosdoDxMd7fCNGPTpg3qSeX9eLpy2xH9Zi4GsIPX1mqQ4MgHlIGLP
         pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gWNf4zISviT0O075eMDft6o66p0iSBmP3yoC2k9L30s=;
        b=Q1ygfj2agYr3BbpT8XZWuVa97K4cNceZuFan4R/iKm9bSCjfkyzG1n0zRV1FKiUhlC
         YFR5pJtYo+dABJKHIc3PNue0j+UoPX3za2jZBSowhziENaG6F7hY3F166Bh3at3xa3Ik
         I94l2D/ReSY5rcIobvt6LprXFJTBJXjBE/eA/Ro++jOiN2iVBWeTuAiSPmaAYbhpuoah
         YsEUX6ClJggVtasHNkTUAvXH7ioVBamgtiFXU7K30OchkRU1+APqw91xNKXAKIMRzvPF
         b8DJvBefJcixBjOoSaxJKtsBfBmICxn3LIR1oHRlrDFXzFef2y6B/HwD+2w9Kt2xz1mD
         yRMA==
X-Gm-Message-State: AOAM533fVDnoDfYtiaMgTvLU4gax/acYJJ9kg2TfF1DuZUz2m5ZfiScN
	u85heM1hJTBlycEyVrZ/ydmhmpOaU00=
X-Google-Smtp-Source: ABdhPJy1EcK1Ls78Ofn6WTxbw21kuLZhIFxSHu84kK9NBQ1319q3BRU7LTTnK4saL8kgvjS2sRwCpA==
X-Received: by 2002:a7b:cc94:0:b0:39c:4507:e806 with SMTP id p20-20020a7bcc94000000b0039c4507e806mr38807711wma.91.1655784780332;
        Mon, 20 Jun 2022 21:13:00 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id bt28-20020a056000081c00b0020fcc655e4asm14349200wrb.5.2022.06.20.21.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 21:12:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH] dmaengine: sun6i: Set the maximum segment size
Date: Tue, 21 Jun 2022 06:12:53 +0200
Message-ID: <1793109.atdPhlSkOF@kista>
In-Reply-To: <c0c27494-99ea-969d-ff6c-a21f110ed3e8@sholland.org>
References: <20220617034209.57337-1-samuel@sholland.org> <3494277.R56niFO833@kista> <c0c27494-99ea-969d-ff6c-a21f110ed3e8@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 21. junij 2022 ob 02:20:11 CEST je Samuel Holland napisal(a):
> Hi Jernej,
>=20
> On 6/20/22 1:28 PM, Jernej =C5=A0krabec wrote:
> > Dne petek, 17. junij 2022 ob 05:42:09 CEST je Samuel Holland napisal(a):
> >> The sun6i DMA engine supports segment sizes up to 2^25-1 bytes. This is
> >> explicitly stated in newer SoC documentation (H6, D1), and it is impli=
ed
> >> in older documentation by the 25-bit width of the "bytes left in the
> >> current segment" register field.
> >=20
> > At least A10 user manual says 128k max in description for Byte Counter=
=20
> > register (0x100+N*0x20+0xC), although field size is defined as 23:0, bu=
t=20
that's=20
> > still less than 2^25-1. A20 supports only 128k too according to manual.=
=20
New=20
> > quirk should be introduced for this.
>=20
> Thanks for checking this. A10 and A20 use a separate driver (sun4i-dma).=
=20
That
> driver will also benefit from setting the max segment size, so I will sen=
d a
> patch for it.
>=20
> I think all of the variants supported by sun6i-dma have the same segment=
=20
size
> capability, so no quirk is needed here.

Ah, yes. Then this patch is:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Regards,
> Samuel
>=20
> >>
> >> Exposing the real segment size limit (instead of the 64k default)
> >> reduces the number of SG list segments needed for a transaction.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >> Tested on A64, verified that the maximum ALSA PCM period increased, and
> >> that audio playback still worked.
> >>
> >>  drivers/dma/sun6i-dma.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> >> index b7557f437936..1425f87d97b7 100644
> >> --- a/drivers/dma/sun6i-dma.c
> >> +++ b/drivers/dma/sun6i-dma.c
> >> @@ -9,6 +9,7 @@
> >> =20
> >>  #include <linux/clk.h>
> >>  #include <linux/delay.h>
> >> +#include <linux/dma-mapping.h>
> >>  #include <linux/dmaengine.h>
> >>  #include <linux/dmapool.h>
> >>  #include <linux/interrupt.h>
> >> @@ -1334,6 +1335,8 @@ static int sun6i_dma_probe(struct platform_devic=
e=20
> > *pdev)
> >>  	INIT_LIST_HEAD(&sdc->pending);
> >>  	spin_lock_init(&sdc->lock);
> >> =20
> >> +	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(25));
> >> +
> >>  	dma_cap_set(DMA_PRIVATE, sdc->slave.cap_mask);
> >>  	dma_cap_set(DMA_MEMCPY, sdc->slave.cap_mask);
> >>  	dma_cap_set(DMA_SLAVE, sdc->slave.cap_mask);
> >> --=20
> >> 2.35.1
> >>
> >>
> >=20
> >=20
>=20
>=20


