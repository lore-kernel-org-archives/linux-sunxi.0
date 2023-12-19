Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD5200C7
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwfVJtNt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2343c31c4bso378031566b.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703004763; x=1703609563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxC6S8Df4SvnkAXMbWUKpOTSQ1v3y3ScMeHuaO257hA=;
        b=RwfVJtNtd1a+Prq93DGKlJieElWiSmDWOT4+bvY0F3nl5HikoqUQDgDKkfrF8HdKSa
         QssVK+0G2IwsfbHJq0j2m6KBCuSnQtt4qjI9+neWXXsfipsTP/aHw8t1eWo6jIO/0pPJ
         LhsOjRFyKEsWpU+RKIJpQKecXYmXLExRKSnMl76NdB/CklD4S6do0rVFHZCIpZD/S+EN
         QNcuyaGtR8BYO9uxyvW3fSF23clCPlUcyTh21jyGzBQsnfeAfSK9KzhDdWAL/NP2nnY0
         nBfNkQp9BTN3wXb31RCZRoCsIfKnTCdzk9lXAFRLg++AQIU1vOYlHee9QtbCVYnZ8GM4
         wsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004763; x=1703609563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxC6S8Df4SvnkAXMbWUKpOTSQ1v3y3ScMeHuaO257hA=;
        b=m+9/U8aO4NF3F3pvhLrP3VtHw1ai5J6niXkiGsHqGp1uI40hWqmPxlaRJ5gK5BV9W4
         FwXZxEDWSsjuqL9dzO5cFREHYg2XgwIXgVBPKuMIl0svsCainHt5ig8TkykoOrzz0NPM
         Rvnx3DFwlabuRC1YnZIUqccbBd7PD5eADNWHjt+lTqfZlupI6Tx2tAXbH+gqbmZ3REIT
         oc/T3CYtpXmua+yNF0JOyws1MlmGG/6LHAFpBaxvsdRWM22aTBeHT+8zkEqM7PuaQ+Q5
         dyvlOdUFb839hQvcfQjJTVNPore9cI2Y8l34QQ3vOvuvY0TgGCk/4WLhxMbqwMg5cgHH
         GQWw==
X-Gm-Message-State: AOJu0Yxguuuz9UTNCnR75MGKhl4T7EULmdHj5d7hbQ39BuUehkWM1HRS
	XQrox2/G+d5BTjHIeViYq5c=
X-Google-Smtp-Source: AGHT+IGAGwRqdPR1+1UIH4G19Rxphe2JUwS3RizzhgFClQPqT3fjslJQZ2yevwgtTAN2fDlpbvd1Wg==
X-Received: by 2002:a17:906:e011:b0:a23:350a:2d02 with SMTP id cu17-20020a170906e01100b00a23350a2d02mr1742458ejb.104.1703004762981;
        Tue, 19 Dec 2023 08:52:42 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id lm11-20020a17090718cb00b00a1db76f99c8sm15833180ejc.93.2023.12.19.08.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:52:41 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH 3/5] clk: sunxi-ng: nm: Support constraints on n/m ratio and
 parent rate
Date: Tue, 19 Dec 2023 17:52:40 +0100
Message-ID: <1871631.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-3-e238b6ed6dc1@oltmanns.dev>
References:
 <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-3-e238b6ed6dc1@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 18. december 2023 ob 14:35:21 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraint for the
