Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853C395240
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776581; cv=none; b=U0I64sK9Js2/Cf995jU65DVCFfLVxIthHK4hAUUpcUleJZu+660TG819/zJqz2EBeRZWjisJABqErgdSthvrwyfAXPECXiM5mC7oFySonIPyjpipjfPeu9w8Q8NgyYqw1TYJhuLlwig3ylZDktxOhYkTPv9gUMtrfOB6Urqjxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776581; c=relaxed/simple;
	bh=LOSO4bEUKQ7c2LrV472oUEJlXNxJX1Sx7D8QFgw2WY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFIqkpCC3lsT/FcCXQ34lYjXMJDaRo4hdy4XLW067sjKUnwLaSw3t5ciaAsNEAolVGxgc+UCd2ukeaouFtfAMMh352tv4TeXKCmE5K7BkjZRjO2Qsz6MTxPXzV3ZsD0iQRAhAHVClVT6fV/9A9PeSFusRWP+Wii0qn08S6qCGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTdXnF8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTdXnF8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CD21F00A3D
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776573;
	bh=1IenpiuM5JsmgqLGPzCFWXP8UT6+FeKulhYM9DPJHH0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=FTdXnF8GFLny3L584AQMMgX2xFs2nxONoFzoXYXqVfCFkjBOgeX8Mr/iTQ9uusC3r
	 Zgj3u3iA940U7/5dptUgEJR63P/Yb+TVqM0phvTk3cTLIEbBs8bljGub28r+RCUbwV
	 EkLQsjUHId9GqE8Ku9EU/+GjtYNYBPmPynBYLHs6WTRfmevunezT+XRbZ3MebOQf4D
	 A1opir9RT91tIzWOrZQK3fkhpuO0gNdIyUr0JBq/dYWEi3HFFM6TFM6/OwO4DVKTz3
	 mLsIEks8ez6oRODt/3GYbQ7+hrOxNVzwB6uV85OQDVjhcYsXBLauovRXM7ewba5Wcz
	 qmp169nCj/83Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39ca0a30148so32446281fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 10:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZMMBllA6pWaRuzcnAZkaja1KxIYtLir4BW1W3/PJ4g+rlGh0PP9BKtZy1v+iZsqbrFAPfXy7L8gg/vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0AksD1+3adeDdJ/Jw9oUbdvprVfrZQDEV5v2aCFFzfZvbhlvf
	ZUjNjXfvKAxRBWPnBpmzIlfF/rfFkiLjEiHcY7NwYiVajqbAgmTPyTV0zjCbFq1h/Kg55JqCH+p
	04v1OhfBRF7BUiZB8f+ovUXZuKXqgwFU=
X-Received: by 2002:a05:651c:a110:10b0:39d:9eac:8ec with SMTP id
 38308e7fff4ca-39f863feedamr15152501fa.25.1785776572170; Mon, 03 Aug 2026
 10:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:02:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v66yVbzTSu6sb4ryuD-djcH+vaCtamuhtY=xnq93_ZvKog@mail.gmail.com>
X-Gm-Features: AUfX_mxnJXn_HowfQijlCXTBUd6N7zXjEPoDoAqA1n9Cl_6r3aRntgABVyXhcqU
Message-ID: <CAGb2v66yVbzTSu6sb4ryuD-djcH+vaCtamuhtY=xnq93_ZvKog@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm/sun4i: crtc: Propagate layer initialization error
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
> sun4i_crtc_init() returns plain NULL when layer initialization fails,
> while all its other error paths return an error pointer. The only
> caller, sun4i_tcon_bind(), checks the result with IS_ERR() and happily
> continues with tcon->crtc set to NULL. sun4i_rgb_init() and
> sun4i_lvds_init() then dereference it in drm_crtc_mask(), which
> oopses.
>
> Return the error pointer instead.
>
> Fixes: dcd215801b02 ("drm/sun4i: Drop primary layer pointer from sun4i_dr=
v")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index c2f7f69baf75..3fa1f4fda0f0 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -208,7 +208,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device =
*drm,
>         planes =3D sunxi_engine_layers_init(drm, engine);
>         if (IS_ERR(planes)) {
>                 dev_err(drm->dev, "Couldn't create the planes\n");
> -               return NULL;
> +               return ERR_CAST(planes);
>         }
>
>         /* find primary and cursor planes for drm_crtc_init_with_planes *=
/
> --
> 2.43.0
>
>
