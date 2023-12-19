Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963D374D7
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 16:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhO0KBYa"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a23350cd51cso369802966b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Dec 2023 08:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703004371; x=1703609171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iyYRRTfOYCdZhFzzYt7vcnK5tnPRi7bc1hwQ2Xgkro=;
        b=IhO0KBYaZvju0yyjidJyiUBEZUpXrdSvMEXaCy46NLTa/+Abnm/bVc+waK3Ld5C4tg
         ZWW1VG0hSVfWC7xV0o2uBjTSGLOKm1DgEFrfwvryXtixyF6OEuIIlMOExhZWYOEzYdFq
         b95Jowu4xv4nZMfOPy3msWGT21xXKUgpbF2/kwwKyuen6hvS5DhI3/YDsu1UQ3iLg5q4
         QmTo2h8yuhF7NdRACbGTWaH0W8Rb3xAK2AvB9Avo1qc5C4kex2UmTrromTpLHFyr+NnE
         c0N4qkIYEHQzYeM0qWt1RigPNRzFe8mFbqlU/eAexv7YYvAnkElmMaCvF+X/8tVozFTb
         zOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004371; x=1703609171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iyYRRTfOYCdZhFzzYt7vcnK5tnPRi7bc1hwQ2Xgkro=;
        b=WxqePm7yZhIye/PTId8hIvX+J8nValoZLFCKUD0IiD9JUmA3xsbFRsmjlRVTuwfmFq
         Rxtjbk9bDXnkZkIycA0CkWChr8ziubBhLeO0bchOsyk0U1lsZbQ5Iel1Y27cmtEV5Xpd
         LK0+mvU7WsMRUVBOPRZXd2RpiTfrJbriu+iF5KwyBwzu+tBg7KOfsZeVpURHaB2n5C6T
         kVj+JrlnlGxihj2s4V+ydVSR1I9N8j/z+2FmLgjuRWnSZ/t6CcZ8612l0IVZxpyQal71
         Ti7hcsozyxh9NKfs8+QPxH4ahoNpJgk7MQG/xYHNW/ZUtR+vulOX0fxek5O8lzGrEWkd
         oNOA==
X-Gm-Message-State: AOJu0Ywadg3WeaMNSKCkx/cUmNg2oEy6NEj4/rkN5z1tajeb+DQJLF1S
	6ank0VuEXJ3mp53zmOkCce4=
X-Google-Smtp-Source: AGHT+IFJfMra7NcuO7fQEfUYtCoN4Bxnp51stjqeihm0piqP+Wi1lNVa1b2/OyVghxfcNYQDfZPAyA==
X-Received: by 2002:a17:906:2206:b0:a23:3299:f332 with SMTP id s6-20020a170906220600b00a233299f332mr2818692ejs.140.1703004370668;
        Tue, 19 Dec 2023 08:46:10 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id vx4-20020a170907a78400b00a0a2553ec99sm15564251ejc.65.2023.12.19.08.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:46:10 -0800 (PST)
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
 Re: [PATCH 1/5] clk: sunxi-ng: nkm: Support constraints on m/n ratio and
 parent rate
Date: Tue, 19 Dec 2023 17:46:08 +0100
Message-ID: <5736273.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
References:
 <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-1-e238b6ed6dc1@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Frank!

Dne ponedeljek, 18. december 2023 ob 14:35:19 CET je Frank Oltmanns napisal(a):
> The Allwinner A64 manual lists the following constraints for the
> PLL-MIPI clock:
>  - M/N >= 3

This should be "<="

>  - (PLL_VIDEO0)/M >= 24MHz
> 
> The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support for
> these constraints.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 23 +++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_nkm.h |  8 ++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index eed64547ad42..2af5c1ebd527 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -16,6 +16,20 @@ struct _ccu_nkm {
>  	unsigned long	m, min_m, max_m;
>  };
>  
> +static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long parent,
> +				  unsigned long n, unsigned long m)
> +{
> +	struct ccu_nkm *nkm = container_of(common, struct ccu_nkm, common);
> +
> +	if (nkm->max_mn_ratio && (m > nkm->max_mn_ratio * n))
> +		return false;
> +
> +	if (nkm->parent_wo_nk && (parent < nkm->parent_wo_nk * m))
> +		return false;
> +
> +	return true;
> +}
> +
>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
>  						       struct clk_hw *parent_hw,
>  						       unsigned long *parent, unsigned long rate,
> @@ -32,6 +46,9 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
>  
>  				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
>  
> +				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
> +					continue;
> +
>  				tmp_rate = tmp_parent * _n * _k / _m;
>  
>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
> @@ -65,6 +82,12 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
>  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
>  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
>  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
> +				if ((common->reg == 0x040) && (_m > 3 * _n))
> +					break;
> +
> +				if ((common->reg == 0x040) && (parent < 24000000 * _m))
> +					continue;
> +

You already figured this part.

>  				unsigned long tmp_rate;
>  
>  				tmp_rate = parent * _n * _k / _m;
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
> index 6601defb3f38..d3d3eaf55faf 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> @@ -16,6 +16,12 @@
>   * struct ccu_nkm - Definition of an N-K-M clock
>   *
>   * Clocks based on the formula parent * N * K / M
> + *
> + * @max_mn_ratio:	Maximum value for M / N.
> + * @parent_wo_nk:	The minimum rate the parent must provide after applying the divisor,
> + *			but without applying the multipliers, i.e. the contstraint
> + *			   (parent rate)/M >= parent_wo_nk
> + *			must be fulfilled.
>   */
>  struct ccu_nkm {
>  	u32			enable;
> @@ -27,6 +33,8 @@ struct ccu_nkm {
>  	struct ccu_mux_internal	mux;
>  
>  	unsigned int		fixed_post_div;
> +	unsigned long		max_mn_ratio;
> +	unsigned long           parent_wo_nk;

What about max_m_n_ratio and max_parent_m_ratio, to be consistent? This
should also allow to simplify description.

Best regards,
Jernej

>  
>  	struct ccu_common	common;
>  };
> 
> 




