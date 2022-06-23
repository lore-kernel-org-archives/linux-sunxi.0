Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6806143F0
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 09:03:50 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id n15so10863108ljg.8
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ozaotd6LY3ERvzpwuGvbQZTaC8kPny1azl5sB1Hldp8=;
        b=N+E4E6aBHykbEoIC0lGs7IRiK7feaBLf/CkLd78oSXziwtTtGtoy3tXA3mN4u+M1+H
         2lEeyKhEQm7uMBzKjVgfV32iv3ycYBLlXefCytlCiYeWvc1vlkkqeVdHyvQa/4I7awPw
         +yqS6OsEIt1tCt5xFxEtaCt0oLEVSvoZwtAwW4dIcdORniXK5c03omQkgHXW3VVUbG5+
         pCxDaxADdI5OOyGHM8VigOdxW8fFm9ClSBdiUkl8+LnNLmV81U1i7QDLpG5qCPGM/ib4
         ezVP1RIDjW8Fye2pDE0ph9F+Vj4aLCnvOMeonKSMKU9+nmoEZVsNcW8/ABtqbLZ0wEk1
         ujjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ozaotd6LY3ERvzpwuGvbQZTaC8kPny1azl5sB1Hldp8=;
        b=TOHePS/n21gP2x7heTI0AgK9vdo2AG7HmGR/Pob9FxxySL4YXbw8q7TaEpbhBRwt37
         cvOzFAAyakzVyAzrHRIA1KTnIPXBHNbbN7Xq55ymxyNUg0/iqLvyxGYQbB6+VmI3stSG
         fyEVfG/q2hmfh0RoHqRgofWYtH6Mw3/TCRI6yPTwmx76LeLoWy/P3qLnW6jO3T4ihH6V
         4A1UWonSepK3ODTDWDwfF7uCzGAYqgLUXa17eHMdWjA+gcFUYjIkCWAlRGDptB/lOzJ0
         +mnHhXGnaazjnWEvCwjPJumiKlhmkM4x39qdxDBMagLiMR/RRWe/WMB0xkv7oDEwFmC6
         keVw==
X-Gm-Message-State: AJIora+BK4PRxif0uXpHADzioqCVJKQ/bNUtHtQkzRBGUE9lw/K12YQD
	51tECUb9ZLK0YfkFLNgbljE=
X-Google-Smtp-Source: AGRyM1vF1zU4Gj87rqZsJvaSlU5/WAIf+VWD8fk9zG8OB0wQ+t7uncoazUPPDPmBI+qN6/ToK7aL7g==
X-Received: by 2002:a05:651c:1609:b0:25a:86a5:9eab with SMTP id f9-20020a05651c160900b0025a86a59eabmr4055972ljq.61.1655975028288;
        Thu, 23 Jun 2022 02:03:48 -0700 (PDT)
Received: from [172.16.189.61] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id s16-20020a05651c201000b0025a73f7aa3bsm1153452ljo.96.2022.06.23.02.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 02:03:47 -0700 (PDT)
Message-ID: <415e6876-9304-9493-369e-d5eca0238bea@gmail.com>
Date: Thu, 23 Jun 2022 12:03:43 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 02/49] regmap-irq: Fix offset/index mismatch in
 read_sub_irq_data()
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, broonie@kernel.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, bgoswami@codeaurora.org,
 gregkh@linuxfoundation.org, rafael@kernel.org, cw00.choi@samsung.com,
 krzysztof.kozlowski@linaro.org, b.zolnierkie@samsung.com,
 myungjoo.ham@samsung.com, michael@walle.cc, linus.walleij@linaro.org,
 brgl@bgdev.pl, tglx@linutronix.de, maz@kernel.org, lee.jones@linaro.org,
 mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, rjones@gateworks.com, mazziesaccount@gmail.com,
 orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/22 23:05, Aidan MacDonald wrote:
> We need to divide the sub-irq status register offset by register
> stride to get an index for the status buffer to avoid an out of
> bounds write when the register stride is greater than 1.
> 
> Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>   drivers/base/regmap/regmap-irq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index 4f785bc7981c..a6db605707b0 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -387,6 +387,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
>   		subreg = &chip->sub_reg_offsets[b];
>   		for (i = 0; i < subreg->num_regs; i++) {
>   			unsigned int offset = subreg->offset[i];
> +			unsigned int index = offset / map->reg_stride;
>   
>   			if (chip->not_fixed_stride)
>   				ret = regmap_read(map,
> @@ -395,7 +396,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
>   			else
>   				ret = regmap_read(map,
>   						chip->status_base + offset,
> -						&data->status_buf[offset]);
> +						&data->status_buf[index]);
>   
>   			if (ret)
>   				break;

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
