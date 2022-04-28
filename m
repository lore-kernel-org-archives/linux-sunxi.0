Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75527B
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 05:43:28 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id dk23so7345390ejb.8
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 22:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s07a0DsY9s52QkJmiJ36LrahFkWV2t9AjkvfZr/kSYU=;
        b=AoSWjN4/5ia3sJysWSlpJKDFdG/NXjaAcfPIzWtpSV7VXYWAH+TaL+n47Sj1nuCQPi
         J56q+vUiECCLwu3kys9q/Jv1pOUc4MpmGNGfLPbRGLnRnQlsR6GqQZzTdDvhd/Qawh92
         /7oYX4g5gnXixje6OV1O6PG2hG6BTfY8TDrf+zL6dHFRjBtRiDNo5fmZgSzurmzXkvWU
         6bV3KbvuIPI5CN1bqS2frjrHr0uwIWKYxkXFhDlOkezxthjM5PGtwoolbM86cIje0lKr
         vTVdQTiCDjE8/E/f1AI0sSkqNPpeBQsbiI2JxkXRLOf+TlWZzylSoDuwScGjfY10IK+2
         M4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s07a0DsY9s52QkJmiJ36LrahFkWV2t9AjkvfZr/kSYU=;
        b=F8gdm8uhTOPeNl1RZFxOMaVpZ1+Vp+fgMgIAfr8HpttdU+bmGIqhqi/8dwp/hGP6qx
         4fakocxUn6cpXUAWvrrwb88s9vLm4/OUgGf5oBFW+fTIkR5TXVL0AYn+g3iPFOGU7KX9
         GH1z5Poe+3OmwGJW4YwK3uJTQHU4zIX6Z8O6kWwQ0Wh5UxzilAZGzalruLbEHsW5fQCN
         aMdDohT71zV0LV4Btn2GTlR4MngbbY27PH68nij55jj2j58kkJli5QRNYWcwNT5DhC33
         26Co4xcWzcDft4juJDGb3bmLEQeyLLx72UZQlbvynlPlwAcP9K7DYrzbTBiy4oZ6HAp0
         Iq4g==
X-Gm-Message-State: AOAM531jJv4wGaPrHT18ZjohBu8fm/NbbUsThoLgGO71mIRM2FTfx3zU
	dVAWWdL5lkGa68HIpWx7qME=
X-Google-Smtp-Source: ABdhPJzWJjNdXgo+WbHDrSQuq/2nYg4TWpvGFaOwbQshU+cXykP4HIK3zWEPoWCTdp5k14/cBAAWdw==
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id w1-20020a170906184100b006e8872d8999mr29426739eje.492.1651124607032;
        Wed, 27 Apr 2022 22:43:27 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id s25-20020a170906285900b006f3c813f51fsm2227173ejc.128.2022.04.27.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 22:43:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org, Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/5] iommu/sun50i: Ensure bypass is disabled
Date: Thu, 28 Apr 2022 07:43:25 +0200
Message-ID: <1922960.8hb0ThOEGa@jernej-laptop>
In-Reply-To: <20220428010401.11323-4-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org> <20220428010401.11323-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 28. april 2022 ob 03:03:58 CEST je Samuel Holland napisal=
(a):
> The H6 variant of the hardware disables bypass by default. The D1
> variant of the hardware enables bypass for all masters by default.
>=20
> Since the driver expects bypass to be disabled, ensure that is the case.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Actually, it would be better to set bypass to 0xff and in=20
sun50i_iommu_attach_device() clear bypass bit for that particular device. A=
s=20
you might notice, index in phandle is currently not used. This would also h=
elp=20
expose bugs, like missing second iommu channel for Cedrus on H6, but that's=
=20
easy to fix.

Best regards,
Jernej

> ---
>=20
>  drivers/iommu/sun50i-iommu.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index ec07b60016d3..b9e644b93637 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -374,6 +374,8 @@ static int sun50i_iommu_enable(struct sun50i_iommu
> *iommu)
>=20
>  	spin_lock_irqsave(&iommu->iommu_lock, flags);
>=20
> +	iommu_write(iommu, IOMMU_BYPASS_REG, 0);
> +
>  	iommu_write(iommu, IOMMU_TTB_REG, sun50i_domain->dt_dma);
>  	iommu_write(iommu, IOMMU_TLB_PREFETCH_REG,
>  		    IOMMU_TLB_PREFETCH_MASTER_ENABLE(0) |




