Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517D173
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jan 2023 04:59:04 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j9so524939qtv.4
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Jan 2023 20:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2S3RLfrNyQH49fsnFGoQQ0jF5nvWXPOvFK0VP3Scjo=;
        b=IWV/X5EtYYc53U1keZc6Iu7v0jyTbAY6l2uYNr2tB7WaZHXvEwhIXcw5VZBulQSL6A
         6Jvn59mMR6weRaRmLdZ8F/95n+NaBJ9dRVjOjQ19w5aWxL+R6I/zOQkl4hj19hbQKkcg
         XmaOWJvaFGorOGR6gKFoxWNZ42yq3JI5PBjwnFIMJq9VFbqd+i4rUMftB8vjBgxSsNEW
         8gniu1Yv79dBtc9rOZbpIC451t5eJqX4pgao5Ha7dYw38DOKNCO4jT0+eG5WUHdqooRu
         CkQgahq+Ky8sF3BbotZY5uEqwtIQM7xrxtVzCBDUeiEKNovMTvE8/M+lrLSGEv0r5Wgg
         UqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2S3RLfrNyQH49fsnFGoQQ0jF5nvWXPOvFK0VP3Scjo=;
        b=VnRxvJ0PGaFRL7Se4Nt1DR//Gn0Uq5mdpfv2dPxrwwh8Doh/aXwsvNBJeKI0jBNF7n
         VrAEiK+bPK5v7Z7VozenfV8bYQvyNmSQfGnHoh6SuDwDiIzu+eCp+lMrN9/rzFwFKWle
         HLSrgQ+NSGmUM1TzOlZKFZjMlf8NWJ7PaRjqZoZYdvcS6GGVAHEzc/4IV56QSaDoMU26
         LdUtrWxXraoAmaY2Ub1EjglIDU1TqrGVMbTJhBr2SA2kGV2kupWi5Q/ORxpeBZ26VzTh
         CkzNfTEGRy1eTqFp8U6yAWPyoxFvff/KETL7204foi6e3nDUx28h+0K3evPm1XXwwR4p
         4v2g==
X-Gm-Message-State: AO0yUKXlJTVPLZsmZ3h3ObnqocDEBHiZepq9/GXHYbOnVT3YSzXeP7Pw
	iTzlA6Foj7twyP3oiIHNHEk=
X-Google-Smtp-Source: AK7set9uZfTD1W3z0cbHBVUg5SVE0mxBEXs/DXbPnm5/hifsR8XEBxaOH/w+lDF8YqDyrPMz+u2j0Q==
X-Received: by 2002:ac8:6794:0:b0:3b7:ec87:8154 with SMTP id b20-20020ac86794000000b003b7ec878154mr6565219qtp.44.1674709143369;
        Wed, 25 Jan 2023 20:59:03 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id j7-20020ac806c7000000b003b80a69d353sm120720qth.49.2023.01.25.20.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 20:59:02 -0800 (PST)
Date: Wed, 25 Jan 2023 23:59:00 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
Message-ID: <20230126045900.GA7126@localhost>
References: <20221231235541.13568-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat 2022-12-31 @ 05:55:35 PM, Samuel Holland wrote:
> [Resending because it has been a couple of months since v7 with no LED
> maintainer feedback, and LEDs now have an additional maintainer.]
> 
> This series adds bindings and a driver for the RGB LED controller found
> in some Allwinner SoCs, starting with A100. The hardware in the R329 and
> D1 SoCs appears to be identical.
> 
> Patches 4-5 depend on the D1 devicetree series[1], but the rest of this
> series can/should be merged without them.
> 
> This driver was tested on the D1 Nezha board.
> 
> [1]: https://lore.kernel.org/lkml/20221231233851.24923-1-samuel@sholland.org/
> 
> Changes in v7:
>  - Use DEFINE_SIMPLE_DEV_PM_OPS
> 
> Changes in v6:
>  - Drop the A100 DMA controller DT node patch, which was merged via a
>    different series
> 
> Changes in v5:
>  - A100 contains the original implementation, so use that as the base
>    compatible string, and rename the binding to match
>  - Add "unevaluatedProperties: false" to the child multi-led binding
>  - Rename the driver R329 -> A100, since that is the actual original
>    implementation
> 
> Changes in v4:
>  - Use "default" instead of "maxItems" for timing properties
>  - Depend on LEDS_CLASS_MULTICOLOR
> 
> Changes in v3:
>  - Removed quotes from enumeration values
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
>  - Changed "writesl" to "iowrite32_rep" so the driver builds on hppa
> 
> Changes in v2:
>  - Fixed typo leading to duplicate t1h-ns property
>  - Removed "items" layer in definition of dmas/dma-names
>  - Replaced uint32 type reference with maxItems in timing properties
>  - Renamed from sunxi-ledc to sun50i-r329-ledc
>  - Added missing "static" to functions/globals as reported by 0day bot
> 
> Samuel Holland (5):
>   dt-bindings: leds: Add Allwinner A100 LED controller
>   leds: sun50i-a100: New driver for the A100 LED controller
>   arm64: dts: allwinner: a100: Add LED controller node
>   riscv: dts: allwinner: d1: Add LED controller node
>   riscv: dts: allwinner: d1: Add RGB LEDs to boards
> 
>  .../leds/allwinner,sun50i-a100-ledc.yaml      | 139 +++++
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi |  14 +
>  .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  12 +
>  .../boot/dts/allwinner/sun20i-d1-nezha.dts    |  13 +
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |   6 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  15 +
>  drivers/leds/Kconfig                          |   9 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-sun50i-a100.c               | 555 ++++++++++++++++++
>  9 files changed, 764 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-a100-ledc.yaml
>  create mode 100644 drivers/leds/leds-sun50i-a100.c

this whole series:
Tested-by: Trevor Woerner <twoerner@gmail.com>

from: https://github.com/smaeul/linux/tree/d1/all
test script: https://github.com/twoerner/rgb-led-test
