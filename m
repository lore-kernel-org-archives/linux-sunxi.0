Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57232356744
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477655; cv=none; b=ecoHKbg5GcbfN8Al+BgWwiuuepI9KY6l1EPhdODWmSONXm753iF9aF3IMlxFqWxHGvWuaD5tf52pNzuGbs8tMJA5UnvZS9lG/Hl78sHix+/xAeSMWZ7TWGxTfUnVg3HDtvAN0ybXr7JzpvCxvie4U0BhNnIR8/Dni7p40Fh4aWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477655; c=relaxed/simple;
	bh=2YIDv7oPJ+C/U6F9f0nJc5S8EyMuxDotE8uZr4sFe0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sro7SO9UklZfZ2U7Y1B8wNTl1/lpmK0oUKTdV1SevXoGBQUu/mktNyhyX8Fx8xOyYCjl//onhuJQqWzd+hl6XPYL0hW3B02Pz5dZonsAxP42a618amOOC7XXdHkkNN+Z+GTepTrzmpnT7XvfP2GWlp76Kg6y0UoWSJ+oUXADxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyxIvbla; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyxIvbla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047C61F0155F
	for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779477654;
	bh=wIDdUlwLSUQ6HmbQcd4EJ2Xlpe/x6RgpxVHPUBtWOWQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=CyxIvblafc9o1zBDFIS2/n6XwOdH2KLkAR6YxrHNRK+aCoBzHB0qSLh3WcjFw05RA
	 fRO289iHal7bHRlyVAzmx79wA8o0STWO8xtsyG0wtwUdVCfgLsMF2uXD0ABUfoCNMq
	 2nrjIOmHPDhauAPpxFxw7Um0/KDq8bqxvtzWTNQhRdoSOTPvtZhzRQaXTaOoFvKrIz
	 NlT01TtRsyuMKNPJX0kRFh2ax0BMTBQ+lqoI9DgxeyCQnX+967g/BO3Vy5TohRv7/n
	 j/MVsZiKdAFkKOyB11UtL1ff+zWXUt6lA7zqqj68/LkZWvYcfy6ren5ie+yrhToI0I
	 MRBD27xeHUoNw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso71311831fa.2
        for <linux-sunxi@lists.linux.dev>; Fri, 22 May 2026 12:20:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VuD+cjIRrEh+Pi8HD2BCdyHLq/DE+7UMppQNWA8sdmVLh93MHfcSOoQPuE++xEJhos/1StvXyAfcFGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2T9zfEOTpd1R1wQI1fJTgqS6hn8me7lGj7tJNgpRexT8WVr66
	0Lr8ARU9dVlUWMvcDt+E3bTLwkl9oVzkMA8UFQ5hyPKqess8QTvLB9oPEfQ+p2QsGXWsos78Tfy
	ZMww5CKUaONNurpu9KklKJNIlqwMSXJU=
X-Received: by 2002:a2e:bd83:0:b0:38a:6537:6f51 with SMTP id
 38308e7fff4ca-395d88d8c98mr16564161fa.5.1779477652493; Fri, 22 May 2026
 12:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
In-Reply-To: <20260522095401.72915-4-phucduc.bui@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 22 May 2026 22:20:40 +0300
X-Gmail-Original-Message-ID: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
X-Gm-Features: AVHnY4KTFRLsmgQYHw4_DylTQJci_NqnQ4LhdImsNnc-4boV7ByQgHAhKlvxOjM
Message-ID: <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
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
> Enable the APB bus clock before the SPDIF module clock
> during runtime resume, as register accesses depend on the
> bus clock being enabled first.

That does not even matter here. Access will only happen once the runtime
PM callbacks return.

> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.=
c
> index f54eb14c9ed8..102db1a2afbb 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct devic=
e *dev)
>
>  static int sun4i_spdif_runtime_resume(struct device *dev)
>  {
> -       struct sun4i_spdif_dev *host  =3D dev_get_drvdata(dev);
> +       struct sun4i_spdif_dev *host =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D clk_prepare_enable(host->spdif_clk);
> +       ret =3D clk_prepare_enable(host->apb_clk);
>         if (ret)
>                 return ret;
> -       ret =3D clk_prepare_enable(host->apb_clk);
> +       ret =3D clk_prepare_enable(host->spdif_clk);
>         if (ret)
> -               clk_disable_unprepare(host->spdif_clk);
> +               clk_disable_unprepare(host->apb_clk);
>
>         return ret;
>  }
> --
> 2.43.0
>
