Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8E193427
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518279; cv=none; b=smYTd1qmOGv/EYF5iD+JpaqHuS40Rm1FBAsEawm8KX3JqmHEeSVcL7iBTIglmZCWaABuGfNILgJ31iiZp/EanoaEZDCTenfx/CT4PpbRC7QfpFgeI54D6TibPTfoltTYhjgs+hnjRpgnH2YZJicUEzJQnrB/1TLcQTsqYSjvH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518279; c=relaxed/simple;
	bh=kPuLEYWwCH86IGS2zEuCcMab9gc+4AGP/aatGr3hRJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcv9Z6W++8qOjo2GMTKQVUtj6Pwd+CY3mjGgJ6bYpbrftfkB/VUFUQpWz1PMQqtEVcsy8iL3WN2v1dFfZZgLlQ0UrptmdnrUm/20ZIsSDb67UBVzwRYsggIhIOUgdHE1mqGBzn3TAdJ1nvNXsSl9EeAK48fb2KaPb5hzKmmhjZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrfnZtke; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrfnZtke"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2616413e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Oct 2024 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729518275; x=1730123075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wA9D1co2BPCyRcKrOGgUmRJb42G/2xnYI/PJRf0sfiI=;
        b=BrfnZtkevDl2jLVcg9tVrhTabfSBL78Q24mVGHfU2WDxP5hOvB+af3i/vOFHEdBLTf
         MgJRTtYBtJOdnXUTO3W3fRDCttU/TCbQHEk178SUSDvkOd97JSOexbe9rJRJVL0tU9Tc
         eEoQulUCegfbIHGKmxoxhb3cCvd+iPYkncWa51X07PzG5nbKH4BVG5w9np+V5AyLiJ11
         RDkjhBsBE0+lTgrFc68epqIqIoy3c7sGn4/1iiJNfKhOcOA3V/jd3Ax2/lS+Ll6nhoab
         Ln5/do1rnmPABz/ADe4Vmr8BysjBDEToICtkhqialcnoDG8gpyMqO1yxQOWS8Q20Y62R
         hQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729518275; x=1730123075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wA9D1co2BPCyRcKrOGgUmRJb42G/2xnYI/PJRf0sfiI=;
        b=V+OL6c0hThlzUmKSibrQNb15coqIPs0iciKCi3lu5ROhqkOUd7HteGdJpyOb2yVNJT
         fsRbB/mFxWU59yyvMdPHc0A2b1ea8+RdpS/RrTrF1T/4VhW8zWNfpC10wsYSz7WP5UU0
         lPhGXE9rRxIPpPveiXC3WE5HCmRlJc51qmeupghAe5n3gCPZb4V6hEBDre+TVAZsjdPa
         wPW9T9KGmVm0qW2sXvE34gLRYIDDEOhAzZ4Z1g0Lvg7cgWoBUFCuF+qlcteX4A2Eo6Lg
         Bg+MY0wEhwKTxihcU6636/eMcMSpFWc4vAru/jVHU0dVLCCrMU6420d1wriEC62O2/Tf
         rdEg==
X-Forwarded-Encrypted: i=1; AJvYcCXrvJAb8oUCYWQll1kYBCk0JvIxM5tO7iuSabhXVcX4grx7l+R8Kw/EcYy2CSb9FZoSSuibmHQ0w1nqCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQVagSBgMbkzRHP9VclyCcwxaMYE60rjTmBnWkROJmutJEdleo
	zqGisbC1UMUIsoW6RXIYha6V43rGA3lp6fuafo/SPDzSEJIXJkMm21pLe/XfYjU=
X-Google-Smtp-Source: AGHT+IFXHRDcy85ee1/d4HX6Zxgy37C2+Hq/Nm/Ll9Oqk+925jbxRjDc0fXfRkY9HnW5XrkeyVxUGw==
X-Received: by 2002:a05:6512:2210:b0:539:8d9b:b624 with SMTP id 2adb3069b0e04-53a1547049dmr5031415e87.55.1729518275386;
        Mon, 21 Oct 2024 06:44:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223f0067sm487737e87.81.2024.10.21.06.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:44:34 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:44:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/6] drm/display: hdmi: add generic mode_valid helper
Message-ID: <2az2ja5zrd5kw4iusvl23grvrgjcvh7jcyw66kjdsh2gftvmkb@araqcfpv246x>
References: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
 <20241018-hdmi-mode-valid-v1-1-6e49ae4801f7@linaro.org>
 <20241021-chubby-fascinating-labradoodle-144990@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-chubby-fascinating-labradoodle-144990@houat>

On Mon, Oct 21, 2024 at 11:32:03AM +0200, Maxime Ripard wrote:
> On Fri, Oct 18, 2024 at 11:34:19PM +0300, Dmitry Baryshkov wrote:
> > Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> > It can be either used directly or as a part of the .mode_valid callback.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_helper.c | 25 +++++++++++++++++++++++++
> >  include/drm/display/drm_hdmi_helper.h     |  4 ++++
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > index 74dd4d01dd9b..0ac5cb000ee2 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
> > @@ -256,3 +256,28 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
> >  	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
> >  }
> >  EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
> > +
> > +/**
> > + * drm_hdmi_connector_mode_valid() - Check if mode is valid for HDMI connector
> > + * @connector: DRM connector to validate the mode
> > + * @mode: Display mode to validate
> > + *
> > + * Generic .mode_valid implementation for HDMI connectors.
> > + */
> > +enum drm_mode_status
> > +drm_hdmi_connector_mode_valid(const struct drm_connector *connector,
> > +			      const struct drm_display_mode *mode)
> > +{
> > +	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> > +	unsigned long long rate;
> > +
> > +	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
> > +	if (!rate)
> > +		return MODE_ERROR;
> > +
> > +	if (!funcs || !funcs->tmds_char_rate_valid)
> > +		return MODE_OK;
> > +
> > +	return funcs->tmds_char_rate_valid(connector, mode, rate);
> > +}
> > +EXPORT_SYMBOL(drm_hdmi_connector_mode_valid);
> 
> As discussed in the discussion that sparked that change, I believe that
> we should use hdmi_clock_valid.

Ack, I will modify the code accordingly.

> 
> AFAIU, your concern was that max_tmds_clock might get stale, but then it
> would not only prevent mode_valid from running but also the commit
> entirely.

It might be stale when parsing / validating the modes. But let's try
landing it the way you had in mind and fix the drivers which misbehave
(if any).

> 
> We don't have any evidence from that, so I'd rather try to keep
> consistency between the two. And we can always try to address whatever
> issue we might have if it turned out to be a bad idea :)

-- 
With best wishes
Dmitry
