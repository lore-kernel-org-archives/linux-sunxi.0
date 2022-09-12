Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9623232
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 16:14:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso7521558wmr.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=p2UuUVGgNeM7cWoN9co4RiFexO2JQRrTt6fDZRT2l6Q=;
        b=WjrnQt4bUeUHZEbDpxtLxWOhdOwi5lTqQ099s2SU4zwqBVZeCaJ99AWi+Lje4bC1nB
         O3tzwj3cB/y8uJIrxyAMmpAZZiZE1oAoe+CmU6tvH6uuu7kRH4qjFLTPX3X+w5dUwOFX
         o8co/TSCDVVOqEY+F9a2elNlGE789+JRJGg/2swqnsMphCm5dTxSs6un8KvwqrN4el9C
         w0tyhgDMmpoZdlDcn3+rt2sQ0+UJNLN3YSXLC/LCoofMNzJoj+5eLDxrmnRvgtE8+/mt
         XEj06YGEsdvvuzfqdQzL+utyOMeqWfZy+0ykcJCPkT0Rne+IksX8EnxcGIR/uJ517dRo
         zh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=p2UuUVGgNeM7cWoN9co4RiFexO2JQRrTt6fDZRT2l6Q=;
        b=ZqIuKfgQpqHgL+BjU925YORIkQNvRy4cCtTypAlY5+6/8oxMFjB4+qOqIesVAFPjCI
         56e8ZQJcMozaKw5LOuWYKi8Zo51PMujBfBVJUWqVTomYrHuoPowM3maCNifp+vWjClYH
         RNnkNOoJEYBA6PKhpBB8YidPcu8u2jyIaYAvCJgD9n9jjtrWILE5jSOj2nPh9/O47hdh
         jAd1RfcDAnLKl+rDNDqnWLsA4rDyfqmV9Wohhrqxa2N5lLO9/nEHr9lbNpHj9Zke/Twg
         iDR+52KgPeWWLNHOb71iySpsOOXey7EWRSAzYXv5+B3EnCOLnAmUwam28RzGdoOk6Xsc
         XW7Q==
X-Gm-Message-State: ACgBeo36TGZUvjOKtXlq4oXeebjYYLOIchqJmoq5oUqvOpyOyaEBj/Qi
	qu8diBbjt25K3DnFqoJacRU=
X-Google-Smtp-Source: AA6agR6TxM9HREIppAFy4INv7lrvGZZIc1xY0Z0z6Wz7xBGrYJrUQHdC7xeeaLg8OPCnLJ3WpI/YYw==
X-Received: by 2002:a05:600c:1c1f:b0:3b4:8330:5a46 with SMTP id j31-20020a05600c1c1f00b003b483305a46mr5102190wms.45.1662999285997;
        Mon, 12 Sep 2022 09:14:45 -0700 (PDT)
Received: from jernej-laptop.localnet ([89.101.193.71])
        by smtp.gmail.com with ESMTPSA id a6-20020a5d4d46000000b00228aea99efcsm7717117wru.14.2022.09.12.09.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 09:14:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in probe
Date: Mon, 12 Sep 2022 18:14:44 +0200
Message-ID: <5600291.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220911145713.55199-1-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 11. september 2022 ob 16:57:11 CEST je Mikhail Rudenko 
napisal(a):
> In the case when a codec device is probed before codec analog
> controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
> a misleading error message
> 
>     sun4i-codec 1c22c00.codec: Failed to register our card
> 
> even if the device is probed successfully later. Use dev_err_probe()
> to demote the above error to a debug message.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 60712f24ade5..01b461c64d68 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1825,7 +1825,7 @@ static int sun4i_codec_probe(struct platform_device
> *pdev)
> 
>  	ret = snd_soc_register_card(card);
>  	if (ret) {
> -		dev_err(&pdev->dev, "Failed to register our card\n");
> +		dev_err_probe(&pdev->dev, ret, "Failed to register our 
card\n");
>  		goto err_assert_reset;
>  	}




