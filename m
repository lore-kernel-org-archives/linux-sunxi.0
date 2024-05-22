Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86037EF0C
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716416138; cv=none; b=npYscn4ANXi0z7CxSMw0hKveKCA8pnSXwbdQz8uKh521neO6vjBOqiigoXscg3+4nZAlVnjzrmIuz3l+CKWnF4xJ2vKDKO9HiL725GJ0PS9XSoW07dPQ+VKT93NE1vZYDGr83fAh2eHqAZwWCAn0YdmWw1hv8RA4AkwWGmrrIWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716416138; c=relaxed/simple;
	bh=Z5ybYhW+4mph3V5SHpXWp1q2xqKfqKBh7qVI+noB3io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1Ql1WWn37WULEH5Uj77d54XTzTZh7YKby/Cnn71kQs2AoYDgIdh90xDUXIsUftAPdGMObDIgWd/Yt+bh9es72h8SGt6QzqUTUlRVOomRuJAiWOY3C0/pzmalUdF0KpatB4OQOwope4XrGReCe3fl0tz79sNriwygqFok7rFa3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YO+a91M3; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YO+a91M3"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e72b8931caso42925391fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716416135; x=1717020935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
        b=YO+a91M3vJfAN/4E8p2s3fTh7sXrfvr4rjBNvz2RhqZDvZe0TyLr/ZcZ6bhV6UF0J6
         aue63V3FCaA0+1dDjJcc/7vn1jp0CH0sW9HTb+xznZ0H5MLvSUuGQhB+HxQK2wXsEWt2
         S4bMaGj9XXg2UdnQqtAbdMxOKart83fjoeu8WwJo30E10Zim3lYrT+tjKbjqMB4/F9dB
         hX+tTUU/CrfOEETwG5YwW6wbM0oGhqI+AbIMMbS126DXdeeybRp50hXgyjIaCh7zs8zX
         t1ZoMXkuYfRqjM3eq9U1Oxf/ve6keDJkFd/JgujfaiNBW8/8SNoXweAYMyxFoRe9RqB2
         lv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716416135; x=1717020935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqIqpNkg9IjyHtUc5l2lxPSbyEb8h7TdgsyXTpwuQbM=;
        b=w+tK6wnqtXFrhuSo13i841rBlTiLUIWicGF8O78laHjYzvQtllDY2Q4xcjyFHTaWi5
         wIuSC3ezaH02+m6C4De/sMsvO3fFD5d84Ge1lPfp9xaa5lv3M52kFven4+Ps2s8boSmC
         Twxs7pr4+57Y0D09pVsDClhFVgGqjkduqgVGRVb/xbyvVweFBw1d+SzMJSU/ItbnXYTW
         rhcEu2ysJad2pu7lJ3iAm8GfETYpTm7uQGK2mnge74GQt19c5sZq/PvgV316gEDmma+u
         SQcp2epKHO1ow0nHws5YsV5j9hu9+otugKv2KeUOpA2pJlCfRSYzlJh0AstbPkeyGVwv
         oXwA==
X-Forwarded-Encrypted: i=1; AJvYcCVv3bjC6GQLti302bS+M5dEzULwqo4IjRYv3w2Y4JNFc7DRrzFml036MJoTQwgW2IgMRV9EgnlHeAuy1+fQUKnOQ35gMxzUlPTeq2k=
X-Gm-Message-State: AOJu0Yy/KS3Uc2HcCiFnwAcb+/kkDf++k+WvO5jInYly8RwA/L+IfKAN
	99371RH3UC4HBkSATNjEguTLZfx/LtpiNhqUV3PHrraU5YFBc0P3VvQAXdHYna0=
X-Google-Smtp-Source: AGHT+IF/UTSqsmeasuf7NOT2sTbmOrMUL+I3W2MWiTAwWJ+7vs+IwOiiNIBy+wp79U/WJ252kb2Igw==
X-Received: by 2002:a2e:2c0c:0:b0:2e0:9646:8512 with SMTP id 38308e7fff4ca-2e94959d2d1mr19932501fa.31.1716416135049;
        Wed, 22 May 2024 15:15:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0bbc372sm41384461fa.8.2024.05.22.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:15:34 -0700 (PDT)
Date: Thu, 23 May 2024 01:15:33 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
Message-ID: <nxcom4wqbviqipongd3r4ao7w4ik4pntq3jejhmb4sr2ymb5vb@mtyeaxtxlmat>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:35PM +0200, Maxime Ripard wrote:
> We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
> sure a given property has been properly created. Let's export it for
> tests only.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_mode_object.c | 1 +
>  1 file changed, 1 insertion(+)
> 

If this ever gets reposted, it might be better to move this just before
the patch 6 "drm/tests: Add output bpc tests", which actually uses this
function. Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
