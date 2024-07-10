Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E49194A5E
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720630426; cv=none; b=QxbBJSB0NDjWJNgLY51bLo/pa3WaMBSVIIIdP4L8IPWak4nLir8b9jTXP+zKreGP5sutyPObNp/VRu8Xil0TL4JGr97DOrfoj10Vk4614dBZv9RNsBr6akJp6YTlWWowQEyCYoREP6EdYlHOmDNygDK5B4PGYOQFFPtZH+sYdPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720630426; c=relaxed/simple;
	bh=yXIFSh5lnPGvTePfPUmjGwXfH2aiY6Jdg/YeOXwdkyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agH0cd/ytoDrqTJyYcNxmkOlP7yXDU1aU+geEfoPDEsxKhzx/EPRLgU0aN6j5VhwNm8s0gZ/cVvm3hWcEWfc9k6KX37IM33heYtcB/Z3Kax+b2smEcL9Wrk/XzehphEcWMUIKtVYtMi/Tk03bSFDESLcaSlCTlIi0jHoGNxKt5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee9505cd37so55699351fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 09:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720630420; x=1721235220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpiULvgBKLSjZABIaTgqmq90IKC/N4ETs7/rDViqHSU=;
        b=Hka1k1E3zc3/RZp5a0Z7EcoU0o9fFwB+uZgAaR8Iclle+cH1206Q9R6VfU90NosZOJ
         T9fkpAqcSKAu/vWx8t2JqbtDBMY54KDC2KLar34giQvzDC+m+XyyN/BwBFWatsTxuL+6
         cEbGxGSJdtawvIM9pCHlhy+6a02jX2rzblw7rDA9SiJFF5Ou7pjf1V4AFD5nN/pQDv0W
         PbSeJX1F+FIVRVRfDoLT6/ambKFbLntCH0bkRKleR86JFT69qScx+yNc7nOzKX3uPdrl
         yy04sB4DCiR6mMSKjp8i7wPN+rLc5O4PBuaxRnvnYRClxBNz59IqZvd9rE3ENqlkm8ym
         Vn/w==
X-Forwarded-Encrypted: i=1; AJvYcCVvnN72Lgzjc+czRzPiY2y5dHtL/ACEFMkVGackaYA7CGbDbSXNssWbV3Hc52Vq7qqY+8j4ARaDmW1yKeVVg09VlSUq+kWu+4Clnrg=
X-Gm-Message-State: AOJu0Yw6/RT8CTVJQez6PxDCI5VjCGCSKa76blwaXKl4Gen9d4QZM+ht
	pqjFpP5t3pCUd4yg6NfHUTeUmNt5TN6dgSY2smujXzCe5r5B0xEAUbmLiAzJcyI=
X-Google-Smtp-Source: AGHT+IE8XtxMbPMXwkPfzKfmHB77cL10PsWBh4cyJ0p5PimHLvXnec4vUAPWkGpp3HH5VcsGKB/uKA==
X-Received: by 2002:a2e:6e0e:0:b0:2ee:8eb6:ff62 with SMTP id 38308e7fff4ca-2eeb30ba10amr42238211fa.8.1720630419710;
        Wed, 10 Jul 2024 09:53:39 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eeb3421ca1sm5570381fa.29.2024.07.10.09.53.38
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:53:39 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so65461111fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 09:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKwiWQHjJGrYpGAhXccoqZ+D18zfwvl8tNpUH1Zjgf3T05DD9hPpz3PRL+2Nr+O/jLJ8pq8Vrke3U3K5v0px6epSxqjp6J+zV2Vbs=
X-Received: by 2002:a2e:9016:0:b0:2ee:7a3e:4721 with SMTP id
 38308e7fff4ca-2eeb318a3b2mr39735341fa.39.1720630418140; Wed, 10 Jul 2024
 09:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com> <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
In-Reply-To: <20240703121750.0dc2eb3a@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 11 Jul 2024 00:53:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Message-ID: <CAGb2v66ox-vu2T=CnBkV70k5E=aVBGm6Sg4pcK5kYB+t9uSvxA@mail.gmail.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 7:19=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed, 03 Jul 2024 11:50:22 +0200
> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
>
> > `sun8i_r40_ccu_regmap_config` is not modified and can be declared as
> > const to move its data to a read-only section.
> >
> > Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> Looks alright, we indeed don't change it, and the only user takes a const
> pointer. Also the compiler seems happy.
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

Stephen, can you merge this one directly? It doesn't look like we'll
have any more stuff to send for this cycle.

ChenYu


> Cheers,
> Andre
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-n=
g/ccu-sun8i-r40.c
> > index 984ad3f76b18..2f51ceab8016 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> > @@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(s=
truct device *dev,
> >       return false;
> >  }
> >
> > -static struct regmap_config sun8i_r40_ccu_regmap_config =3D {
> > +static const struct regmap_config sun8i_r40_ccu_regmap_config =3D {
> >       .reg_bits       =3D 32,
> >       .val_bits       =3D 32,
> >       .reg_stride     =3D 4,
> >
>
