Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F056F2DF128
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775512; cv=none; b=Zm02fWNjUE96ZbSTKjEZ5VVXkgqTg7n7OOKZD93GlHvt/e8MKWrWXkTH1GHMgskJCyfnZB95h4HH5oVfh9AvSRpLAvlx8xHSZ9lWKS/t2tyDakcXmu4CqqHcerIDd30geVkRDo0ZUffKuJ/cq9L8TqejbXNGohDgc+iA87ShjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775512; c=relaxed/simple;
	bh=88pRP2t9YXWiEjcJFOTdLm8hsyP4KBTh9b3qc3fGiI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQ0TIPKfbrxVQ2jVtQZSsRJ7OaxZWYpeVO24UjRtSjmLmVySnKJ/d+TcDiRBg9sXcIFET93nYMfvuNHk+ZhZNjy8GXonbkyOGrdouiYgVXwwQwwYYLGz2cD8Bseo9wioAgmxmvvYokkMJE4OMSDNcXZt9Ea0zObGTLa6Ik3GPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9cmzoa/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9cmzoa/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6ABB1F00A3A
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775510;
	bh=wXOfikKqyccWdJOmPTIyOaKQPXwqCCx6SW5ye3VQI60=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=f9cmzoa/OwV6WSEg37RcrMKDx5ZcWFT33ygO3Xj0h3Ye1aj4j0k3fP1VPsF6J+nKy
	 pJLoiMLJD2pmYw+bb2kEVDttnYb8ZGm9AxBtj6A1npnP3x4sPi55IrQ1BRBVgh4Z1H
	 HnKTG1V/Gb72vEuAXNFto1Yu+rxTjIJup98L38pZf3e7ekRnLeZJYYnxNIe4LvxBMl
	 /vzIZiX7h+I6WNA1OtTCMDpLMHxpW6qKy+tF/KWh4IJdABsBD+Oojda1RArd93Wo8k
	 q6tJWOCzzedR11n6ktRCJTiJNtJBcMLs9makFr5pWsVrQ6Em+dkKowt26F2RTvdELW
	 /bq4DaHd2Nicg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso4103418e87.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rql6jQhlN0ufcjZ+qOnN6YggXEsMPgXxjXpZoSYn5F6Fbm/sIMCH+84grrtcMkLAc0hbToq+HBNhqIN9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEIqwSGjR1BtxTAQvpqzBNLssbFMq73ZHYGOJhh1AOqYsNHjP6
	/aiDeC2BD/zqOiqOfgdyHPz+jfgJOxsA/r8unbibrmnNPK4MBvfHhoiJfcqQ9+D2y5G9l6E1Lj2
	LWBIxNHnQh3vDpak92glTp+NqoZhj3RQ=
X-Received: by 2002:ac2:442d:0:b0:5b0:21e3:672a with SMTP id
 2adb3069b0e04-5b2e4f936cemr1411737e87.56.1785775509359; Mon, 03 Aug 2026
 09:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:44:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67+AR+UDSM6tJSDtJw_zje164F8CmjUJaFegDr=txmUaw@mail.gmail.com>
X-Gm-Features: AUfX_mwkv5wRgU6YrCVP-n9_AeYgFr7hs0G3AjcJP388guGB69s2xIov8DPXNPg
Message-ID: <CAGb2v67+AR+UDSM6tJSDtJw_zje164F8CmjUJaFegDr=txmUaw@mail.gmail.com>
Subject: Re: [PATCH 04/13] drm/sun4i: tcon-top: Keep mixer routes distinct
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
> Both mixer selectors reset to TCON 0. Selecting the same TCON for both
> mixers causes black or corrupted output.
>
> When a route would collide, park the other mixer on another described
> TCON, or an unused selector if none exists.
>
> Since the TCON index is now used as a shift, also reject negative
> values.
>
> Tested on Orange Pi 3 with TCON_LCD0 and TCON_TV0.
>
> Link: https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/
> Link: https://lore.kernel.org/linux-sunxi/20241108-tcon_fix-v1-1-616218cc=
0d5f@jookia.org/
> Fixes: 05db311a792d ("drm/sun4i: tcon-top: Add helpers for mux switching"=
)
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Though I have a couple nits.
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 71 +++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  6 +++
>  2 files changed, 65 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun=
4i/sun8i_tcon_top.c
> index 8adda578c51b..9cbd655518b2 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -25,6 +25,49 @@ static bool sun8i_tcon_top_node_is_tcon_top(struct dev=
ice_node *node)
>         return !!of_match_node(sun8i_tcon_top_of_table, node);
>  }
>
> +static unsigned int sun8i_tcon_top_get_tcon_map(struct device_node *node=
)
> +{
> +       static const u32 out_ports[] =3D {
> +               TCON_TOP_MIXER0_OUT_PORT,
> +               TCON_TOP_MIXER1_OUT_PORT,
> +       };
> +       unsigned int i, map =3D 0;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(out_ports); i++) {

You can declare `i` directly in the for statement.

> +               struct device_node *port;
> +
> +               port =3D of_graph_get_port_by_id(node, out_ports[i]);

You could probably use the __free() cleanup macro and make `port`
scoped and put the reference automatically.

> +               if (!port)
> +                       continue;
> +
> +               for_each_of_graph_port_endpoint(port, ep) {
> +                       struct of_endpoint endpoint;
> +
> +                       if (of_graph_parse_endpoint(ep, &endpoint))
> +                               continue;
> +
> +                       if (endpoint.id < TCON_TOP_PORT_TCON_NUM)
> +                               map |=3D BIT(endpoint.id);
> +               }
> +
> +               of_node_put(port);

And this line wouldn't be needed.

> +       }
> +
> +       return map;
> +}
> +

[...]
