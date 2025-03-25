Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B491DB154
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892997; cv=none; b=OQ5/ZHHLVvFEbsZCb48nbPgSjCZ4Gceg7UREUb5KXJWuQrLdhKnLHvtYI8gt2+u9ySBrdx6K9oQ1Xdm/pnnP+QSs2KEl8B7PRpwCzxSm1NtANYWcVFMmIOH3jyb0iLMF2qM2GBfEFdwvuUn79eiumKnbEe2+kXMsJSwozU9gZs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892997; c=relaxed/simple;
	bh=pF3R+3YDau9KUabMuvlU3fzSyQgYNUpoXNHr0OjVo2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VL6bUD2l2pnVyyhJUDJHTZ2xLfQLdTxiPvFNnIldIMyT12V7Zc7zOYkREKdSK1hGRqa+Nn/8mCYJKfpiXI2UBPmMK87uv7EQVbAGvHgaCT3QqEYVvlcqFxdDrTwsJKNdK5dFAQuwT5MeRpBaV7NB9GDhIk+fPWetDN4bAOT37Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so50897971fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 01:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892989; x=1743497789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yug/5aBsatlN0TKX/juq/d600tRujIOyiR7/duVhtrI=;
        b=m83qUgNz+gNkv4IKK9uw6GdVj2YRb2PagjIo4JgV9R6BzwXsgr0zOSDaxVtKikqEG9
         ROJKZfFK7UKoU+zP4JCFgChI9xKf3PgLc2oMjGa0iWWA0urOhF0KkhANqLTPpz5MLtTZ
         CCNfy5oZdhKfjYX1CSBCvsFWkeDWTKgqMdPD0aANijhvu5pZss0ALCgcck1+nQSjBWyd
         A3ixJ9ZvCP//qE+aEIlMhgCo+0vrjEerO/UI/G8i2/6Ragh/DEuqjSDakxtoEjPkkvGM
         kZWv3irmmZNeYKIKDmvLFwvwxNuDcKzalWdF23/nWkRYyvoOhUJgG18i7x0aD3+Anm5m
         yDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCULWn59a2aMi41myzuFBRx+lU0bMdOU/DM3YEkPQjs+U/zJNAqqh1BwQy2sQolRLSccp+8dL9rZeWjLHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy78smTBQ72JOK8tDrCr7VBi0Pd7EsY4qA1O7T/vxQtWJQVr76L
	4Qff9MDcZCAqiXnhijxVoZdJG3PGf8mVf/UhMw/Th7wxtetQe2DQxAUYVYo/
X-Gm-Gg: ASbGncsHYgr1jzZaNRWKVX41KMeCNkT31u9FzLBFuzPXC65GkoIVUWy8OJ8L2WAZdOF
	1KGgnZyvfZDD5x1BSSxRe2ffsI/cjl7C1OMNGJUwSgXIoOvphWnmRYLMw+Uy1qRckkFGmnqXN8i
	gYRPXMfLmQYVuaGQZAOjht1LY/sLwzlghl/J+jOhUfO+Xq9++lz4F4txf1VMXPoDu0SKRm2LBZb
	slJT6Fud2c4IWO4wzXZ0DyjVKtWrX2hBUhZsJTQ/aDU0CCf15ma4F/frC0iJPNfMadRjCS3ZWRr
	WXrFc6XWQKpfUIlM0tTV+wmvO8CtlR6gTCTm4nb/3QnWpBozr99lhuSJ6lDHFWJhQgN6rpJRrOA
	0xQ==
X-Google-Smtp-Source: AGHT+IFFhxX35Vmw78V7Z5fIn/18wNmovlQ6G4QXfz6TbmbY9FZ7D+wQVhUnHz/6Qc0JEfdwjku89Q==
X-Received: by 2002:a2e:88c9:0:b0:30b:be53:bdd4 with SMTP id 38308e7fff4ca-30d7e234f06mr49928191fa.20.1742892988762;
        Tue, 25 Mar 2025 01:56:28 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d8f3c93sm17949121fa.82.2025.03.25.01.56.27
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 01:56:28 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so50897291fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 01:56:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW12R4tYG1BlmLz/JhNYf8OtyvdGFJrtExar3C8ZClMjLDRd3n8C//VNnDQSxyJcn42FvoS9hL6jrddFQ==@lists.linux.dev
X-Received: by 2002:a05:651c:221a:b0:30b:971c:96e6 with SMTP id
 38308e7fff4ca-30d7e2a2635mr57206101fa.26.1742892987667; Tue, 25 Mar 2025
 01:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250325032833.604073-1-nichen@iscas.ac.cn>
In-Reply-To: <20250325032833.604073-1-nichen@iscas.ac.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 25 Mar 2025 16:56:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65e8Hk7aZ543pEXYKJ9VDs1znuCtaDDdCOfaRKWrT2MdA@mail.gmail.com>
X-Gm-Features: AQ5f1JornbCi49rWdD7DV_uaQAEm5VTpxGrz64paaXxDiD5xJP4tev5eWwCG9IU
Message-ID: <CAGb2v65e8Hk7aZ543pEXYKJ9VDs1znuCtaDDdCOfaRKWrT2MdA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun8i-codec: Remove unnecessary NULL check before clk_disable_unprepare()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	jernej.skrabec@gmail.com, samuel@sholland.org, ckeepax@opensource.cirrus.com, 
	u.kleine-koenig@baylibre.com, megi@xff.cz, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:29=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote=
:
>
> clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
> Remove unneeded NULL check for clk here.

Please also clean up the clk_prepare_enable() call.

ChenYu

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.=
c
> index 8b9eb1a202f7..a27976c375fe 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -274,8 +274,7 @@ static int sun8i_codec_runtime_suspend(struct device =
*dev)
>         regcache_cache_only(scodec->regmap, true);
>         regcache_mark_dirty(scodec->regmap);
>
> -       if (scodec->clk_bus)
> -               clk_disable_unprepare(scodec->clk_bus);
> +       clk_disable_unprepare(scodec->clk_bus);
>
>         return 0;
>  }
> --
> 2.25.1
>
>
