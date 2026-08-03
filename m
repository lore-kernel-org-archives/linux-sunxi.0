Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D17F383C80
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774956; cv=none; b=cU+NoZMBdecdezdh/Y1xVelvYPGZ5PfA4iN7z+nfWiUY+3ejpoY6/qydJ0aP6/50T9LrL7SyCfjzxUVGTGDRpkkpv64QzPmllRMjkEevHJa0PQkch7dvmQTZJjxaLto7W92FWE0ACPDGgTh/8LPQBeJ0/LnlnlaJEuAawrskVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774956; c=relaxed/simple;
	bh=iSTTN82j+++8XgyQqPoO3M3kJp/D2tg3MSfaEyzwqGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADNZsbN1+bj3cAYL02G2fMwD6P1vTZYA9FmLxOOKg2ZsWxjLjM4g3vijtMuo7hyMzyYy4AoJwQf0dgOyX24hv+C4BuNbsn4piPpIeSky/z8lDX1MimhpgUAYQ+arf34sv7n47CmamA625tjud2QvacYO9ENsRu1vTYy1sm0Z550=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLMm4TsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLMm4TsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0551F00ADB
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785774955;
	bh=FzYIensEehg4AqZ63zYidEpWKUCxiiUHEFuqj6KSwoQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TLMm4TsSV3ywjoKPjQMCMskB5/3cN3u0ES2TuqR9lzQ40DCL4ct7oq+MAdRFTJIwb
	 CixM+flP07q0hi1TOAcGGEf21lE2ImOvNUjHGgBJQ7F8JIV4mn3n5BWhDX9WQ0aElA
	 ntjXgLqkub+fuDwJviyi4WJwonjbf1QFB0IWqi7NK74JFtQVGz0U/l0TUuTsZSUUKw
	 J8pSXB4xID4reTlQfLYno68AtS0M8mfz20uDBQhJnJblL/QrdBgpqt3XhVIpzKZtWu
	 LOe9wE1hZTluV7lXQ40sbhrDV8bQrUtaL1IyRcDFE2156SrQOM6+QG26ig6nThTcZV
	 q3x9VoHsQUHUg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39faaf1efd3so3423311fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrVF+95YUiQSiX4prUQc08DGvYKLPNNDDoT1boUldrw8SMwKzrs5ECCm4pzl2CqXfBop8BVi0nLoy8Aiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEsaAPm4rrjut/6SLXVDeQczkf3gVzx6zKubk7ZafbqhCHK6/0
	z2P12seMlbjUZLwuJ7udWXht2jr2podiQMB+FAfZ5dqCC+2tMleAI8Q9ol1/UO74SLViSQHFVMp
	P8NctZ3yEXGCwd8B/J45h8ebQpq3Be8g=
X-Received: by 2002:a05:651c:a348:b0:39f:7feb:a07 with SMTP id
 38308e7fff4ca-39f863fde4cmr19415821fa.24.1785774953645; Mon, 03 Aug 2026
 09:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:35:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v67S+ZzKKg8uuMa2hwOV5Sd62vKCwUFFgZY6j5yAy6adfQ@mail.gmail.com>
X-Gm-Features: AUfX_mzh5MHTOP_BoCG6ZOvMRIrsBiiV2OmKYqiAQb1qTkbYX3vB0mzChVE8uZA
Message-ID: <CAGb2v67S+ZzKKg8uuMa2hwOV5Sd62vKCwUFFgZY6j5yAy6adfQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] drm/sun4i: vi scaler: Restore opaque alpha in video modes
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The DE3 mixer initialization clears the entire mixer register space. This
> also clears VSU_GLOBAL_ALPHA, despite its hardware reset value being 0xff=
.
>
> The VI scaler uses Video Normal mode for subsampled YUV formats. In this
> mode, VSU_GLOBAL_ALPHA provides the scaler output alpha. Leaving the
> register at zero causes the scaler to produce fully transparent output.
>
> Set VSU_GLOBAL_ALPHA to 0xff whenever configuring a DE3 or newer VI
> scaler. The register is ignored in UI scaling mode.
>
> Fixes: c50519e6db4d ("drm/sun4i: Add basic support for DE3")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 2 ++
>  drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.c
> index d4412a62c2f0..a5cc99981006 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
> @@ -975,6 +975,8 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
>
>                 regmap_write(layer->regs,
>                              SUN50I_SCALER_VSU_SCALE_MODE(base), val);
> +               regmap_write(layer->regs,
> +                            SUN50I_SCALER_VSU_GLB_ALPHA(base), 0xff);
>         }
>
>         regmap_write(layer->regs,
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/su=
n4i/sun8i_vi_scaler.h
> index 245fe2f431c3..d89c0cbe188d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
> @@ -36,6 +36,7 @@
>  #define SUN50I_SCALER_VSU_EDSCL_CTRL(base)             ((base) + 0x28)
>  #define SUN50I_SCALER_VSU_ANGLE_THR(base)              ((base) + 0x2c)
>  #define SUN8I_SCALER_VSU_OUTSIZE(base)         ((base) + 0x40)
> +#define SUN50I_SCALER_VSU_GLB_ALPHA(base)      ((base) + 0x44)
>  #define SUN8I_SCALER_VSU_YINSIZE(base)         ((base) + 0x80)
>  #define SUN8I_SCALER_VSU_YHSTEP(base)          ((base) + 0x88)
>  #define SUN8I_SCALER_VSU_YVSTEP(base)          ((base) + 0x8c)
> --
> 2.43.0
>
