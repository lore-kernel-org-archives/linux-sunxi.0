Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D262B
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Mar 2023 04:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E51DC433A7
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Mar 2023 04:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678248809;
	bh=KZvivIcdP43nYQjxQV2iwy3EY21Hd7biSu6JBWcNfhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qwpkfQ9VnecJvrGDoPULM/UgWFCDiFizZR9bwOGtGDBHVcPfmKoGcKdlIPO9ML2A4
	 7Hoq1/OwuH5ZeKgVG0mk7tWzc15Jks/nMeMCDoc8qnnG1n3n2EbMbRr3ITnC5kGJZ+
	 doklXfgvNCatWziSkJnkLWMgzpH/UIqYn09mHlzvMkHPZPER8YQRGmvHyLKq3kA/EV
	 ba1NYZ0jLVjH2rSj2i8COtMWqsU2/947TxQhR6HNrwOfZ6czJ+zzVuxbVJ6r8lTVft
	 wJFNmD9hOP40zKm8aUBXFOR6VCyFF9ZfyyeZPLLOXaMLmoV9f0Xw7UZQ2EhYR9yJ8E
	 F6UDj4NBFKYsw==
Received: by mail-ed1-f43.google.com with SMTP id da10so60871539edb.3
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Mar 2023 20:13:29 -0800 (PST)
X-Gm-Message-State: AO0yUKU8ttnoiAl45nIM2Wrj0+KVNBCXbUAKa8a0QrRVTx0m4KTsa+qH
	5EMWwpY3HbEdzhwFkMHXO3yZglC2t1VeWBwpdZ4=
X-Google-Smtp-Source: AK7set/OXHamMd30xa9MOxiTaztHdq2/uUI5fxgIghiVMrlHV5++je5CqfJuFdwe8KixFa9DHTv2yqkrJAn+QxpPD+o=
X-Received: by 2002:a50:9b53:0:b0:4ae:f648:950b with SMTP id
 a19-20020a509b53000000b004aef648950bmr9192549edj.7.1678248807011; Tue, 07 Mar
 2023 20:13:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221231235541.13568-1-samuel@sholland.org>
In-Reply-To: <20221231235541.13568-1-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 Mar 2023 12:13:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTgV=xTq-vqf4KHcpcRndp1=o74NebvAVfpC8CMRv8qWA@mail.gmail.com>
Message-ID: <CAJF2gTTgV=xTq-vqf4KHcpcRndp1=o74NebvAVfpC8CMRv8qWA@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 0/5] leds: Allwinner A100 LED controller support
To: Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Heiko Stuebner <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thx Samuel,

On Sun, Jan 1, 2023 at 7:55=E2=80=AFAM Samuel Holland <samuel@sholland.org>=
 wrote:
>
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
> [1]: https://lore.kernel.org/lkml/20221231233851.24923-1-samuel@sholland.=
org/
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
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun5=
0i-a100-ledc.yaml
>  create mode 100644 drivers/leds/leds-sun50i-a100.c
Acked-by: Guo Ren <guoren@kernel.org>

>
> --
> 2.37.4
>


--=20
Best Regards
 Guo Ren
