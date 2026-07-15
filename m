Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9CE449EB8
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127795; cv=none; b=L6heQ6euNmX8fMgep4yEzYaJkv4AEPSHb+MVBxLx7/23dyvWu9dNvnhfmbhdNxgcFmlAJrcg19Zwxyu7mbhBWkMh3eznvD1ydzHnrKsVAI6D9udLahfeJZ/6IMQieUkZ8loyVqyZ6jG9VIpuPsVyZBmUPMVL0rSppFaGB1R14LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127795; c=relaxed/simple;
	bh=bkFgFNPd98s3U9j3PHlxQv8lr+Jlj7FnKHUtWJfhfy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItEtlCgKPdafKGLekjOefEGNRZhLcM/8fVb9LZRlAFs35EV76k9Vkc4pw3et08Aa/9z7tRBOOOhn6gdOinFypbq+dxyd27PwZqaMYYfeW4PLhNZojbtHT2yuOPTCeXgY1ZH+ZkjwjE/Lsg2YatAOs7Ma1wi8KF6fTXqMxq1k+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mg8SD4Xj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg8SD4Xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B212A1F01558
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127793;
	bh=s8uriDz24bpdoccH4vWMOCq6HU4t2QJ/y1gbdDpbspE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Mg8SD4XjqFxEhVvUb7Rw7m6gxyqCFykXs0hQYgBxtwU0FEDg1hLUxobvy6V29Nlq6
	 bz031aMYeEvbsRwphnMQsXDNoue1Erw2J/AM0m6tPsFEuVl4WgHM1llTKS7m8g1hno
	 swDUge/7WhaQN8ljISgS/RqJ3vMlXKtQlc/JCDMHLkL+8Xw7JoMFGPfT//si7uE2L5
	 /tlGy9TJmirzzwtkxGhbqekk9Pm9113lGpZ4Wk4Ch9OZPo3gu4kgJWzoqzn9aoyr3H
	 B5CTNcm1vat3e+p3ofvbcK+YqhDzQSjq4AMaXLeOxvabUNDl2XfDqyQsAespN/iG4X
	 649IIEfkzaT9g==
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ec1e9d3359so2012836a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 15 Jul 2026 08:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPANeRPKY/7d4sjyAHpvbXpRHNy/RMqeBPBTBd32RwBqD5Dc2QSEiO1KhQuwKiBKazxH1AheK7oPtS3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoZQVV2oNShEUp71jD6bVP3TsL8CkhgInwqiGsCo5fB4UmCFNw
	PTmKqez0l5YKYz9syaeVu/bTEjKiddBLQ7/yZL+mVtMSEkuBZkzUq9jiKHf+nz2hk/Oa1vp3Khc
	4W2PPHJCR6tsOZ+EGowdJGGBhw2hLzzk=
X-Received: by 2002:a05:6830:290a:b0:7e9:e19f:c015 with SMTP id
 46e09a7af769-7ec423e1b9amr4763700a34.30.1784127792848; Wed, 15 Jul 2026
 08:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-3-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:02:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
X-Gm-Features: AUfX_mzAhYE5GHJMqIrUkkUhLvN9sPzUv98iZb5X0KnS9-GyHXUfIRnCGG3q2Ys
Message-ID: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The called functions already log failures where appropriate. Return the
> original error directly and avoid duplicate error messages.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.=
c
> index 05308df3ae5b..71f7a1fedd88 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -2380,31 +2380,22 @@ static int sun4i_codec_probe(struct platform_devi=
ce *pdev)
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev, quirks->codec=
,
>                                      &sun4i_codec_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register our codec\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         ret =3D devm_snd_soc_register_component(&pdev->dev,
>                                               &sun4i_codec_component,
>                                               &dummy_cpu_dai, 1);
> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register our DAI\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);

snd_dmaengine_pcm_register() doesn't seem to print an error when
dma_request_chan() fails.

> -       if (ret) {
> -               dev_err(&pdev->dev, "Failed to register against DMAEngine=
\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         card =3D quirks->create_card(&pdev->dev);
> -       if (IS_ERR(card)) {
> -               ret =3D PTR_ERR(card);
> -               dev_err(&pdev->dev, "Failed to create our card\n");
> -               return ret;
> -       }
> +       if (IS_ERR(card))
> +               return PTR_ERR(card);
>
>         snd_soc_card_set_drvdata(card, scodec);
>
> --
> 2.43.0
>
