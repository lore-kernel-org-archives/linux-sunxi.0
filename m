Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEBB179AE
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713984154; cv=none; b=GdT7rZ+7EEj2mt7SOHm5WS4R/L2e+suPioQtjEtWEZfe8aQpA3sCOzD7HJrLvrN+REfzVuZJHTRp3g2P7dK8Xx3WBEfAV1xdFF2EFRQZXhd7i7x3pLS0SwEsDRs8X2abyw49F3YKnU8UjIl03hPGmCxyZnj9EYdytXeFjC+d6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713984154; c=relaxed/simple;
	bh=Itcg+Jd23ZQ0QilHdje/jSd9t3UqWVBHp9CbQrEwRDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekXTFcIgRJTYAOecdC1AhAZinbchOnxZ/Sy6qyG4V5aBZj+WvCBaCegDMjZWRBf6zKfBd+ze/EFrCQgXgPgG5hqGVw962WEwOnKfkyj0a/xtsT1KfX1KwlScr/H9ru3CZcrTZN1hSKzPLgX9Y2mmzgQ5kppvMVFM5/IOAOb/R7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPvb4Fg9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPvb4Fg9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-571c22d9de4so114283a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713984151; x=1714588951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ol9krzBmTOyIuy1ft27l71rabBxmYrw1+e+89jby570=;
        b=iPvb4Fg9TurPEfdOJvZdXRqa7VOmPgwzjtSD52l3qDAmUV9zQiVsUK6lNzUmxX5nPR
         y1GvOthhBrknDCNSB0ZeS4wwLLYkyCieFU7lqEiBRVA7zs/Iv3VCQhoA9rwkzaJXr1m5
         85llMP9asaVfosVV4fRGJ6UIZfHNn3T0gJF4WKii/GoftYER8gwdhg98EcFOk4L0nijd
         Vw34APnGzK0iD/6oMDTPzaPQJ132HDpejj84hdAwqEiXEGBfO3pqSqFgoNLEOq8/qY+Q
         tqxHdgt2+S/Bici7DS3rOtMhKMezu7ULzAQcTcim9o6Ult+HHhy9rSmUtZVSlt/QnB5Z
         AqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713984151; x=1714588951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol9krzBmTOyIuy1ft27l71rabBxmYrw1+e+89jby570=;
        b=DTf9QGk3/y6IFL3QwcUsKAC4d+Zj7w6jX7hqbf+OZ9xurL9YV8uqg9sQ56JR2LT/5I
         G6Ivm8WcGlWqXW/tki7Q3XK/vE98WV1EEJ1JTsA7RabbYU+Z0vp0rkYeZ1dJkAP2ALEy
         3shYbnmFdbRQCDOqq2mKSfHMNhN6FPQ/eXPKhwQHxotG5bruVVwVSC6DYh/rm69aud2M
         yH+DQx+T5x+0jaSEvn1B0MsOrB4DFP9A793gwUfTU94f8gTlNwYmasqD2zMI1muDWbFZ
         I704JVOFx/qMgPK3hIMFaoq/18l6vrND3LF8/wR9cf2MLHufdEwy7GnRbNS3X9O1hUC7
         QXzg==
X-Forwarded-Encrypted: i=1; AJvYcCXfgE9RJL+b4qjgR094Llx4od44Td+XKkFMBxIkywo5yMQpktnGeeh28+EqDOWSsCZdL9dO2xJEEGRvDpGT3CgjaM/WH+kqky8TM0g=
X-Gm-Message-State: AOJu0Yz4Z5EQeEm5bhsi81+kmCi0lCSH0WTv9yC4fB51Z3noBZvQfjKv
	lib6sHH8P/9ps5qsZLboDReNavgFs+jyglmdzV7/ECgCBVyoZeWE
X-Google-Smtp-Source: AGHT+IFJqfBO5mQOjDTG16NEhTc1tvbEXpcR5UL3y/xbDmPZLBWl1fVr9z9AG8k1xyje5QaUGr0gWw==
X-Received: by 2002:a50:9e64:0:b0:566:2f24:b063 with SMTP id z91-20020a509e64000000b005662f24b063mr2220945ede.23.1713984150928;
        Wed, 24 Apr 2024 11:42:30 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7de82000000b005720e083878sm3644714edv.49.2024.04.24.11.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 11:42:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Joao Schim <joao@schimsalabim.eu>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ASoC: sunxi: DMIC: Add controls for adjusting the mic gains
Date: Wed, 24 Apr 2024 20:42:29 +0200
Message-ID: <5772237.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20240422150213.4040734-1-joao@schimsalabim.eu>
References: <20240422150213.4040734-1-joao@schimsalabim.eu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Joao,

Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napisal(a):
> The AllWinner H6 and later SoCs that sport a DMIC block contain a set of registers to control
> the gain (left + right) of each of the four supported channels.
> 
> Add ASoC controls for changing each of the stereo channel gains using alsamixer and alike

Add SoB tag.

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..f8613d8c3462 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -14,6 +14,7 @@
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> +#include <sound/tlv.h>
>  
>  #define SUN50I_DMIC_EN_CTL			(0x00)
>  	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> @@ -43,6 +44,17 @@
>  	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
>  #define SUN50I_DMIC_CNT				(0x2c)
>  	#define SUN50I_DMIC_CNT_N				(1 << 0)
> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
> +
>  #define SUN50I_DMIC_HPF_CTRL			(0x38)
>  #define SUN50I_DMIC_VERSION			(0x50)
>  
> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
>  
> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);

DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE should be
used instead.

Other than that, it looks fine.

Best regards,
Jernej

> +
> +static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
> +
> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
> +                       0xFF, 0, sun50i_dmic_vol_scale),
> +
> +
> +};
> +
>  static const struct snd_soc_component_driver sun50i_dmic_component = {
>  	.name           = "sun50i-dmic",
> +	.controls	= sun50i_dmic_controls,
> +	.num_controls	= ARRAY_SIZE(sun50i_dmic_controls),
>  };
>  
>  static int sun50i_dmic_runtime_suspend(struct device *dev)
> 




