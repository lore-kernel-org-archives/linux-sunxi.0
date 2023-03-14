Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A7A939
	for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 20:02:03 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z21so1527703edb.4
        for <linux-sunxi@lists.linux.dev>; Tue, 14 Mar 2023 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2aWBeYsPOZw3VmzBEuzhxtl3VZ6kigXr5nDO9DM/2U=;
        b=bVqRHzowBzQ9FMJbsHRWs2Sxoz9+ZbXHdXaXS4je98WG9lHtpb1qZVJ9znZEWYJVqT
         LQ3HelJFg+kQZSxnNKkXTwdwaR0oEDzesDv4vqfXGLusNTVsbsMoIybrszJ2jouYLb9o
         hAOFFqXzZyWPIDpfyzC1HP5A8QWtE0SbsLPPVutFanTXOH4iiN/r02II7I2GlKjU9JqG
         OFfug2LvE6qPrVS5UCZ5nyutVbYX9bLqeE7TIkx2MnwB0rZO6vpV0Zk23a36jD7Hr0aP
         +vnSq7qP5oorUz7zDNMPjZRYI7O0y2AYmgsSogANCY9dGpIvignMjWDasiPXuGPG+cVm
         vV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2aWBeYsPOZw3VmzBEuzhxtl3VZ6kigXr5nDO9DM/2U=;
        b=37J+RXgF1I/0mBRJXgy1tDbJT3lLQazkMsjSuYk3x2O9w3ruSnmomZo0WskpR5HpyA
         ZKPB3YHst71VrRIDDcCK5lkmnbas7XRe8cdUFlt475qQ1kWP6D3HZ6IJNyngJq8h2rmc
         HAwVwI0FaUpe26cJWD06Xliu77sMatJhD3PF3nr94vhm5y9cwtvxLF8vZAkmmZUGYQ8x
         Krl6f8hi5KiDyu27PEHmIZf1kxRvOr86yQIm8NgJQnjWZwKCGt2j0R0LFj0I3pwlBPdv
         AXNvGrYmM59yaQIt78NxxBLG45lsttRJjuvGl64crPLxbDS9/aX5NVc4cl8Tfnk8LJwt
         0+6A==
X-Gm-Message-State: AO0yUKWpTrrcc72zdgtDiHKXPQ0QOD54m5AMaSPN0s51JypeIP8TZ/TP
	GjngiP9pdm06v6Z0ndSMXIM=
X-Google-Smtp-Source: AK7set9e9EO060s4bRckBVlG+IlgdCeWavxzh4N5oYIX6Pb2j4hXy67uRYvwwfD6th6kq9HthDHzWQ==
X-Received: by 2002:a05:6402:ce:b0:4fa:96fd:797b with SMTP id i14-20020a05640200ce00b004fa96fd797bmr363385edu.6.1678824121330;
        Tue, 14 Mar 2023 13:02:01 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id lj6-20020a170906f9c600b008bbc9115038sm1534607ejb.56.2023.03.14.13.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:02:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH] pinctrl: Use of_property_present() for testing DT property
 presence
Date: Tue, 14 Mar 2023 21:01:59 +0100
Message-ID: <3218406.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
References: <20230310144721.1544669-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 10. marec 2023 ob 15:47:20 CET je Rob Herring napisal(a):
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-moore.c |  2 +-
>  drivers/pinctrl/pinctrl-single.c         |  4 ++--
>  drivers/pinctrl/pinctrl-stmfx.c          |  2 +-
>  drivers/pinctrl/renesas/pinctrl.c        |  4 ++--
>  drivers/pinctrl/stm32/pinctrl-stm32.c    |  2 +-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c    | 20 ++++++++++----------

