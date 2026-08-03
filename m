Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707A34A79D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775551; cv=none; b=M5bAPY2hOY/5LsffuZIIpBsCvTjJqD/6I3f//oUMUAp9ksoResxx/oEGRTaAF4HUcN+YG2I/C5ZGO2JaH1oN12lZDOmN1g6F46UaFeR1izv645rrsLXutMIJ4gH//eCAejhqhzvHhRHx00hKcwrRbp18cZps8BFYy6qFU8naw7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775551; c=relaxed/simple;
	bh=INV4uyC91IEYZhiJM1/wH5ksag8VacqXlu7y2ZR56BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zr1J9d5ycxf6S1OOzRolNo0q1qEb1g2nG3Cssjppxk9zC+J/acBk8gMTMMMUg6UOTTtOhZvfWqCzyGZ3fagvLeQ6pol/Om10baERldC6q/jwvq5nY5MCvae7xKImKAYUAKS2AQl6725b3LffxVs1HhN1KkqXz5L1Tfszoe7yO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7Y32Wwu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7Y32Wwu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06D21F00ACF
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775549;
	bh=SXxFPuDCxz3Aji6z4V5I94Ca9I9A0J3OETny9fcwk9g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=P7Y32Wwu5CLcyaG4uHJwQw/yPwMDH8PRwLZoe8YqxPZjHQ52LTeR9XnqX2Iv407og
	 1E0m0JDC58qFlh/g78Yq5DDM4PFeUOA8eF8JybeQq/jxx4Tj4PdQAfCrLQmnfHO/oM
	 RiY1HbG00m7mBpr12/n0JgS5UFeln7WWtH1tXC2uFlZ78GqbJzkJfb7Ba573dJBm0q
	 uAIfwKNoYyvQ+rteuURYqIIzkBzh2cRpJJDD/PBE5pd15CdJvVqXhGtWdePk7bwhP6
	 PuHK+gn2EnFx6jxIOT5eFGNtb8QE5Zs0l6ET60LWCvQpfy0j8x1/ufcLewW1QJXmcM
	 M/UT+WZ7zzo7g==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c83acb86eso32321031fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZlcCaSRZNfSQmpRgh7EzPtm7OK0pYY8v/d0xkmNFxYHaGSYgiza4yskCIdLZh67kkCQLhlR0vJAxupA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUG6V6lJfwIBIRvaqwab7aAdwzYgJXxDZqnL46EVGGj/QFSu7F
	ZU1rX1y/U5zDoizy/xrJptsFWpvmMIlcVupkVkBSs8Ow9N//YdyrfnUgg2wkV4mycaiT4PQOuoF
	4lWGuV0jdgvSsNpAiWI8Ge5gQEofSZN8=
X-Received: by 2002:a2e:bcc6:0:b0:39f:fbd:69e4 with SMTP id
 38308e7fff4ca-39f8647da2emr21946901fa.41.1785775548162; Mon, 03 Aug 2026
 09:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:45:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64MMcUQW-6X3Hb=ifO87VhEDicjXtpHvq+pBYczyLECrA@mail.gmail.com>
X-Gm-Features: AUfX_mwZCPbOCHuxVBeBJfg0hkv1k_HMStH-Sat9nWvpFIL9sOzUuH6ZR1uJGfk
Message-ID: <CAGb2v64MMcUQW-6X3Hb=ifO87VhEDicjXtpHvq+pBYczyLECrA@mail.gmail.com>
Subject: Re: [PATCH 05/13] drm/sun4i: tcon: Set output mux for DSI and LVDS
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
> DSI and LVDS skip output mux setup, so TCON TOP cannot route the selected
> mixer. Configure them like other channel 0 outputs.
>
> In practice this matters for D1, where channel 0 TCONs are fed through
> TCON TOP. The remaining set_mux implementations only handle TMDS and
> return an error for other encoder types, as before.
>
> Fixes: b9b52d2f4aaf ("drm/sun4i: Add support for D1 TCONs")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 960e83c8291d..ea7c90fef316 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -717,9 +717,11 @@ void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
>         case DRM_MODE_ENCODER_DSI:
>                 /* DSI is tied to special case of CPU interface */
>                 sun4i_tcon0_mode_set_cpu(tcon, encoder, mode);
> +               sun4i_tcon_set_mux(tcon, 0, encoder);
>                 break;
>         case DRM_MODE_ENCODER_LVDS:
>                 sun4i_tcon0_mode_set_lvds(tcon, encoder, mode);
> +               sun4i_tcon_set_mux(tcon, 0, encoder);
>                 break;
>         case DRM_MODE_ENCODER_NONE:
>                 sun4i_tcon0_mode_set_rgb(tcon, encoder, mode);
> --
> 2.43.0
>
>
