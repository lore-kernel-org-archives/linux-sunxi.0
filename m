Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28B35A2AD
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614141; cv=none; b=FrN9t5zyuCbxg+EGYcpvFJjxAskXteGUaJ02z+HJwWW2cfxqORwBq2wpAfX+NFnj+ngPvKgrQLizDgreFkCGQJRKhFolHFRnOJIJ3hlH0Mt+Xfil5t5rp1ANm+jDtkZLbIQc6/e6kfZ46UdjZYeEyGEaTYCeXb9J4P0QM7j2WDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614141; c=relaxed/simple;
	bh=nk0BW2Ba7j1ibTLdZtLwj3tMl8qp9lHnXIvnkwXlhdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbnGAAx2Egmkj2lztALB2y59k5fHPdvniWVo5klTrnJFJ0eSTEgrpglML8leZ2+cd8PD7OkTGMQLnWSguP5O0iZpltYTD8WqLft8DntZG0idGTgCY2V30AXbtZVfDAq0qLxi022/AZPVRuczNnfPhFoGi/1p9Zu43bSZf411+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faqVV/EE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faqVV/EE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso7959375e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Sep 2025 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614138; x=1758218938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=faqVV/EEL5mWl5HxuxhOwki27ca4fxR3cqz82P3xlM1f5Owe+gWGR9+0G3DGaq0sbJ
         C6kSXQYmnoBettISOf416pg5xMpjzZq6p/KbDY27GBRtkOmFxjQVZI8NzQLLWWPT0YK/
         w8xefGW1f1pp8fN4mAYnleR4F2PyWkoKL4iwRwOKl/3Bg0cj0gzEeL+rN0dQqJEv699c
         tHqXaU4AIf/fSw2/RYkxKODtOXOAW8xc7wrwJ3vpd9TDcXdhpCCsLzXIhd1cfH5HCMT0
         l4krqimQTnT7TKUe78Zb5oyT9MBEwIPvb9rTrccamuKKkthY4uDd0Hr4tLWvc1P48uZY
         ivNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614138; x=1758218938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=cwYoI/A92SnUIYfPFssJfuZAfb9adWCpis7+ceGN4Vba8eaW7puGdSrvi/3vhPsQlo
         7PtsVX8YQ3eyXD1V7Zks6tFKdDtvNa1tdrsuQCYuKB3nz6csZ7AU2NQEIX/9IXQRvwOJ
         OsfBpT3E1nAd8ZETeiyYQ26wxWp4CIC//KXKEtomR3KdRYI3MOuolcjjNVIY4iVOSc2q
         9nwHwFoSOUphTMXWkWR0jl+Vb2sPsyvoPPAr7/6B6vgFTRdLDt1421GYyGPnQ5abvNDj
         WrPMOstztTPJRw3/OH6NbWIXUeHxE0FfHEsyICagh2biYXW8wGXIlzj8xi+pvkg7Cm8C
         m/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXpVg/l2tpKflKDW1agjbY0IUkgefZUVjpmgOzUGv8DPW4/1XxixEUupCZtqI7JkAcnroGKe2/wr6Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyB/y8zwYbgObQZacTYNtn8oNAEy49Df27ufFyK6sgfuBxK7lzs
	ba8LYrDKcQJ8PZmn+ziN76SFLr1hr/Rjj0WE8PYkIEj6R3dYhnpdl99s
X-Gm-Gg: ASbGnctbDa8nfEkz3BWK18khdZkWMdriBbo8WQWseitK1QLuWkMdfz0YGB59MJPp2Du
	RjQOQVgDQxRc5xRnHkMlOtNTFRuD/19eEdmkD8I+Gixk6D25Tl69ZOjHWrT9B6Sky8+sBzMpRjk
	/zOXQnK6nxPAhun8VMB2Un8zqFYF6zGszx1MfNd9aTtJ5a+3FqTNmLNQaPKX327mpSdmdICm/z1
	6QUW6HqDbAGm1czPvMTUpbIfcYkACkJbKsdIbdC05zAuwU7xCBKIMYhFG0JnR6PEh5YE+ghtViR
	EqF/hF3wQdIdoRdTXqVB5bUI8gjrI8rC49biusGC4Gfx2cWofI4Js+gIvu8kWU499HgXjquI9Et
	UfebTGHhH/u2zRX8Vvzww76Fg4MUjcbXjhSpR+E3lQ79yxkZa2Hm1Al1wKctGwKGjTmnIVZ8nCG
	DsJKOp9vRWCw==
X-Google-Smtp-Source: AGHT+IG/tgONKkALdGCBSwVsuGobkxpNF6yi/bsIuUbq0WXKY1dVZ7jjm+lB6jrMTTAtwUaxRQ2WoQ==
X-Received: by 2002:a05:600c:58c1:b0:45d:e0d8:a0bb with SMTP id 5b1f17b1804b1-45f21214d99mr2291715e9.23.1757614138011;
        Thu, 11 Sep 2025 11:08:58 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a2esm35156765e9.13.2025.09.11.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:08:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: sunxi-ng: div: support power-of-two dividers
Date: Thu, 11 Sep 2025 20:08:56 +0200
Message-ID: <5919523.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250911174710.3149589-5-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:07 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Some clocks (for timers) on the A523 are mux-divider-gate types
> with the divider being values of power-of-two.
>=20
> Add a macro for these types of clocks so that we can use the divider
> types instead of the M-P types without an M divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index 90d49ee8e0cc..be00b3277e97 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -274,6 +274,24 @@ struct ccu_div {
>  	SUNXI_CCU_M_HWS_WITH_GATE(_struct, _name, _parent, _reg,	\
>  				  _mshift, _mwidth, 0, _flags)
> =20
> +#define SUNXI_CCU_P_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +				       _mshift, _mwidth,		\
> +				       _muxshift, _muxwidth,		\
> +				       _gate, _flags)			\
> +	struct ccu_div _struct =3D {					\
> +		.enable	=3D _gate,					\
> +		.div	=3D _SUNXI_CCU_DIV_FLAGS(_mshift, _mwidth,	\
> +					       CLK_DIVIDER_POWER_OF_TWO), \
> +		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
> +								   _parents, \
> +								   &ccu_div_ops, \
> +								   _flags), \
> +		},							\
> +	}
> +
>  static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
>  {
>  	struct ccu_common *common =3D hw_to_ccu_common(hw);
>=20




