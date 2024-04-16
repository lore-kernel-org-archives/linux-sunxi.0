Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA16678C64
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713252742; cv=none; b=Ofh8THeNcIKYFgCCnT4GjrZOM8RQpqrEeJuHBWiNUOgjWY0ve6uGpq03MPseuJDOlME/WLUFxK3FvF4mD6XgxYcCtis4njMByPS19rrPrMC08fEM4fBgREm2KrZy63KY4+hoAu0r9WNr5H0KBjzLjTwForf6f9L+DhTajRE7gJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713252742; c=relaxed/simple;
	bh=Cs1dgXPtyii2K9Gr9D0keZ57yvHI7OfDP8UWsuFVXPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDCcdgEh3AZXKdmfqBdMF9QhoddEKrOqmIwKdiDXVHDZMDDd56JimCH7qJZgyiP2w8zOAvQkVMNn0fJmM4eZvOxrHNl01DvmWPBjj4peudibgfEHGn+dywxasEtk78rT/r7xANVKsPAjxWqdk0KJVwPWlegDiL+7Cecn9XhXaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuQQmwKx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuQQmwKx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a524ecaf215so322505266b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Apr 2024 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713252739; x=1713857539; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
        b=YuQQmwKxuDkJaNNpkCTS4vN7ViLR/J0AR6kJj0sU1LyYzIxaqbSv0CpVXNxcumuROr
         y9wFlrfI2iRdvFH/t8xW/JmPbhEyY3lDOec3goKMUF9wdeMnMbwubW7NNDWkgM2KW9Eu
         7e3BN4nMX3aC9CPxypYUK6BS6E8IvJ7vlZ/qVRAaUMOozxoHdP+XI8bQyjLNAiO/Sv0G
         qdX12RUPv2OSvACt5/gR4vdCCFZdp6hzAqK8j38leO07gv+/dMQ+9DbCP0fAsIEUxxW0
         q6Fdo2wX81TCjJDKKbPXGitGsTjQj+d5HLONcXVR3RgKvn5xsZT/JFV7ph8E2fjCGZ1n
         +itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252739; x=1713857539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8R9bVOGo16amHaHdQgn3vohiOg/80cUEYV+3t7qlHzM=;
        b=HwsfNOHNEYpM6tbWg74LCI+trh9am33S1uz3128CZ4CaHYHXDyo8c/WxHe0nWuvDHo
         9X4iSdShAVfzzWz/hZx9BcCwgOhYvhaacX+Cl1ZsXUv3FALcOyvUAyYntxyc9D1qs2Z0
         HqmN0+ZBVObLO72QGygPo+ch+33dCVLUUm4VOssRtRKmP6IK527COISXie5Lk2di7sJA
         ijeOb3vrKBMfptuTvnT7MK3W6LhbGojfNRXI2/wSULuvOcJ8pZd0W4J794mpMz5/auin
         WgOFGPwrz2dFh+jrCqpbjEVkaVMhVGFknm6pPaU3EHwRgKdraOFxSqlCq3FTUIv1vKTX
         GKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvH3ks90IB4yIkjIMG5glCgeN5boS2qeStkxKGa5znsPAWIWwzSQ3n+6CUtt4dISMxfj+sBaPbVNG0GgxBNXA8FV7V2bfYdBxLq7k=
X-Gm-Message-State: AOJu0YxpIZj5Vyu2kduQCysB2QxdOnaTlBqrb35m+yUJ4bHfKkbIJ4u6
	9+Q9P+q+qT9dzTqjSTnVOG8ec7wVUypKMeHNWXR8dn65J4l6t6sCXwfXdnFpfjw=
X-Google-Smtp-Source: AGHT+IEiSwmXJXJlRrwBTxtu6/XHomvPQRR0BAqxebaWeb0WkKlHDct2PHGh5ytZktKV5zyNXHYwQg==
X-Received: by 2002:a17:906:57d6:b0:a52:6c4e:25ae with SMTP id u22-20020a17090657d600b00a526c4e25aemr2620587ejr.44.1713252739010;
        Tue, 16 Apr 2024 00:32:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qb11-20020a1709077e8b00b00a51ab065bf0sm6421883ejc.202.2024.04.16.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:32:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:32:14 +0300
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
Subject: Re: [PATCH 02/35] media: stb0899: Remove unreacheable code
Message-ID: <e5824d5b-9aa4-4b92-91a4-7e26de8b293d@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-2-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:19PM +0000, Ricardo Ribalda wrote:
> chip_id is an unsigned number, it can never be < 0
> 
> Fixes cocci check:
> drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/stb0899_drv.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
> index 2f4d8fb400cd..222b5476ebfd 100644
> --- a/drivers/media/dvb-frontends/stb0899_drv.c
> +++ b/drivers/media/dvb-frontends/stb0899_drv.c
> @@ -1277,11 +1277,6 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
>  	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
>  	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
>  	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
> -	if (! (chip_id > 0)) {

This is not dead code.  It's possible for chip_id to be equal to 0.

regards,
dan carpenter

> -		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
> -
> -		return -ENODEV;
> -	}
>  	dprintk(state->verbose, FE_ERROR, 1, "FEC Core ID=[%s], Version=[%d]", (char*) &fec_str, fec_ver);

