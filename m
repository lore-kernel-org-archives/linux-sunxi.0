Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7211517FE0
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 18:19:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso6235829f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jul 2023 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099576; x=1691691576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YGaaVLLljfwhL7I7pdePBXr9vIdDz36pjGnvHMvilI=;
        b=KHmTo/LYJBFDq+TnlOYbcz8G9El6xZsDW/OK2P08tqLF1t9npn0XrfSGSkiT26OKnQ
         hYDJFvqUYTQo8q1VAnAARl7qnhbBUwNmY8aIvRwK+U5zQTxmpjGjHg7q9a4dPZ5O5yMn
         gs9N72SFz6/mkstnvETHv564XOq569alNflXGlIVw/el5N1Tj2aOKimeNPkZ28rORzcp
         Xv0Q43+iLlcXqaC5nWvxzZbHnB3637AjPIdI9r54HsefCiYtM6TD43gbBofdZaMwKI6g
         lE1vDF/IWeb2dus7FP0RDgIa5BRsUvCOR9c5z1fPTNqByISN4gt5XCBn+DNUM5YszAck
         jvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099576; x=1691691576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YGaaVLLljfwhL7I7pdePBXr9vIdDz36pjGnvHMvilI=;
        b=JI2UJYS9BNE1aqHvZN3UPZ30o2B7cJpe3oxrNIdreDcQ8qYHh04OHZCZDKLGzMeTwD
         LJehyeG/WAesj/OB2MVwFPV9yL/fh7VPoOFt/5QLEJgM6BeqWhHZF/HLaIKsY2fSEzHb
         70HK/4QQnH5MAuRz3g98TN75fg/6OZszBHpCk3Hn6Vcx3EYHp7CEA8ELJrWeQweNbcIJ
         d1hxOeGeCweviE85pD1RfmB/c9G3pLmTQBC4CW6JVdKOc5PMYAGiX5vvsBtO7xiopszF
         UDbmzKmYWd29y6ZnIQRoQkaYXZEobsV/6hJ615KeypSumNLNRS2kpKuv68AYrWHXZ8Uz
         VMEw==
X-Gm-Message-State: ABy/qLZfP/e3U0rboBXtCWYUhfgafBoHEEHpnc7Nf31aMp7eNL2TWUPF
	9YW/3idjGnyA+09yQLLl2Uk=
X-Google-Smtp-Source: APBJJlEWOC+0TIySzdwSSr1Jk0NFX4B0/RuaPAFShvurW/BJZQn5yPYcNHjdV2dkkJY3Wv6DIPIxQA==
X-Received: by 2002:a5d:6b4c:0:b0:313:f7bd:f0 with SMTP id x12-20020a5d6b4c000000b00313f7bd00f0mr16484738wrw.49.1689099576238;
        Tue, 11 Jul 2023 11:19:36 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b003143aa0ca8asm2914790wrv.13.2023.07.11.11.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:19:35 -0700 (PDT)
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
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Leonard =?ISO-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 William Breathitt Gray <william.gray@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Mike Looijmans <mike.looijmans@topic.nl>,
 Maxime Ripard <mripard@kernel.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 4/4] riscv: dts: allwinner: d1: Add GPADC node
Date: Tue, 11 Jul 2023 20:19:32 +0200
Message-ID: <3238166.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230619154252.3951913-5-bigunclemax@gmail.com>
References:
 <20230619154252.3951913-1-bigunclemax@gmail.com>
 <20230619154252.3951913-5-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 19. junij 2023 ob 17:42:27 CEST je Maksim Kiselev napisal(a):
> This patch adds declaration of the general purpose ADC for D1
> and T113s SoCs.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> 922e8e0e2c09..cb353d5805cb 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
>  			#reset-cells = <1>;
>  		};
> 
> +		gpadc: adc@2009000 {
> +			compatible = "allwinner,sun20i-d1-gpadc";
> +			reg = <0x2009000 0x400>;
> +			clocks = <&ccu CLK_BUS_GPADC>;
> +			resets = <&ccu RST_BUS_GPADC>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(57) 
IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +			#io-channel-cells = <1>;
> +		};
> +
>  		dmic: dmic@2031000 {
>  			compatible = "allwinner,sun20i-d1-dmic",
>  				     "allwinner,sun50i-h6-dmic";




