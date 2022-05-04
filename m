Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5F33C9
	for <linux-sunxi@lists.linux.dev>; Wed,  4 May 2022 17:16:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y21so2464742edo.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 May 2022 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiVARxmXu8FTB4rwzADnzbXFPdjI8umDaxKRYynAmhQ=;
        b=TM8GmEt9YloR+Qv/mT7g6w8/+iPNVgrRi+Ym/LhHMZs79+zWcr0aTLLrivUDaliIeA
         EnMUEa1WnJ5vxOOWyNvJDBmcFkbhcebsTJc46wwYpoxg7fD2m6r3Ukywyhaol4FYRU7N
         PV8Y+wrHKtCH5SntwUq5U5sd3spaKzbBrCYpt3eJRuEBc9yUwJN+7UvXUzEudPfsOtQK
         /RBagaBch5I2IBx1KoDObN5OJH6dOYJqPbNHOz/hmnjUfUQ079jWtigdWh0ns+UtGbgD
         EGVQ2d11luLHCuL1cMlOQgu6BYedUk34XhQKzv6PfeFLf19uZevzfC2btvS6LiE4LZ4a
         n4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiVARxmXu8FTB4rwzADnzbXFPdjI8umDaxKRYynAmhQ=;
        b=hUWAbjtagUM0qc5KeCKVRhPFZGqYa8Lsq3s5Fjli/8XeWTG87HpVI4EA1Hnf3OVx97
         MEL5QGbXUA4HjSv8NNwBRzCbBjhDCJ/GnQtOAEIXus7Fi8I3FpaZxBhf6MhcnhWnDRaG
         3Ri2WknAX5CarV36ECyN9R3RW9jJuuPJrF+cf+VBuYPNYAXAqSY/I6T0OzJKH/lwWEb9
         tYWGsZG/SO7K5Hl+Lb04Rjdhj/oXXxssnJyicKy74ifbZY/gNxT/WOaacFzNkEYYnPfO
         CquX7cVzSdEnA9j4A3iagHbB2FdTOUrzNkMG9V1ym1JFCsUw+JTBPHTfQq+J/AIiYwYI
         NUXg==
X-Gm-Message-State: AOAM530/qINzAu8Gu5GiNvAIRPzPi86vItkelkin/FTTfTIMoeOfqY08
	DJTLb7HrnFCBtnfx3hddYcI=
X-Google-Smtp-Source: ABdhPJwRgFhXMv3zDJ3kdKMXaXUveRvG3cyjmR3eLowMukINPTS5zG+/xCtn0bwMVjkNnvoixZkH8A==
X-Received: by 2002:a05:6402:2397:b0:426:4967:8574 with SMTP id j23-20020a056402239700b0042649678574mr24704358eda.197.1651684613103;
        Wed, 04 May 2022 10:16:53 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id v23-20020aa7d657000000b0042617ba639esm9386887edr.40.2022.05.04.10.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 10:16:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: writeforever@foxmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: f1c100s: Fix signal name comment for PA2 SPI pin
Date: Wed, 04 May 2022 19:16:51 +0200
Message-ID: <2507520.Lt9SDvczpP@kista>
In-Reply-To: <20220504170736.2669595-1-andre.przywara@arm.com>
References: <20220504170736.2669595-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 04. maj 2022 ob 19:07:36 CEST je Andre Przywara napisal(a):
> The manual describes function 0x6 of pin PA2 as "SPI1_CLK", so change
> the comment to reflect that.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c b/drivers/pinctrl/
sunxi/pinctrl-suniv-f1c100s.c
> index 2801ca7062732..8109efac341e2 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-suniv-f1c100s.c
> @@ -51,7 +51,7 @@ static const struct sunxi_desc_pin suniv_f1c100s_pins[] = 
{
>  		  SUNXI_FUNCTION(0x3, "pwm0"),		/* PWM0 
*/
>  		  SUNXI_FUNCTION(0x4, "i2s"),		/* IN */
>  		  SUNXI_FUNCTION(0x5, "uart1"),		/* RX */
> -		  SUNXI_FUNCTION(0x6, "spi1")),		/* MOSI 
*/
> +		  SUNXI_FUNCTION(0x6, "spi1")),		/* CLK 
*/
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -- 
> 2.25.1
> 
> 


