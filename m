Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE18152DF4
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737316; cv=none; b=erITKU/izB23SLnPDX04ong8Lv5Z8WVuaz53LjnzUWnXHQ6Fdwdiz0lDKfqLafj8VOdf4lBvvZNdSA+kem/JwFBNNolpZu4nG6wZa3X9q+gbpmOnWjFVaQ/5tTHgz6tjGhM9yHuS7BDnr/O183B9SpIk1b+C4ozhoeiivYU8DhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737316; c=relaxed/simple;
	bh=3oofEKzoY8Dgctp4SevRDAbz9giFPEyX/mlb/8O3MRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njHWEWZtEh/ToadchJb8b4T9Q5YbZXmnw9HtP0B8vKptraXcAFQO/nPYy3o5QF4VLHj1wej95+RcjUHbsPzYcVOGk9sctgH2rgBQJb2SHy7JgjkTcEYTEc0FQlShweF1/rstk/8FOXo+AhMYBHn0XhUMCCms+0n0TvpbWPmoUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J27cHOpg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J27cHOpg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41bab13ca4eso48749335e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714737313; x=1715342113; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejcxvyIN9Gt9hs/CP6yU9CZUBAq0kOYwH6s0PyoHfGQ=;
        b=J27cHOpg7ESKdRIVLnDfy00JiGZPCIUmhXsEgiwRE4nSkvYRQ0Yvi9CKzi7WcHnvWm
         TQmsIO0h3Q0Ez0GjM+mtKaS0KT22vKiqLrVCKsWDs/LSZkX1nsYaK3ZHJSOe+0fXyhhI
         m2OMi1jJVhH4dyJFCFgm0k4Lxr1zJLhMzc2gBy1nP668ec7B3GOPDdOw8BiPUf+pWG53
         mGHlUSSfjWFAtA6leG1XxAElcqtC9tkz7lXKu+AVNvtr5xJu+3lWHHvDcr8M1vebRW4W
         cziCT2T0Q5hvE3cxLl61UMLQUEEA+yfYp01gkzUV42uO4msCpR4sN3ZoWieanrwtY8Df
         fbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737313; x=1715342113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejcxvyIN9Gt9hs/CP6yU9CZUBAq0kOYwH6s0PyoHfGQ=;
        b=lc1zwGfOhulpc04FPKwOG7ssIZUPZpf2ksPhhuXhEOx+cULAm1pT21G9ZlVATRObs4
         yR0YSwH3bwQZfZyEsb0Zt/bK+9s+ZREQ+zVlWs9Y9849CtwINtHH3O6iHKMwPI6r9kzF
         iXnm34r8VLDyaWXfBpacN9znD1gctjDhl0shqyARxg6WQ+U1F01GVwpTn4Ey4C8ZAMCH
         N4AETf2jwG0eoFlfMDmGqh9cslp04etbb3+Muvoqvem944YBJ0PjNdaNs75lB2qKYoHk
         snMgadgB6OYjIoDv9Iwa21cJkaHaKA1oqTHORdG51IWtc3A48myxICZVM8FBr2huchqe
         OUkg==
X-Forwarded-Encrypted: i=1; AJvYcCWVBYjJicVpGs/n0Db0Dl8/Yv0z6dOYG63lXFDi7ZeQYvezCVcTdCCA+FHKb904M7kY42XEXIA7Du7Cm7iWT5cQkt1PkEWEtCSgUMw=
X-Gm-Message-State: AOJu0Yx0I6hbZy5qOn7TTGEcjwklDzwOrJDHG7YDbJ4rZza+5iKdlUzC
	ayYPLtybPPNH6YBBFYS9LJ1hgFrbDOPYEwFMEnUB/9pjwUct+be/mYqRrzSBiaM=
X-Google-Smtp-Source: AGHT+IHjyMa7ooctRLN/1tdS/gx79TA23M2UYYTNE+3A8Wfu/afPHupfSN+yShlxrDD3Ur4rmUCBww==
X-Received: by 2002:a05:600c:5118:b0:41a:34c3:2297 with SMTP id o24-20020a05600c511800b0041a34c32297mr1821832wms.5.1714737313152;
        Fri, 03 May 2024 04:55:13 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b00418a6d62ad0sm9213606wms.34.2024.05.03.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:55:12 -0700 (PDT)
Date: Fri, 3 May 2024 14:55:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
Message-ID: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org>
 <20240503112758.763d8d31@sal.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503112758.763d8d31@sal.lan>

On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 29 Apr 2024 15:05:05 +0000
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
> 
> > We do not expect the sample_freq to be over 613MHz.
> > 
> > Found by cocci:
> > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > index 3e725cdcc66b..1886f733dbbf 100644
> > --- a/drivers/media/dvb-frontends/tda10048.c
> > +++ b/drivers/media/dvb-frontends/tda10048.c
> > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >  			     u32 bw)
> >  {
> >  	struct tda10048_state *state = fe->demodulator_priv;
> > -	u64 t, z;
> > +	u32 z;
> > +	u64 t;
> >  
> >  	dprintk(1, "%s()\n", __func__);
> >  
> > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >  	/* t *= 2147483648 on 32bit platforms */
> >  	t *= (2048 * 1024);
> >  	t *= 1024;
> > +	/* Sample frequency is under 613MHz */
> 
> Are you sure about that? Some DVB devices have very high frequency 
> clocks, specially if they're also used for satellite, so I can't
> be sure by just looking at the driver's code.
> 
> Also, we had already a bunch of regressions with "fixes" like this
> that actually broke frontend drivers.

This patch preserves the existing behavior. The sample_freq_hz variable
is a u32 so, in the original code, z couldn't have been more than
U32_MAX even though it was declared as a u64.

It's possible that the original code was wrong.  We have seen that in
other places in this patchset.  Adding a note about the datasheet is
also a good idea.

regards,
dan carpenter

