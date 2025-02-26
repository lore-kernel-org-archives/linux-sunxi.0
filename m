Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD02248AF
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585641; cv=none; b=RHG6h6tgvh9ujS3oJ2fXKVSJXcU3VXpbcfd/hpgkldkQg2CCfBRY0AJJQdpiDHrs6IkoTwJmeyFzwr6tD37e7KqEEwFqqNyJllt5MfFZiVLkt5024AK0tSZFI4kCmlpUOMxFuaV0fIXR9tPBK3MVL0DePeQW3ibab20tl8J9mhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585641; c=relaxed/simple;
	bh=HEXgJqQrz6xr87EisIQomS625adNtA3oJ+87NWNDMO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilIohXuQdrHytoPDOivVeE54X0Or38p/KsSNHelqEjSvLCqrzyxAT19Q+/4QkWaCiBMVYFgNp8YzRxShRN+8nS6GajnuonWDv9UL2uw0gp0zvP5p5+mhuW4CznDRhkI66Ks20Ak0dB5OlRTVmO3qUO0A8CF759vDImqDkwHwOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9Vf5vke; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9Vf5vke"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so9094980a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740585638; x=1741190438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=T9Vf5vkeRkf2USy49uXHLTOZIv0DJSEhDUablnDerQ4oz4O07vJzN2QwE7Smb+DthQ
         nz0kbahI0EzoLfPdRijDMYeXGLq+PzXRlHc+JFb1o8OZobJOvhCuUqlkA+FGxAdizN48
         cyClhuVMf4i8i1H3pqKsA70cRKG+kcmYtrRbuAZQr2kHQZ0/gmYLbrRD97Hky6jAYJAq
         yyi9/rgLjWFD+M+IkSAWg+Nml30iylJszOAPdvI3Gk8hiMevnZdtu2Z+JtYcyN5mujkd
         gJs4YUMPSc8SGQefCdoinGUKKzJGCMj6rsO04DLkM7GZSCG5XPvsajCN3Ha1BykGz26x
         dqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585638; x=1741190438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=krB2I7FGzpaaT3w7lu63q0mBmT+AlFOWTKjwWeiiyjpOz6vdBKrpOmai1RY9WFP7bE
         1Mj83DvOkWSoMMhtW0b/F++WsfziHstubEAahuUHW0mGcaSUtygtgg4gw9xXIajN4UYN
         W/6K/jvYQn+IN2vvrwEaSVEjc4JdcievUIDGwdquQ+2iduzCpe6VS3aqdv9rgxpkcOT4
         /SLfIfWttcasjyFhw0ML11GnH0tJCXcUCiXgtJzQqVKMnXaFb3aLekpQKaLH1Ed1bclP
         RjoI3mhf8sjsQ4V5ZrvnozgVpc7dmNYwNyvERk84rF6SA5hjO4F/VuTK4lkbZGxcNYAi
         sZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUVhPW5gkzkv27Cg3Ab+ESEEz/JL3ry82bHxniEtaQ/adSJLb37PWJm/f7GdOcuK17HeBR9azpDxZYxTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiAkRHf+mDoVTgFd9nEkfYh2vdCoxYN+JO1SpfiZxqraon04wG
	kNqi5ZLjpw6N4rJwt6t0B4S8NHkof4e7/9s858KbS77glYE8R/yU
X-Gm-Gg: ASbGncu0kEt7Kvmfx4l02CxCpp4BOo8hCckU5WDup/o8K7bBt0+znpxS+R0moIcKIYU
	ezggJVkO4eUtyDIVoBHBfnmBW96F4u0bVTTIEuXyFkMfim53fOrVbW3UaJGf6BgYGlnuYm1yopz
	RIkJM9B+AtfFo6/dzQdcEJk9P0fnkz31hYNFnkAum0iPOTXCzz2rl3jLtYJ+9yQ/flefxdNJ28m
	iFM6L03XZxy2n9zcBtGe71/zOOKtc8zo0sCZ/Moa+fvGiteNdU4yqWZhwS3R2t0XLuulOKtdppp
	6z0CZjR0Vx3LenRs5KxJv5Vt+Ue2lpSoG4iDlDbuUtlC3rLe7jcesMaBSlcS6CUNHS1giB1mHyX
	r6g==
X-Google-Smtp-Source: AGHT+IEX8QHzkUkc9cGra4oV85XFYs0dB6tGVSwdZwBd02GmYl2uN7wCwssdJKsfpCdyntXkd/9Lkw==
X-Received: by 2002:a05:6402:2684:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e44a256c8dmr19099315a12.25.1740585633378;
        Wed, 26 Feb 2025 08:00:33 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2053ec9sm350378666b.137.2025.02.26.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:00:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/2] clk: sunxi-ng: mp: provide wrapper for setting feature flags
Date: Wed, 26 Feb 2025 17:00:31 +0100
Message-ID: <2979203.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250226103734.1252013-2-andre.przywara@arm.com>
References:
 <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 11:37:33 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far our sunxi clock instantiation macros set the required flags
> depending on the clock type, but the new "dual divider MP clock"
> requires us to pass that piece of information in by the macro user.
>=20
> Add a new wrapper macro that allows to specify a "features" field, to
> allow marking those dual-divider clocks accordingly.
> Since the MMC clocks will be a prominent user, combine this with the
> postdiv field required there. Users who just want the feature, can
> pass in a postdiv of 1, users of just the postdiv can pass in a feature
> mask of 0.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I'm fine with the new macro, but we don't need to chain them, especially
since this forces all of them to have post divider.

What about making special, standalone macro for that?

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
> index 6e50f3728fb5f..1da1dcaf62ea9 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -82,18 +82,22 @@ struct ccu_mp {
>  				   _muxshift, _muxwidth,		\
>  				   0, _flags)
> =20
> -#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents, _re=
g, \
>  					_mshift, _mwidth,		\
>  					_pshift, _pwidth,		\
>  					_muxshift, _muxwidth,		\
> -					_gate, _flags)			\
> +					_gate, _postdiv,		\
> +					_flags, _features)		\
>  	struct ccu_mp _struct =3D {					\
>  		.enable	=3D _gate,					\
>  		.m	=3D _SUNXI_CCU_DIV(_mshift, _mwidth),		\
>  		.p	=3D _SUNXI_CCU_DIV(_pshift, _pwidth),		\
>  		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.fixed_post_div =3D _postdiv,				\
>  		.common	=3D {						\
>  			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_FIXED_POSTDIV |	\
> +						_features,		\
>  			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
>  								   _parents, \
>  								   &ccu_mp_ops, \
> @@ -101,6 +105,17 @@ struct ccu_mp {
>  		}							\
>  	}
> =20
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +					_mshift, _mwidth,		\
> +					_pshift, _pwidth,		\
> +					_muxshift, _muxwidth,		\
> +					_gate, _flags)			\
> +	SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents,	\
> +					     _reg, _mshift, _mwidth,	\
> +					     _pshift, _pwidth,		\
> +					     _muxshift, _muxwidth,	\
> +					     _gate, 1, _flags, 0)
> +
>  #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
>  				   _mshift, _mwidth,			\
>  				   _pshift, _pwidth,			\
>=20




