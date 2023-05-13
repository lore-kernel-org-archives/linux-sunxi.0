Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBBA35
	for <linux-sunxi@lists.linux.dev>; Sat, 13 May 2023 06:38:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-969f90d71d4so893268866b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 May 2023 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683959880; x=1686551880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJAHS0Zaj0yVKhfNHhf5jx/XvjbWQe6dR3+gBFASJBU=;
        b=YFD59SfNwI80NXatbYx+VnyB6F8bgTWYF5cM6l+/+0MBybE4ati0s2sJJIOR2Dql7+
         p1amTvshUKIr2n/XCcTaSELHndPCCWo+owGMRBQcF/Dqmp+vlOOYoDOxZRpsvEpdJTTt
         uUWxOlqz2ZYWlYXn3eE74ooL2nOXT5Ihsd3l/9W6ncaGvgy3lVfZ82Ck9LaTltNt5dzg
         lJRmt1J1fdlgtxYrkXdL/DEI7/7ui+2QBZi4T4g0e30hckViwFx3A7ksKyFnKHVWrPK9
         jVMcj+eSseJrZuT5YwPN3F/Fco1dfu1OckFwiEsVHkkT4aZx7GvkIUR0MCgOw0J9PThd
         O3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683959880; x=1686551880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJAHS0Zaj0yVKhfNHhf5jx/XvjbWQe6dR3+gBFASJBU=;
        b=iBF0VN3Wg1fC3dFh8AiaudIytP0B6CsAV4iesTfrN6KYMGbpU/+ZHXnWEvae5oflBa
         rVBlK5ovZNnzfyUvCemGrlvB8ZVQN2ITDwMRtHg3XtnElXilD2T0etB+0ZIqC/QKiwxv
         s8wnUvEyDUXaNBNk/i6Wd8mSR6HPMbUac6aVtc97hTuasTO6EeS3UCuyJbIEX3J9W9TR
         5F4Rvpcx3e0bdB0YLbe3chIQkWHUolyQ/xutGSofwIMlOyBA0W7nGOoOOI+f8X2PzSxX
         sW47o54BgchVUFesMQkb6pAZBzEqhEM0kr39LARoHRlyTz3FNU8p2VzEu6+jBwVSCkon
         3JHg==
X-Gm-Message-State: AC+VfDzMW77eSHqWN/d75x/WuY14MTzu6Ks/vlXo3wzwB4bIgigSyxpP
	CffbfDGbVYpXMb/t7F/BDak=
X-Google-Smtp-Source: ACHHUZ6ItNQrDwZ3aO2IHbDnGlrK+eX28iXA7zT5j5NaZuSZ7J3VBuL20juqQ/09jGy+jwM+MI5cag==
X-Received: by 2002:a17:906:5d0f:b0:96a:ec5c:687b with SMTP id g15-20020a1709065d0f00b0096aec5c687bmr248946ejt.64.1683959880013;
        Fri, 12 May 2023 23:38:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906195000b0094e96e46cc0sm6371733eje.69.2023.05.12.23.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 23:37:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "open list:LIBATA SUBSYSTEM" <linux-ide@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ata: libata: Make ata_platform_remove_one return void
Date: Sat, 13 May 2023 08:37:58 +0200
Message-ID: <4827684.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
References: <20230512204646.137746-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne petek, 12. maj 2023 ob 22:46:46 CEST je Uwe Kleine-K=F6nig napisal(a):
> The function returned zero unconditionally, so the function returning an
> int is something between useless and irritating. With the goal to make
> platform drivers' remove function return void, it's helpful to convert
> the function accordingly. This converts several drivers to the new
> .remove_new callback that was introduced to smoothen the platform driver
> conversion.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/ata/ahci_brcm.c        | 6 +++---
>  drivers/ata/ahci_ceva.c        | 2 +-
>  drivers/ata/ahci_da850.c       | 2 +-
>  drivers/ata/ahci_dm816.c       | 2 +-
>  drivers/ata/ahci_dwc.c         | 2 +-
>  drivers/ata/ahci_imx.c         | 2 +-
>  drivers/ata/ahci_mtk.c         | 2 +-
>  drivers/ata/ahci_mvebu.c       | 2 +-
>  drivers/ata/ahci_platform.c    | 2 +-
>  drivers/ata/ahci_qoriq.c       | 2 +-
>  drivers/ata/ahci_seattle.c     | 2 +-
>  drivers/ata/ahci_st.c          | 2 +-
>  drivers/ata/ahci_sunxi.c       | 2 +-

=46or sunxi:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/ata/ahci_tegra.c       | 2 +-
>  drivers/ata/ahci_xgene.c       | 2 +-
>  drivers/ata/libata-core.c      | 4 +---
>  drivers/ata/pata_ixp4xx_cf.c   | 2 +-
>  drivers/ata/pata_of_platform.c | 2 +-
>  drivers/ata/pata_platform.c    | 2 +-
>  drivers/ata/sata_highbank.c    | 2 +-
>  include/linux/libata.h         | 2 +-



