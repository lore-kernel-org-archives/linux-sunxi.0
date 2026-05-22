Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779303815D9
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 19:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477585; cv=none; b=tPXsUMCxhedcUDJ+t496JVp9GWoP/lf2i8f1e5ibMqFpWHEHxX71AtlM6tRx2vC+7KkgF1qSq3/fd8/eTY8HnUudTCV9slAN4qYEOTkRIer5Ky1l6RIiy90QM1jVozh6bPG7cHnR+GfrLVeGSahcq2OWhjcnE5H3XJ9c6kH0M7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477585; c=relaxed/simple;
	bh=29/7APGHKuwal2qZ6F4qQrwLLWtrde3Z0Gv30EeECUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7r8niRHLivvcp7Vt2R0v1IIR2E9BcGSCMZjH6glCjJjxLn+9aiFTtph6dpOJVC2YraFfZPtAJJ4VfPcuHy6asB266UtLGL4jY7pqZIww0WWWDyd1zT28FyA0GDHblij62ZVTeOfgaJK0qAeR05fhSsFYkRB+JrLCdAgpzlqshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+ZNmlE0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+ZNmlE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306D11F0155E
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779477583;
	bh=/963SaMdjSqaZV3E16x7QC3H7CLh1B3KU72kSN0hNJI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=E+ZNmlE0DoCuxSB48HVESxbd5crug2jNY3dHaKN/XlwzPFfOV9+sCUQW1Pn4fhDsh
	 xDAFd1tvGCoYYhBC22ZQH7isYQO5/zD0c2rxFznuidrsgVXKv2CmVDJeuCxh6pTP6h
	 jXRnPYz+MSmPEbyfvH+bV9yv+uuUu9ZDpCGCDSw58hDPQqdVyh/WDGj7NwshPcrwm2
	 tm3UkYKR4SMJ38x2/3bSFwp3wScaeiZy8pUbNX69LMNbhEKFpFVWsZuTFhW/ALbtm1
	 O1wkGHZFcg0j40vw8rmRkysMwq3pIxREAf+vdCpREMKQUzohCTnYbpKHjcllRUE50V
	 K+Pp2rSpV3ikw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so8267373e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 12:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9o/wwG7Tg8myQV0HsKwq3hLRVAPmZpETz28HFwzvalMNNWrmMVyMhBDKPI+E3bKyvji454xLEJQDJTTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNZ5AQqjjR/GO+iRaWHHeYGps4uau5ubdZNlz+RIGcRL9t63SU
	atamJL/UndmonMCMJC1eCAQ2lBq+bvfQcpbsN3/DT6VSiAUvdtx8Tg+u3ZShS7OCcRaZP8I0lDV
	YHnXL+FufFjoiuGm8Q7mfs4WFryWdcwM=
X-Received: by 2002:a05:6512:3b25:b0:5aa:b6b:93c0 with SMTP id
 2adb3069b0e04-5aa323a9144mr1722768e87.42.1779477581606; Fri, 22 May 2026
 12:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
In-Reply-To: <20260522095401.72915-3-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 22 May 2026 22:19:29 +0300
X-Gmail-Original-Message-ID: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
X-Gm-Features: AVHnY4L8PhtBwUpCMgPdVH7zJKEZWisTWbNT00mcsDhEyaF4lTxulcCeLkrcUQA
Message-ID: <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 12:54=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Accessing registers while the device is runtime-suspended
> may lead to invalid hardware accesses on systems where the
> APB bus clock is gated during runtime suspend.

Did you actually reproduce the issue, or did you add the patch simply
because Sashiko mentioned it?

On sunxi, either it will hang the system because the bus transaction
got ignored, or it won't as something else enabled the clock.

And when you do add patches due to Sashiko raising an issue, please
do mention it in the commit message.

> Ensure the device is resumed before accessing registers.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.=
c
> index 89eccc83a130..f54eb14c9ed8 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontro=
l *kcontrol,
>         struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
>         u8 *status =3D ucontrol->value.iec958.status;
>         unsigned int reg;
> +       int ret;
> +
> +       ret =3D pm_runtime_resume_and_get(cpu_dai->dev);
> +       if (ret)
> +               return ret;
>
>         scoped_guard(spinlock_irqsave, &host->lock) {
>                 regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
> @@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol=
 *kcontrol,
>                 status[5] =3D (reg >> 8) & 0x3;
>         }
>
> +       pm_runtime_put(cpu_dai->dev);
> +
>         return 0;
>  }
>
> @@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontro=
l *kcontrol,
>         struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_dai)=
;
>         u8 *status =3D ucontrol->value.iec958.status;
>         unsigned int reg;
> +       int ret;
>         bool chg0, chg1;
>
> +       ret =3D pm_runtime_resume_and_get(cpu_dai->dev);
> +       if (ret)
> +               return ret;
> +
>         scoped_guard(spinlock_irqsave, &host->lock) {
>                 reg =3D (u32)status[3] << 24;
>                 reg |=3D (u32)status[2] << 16;
> @@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol=
 *kcontrol,
>                                    SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
>         }
>
> +       pm_runtime_put(cpu_dai->dev);
> +
>         return chg0 || chg1;
>  }
>
> --
> 2.43.0
>