For sunxi:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  6 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c
> b/drivers/pinctrl/mediatek/pinctrl-moore.c index 007b98ce5631..8649a2f9d324
> 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-moore.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
> @@ -586,7 +586,7 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
>  	 * Documentation/devicetree/bindings/gpio/gpio.txt on how to
>  	 * bind pinctrl and gpio drivers via the "gpio-ranges" property.
>  	 */
> -	if (!of_find_property(hw->dev->of_node, "gpio-ranges", NULL)) {
> +	if (!of_property_present(hw->dev->of_node, "gpio-ranges")) {
>  		ret = gpiochip_add_pin_range(chip, dev_name(hw->dev), 
0, 0,
>  					     chip->ngpio);
>  		if (ret < 0) {
> diff --git a/drivers/pinctrl/pinctrl-single.c
> b/drivers/pinctrl/pinctrl-single.c index 190923757cda..0dabbcf68b9f 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -939,11 +939,11 @@ static int pcs_parse_pinconf(struct pcs_device *pcs,
> struct device_node *np,
> 
>  	/* cacluate how much properties are supported in current node */
>  	for (i = 0; i < ARRAY_SIZE(prop2); i++) {
> -		if (of_find_property(np, prop2[i].name, NULL))
> +		if (of_property_present(np, prop2[i].name))
>  			nconfs++;
>  	}
>  	for (i = 0; i < ARRAY_SIZE(prop4); i++) {
> -		if (of_find_property(np, prop4[i].name, NULL))
> +		if (of_property_present(np, prop4[i].name))
>  			nconfs++;
>  	}
>  	if (!nconfs)
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c
> b/drivers/pinctrl/pinctrl-stmfx.c index 1181c4b506b1..3c031692e44d 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -632,7 +632,7 @@ static int stmfx_pinctrl_probe(struct platform_device
> *pdev) pctl->dev = &pdev->dev;
>  	pctl->stmfx = stmfx;
> 
> -	if (!of_find_property(np, "gpio-ranges", NULL)) {
> +	if (!of_property_present(np, "gpio-ranges")) {
>  		dev_err(pctl->dev, "missing required gpio-ranges 
property\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/pinctrl/renesas/pinctrl.c
> b/drivers/pinctrl/renesas/pinctrl.c index b74147800319..5c71e168b370 100644
> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_dev
> *pctldev, * inside a subnode nor across subnodes.
>  	 */
>  	if (!pmx->func_prop_name) {
> -		if (of_find_property(np, "groups", NULL) ||
> -		    of_find_property(np, "pins", NULL)) {
> +		if (of_property_present(np, "groups")||
> +		    of_property_present(np, "pins")) {
>  			pmx->func_prop_name = "function";
>  			pmx->groups_prop_name = "groups";
>  			pmx->pins_prop_name = "pins";
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c
> b/drivers/pinctrl/stm32/pinctrl-stm32.c index cb33a23ab0c1..66a25becd8f5
> 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1374,7 +1374,7 @@ static struct irq_domain
> *stm32_pctrl_get_irq_domain(struct platform_device *pde struct device_node
> *parent;
>  	struct irq_domain *domain;
> 
> -	if (!of_find_property(np, "interrupt-parent", NULL))
> +	if (!of_property_present(np, "interrupt-parent"))
>  		return NULL;
> 
>  	parent = of_irq_find_parent(np);
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> b/drivers/pinctrl/sunxi/pinctrl-sunxi.c index f35179eceb4e..1dc1882cbdd7
> 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -224,16 +224,16 @@ static int sunxi_pctrl_get_group_pins(struct
> pinctrl_dev *pctldev,
> 
>  static bool sunxi_pctrl_has_bias_prop(struct device_node *node)
>  {
> -	return of_find_property(node, "bias-pull-up", NULL) ||
> -		of_find_property(node, "bias-pull-down", NULL) ||
> -		of_find_property(node, "bias-disable", NULL) ||
> -		of_find_property(node, "allwinner,pull", NULL);
> +	return of_property_present(node, "bias-pull-up") ||
> +		of_property_present(node, "bias-pull-down") ||
> +		of_property_present(node, "bias-disable") ||
> +		of_property_present(node, "allwinner,pull");
>  }
> 
>  static bool sunxi_pctrl_has_drive_prop(struct device_node *node)
>  {
> -	return of_find_property(node, "drive-strength", NULL) ||
> -		of_find_property(node, "allwinner,drive", NULL);
> +	return of_property_present(node, "drive-strength") ||
> +		of_property_present(node, "allwinner,drive");
>  }
> 
>  static int sunxi_pctrl_parse_bias_prop(struct device_node *node)
> @@ -241,13 +241,13 @@ static int sunxi_pctrl_parse_bias_prop(struct
> device_node *node) u32 val;
> 
>  	/* Try the new style binding */
> -	if (of_find_property(node, "bias-pull-up", NULL))
> +	if (of_property_present(node, "bias-pull-up"))
>  		return PIN_CONFIG_BIAS_PULL_UP;
> 
> -	if (of_find_property(node, "bias-pull-down", NULL))
> +	if (of_property_present(node, "bias-pull-down"))
>  		return PIN_CONFIG_BIAS_PULL_DOWN;
> 
> -	if (of_find_property(node, "bias-disable", NULL))
> +	if (of_property_present(node, "bias-disable"))
>  		return PIN_CONFIG_BIAS_DISABLE;
> 
>  	/* And fall back to the old binding */
> @@ -1424,7 +1424,7 @@ static int sunxi_pinctrl_setup_debounce(struct
> sunxi_pinctrl *pctl, return 0;
> 
>  	/* If we don't have any setup, bail out */
> -	if (!of_find_property(node, "input-debounce", NULL))
> +	if (!of_property_present(node, "input-debounce"))
>  		return 0;
> 
>  	losc = devm_clk_get(pctl->dev, "losc");