> PLL-VIDEO0 clock: 8 <= N/M <= 25
> 
> The PLL-MIPI clock is implemented as ccu_nm. Therefore, add support for
> this constraint.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nm.c | 21 +++++++++++++++++++--
>  drivers/clk/sunxi-ng/ccu_nm.h | 34 ++++++++++++++++++++++++++++++++--
>  2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
> index ffac3deb89d6..cfc6981e398b 100644
> --- a/drivers/clk/sunxi-ng/ccu_nm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> @@ -27,6 +27,19 @@ static unsigned long ccu_nm_calc_rate(unsigned long parent,
>  	return rate;
>  }
>  
> +static bool ccu_nm_is_valid_rate(struct ccu_common *common, unsigned long n, unsigned long m)
> +{
> +	struct ccu_nm *nm = container_of(common, struct ccu_nm, common);
> +
> +	if (nm->max_nm_ratio && (n > nm->max_nm_ratio * m))
> +		return false;
> +
> +	if (nm->min_nm_ratio && (n < nm->min_nm_ratio * m))
> +		return false;
> +
> +	return true;
> +}
> +
>  static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long parent,
>  				      unsigned long rate, struct _ccu_nm *nm)
>  {
> @@ -36,8 +49,12 @@ static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long p
>  
>  	for (_n = nm->min_n; _n <= nm->max_n; _n++) {
>  		for (_m = nm->min_m; _m <= nm->max_m; _m++) {
> -			unsigned long tmp_rate = ccu_nm_calc_rate(parent,
> -								  _n, _m);
> +			unsigned long tmp_rate;
> +
> +			if (!ccu_nm_is_valid_rate(common, _n, _m))
> +				continue;
> +
> +			tmp_rate = ccu_nm_calc_rate(parent, _n, _m);
>  
>  			if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
>  				best_rate = tmp_rate;
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.h b/drivers/clk/sunxi-ng/ccu_nm.h
> index 93c11693574f..0075df6d9697 100644
> --- a/drivers/clk/sunxi-ng/ccu_nm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nm.h
> @@ -31,6 +31,8 @@ struct ccu_nm {
>  	unsigned int		fixed_post_div;
>  	unsigned int		min_rate;
>  	unsigned int		max_rate;
> +	unsigned long		min_nm_ratio; /* minimum value for m/n */
> +	unsigned long		max_nm_ratio; /* maximum value for m/n */

Comment is wrong, it should be "n/m". For consistency with nkm patch,
min_n_m_ratio and max_n_m_ratio.

Best regards,
Jernej

>  
>  	struct ccu_common	common;
>  };
> @@ -108,7 +110,8 @@ struct ccu_nm {
>  		},							\
>  	}
>  
> -#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
> +#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
> +						 _struct, _name,	\
>  						 _parent, _reg,		\
>  						 _min_rate, _max_rate,	\
>  						 _nshift, _nwidth,	\
> @@ -117,7 +120,9 @@ struct ccu_nm {
>  						 _frac_rate_0,		\
>  						 _frac_rate_1,		\
>  						 _gate, _lock, _flags,	\
> -						 _features)		\
> +						 _features,		\
> +						 _min_nm_ratio,		\
> +						 _max_nm_ratio)		\
>  	struct ccu_nm _struct = {					\
>  		.enable		= _gate,				\
>  		.lock		= _lock,				\
> @@ -128,6 +133,8 @@ struct ccu_nm {
>  						  _frac_rate_1),	\
>  		.min_rate	= _min_rate,				\
>  		.max_rate	= _max_rate,				\
> +		.min_nm_ratio	= _min_nm_ratio,			\
> +		.max_nm_ratio	= _max_nm_ratio,			\
>  		.common		= {					\
>  			.reg		= _reg,				\
>  			.features	= _features,			\
> @@ -138,6 +145,29 @@ struct ccu_nm {
>  		},							\
>  	}
>  
> +#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
> +						 _parent, _reg,		\
> +						 _min_rate, _max_rate,	\
> +						 _nshift, _nwidth,	\
> +						 _mshift, _mwidth,	\
> +						 _frac_en, _frac_sel,	\
> +						 _frac_rate_0,		\
> +						 _frac_rate_1,		\
> +						 _gate, _lock, _flags,	\
> +						 _features)		\
> +	SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
> +						_struct, _name,		\
> +						_parent, _reg,		\
> +						_min_rate, _max_rate,	\
> +						_nshift, _nwidth,	\
> +						_mshift, _mwidth,	\
> +						_frac_en, _frac_sel,	\
> +						_frac_rate_0,		\
> +						_frac_rate_1,		\
> +						_gate, _lock, _flags,	\
> +						_features,		\
> +						0, 0)
> +
>  #define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX(_struct, _name,	\
>  						 _parent, _reg,		\
>  						 _min_rate, _max_rate,	\
> 
> 




