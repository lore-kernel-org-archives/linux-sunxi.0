Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EA7B
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 05:35:27 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id gh6so7414033ejb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 22:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6GB1/WywBgvh+64+Tjj1z6mIuDmSgmvtpDpu9gTFhI=;
        b=Sk9QjBASR1ZDnIiWemIfYQHAyckj3WwUQ0Dk1x8vUbtZKw+Ps2RXC6ddu1yuaUfDpB
         gMi/A8uQw0hEu+F47+bjMp3t0QSCs67/abhdlEHByg/jPyQayH7pn4Niiz8YRh5dR/se
         xln6tUHCH2ERr0czmm5bEvYM2ukGDy9YomaBo1EqTSTx4xoNVJ08d1wBBXiam8xKQTnx
         m2eyYfCopyih6EYsIGG1jf7cGgoW/UdVQ6fuA03CTOCzsi1Xz/KgZtBjOu5G13Jw3OOq
         KE1LJORJpVZYpyh+W5+KQw59PhV/1nUPGPeM7fCd356wan6bL63d95Hnn1EfATYDBxWT
         v/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6GB1/WywBgvh+64+Tjj1z6mIuDmSgmvtpDpu9gTFhI=;
        b=DXUv5t/4oHh+02ELDGlhD7iOqylRzEhgLG+UE6Xex9ckJ6f/3KZ8ckuE5s25kgFhk6
         D5xGqhgFrM4mbU1hncbVr3QKUXiH4endywTCd+A8H94jPn0gqxkVjxXdq/DpNNmLqTPU
         2R4LdSlZe38G+aKbnjfGjuziakvhD/2LztPdf/oZl0yOlJ33vIg13DnpC4R3HnVbjU16
         7V/ksx5ZpB8ucxWlNd29242yfB1QSZUkE4AA4qBsgyYJ/1Nld9iq1aHWBGsJzDkn4WL/
         K0b4S5Ye19o89w7TXxZ5+GDBVBDFyOCQQ2qHCuteuxvi2mClYFTX/u2Ly9uAr0drIP3I
         k33w==
X-Gm-Message-State: AOAM533a5dAf3R5ss6r3o4PBgjUXHM4JELPm+nhwXKWBgs7ofTB5799R
	VBAdoOH+Ne6qiEyTC+ZPHPhrAUPrxzjnhw==
X-Google-Smtp-Source: ABdhPJxOTXVpvT//Cj+0qyGctmcgG8tu4Sgrf5+zvtxXeIcbwKP79h4Ibc/zhuPFP2T8AkYgQw4Smw==
X-Received: by 2002:a17:907:72cd:b0:6f3:a068:a2ce with SMTP id du13-20020a17090772cd00b006f3a068a2cemr16041538ejc.563.1651124126336;
        Wed, 27 Apr 2022 22:35:26 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id b6-20020aa7cd06000000b0042617ba63a9sm886885edw.51.2022.04.27.22.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 22:35:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org, Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Date: Thu, 28 Apr 2022 07:35:24 +0200
Message-ID: <1762951.8hzESeGDPO@jernej-laptop>
In-Reply-To: <20220428010401.11323-6-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org> <20220428010401.11323-6-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 28. april 2022 ob 03:04:00 CEST je Samuel Holland napisal=
(a):
> So far, the driver has relied on arch/arm64/Kconfig to select IOMMU_DMA.
> Unsurprisingly, this does not work on RISC-V, so the driver must select
> IOMMU_DMA itself.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>=20
>  drivers/iommu/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c79a0df090c0..70a0bfa6d907 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -223,6 +223,7 @@ config SUN50I_IOMMU
>  	depends on ARCH_SUNXI || COMPILE_TEST
>  	select ARM_DMA_USE_IOMMU
>  	select IOMMU_API
> +	select IOMMU_DMA
>  	help
>  	  Support for the IOMMU introduced in the Allwinner H6 SoCs.




