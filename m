Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFE13D521
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459820; cv=none; b=Be4Xktucx8hn0XvSnluEOWaKSc5qJnQIdMS19NiBzGN4YemX5OBoOYfCRPIrtjysMjWRTlTSYpJFejIOxJWWN8ww1S0WC68NNQfFgdK9hYjBj4czL0LX1w8PNxYd5KcOCMgZMkzR6cwufqAbA+va3xR5nJp2Tvn46idJ/hkpvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459820; c=relaxed/simple;
	bh=2KipswG3SW06NUnJzETJvY0SfYT0V8GYDD2v8dOrjrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRgFlL3KiRJv2U5gW4l2WSd6IEKk8SuegPuGH2aTSi0pjK9q3G+SsGHUAtCbvLkY2tCry8ztxv5Qvq7bKKtDS4Jc09pPkPHG2hOuejiddHMumPVvhMmiUF/i7f8wQnwfmNkPi6rh5VT5OWAcG1GVcmSqFF2IC3MQFJoruuocRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZY0+BFqF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZY0+BFqF"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52742fdd363so1450474e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459816; x=1717064616; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=ZY0+BFqF4+zvpiul6D3yS8mcgTgupnkeNxaRtTY4p6pwB4K/QlM3Eqi0G+r3dOJmnF
         x5lyWvRTKx5O+JJJQXFLcsKojgYf4+q6ZZEDA3nbsrzUM9TFgeVaRr5+dQR/uxoqY/yr
         JpQKQ0VEzeWFG3X0UYKVYb96cGis0KTtz6bmBf1+JnNAybF+mBNJMwtm8sl7MtUAWqgU
         gVKGP/6/vhQpSnktPiN0Pa83DrW8Gc5Ab8wSuI4B0lbSJlxUcBdD1Bs8djzNrdm3R0/q
         Vc2hJKUAvEDmND+WjNa+Qss/5OgKPZ9r2Kqerz7McF29SbOumLEyv0mPagRT9bnSBzAU
         J3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459816; x=1717064616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=k1IyZRhbWr+8TZmxkvKw/pzhhmYHovvH56Rump0iTs79Ug7VHfamm8g+Qy6Htm9a7P
         ngF4f1nq3ITdztTdnCq6b0vdv1uso063kxAn7TRw9vOaLQg+uC2R3lOK2CP1zOKae9Mw
         nGakGtXZMlG3O+tyRnSmypPEa3xqKcPt5UPzp8NYJh/DZbkQwVS5zi9wMT7xyabXks/c
         n+64lxA77Blmc9/Eu4U2SxaP78otmbhesB2lr4Me2bIAmo/k9Znyk/70fXEpb0GULafU
         UBzLpxm56UlIJpxb0TDLdilid6r3px7YT4LfHoCa1bAJ7zgTD56dMOQTWAmvRT/NcrHZ
         f8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQSDL5pxEUjuMg9UZCCyF8O/eLFWki8Hz210VqL/oOpVQTTD7gYIFo8yyiUBEfI1EUOFG/Lsw72RZ3iXHPARI1k3GSkt8OF4rj2Z0=
X-Gm-Message-State: AOJu0YyzXI3FUws9mNA4soBDuL91EQVHO0bViSVpGFI21VItpF6yK9Xs
	B0k7Q8tGnSu/IHruAvLnEEsrvcRaxqJ1zecM8fjq1oOArLDLCa5zMJSLV/Ijmps=
X-Google-Smtp-Source: AGHT+IEzxmh8z+32apu2/wM5J7agRdiD9NBJtehzlsORjUBmhCc0n9L3OJrcZNqTzzbLZrKSNAoRhg==
X-Received: by 2002:a05:6512:3b85:b0:528:996c:137c with SMTP id 2adb3069b0e04-528996c3830mr730488e87.63.1716459816721;
        Thu, 23 May 2024 03:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d899asm5271242e87.231.2024.05.23.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:23:35 -0700 (PDT)
Date: Thu, 23 May 2024 13:23:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 18/28] drm/tests: Add tests for Broadcast RGB property
Message-ID: <3pxdrdobtqbxedsstby2bfexuvzyqinzlxdp7d3gii6bbecp3y@zg6wl5lu4kgk>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:51PM +0200, Maxime Ripard wrote:
> This had a bunch of kunit tests to make sure our code to handle the
> Broadcast RGB property behaves properly.
> 
> This requires bringing a bit of infrastructure to create mock HDMI
> connectors, with custom EDIDs.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 116 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++++++++++
>  2 files changed, 267 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
