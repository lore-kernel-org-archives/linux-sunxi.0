Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598013232
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 16:15:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id bz13so16192199wrb.2
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=M0xmdgrmwbDBhsKXm8W2iTCB3o2g5k9UR6WS8CgTgAc=;
        b=Oxw61ItYOZEFE3R9dscWj0YuzCJ7CCVcOrfiBfKNEDsx/Aq5ErBXBfqZbtvfWuPX++
         i2mEGSZ0rWDJAjlRdBKMC8BZ62bIvCziS/Es4XF0lhgcdQwWC6L/OPhmn69JU3ttZAsI
         9cVmlIdvu/F965sUahklPfNqgAjA6e5Q63oZ15mvA7U7ExYUlF1bIxpJPc7pC0JWw5ty
         GLQs9oBo4z8LYnpw4VhiY0AbUYwQdhgV9t7bYpBkELDCW6CWThwbEaN4UseBm6BhakFw
         44wQuMX0ozZjSAvtzBdqncTB2L/7M404U0QQ89tU9gN6Qk8vgLF0AohgO8It/rvmRI2p
         LKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=M0xmdgrmwbDBhsKXm8W2iTCB3o2g5k9UR6WS8CgTgAc=;
        b=lVHfMLyngMTfo43IzoHdBnjj3+Fl8MiklutIOoG7XB+d9Cp0iaZN9PPB5ufescWSpI
         gHOjfFhW/zD8F9TfiwBbXERJmtfzsGb2G3kigoY6Ou3u7uC3uc43Vc5m3P3q5TAlb2e2
         MXcxQjBKeu0gp8mlX5U4/OvkjKYet/JbgUzB+a4OtESyZyJyhtx5nGVYLfamDo2wOKr+
         FGKwKDuQGryMCshYR/+Um0Y2JIixpeH9dgTBlDCbViUmrztZvO8iqkq3/LK4PuvRW54n
         Im2U06CJ/RLYfgapYIV5U9Kv9dx/N2TF+EE0ukh338kiMvL+3y9AzOgeF9K5ljSuhywm
         JpeQ==
X-Gm-Message-State: ACgBeo0UOfx/N7CQxT9y8Nf96rKurkWVlhf4SPn5efm/g7AlcMISTKkv
	FKCwcbTEm2Moc3n/1zGyWjE=
X-Google-Smtp-Source: AA6agR7iIstenSIVzqPRm91CXrgAFC5OzE2haezdyWa1MRmbRFznZs+R7yo6gnPmDP2SRl48i3jbAw==
X-Received: by 2002:adf:d1c2:0:b0:22a:66ad:2669 with SMTP id b2-20020adfd1c2000000b0022a66ad2669mr4996100wrd.468.1662999312594;
        Mon, 12 Sep 2022 09:15:12 -0700 (PDT)
Received: from jernej-laptop.localnet ([89.101.193.71])
        by smtp.gmail.com with ESMTPSA id bo23-20020a056000069700b0022a3517d3besm8549700wrb.5.2022.09.12.09.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 09:15:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU DAI component
Date: Mon, 12 Sep 2022 18:15:11 +0200
Message-ID: <4766008.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220911145713.55199-2-mike.rudenko@gmail.com>
References: <20220911145713.55199-1-mike.rudenko@gmail.com> <20220911145713.55199-2-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 11. september 2022 ob 16:57:12 CEST je Mikhail Rudenko 
napisal(a):
> At present, succesfull probing of H3 Codec results in an error
> 
>     debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' already
> present!
> 
> This is caused by a directory name conflict between codec
> components. Fix it by setting debugfs_prefix for the CPU DAI
> component.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 01b461c64d68..4d118f271e8c 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1253,6 +1253,7 @@ static const struct snd_soc_component_driver
> sun8i_a23_codec_codec = {
> 
>  static const struct snd_soc_component_driver sun4i_codec_component = {
>  	.name = "sun4i-codec",
> +	.debugfs_prefix = "dai",
>  };
> 
>  #define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS




