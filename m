Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146840DB2D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777989; cv=none; b=m67WYMmFr0q9VMZrXyCe+Rnh04piacTiyTYNEG1gTNydUI6lLgKqaqu8rF71Wpopn19RPkS/cSU+MJnFb5JN9hlJYFdabejN7gFxJftGGtZPld7K1wkldtmXzeKGre9x9uuLdj+UolqlGYc8yjMxiycfWqXj7zWSP8XzqGbFUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777989; c=relaxed/simple;
	bh=7rCXV3dm9cmknR8p6mHSCf1NkHk/4mhUiXpI7NICCUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCaZ7QZnN8Mv2Y0VvuThgCfM4xnLwRqlgqDxGV5fYssM29Ue3tFxkjLPSEk9r2/a5kf2aGqJhY4CMfXSwlk81xQSvf+F7NU2MsAMjs0LdRAvymAmvjHbRirhZv53vHcuf/NHfznLeZOfjNdA3JjY9CYHHAxrIBw9B4AjJmSwEAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOdmjbZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOdmjbZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EDD1F00A3E
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777986;
	bh=2BOhkhN+nD6eTFoBG4yVgCP6CfGcQEWxk1diIr5TtuM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TOdmjbZ2iH/jgLMW0euKcOBac7p7mK/rCN9x9HW4PIcef93PUhmSxnheRPA3JFkOL
	 9RqriVpqHlLfXJn/2feJu8WCCg6FwIzTHTm3w0ASuRlh5pPmyy63f326l4+2WMJ7dC
	 P2BeNZuCEcB7di6VqJ9X7rOIeS1v5oJDFqw5mmSrLlo1RjYm7DyPvsQAsey6kX9BnB
	 5JVuSrMtiLRAyHNuTuaFG8nl8cjjCdil//IPqwCARyciuaXdNbDoN0pUammbZOFZGd
	 lPiezk4Q0QoYjQ8WH4b8KCJwtSFoP9gvwWILXaFGgaXIwngqo+6HiSnDYgHf4sSs+Q
	 pMrduqxSp+/Dg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so33164961fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9KL7F13gXw+pXbqqnZD2dp4lQN1jncbPE00DHxgEiWnVYT8JpQIhxpada0SkbruWdjAOIzcbwCgLbdA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+qs4YmdhUPyK1U7ZoaiB+NsVXG/xSuxV4VS7LBeaxsiJ8K+RS
	cDhNI2VuvG662LDt2Cx4X8kcQVonYQidp8Xe2WBken5a+kgTvSFQOa864xV3Vo6eXo0LmLA+vWd
	iuHcHKqEeps7OIcJuGh/a8CtYF1D31JY=
X-Received: by 2002:a2e:be05:0:b0:39c:6fad:2bc4 with SMTP id
 38308e7fff4ca-39f861a8b58mr22384021fa.16.1785777985252; Mon, 03 Aug 2026
 10:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:26:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j7nGbnCCG_2XCuFOzYkBJzyqu-YJ-w6QgLY2idndhwA@mail.gmail.com>
X-Gm-Features: AUfX_mwuI2xct4yNs35NtVK4bvQPSjfvQWC7fMdYbuzLo9QKn0Un44VUoQL0gtU
Message-ID: <CAGb2v67j7nGbnCCG_2XCuFOzYkBJzyqu-YJ-w6QgLY2idndhwA@mail.gmail.com>
Subject: Re: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits into
 packet control
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
> sun4i_hdmi_enable() keeps using the same variable after it programmed
> the video timing polarity register with it. The leftover TX_CLK, HSYNC
> and VSYNC bits are then ORed into the packet control register, where
> each nibble selects the packet type sent in one slot.
>
> As a result, slot 0 selects packet type 3 instead of the AVI infoframe
> whenever the mode has positive HSYNC polarity, and the TX_CLK bits set
> nibbles which the driver never programs.
>
> Assign the packet types instead of ORing them into the stale value.
>
> Fixes: 9ca6bc246035 ("drm/sun4i: hdmi: Move mode_set into enable")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 74c7c3720ba8..a27d394d0570 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -161,7 +161,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *enc=
oder,
>
>         drm_atomic_helper_connector_hdmi_update_infoframes(connector, sta=
te);
>
> -       val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> +       val =3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
>         val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
>         writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
>
> --
> 2.43.0
>
>
