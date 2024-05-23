Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1ED7E0F1
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455904; cv=none; b=ag2ZPGGpxC66m17zckBov6eWwKAVBkWtNUHkYT8pL9ZaLZPQy+f+drdIirZ1chV5F44iIQ37c2vGp/cSR29A2IExo2Y0xs+ro9ncBOKYnEOPHrwBw51gqdvylDSGix6vjEIcDlFL6jEa2Pcn92XxytEsdqTs21gwciwAfF+r8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455904; c=relaxed/simple;
	bh=RGxM2jOVFTwquoP32KsAE1HBbRxX9MhiaEXuZQ252p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbZJ2VC0lMGbThCrV8E9BzwQMmv2YzJQFt6Iy1Nuvm4VgSp6nWr1+I3aHqRmajydYldrhC1p9fXU6t7CDQNwjIy5u+3JkcQjYprkeCjMKrdWeMCRRNhJMdj8pOQZf2pfI97kO8oLAprcA51/ehdlvzj7tuyXZzGV/pRqldyJXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU0DKj52; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU0DKj52"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e73359b8fbso41095741fa.2
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455901; x=1717060701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
        b=OU0DKj524NezX0UC2PWK41G7HT2lYVDmuz8PHFo58FZcQnvR6yk4tkqwdumiQ++Cz9
         KJwbOYniyP21bHt1VsTT7Q1lHOfktNL2Jtxp7gSbpdW12zWGbiPA+ahyb5SorM40j+11
         1jURHeFD7RB2qJtrSGPwSzBKOz2Cq4MvcuGXptqLVj8Pw/6eD3+F2DF0xZslqXVcS1tb
         4Ac9a+QXQvMMfc98QYWS/UHJoyo4vwC8BL2L401qgYcNZy5UF+xkmGTcdZBAB49gzUd4
         ms5e8LXUq8oMhtsnVaKiWf+yndNXJhfUiOSPvUfs1DuC1Uhewpq80hB/5hMOA75smcPl
         7cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455901; x=1717060701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq01rfxiJkhZS3QzRfqemO50XhU1PhV9rUGPBC31chs=;
        b=VMXPg7R/Nr9W6VQYyIe/HzLNI9Scct5AoVwnCHYwONiMeT8gbqKHHBTLv9yHzOEqhz
         w59jcd5TjunPDjgQaHwl14AudA0AfRv/fzk7j36YvfumZS28ACzXzD6fL5InDkrnYYEF
         UR8j4yxPrFC2BsYQjSVEEJKOhqQsUZaDvmdGWYgBc3q1gJZLY0E95JjkjhseIzNsdXRx
         RNTwF40FnkkNTAkTrtoR+K2Ctq2pMx3O4VCsrkHp/DPZtafkg4sBEjGG5ypAfDTygBGi
         mRm0UrpwBMJ42tnojwJDV07HbSuAJRuxA/sZvUtE7YSRlHnZ2pF5Mvz0Xi+7NbqWoa4K
         hnpw==
X-Forwarded-Encrypted: i=1; AJvYcCUpWjkEWBWcXybAkudQOpuml1gL8NV4lEvBuB7JzIWummx08PisxrAccVhl8l4bgG9s94bKRuvhnvWbwl03l08arGiLKwCgye44Fwk=
X-Gm-Message-State: AOJu0YwOAWIJXmKV1ucUUs4bQHe6N3tv77lGQTuTYConoazue3CRmu4t
	ivKE4ybjLZG/0kXXqEP4u9Lw/qFqbF6ak7R+DQKL2LPPvZfitxuAfhQRdoUmY5c=
X-Google-Smtp-Source: AGHT+IHtkzdUfQObjmEVprHkzFN8zKAN9fTh1YCm+Kcmac6VM9gqN/CwHy0s14ABNvz7H4Poi3qpvg==
X-Received: by 2002:a2e:a792:0:b0:2e9:564a:db29 with SMTP id 38308e7fff4ca-2e9564ade37mr5621401fa.29.1716455900802;
        Thu, 23 May 2024 02:18:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e5686b802asm36602901fa.95.2024.05.23.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:18:20 -0700 (PDT)
Date: Thu, 23 May 2024 12:18:18 +0300
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
Subject: Re: [PATCH v14 08/28] drm/tests: Add output formats tests
Message-ID: <h4t3rsxz6yez5fosi6lyvob5mbngkjb7ad5e4euddhokcjimn6@dif2qzr2xjhc>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-8-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:41PM +0200, Maxime Ripard wrote:
> Now that we track the HDMI output format as part of the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 99 +++++++++++++++++++++-
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 32 +++++++
>  2 files changed, 130 insertions(+), 1 deletion(-)
> 
> +
> +KUNIT_ARRAY_PARAM(drm_hdmi_connector_get_output_format_name_valid,
> +		  drm_hdmi_connector_get_output_format_name_valid_tests,
> +		  drm_hdmi_connector_get_output_format_name_valid_desc);
> +
> +static void drm_test_drm_hdmi_connector_get_output_format_name_invalid(struct kunit *test)
> +{
> +	KUNIT_EXPECT_NULL(test, drm_hdmi_connector_get_output_format_name(4));

Nit: it might be better to use a bigger value here. It's easier to miss
this if other formats get added for whatever reason.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +};
> +
> +static struct kunit_case drm_hdmi_connector_get_output_format_name_tests[] = {
> +	KUNIT_CASE_PARAM(drm_test_drm_hdmi_connector_get_output_format_name,
> +			 drm_hdmi_connector_get_output_format_name_valid_gen_params),
> +	KUNIT_CASE(drm_test_drm_hdmi_connector_get_output_format_name_invalid),
> +	{ }
> +};
> +

-- 
With best wishes
Dmitry
