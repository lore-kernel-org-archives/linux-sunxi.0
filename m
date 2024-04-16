Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC301E87F
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713264382; cv=none; b=AUjyixti8EI4bbtWH8RvBSbXu842e3SEpcrMdSDz31wPPS76RFvqLtc+JegGIil32X8T5rjuoPLwTjVWCLW6iX0NETTodv2kbKDbefLeIaVMcYVS0QzvkkU81WlmVvrW/vz0/oZoyQ286+c8x4X2X+UONxSpb0qgJoGTwFTh7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713264382; c=relaxed/simple;
	bh=JeEpQglRVkCPotl8Biax9CF54rtqlydCuXYo3Z4B5/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMfifcPH3rdFwm9FwpFESpc/ZCkPDpppmPzfDez1XicDkIskVkWpoeotbK+eQSd4JNvqFzIP+xKCC650q0CS1AWbQSkqWmmpWbvAckrncJJTbUndOcCc4xtxis7oKufwKA9Di7SoSEH0Y43FXH/bf4ukOL8e2Yj4jsjTa7VIZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZohFlqSi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZohFlqSi"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2da84f93c99so20823311fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713264378; x=1713869178; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eHTLqtmJofb3OW9dwP60b9IkbybIqw6tzFbVJdsjmeU=;
        b=ZohFlqSiKgT1M6x0KKxpbwag+Ob39D89LUTJyoqiq1mtISMLC35ObH82LJYy3saFjY
         aXCpwXcCE1390GUmo99A05iusmemnHl1UwQ6TzuDqp/ZXfH3wit15ft2j8OqWEmVTUnd
         qk8aRJE/YlVsu5qMTjmGhESRdipL4vBj6gfVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713264378; x=1713869178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHTLqtmJofb3OW9dwP60b9IkbybIqw6tzFbVJdsjmeU=;
        b=jEhBtCXHUVO84vipEmdkDG7Gh9WLL3EG/RYSwtQpqCbehR1IktfsPoTOuBPwz4+z+z
         cTuPcPBMkat35RdX1hPoKa8tY5DesOI7MeIwgfH0PT2fuhinMhmeKTr/h3k4Z2CL0/Aa
         j0GuqHMlYqiONntzjaSuRXJXjfLqA71kTfi4D2gbB7y8//m++eOWimpihSzI2g2d3DKx
         eAyGuJtobwhwLz+lOZdYAA/JAJkQBB2b2kly0LIzSxqXIPsRo7pNF9LWwwfTwUKe3mkX
         kzVQjVk9dxkS7jqybWyl+zQh8lRYdXiV7zkK0v+V8bY0lS0yD4JvPQpigJyLWshweP6Y
         DYxA==
X-Forwarded-Encrypted: i=1; AJvYcCXMwDgzdLbY6ZNFwJh80G+9vAR4ZaHLFCRZ1IejWbVRvVClwkDdNzHzHpTGh1Ywg3bRDQ5CbVENTxLQvE4wnJ66OzbhhIIS5mKPVy0=
X-Gm-Message-State: AOJu0YyGqnBV9uzDmSRI1raV+pzHOG6+M6uEP36zzqbGTlVCdtFlxxzy
	8gvHyM8sHXJvuNs17lkmbPm0lTwq56ykpuIICt6IAY9WyqE+I2WRLjGzCtN0vLlXH6B9Z4lxt7S
	mULGK
X-Google-Smtp-Source: AGHT+IFxsneOo33kUZG8x8ctV422Y/o3YqG4cSwpCpv/ZbJZ0Z7hH8567Gkeo6mxu5CSx6nNyGkQSg==
X-Received: by 2002:a2e:8751:0:b0:2da:967e:c54c with SMTP id q17-20020a2e8751000000b002da967ec54cmr3186509ljj.27.1713264378449;
        Tue, 16 Apr 2024 03:46:18 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e8386000000b002da701085f3sm607231ljg.106.2024.04.16.03.46.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 03:46:18 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d0162fa1so5383343e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 03:46:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYWTh9sPakHmdB8TyoWWoCQwkUrdLOiZcL3d2IrW8zHKxFbGimMDNc9Y7sLS+wug+lUCuBfexa8mTiCQqDIMmAlGW8j5fOiSJiHyM=
X-Received: by 2002:a05:6512:114b:b0:518:d5c4:b47f with SMTP id
 m11-20020a056512114b00b00518d5c4b47fmr7177225lfg.13.1713263990804; Tue, 16
 Apr 2024 03:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
In-Reply-To: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Apr 2024 12:39:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
Message-ID: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

What about going the safe way?

--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -341,7 +341,7 @@ static int tda10048_set_wref(struct dvb_frontend
*fe, u32 sample_freq_hz,
        /* t *= 2147483648 on 32bit platforms */
        t *= (2048 * 1024);
        t *= 1024;
-       z = 7 * sample_freq_hz;
+       z = (u64)7 * sample_freq_hz;
        t = div64_u64(t, z) + 5;
        do_div(t, 10);

@@ -409,6 +409,7 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
        struct tda10048_config *config = &state->config;
        int i;
        u32 if_freq_khz;
+       u64 sample_freq;

        dprintk(1, "%s(bw = %d)\n", __func__, bw);

@@ -450,9 +451,10 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
        dprintk(1, "- pll_pfactor = %d\n", state->pll_pfactor);

        /* Calculate the sample frequency */
-       state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
-       state->sample_freq /= (state->pll_nfactor + 1);
-       state->sample_freq /= (state->pll_pfactor + 4);
+       sample_freq = (u64)state->xtal_hz * (state->pll_mfactor + 45);
+       do_div(sample_freq, state->pll_nfactor + 1);
+       do_div(sample_freq, state->pll_pfactor + 4);
+       state->sample_freq = sample_freq;
        dprintk(1, "- sample_freq = %d\n", state->sample_freq);

        /* Update the I/F */

I will add a extra patch to fix tda10048_set_if

Thanks

PS: Thanks a lot for your reviews, really appreciate! I have a v2 with
your changes, I am giving it a couple of days before re-submitting

On Tue, 16 Apr 2024 at 12:10, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Mon, Apr 15, 2024 at 07:34:40PM +0000, Ricardo Ribalda wrote:
> > z does not fit in 32 bits.
> >
>
> z has to fit in 32 bits otherwise there is a different bug.
>
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > index 5d5e4e9e4422..b176e7803e5b 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -342,8 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >       t *= (2048 * 1024);
> >       t *= 1024;
> >       z = 7 * sample_freq_hz;
>
> sample_freq_hz is a u32 so z can't be more than U32_MAX.  Perhaps there
> is an integer overflow bug on this line.
>
> The sample frequency is set in tda10048_set_if().
>
>         state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
>
> ->xtal_hz is set earlier in tda10048_set_if() and it goes up to
> 16,000,000.  So if ->pll_mfactor is non-zero this line will have an
> integer overflow.  16million * 46 > U32_MAX.  Maybe when .clk_freq_khz
> is TDA10048_CLK_16000 then ->pll_mfactor is zero?  Ugh...
>
> > -     do_div(t, z);
> > -     t += 5;
> > +     t = div64_u64(t, z) + 5;
> >       do_div(t, 10);
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda
