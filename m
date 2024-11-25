Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E21B4125
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Nov 2024 16:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732551062; cv=none; b=P6TQZJWGKnWOTo5Tbac4xVAO0GjwBLWRInexO3/54GsC6lcPhL0yI7h3vgYKAGBUK3sx1howzH/1wRrps2MpekORqfSLuDWkWU4h7/gKlCZB0bbIawxWAMA3ynr5izwsBgbpr+T/De4HGxUaVXNE3fId3RK0bx/GqUI3oku9i28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732551062; c=relaxed/simple;
	bh=YpRu0OZ3GOiwgYIeW7Qj9gxj9j+efbaXCtVKDia/PNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAr41gtLShwjXxNQveQTgiFdEpLHIFJlm/b0qyDjnWLyHTDZRLg9HRj8itJBRfSfZLiyrjjZsWKMb+sAL0p6SHnL5iAjQF1FNZ4M2PoCxKK1hxo+POWBO7jkGQXbv+xY+JZbzrQ4CQD6nWA6RD4smbgejjPSs8NBjsiOwJF0cxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so20278161fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Nov 2024 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551057; x=1733155857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4agveOwge0PFPBakCbLt+oYuwIz3qhwiYZMG0RcOCo=;
        b=qOZm1s/Nhl7i027i+s0f0HN71OLr21NFpUe2ISafX1hhucq1Ip7ULaYT3seA0x0Ow/
         ZuXm8Kw3dZyDnbD71JAteXRHEeJmf9FinoOlNmE/fGpEVd1YKFJtpv0D74sh71acMRE+
         sYbSAkPSttznm7E3poenzXwLswNlAPcqGraCPrU3TlIOaYPMjq9zUQ8XdOOYgQsTpDze
         ofw3TwTmlu4tBGOHbPCeXRseq7BZ46RFSYoYMT5/tNk0t1GwegGcuawsZHBCcYx68T1+
         8S9YRVnhNzMWnB8G9TapCoFnMRERmm+blXa1om2eAEssyHH2jDD/MQd0mlt2zc/yNjvJ
         1i1g==
X-Forwarded-Encrypted: i=1; AJvYcCXMX7LA9FiB4+gxBZOZ9d9vHhGRGkMUEZahZ6BV22cuIaWM4fbsONvUpUiFfIpwKGS2OC1G05Hl6HVZPA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4ED8ZTAGUsGBKfMSOMgBDXcaF1Zmf8SbajJ3Np9DJJ3EB/DS8
	M+zsvJrxu0vBr2blQet3u9FTmpInNbcJt88+W+BqQZrBkITuCCNswqSIrgh4
X-Gm-Gg: ASbGncu3HPkjv7R6gtk79auVJGzCfp20x/QqLaiPk+6Rgdw26RjQKeqkTg94EEGV0EH
	T9IK4yYeC0AgSHfjA4QZcm8gNP3bIUtCBPxnXkYdwXopG4D/lkj7hdoDk1l5HUTByOjraaMm+VQ
	/mGahHZa+djMUHHoKCCxileMd8ipb4EYlYfttZId1k4xSB3WeUDUJ8RbHF/K7Q1Fl8mQ6mOVprw
	WpO3v+8i+yqqvXjGcH9Q7LS/yJ1ARnBob+52Tzo2eNda5cYUCkT0kbsMiFDRH7eY5yPsmrfYYBh
	X0VRe2Y=
X-Google-Smtp-Source: AGHT+IEweXJL38j4ywPcakZOZc6BJdTeeIBfR+uiU05OJnCWFLU7mJm6MYa8RkpPlMVpeVYW1/+8ww==
X-Received: by 2002:a2e:a595:0:b0:2ff:8a1b:547f with SMTP id 38308e7fff4ca-2ffa7117aebmr59758331fa.14.1732551056932;
        Mon, 25 Nov 2024 08:10:56 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53a112dsm15323741fa.119.2024.11.25.08.10.55
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:10:56 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa8092e34so37961431fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Nov 2024 08:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKwIvxIzWVkBMoyxPNDJmzaC36eYcWiKNYL4dTu8VF67kGGtnDL5rioMNdG+hrk9L0NFY02QWAxDL60g==@lists.linux.dev
X-Received: by 2002:a2e:be8e:0:b0:2ff:c368:5765 with SMTP id
 38308e7fff4ca-2ffc3685815mr25260511fa.8.1732551055307; Mon, 25 Nov 2024
 08:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com> <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 26 Nov 2024 00:10:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Message-ID: <CAGb2v64kH6gWRjBxHcFKw++vx9G7dwoiRCz0heaLO786orvd4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/sun4i: use drm_mode_validate_mode() helper function
To: Sean Nyekjaer <sean@geanix.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 9:50=E2=80=AFPM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> Use new helper function for HDMI mode validation

This is a bit misleading since this is actually the DPI or parallel
output encoder, not HDMI. HDMI is in drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
and drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c

ChenYu

> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_rgb.c | 22 ++++------------------
>  1 file changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/su=
n4i_rgb.c
> index dfb6acc42f02efc40f36914e2925510cd8056d0b..4f8100e32769cf31c25f5dd84=
9a18f5b77376090 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
> @@ -51,14 +51,6 @@ static int sun4i_rgb_get_modes(struct drm_connector *c=
onnector)
>         return drm_panel_get_modes(rgb->panel, connector);
>  }
>
> -/*
> - * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> - * CVT spec reuses that tolerance in its examples, so it looks to be a
> - * good default tolerance for the EDID-based modes. Define it to 5 per
> - * mille to avoid floating point operations.
> - */
> -#define SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE 5
> -
>  static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crt=
c,
>                                                  const struct drm_display=
_mode *mode)
>  {
> @@ -67,8 +59,8 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct=
 drm_encoder *crtc,
>         u32 hsync =3D mode->hsync_end - mode->hsync_start;
>         u32 vsync =3D mode->vsync_end - mode->vsync_start;
>         unsigned long long rate =3D mode->clock * 1000;
> -       unsigned long long lowest, highest;
>         unsigned long long rounded_rate;
> +       int ret;
>
>         DRM_DEBUG_DRIVER("Validating modes...\n");
>
> @@ -122,15 +114,9 @@ static enum drm_mode_status sun4i_rgb_mode_valid(str=
uct drm_encoder *crtc,
>         tcon->dclk_max_div =3D 127;
>         rounded_rate =3D clk_round_rate(tcon->dclk, rate);
>
> -       lowest =3D rate * (1000 - SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE)=
;
> -       do_div(lowest, 1000);
> -       if (rounded_rate < lowest)
> -               return MODE_CLOCK_LOW;
> -
> -       highest =3D rate * (1000 + SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE=
);
> -       do_div(highest, 1000);
> -       if (rounded_rate > highest)
> -               return MODE_CLOCK_HIGH;
> +       ret =3D drm_mode_validate_mode(mode, rounded_rate);
> +       if (ret)
> +               return ret;
>
>  out:
>         DRM_DEBUG_DRIVER("Clock rate OK\n");
>
> --
> 2.46.2
>
>
