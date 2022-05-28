Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919D23C2
	for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 09:18:09 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id q1so7127705ljb.5
        for <linux-sunxi@lists.linux.dev>; Sat, 28 May 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=emBIciAFdQnHcKQSohgcuqMQM4xd/Tz5hPJWkxKaoqpZiunJ9s/OTs4WGMG95NSW4L
         IgZczc+9GJXxJcHaJPXn5wGWSwvNNr7NK0iPiKDna7ZgvHSU3H+3cqKDq++bLMIID/pg
         WGi2IGkojhYGQUTThKK+rMJIPdLBixIvgKrHxkmswTwOqRnEJD7L5yQqGEaEOrvK5lk+
         qkpbzv53N91WJdtTRf68St7YDzO4K7K4CZ379sj7xnW+IFrVVRAmkaJKxBPwkYKBzJkg
         l3Y5YpoNbKupcj3Ag1FqEF0wqmBD5ctEDUT8y+jgldf7YfuRmpnjc1XtWB+r4HJU6Val
         yWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=i9X9NbC75CNdwbUU8+mWwsnjbMDGCpPboklIOxrZrg4u0YLTfBTQNaDsxcSMw74nHr
         Kp6zqsCSf7MwXBMtfD8gm5szdIUfqplx47J5X5aAVGRGZeQ+paX1C5xIZDOubm7vsz4b
         NwIryubSoR0CnkJt2imUBU9mUk2MhL/c9IaL99GautOMxsDhJdl6wkVuLV9weEQN6CcI
         4CwyOYnFZuYN1QRpcI5WEmOIJAlgJ34yd6cyljHalDsf7r/NZ2TMhY5BuMqm7NIn9fDv
         C+JtKvYWkXkU9sgEhwQwmoog/6uF8D63zElKAeD7rl3wCt7yoSXA+TED/doipcvEGLfP
         qpCQ==
X-Gm-Message-State: AOAM531j6LimulxWlxRADFqk8rtuKcHX6unpYd7AyAqRcN9wQqPtMJh7
	22NDre4OHGLt4wRL5ncwBgg=
X-Google-Smtp-Source: ABdhPJxNkzG4eousUKAj15zHH6g3YqSnU9H8B29bmyYBmgxkfeUg1JCXHoHxE95njq7TczFOLpZl7Q==
X-Received: by 2002:a2e:a5ca:0:b0:253:c604:647c with SMTP id n10-20020a2ea5ca000000b00253c604647cmr27577549ljp.403.1653729487689;
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id v9-20020a2ea449000000b0024f3d1daee2sm1402828ljn.106.2022.05.28.02.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Message-ID: <454f31e4-12ce-2bee-8e95-d75854b34380@gmail.com>
Date: Sat, 28 May 2022 12:19:20 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
 linux-imx@nxp.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 daniel@zonque.org, srinivas.kandagatla@linaro.org,
 linux-rockchip@lists.infradead.org, krzk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, jarkko.nikula@bitmer.com, heiko@sntech.de,
 jbrunet@baylibre.com, kernel@pengutronix.de, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/05/2022 18:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/ti/davinci-i2s.c   | 2 +-
>  sound/soc/ti/davinci-mcasp.c | 2 +-
>  sound/soc/ti/omap-mcbsp.c    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index c7368d5296688..fe572b720b094 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -606,7 +606,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.prepare	= davinci_i2s_prepare,
>  	.trigger	= davinci_i2s_trigger,
>  	.hw_params	= davinci_i2s_hw_params,
> -	.set_fmt_new	= davinci_i2s_set_dai_fmt,
> +	.set_fmt	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
>  
>  };
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 961bac6963652..e2aab4729f3ab 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1620,7 +1620,7 @@ static const struct snd_soc_dai_ops davinci_mcasp_dai_ops = {
>  	.trigger	= davinci_mcasp_trigger,
>  	.delay		= davinci_mcasp_delay,
>  	.hw_params	= davinci_mcasp_hw_params,
> -	.set_fmt_new	= davinci_mcasp_set_dai_fmt,
> +	.set_fmt	= davinci_mcasp_set_dai_fmt,
>  	.set_clkdiv	= davinci_mcasp_set_clkdiv,
>  	.set_sysclk	= davinci_mcasp_set_sysclk,
>  	.set_tdm_slot	= davinci_mcasp_set_tdm_slot,
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 5bfb56d4ff844..58d8e200a7b97 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1271,7 +1271,7 @@ static const struct snd_soc_dai_ops mcbsp_dai_ops = {
>  	.trigger	= omap_mcbsp_dai_trigger,
>  	.delay		= omap_mcbsp_dai_delay,
>  	.hw_params	= omap_mcbsp_dai_hw_params,
> -	.set_fmt_new	= omap_mcbsp_dai_set_dai_fmt,
> +	.set_fmt	= omap_mcbsp_dai_set_dai_fmt,
>  	.set_clkdiv	= omap_mcbsp_dai_set_clkdiv,
>  	.set_sysclk	= omap_mcbsp_dai_set_dai_sysclk,
>  };

-- 
Péter
