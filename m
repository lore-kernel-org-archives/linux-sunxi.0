Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8E127E28
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713265007; cv=none; b=UeIWKnAlj6H4tGACM2gDCn1MxmFzK5j0roQejJ2DeicdFIzj3kA75eOKYJHbuGMoLh61iFXf16Rz7I1ye2dRBtaoLqCa8qTI3bh084Smrdco46mkJZDvmnBdgINSbT3VuTZcJ77xYLft3vxY4OD2U42xL17dn0qaBI08tr9Obu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713265007; c=relaxed/simple;
	bh=HlgZk8CvLNHX7j9hSVFcL16+f4dTN36eZ1Z1lh6hhAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9hMlr0er1hLKoo0LYcBxya/M30+xoaJqUevLzDNG38Lfammfreaf0znlMLdz0/zzZRFOjQGPSo1DdGTyhoMDQl/p4Ii/HchJgOZ+w3pB7QiX80BNHwq0vnoVNLj0E0nSH9Xg+kJPyX65mhdlLDT2hvErvvebkDECsfVD5Vm3h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+vZO142; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+vZO142"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-570097653faso2761929a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713265003; x=1713869803; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=R+vZO1423FJEEFVtrD3H6YCNlnKYrMOrdkJ1Iynlu8ZtpgX/vEOWBnFPPuyWvg8J0S
         dimB+aHLxG2qkRD8klWImwSdZxN2LHXSBRlvFALj2FEm1Vu9VFSGcHHJUcUq/bXnmTgu
         Qu9cItJJM+X4Ez9kDQDcy7ewyQ6Ue/3POZ6BT1xL3bqlpr4lSYP5lKg4I9GtV8See5vE
         KiMUdXP2SCAwBg7kLsRdoB4x2QxnfvybdsDmLkzbfmLtl+aCEZIZ6VYEK8PNNQpS7cH4
         SEMgwHIWpoOvQk+gTPjIJs69myaLujyOa78pmyqFNncB7mY7JFe12CxUu32OSmEG8hjq
         3K7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713265003; x=1713869803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=Z9FGc4QxvrGUbmkT4OZKPyH3iEr4hcGJ02LUn9yh6aDWaAech0Fe1/GQxsJuGzxGyA
         9QwLrllV//BguFO8yTWEXB/06el5RfVAcfhsU5qLxc4kg5j1hJyUWZ+mIhmt5s3ua8te
         RcoNWTohVxqtMFh5GoP/UuZq8/TZMP0xG6It4xcA3wcO9lkDKVZZLWj3l0L9d1+W+baF
         fod3LzVN4HcAkM8e/aTDRgFh/c4hueBd6tDUnzy8Os1CFH8zjrhw8TyMxg73vVUR+hGP
         WUwWOs2IboNnjcu6yp27JrUFj3Ho9pg/rpLrPoR4WVJiYuD+uyw5YR0WtlXecvt4Eay2
         1IRw==
X-Forwarded-Encrypted: i=1; AJvYcCVJc384jaZQJrLdczHhae0PpMaHs8rpdzFota5ztYom4JI1pB2yP827ViBaybTHS+8PiGCxPWRsx3ZYli4G2ZTdfBDhxuuYXIXsB6Q=
X-Gm-Message-State: AOJu0Yyhsedh0noN5PCPva2T5AHZz0cnYpZ8blmCmUUGchrv28vA+UzR
	wKa+HRi/1wkoyPnH02VwjplzhSFoX91AtEshjpfivi1tFBq8zKniedxHX7aw7lk=
X-Google-Smtp-Source: AGHT+IFRHzwHYV/k15VsjWZfN2SFFrEwWZL3WX+T78lKXGwI5ZHOHbWBE7IZ649XfmZzZPkChlPXBw==
X-Received: by 2002:a50:8d19:0:b0:570:1161:111f with SMTP id s25-20020a508d19000000b005701161111fmr8339541eds.15.1713265003274;
        Tue, 16 Apr 2024 03:56:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020aa7d985000000b0057000a2cb5bsm4692942eds.18.2024.04.16.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:56:42 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:56:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <bb7d0078-764a-4cf9-9fcf-2e91eaf33e76@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>

On Tue, Apr 16, 2024 at 12:39:33PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> What about going the safe way?
> 
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -341,7 +341,7 @@ static int tda10048_set_wref(struct dvb_frontend
> *fe, u32 sample_freq_hz,
>         /* t *= 2147483648 on 32bit platforms */
>         t *= (2048 * 1024);
>         t *= 1024;
> -       z = 7 * sample_freq_hz;
> +       z = (u64)7 * sample_freq_hz;

I think your patch works, but it might be nicer without the casts.  We
end up having the discussion where it's like "Can this hz be above 4GHz?"
And, here, I think we're safe but a lot of stuff is pushing up against
that limit these days...

regards,
dan carpenter

