Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E0822092
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Nov 2024 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730736070; cv=none; b=LydTSn48YUTRXVw763Yqbjon92Cz16daahJdE+xGKbeDTwmEUvkqdCoEl+EwJjVYE38lE6NSros7zEVakafF1ePYsELrv6qvc/bMkKBnoyYzHtewjmtn6vH4Po6Cv5mpj9vbk9SnreAeqGz3AE04tD674kP8S2iXmLzy6RUtzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730736070; c=relaxed/simple;
	bh=uGJ0bYEml/HrRXHxK5WrIBHnMo9oiduhoM1OOTxFknw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOE3HvO1NnV2ljj+bJJ1geKwBMhBbQmmsG0hl87JYnaIFbscqKVcusaYtYGyG2Sm4+m7b7laF0jc0/+ZlvGK0Cq8EI5YTyeBrC/Se46geJpRB2IFKAsh1XV5D0Ji+4XFmHHembuSr6DR3dqHvr/I7tEKbQP1Bl9l9QoyoWcR8RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hDZWJEMn; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hDZWJEMn"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e333af0f528so891212276.3
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Nov 2024 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1730736068; x=1731340868; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
        b=hDZWJEMnIsnb4xdMtHi2cqHTUCllPcw6pmc5t5wn2/j5Gflm/6tcpQdS2RNA5kitQd
         /QaQMKVCbHVz+5tzUhda0YHrUuAdSasIVUmGma1CnoFuYXrM3zo0CEAfJQ5KYyChyy6o
         E3IEJv6QFnGLlOGqmBAFnyDw9WxijBC+pBQKAzbdoiXP33hjdmI5Ll8cwMAxqYHYd73w
         pTIb9dHLL4ddoqmXo/Gx7Q+0KAejkvzephjL7ADjSc0aLkBkdoTYOOvlrSHC/GKN7MDV
         B/jfWkJFyI651pYm70bL9iAx2RVn50wR8YrqEt4yKffzDWODJtmTOy/iIyCbmavXRUiW
         X+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730736068; x=1731340868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r32SkwEDEGyM8KRubZcTgZf56txRY/08O0Oc/h8gpfM=;
        b=Xf9K6HGYsxHjaNXNlf+HWb2WKLeZ4F7Bko+ikrTaXBQXEF1s3LQhRzfUKPJqsKter9
         exzOKn4R+AtugGki1Tj+jHFD5qKlwelCcMde11nAN/dULRGKD6zCee2E0Zgm9mRwROoP
         tZRXP7Jba5163TN3UAcP/C1nsLWszbkH6pKuhZn4rd/zn8HyoPh83KwH0nxdiAkAVQ9m
         DzzzAfd0LLkTlLyMM1H4QrmI7IjBxKT7839AVTvsJEynmnPjgh/bSI8nU1PkJD4d8839
         khaVeykyhZPepeR4O5zgHJQh7dBZ2SY6JRTOdwibuPb0/m2MupJi8EoTZcJV7q4ELK9R
         5mOA==
X-Forwarded-Encrypted: i=1; AJvYcCUPdeL3D8aqrR/T/hxvADAZv9zGd5o7FmXcoNDmtsJHZ8gVRKiRPx76Z56YEEMsou0JW1kJniTaJUryNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxAAu0N1FdIOlKI2o9kY0rmq0ZZoLW6C3BOcG6QeoMty1BrsFR
	UUIwrp6NOUSudVtTAb52lQh12VlN09dnT3RJ3XxJk2142Za2WqVBCLzOIYk0ZJY+K8US6sAVABh
	9OOJxnMR3zsi7NSRj/wgNymSUsaljfTlHIq9uNA==
X-Google-Smtp-Source: AGHT+IFujurUNdBIc2jhl5l4ausb7S50k/V0Wx+SJ0D+7ItaEAYASme79PTW2iU/NqOUarwZskVPOJUg2kPhSceaIIM=
X-Received: by 2002:a05:690c:9c10:b0:6ea:4e1f:2b40 with SMTP id
 00721157ae682-6ea4e1f3d77mr171184117b3.9.1730736067813; Mon, 04 Nov 2024
 08:01:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org> <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-3-a6478fd20fa6@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 4 Nov 2024 16:00:51 +0000
Message-ID: <CAPY8ntCyg7P2gZ9QpLFUQxZY52e4-MSA=6PM1ZfVBKWwgoxXjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/vc4: use drm_hdmi_connector_mode_valid()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov 2024 at 00:25, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use new drm_hdmi_connector_mode_valid() helper instead of a
> module-specific copy.
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 62b82b1eeb3694d1685969c49b2760cbbddc840e..486e513b898d7f761e8615f2afc193ca44b23200 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1752,7 +1752,6 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>                             const struct drm_display_mode *mode)
>  {
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       unsigned long long rate;
>
>         if (vc4_hdmi->variant->unsupported_odd_h_timings &&
>             !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
> @@ -1760,8 +1759,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>              (mode->hsync_end % 2) || (mode->htotal % 2)))
>                 return MODE_H_ILLEGAL;
>
> -       rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> -       return vc4_hdmi_connector_clock_valid(&vc4_hdmi->connector, mode, rate);
> +       return drm_hdmi_connector_mode_valid(&vc4_hdmi->connector, mode);
>  }
>
>  static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
>
> --
> 2.39.5
>
