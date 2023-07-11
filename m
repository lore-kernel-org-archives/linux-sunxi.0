Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9861E508
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:14:14 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-307d58b3efbso5977276f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099252; x=1691691252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kADj7TkFJka2Bqlkae4pY0x9oLW69mUSF/u4OPIu9zw=;
        b=SNVpgjSRTHtGVEhHWsNPdWiarBQISqftEQCEevuNc0G5qc6wA70ZMwDItNi5QJ70Lh
         WQ/yxCzHaCQP3aJ3pHyxeHwl1bizDesfw8/jNROxhaIh96PVDo0ojv5zrpdHqWbcRPLi
         UIl1Sqy1afzf9t2csa9ICDq3NyYCfhXP+oXpAXpeQ7XijcZ5iztSQ3aSEiNftbWK1yG0
         FR5v/WYsJqwcRIAiacYa16oeOsxmphNPUIFgbzJl4pI1eK4Y4zZBWj59q2IVB3dT9qRP
         XomOxRXpy3ZicVH4KLIE/F5V4OStm4RAupaT2pd0yI/E1l4X3AJnkzUAGIwHRpgNg9Xo
         wB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099252; x=1691691252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kADj7TkFJka2Bqlkae4pY0x9oLW69mUSF/u4OPIu9zw=;
        b=bVow9pXp/77U2RxnClW6St5hU2cg6ZVn1lF29nOV7khTZ7hezNiNRkcGWqpC7VQRuk
         N7gMI7Ehg4nd1ih78Ef/9XqkCmB/51ryYwMeH4xMv+sHARKI5huLW0tpSmUa6uCRhuZF
         zEMsP7xeCBQezn0ktTceNyOJRNl2qvIGoAChpK/xh6KdX0+PbcOotBOoi8YuQR3PlEZT
         swrZVtmDph5gfRF8jx08gxuVKur/kh83RDI0G1aMHG/N4eajJyEw1H1ImH3QZUFWVmdU
         7aycMsC9kmlYwpOuXw8EVvkH4otO5CNG643qX6FECPakisat0MNX8JsFdIPEwE3TUypZ
         R5Rg==
X-Gm-Message-State: ABy/qLadE9y/5e91J03mz3MbGQe+LYAS+nMA4bRP7svjDzKesL9tXw6h
	MXXN45H7KfwNR3Qij4ZWtDo=
X-Google-Smtp-Source: APBJJlE81gCA4q7wctwDy79JVHUy50OZdvk15qWNdOhG/fVz/02t692RpTHodquQlZi07SyIt6jUVw==
X-Received: by 2002:a5d:4f0c:0:b0:314:1fd7:188b with SMTP id c12-20020a5d4f0c000000b003141fd7188bmr13503587wru.17.1689099252131;
        Tue, 11 Jul 2023 11:14:12 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x10-20020adff64a000000b003142e438e8csm2868429wrp.26.2023.07.11.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:14:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v8 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Tue, 11 Jul 2023 20:14:08 +0200
Message-ID: <2148594.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230619154252.3951913-2-bigunclemax@gmail.com>
References:
 <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-2-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 19. junij 2023 ob 17:42:24 CEST je Maksim Kiselev napisal(a):
> This patch adds SoCs names to Allwinner GPADC description to
> make it more informative.

Please reword to remove "This patch".

> 
> Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")

I'm fine with the patch in general, but does this really warrant fixes tag?

Best regards,
Jernej


> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  drivers/iio/adc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index eb2b09ef5d5b..d93868684c7b 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1105,7 +1105,7 @@ config STMPE_ADC
>  	  built-in ADC block (stmpe811).
> 
>  config SUN4I_GPADC
> -	tristate "Support for the Allwinner SoCs GPADC"
> +	tristate "Allwinner A10/A13/A31 and similar GPADCs driver"
>  	depends on IIO
>  	depends on MFD_SUN4I_GPADC || MACH_SUN8I
>  	depends on THERMAL || !THERMAL_OF




