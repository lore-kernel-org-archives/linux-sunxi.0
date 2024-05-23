Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA71054720
	for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459446; cv=none; b=mCGVW3BMbj1bWXI9z3QUef4u7LuMXoBVUsePImWbgmcrPP0yK+NV0zH7wLM8bz/nZ0iXT3i8lLD0uAqS6eRItEdyLfVLzbIE4Vo03c0dhomMf2wnHjnjJSjkzpziwdZkFaLHCLQMifQA+aMgarL/i1o2YBdq3jYnRO+261oxTtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459446; c=relaxed/simple;
	bh=VxArPR+4LU1aox0+YmS8YeLfjdTov1uipRKbrBd98BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA39XSnkFmwSW7N3vgufbjpIOhfadFA3SGjJz7cK9iFDDquOBsKVfOQaaBJwJZwHKV3k1zf8HiRgZetQzqgCGoC8DnRWKAKqBkgbHmUULYWcaNQ2wK+mhYN/VvoVGvzdB9UBMxFzXNNhizMSABb7lDKIga6W4JPPW3EzMlm1Pz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqrfaFR+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqrfaFR+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52327368e59so8367100e87.1
        for <linux-sunxi@lists.linux.dev>; Thu, 23 May 2024 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459443; x=1717064243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=aqrfaFR+mY9CGJ8f8dFcJNbK9llRbzAqrNYxQ1sqDxQ2utiJBdPcyMk9z/QymzGOls
         aHrLVpeB9LEutRZf0Md1OOTJbuLSXYNf+hbPV1M4JGybPbAkdbUmzgnIgrHIJEqQIomp
         XN3zSPw+kilnFtg+7wq7O/qeHxtHQa5GHGFaQUEL1gqjymtDSOlVx5m36xUw/ahMLJMP
         vwz8cvvR/VQ7v9qfoDckh1yg8D/lefO8i/bnkO/YY/Dmisj1+MQjJMWMuXph67HJFvgg
         a6ti2nW4ReZvabxSUQAGo95jSefZ7N7EUWmz70mi+4HpjvKec29rXUcGIbNcCbjb/SFI
         BQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459443; x=1717064243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=TfZ6dnZmKtfIrbal24T5sQJgcnhmLIiB8N45GJZMvflE77MKpUmBfPZB4tqwBeWEuU
         IozAC1V2d5yQoRv+alWhoHoyZzx/OLGuhhLFU8SBbzV4oI5GwRnsMkZh8hO7fhOrCzik
         SPo9wy6C7YTrTdiBuY4mAO+J2WK3J5ReMZxyULB0gEzNOpShs/4cPa5vQTdzyiCYTnVl
         cZK0WXassxtAH6zntTijdxZpUrGlCuuEdnScdNnNaCouDoz9v53OCkrsTvUpOac3Vlpw
         om7LKq03LPQmDPzp3HpsQB6TVtGiQe4YYQAmtWV8mXMLWJykXmDq9grCo/VORBsBvn6G
         xNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKl7rUCju7LYPBDATGZ3snl9CjgtjvTT+SDrjKX8ekmEos/s0S0/7gdK631l1CxMma5lAXKJkeycXnkNqM5TSTQ/Ipyr6dSBUuwiY=
X-Gm-Message-State: AOJu0YwNWfebsKbaALZnYwic8/Dric4Msxn79S7r2yyQA7CBrFb3ArNz
	8zKo09QxdLJ/vTM2eL6VHLrtKVczjVdt+RG7b/wzffLlYV7irN7pTtLIH0WsCBk=
X-Google-Smtp-Source: AGHT+IHf7awBjw/9D/TT+Rgq+OAeb8dHAhP0xUpM418Uxoc/FOiPxZ31oJO7H7MbUzlhcOAfgCiNgA==
X-Received: by 2002:a19:f618:0:b0:523:89b0:b03f with SMTP id 2adb3069b0e04-526bf35ccf2mr2563834e87.28.1716459443132;
        Thu, 23 May 2024 03:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52812cf2e1bsm215911e87.254.2024.05.23.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:17:22 -0700 (PDT)
Date: Thu, 23 May 2024 13:17:20 +0300
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
Subject: Re: [PATCH v14 16/28] drm/tests: Add HDMI connector bpc and format
 tests
Message-ID: <7xvmyypalx7letzlyxoootpc2e7io5f2no3pu7jnmh36m4su44@6sewdztpjqfz>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:49PM +0200, Maxime Ripard wrote:
> The previous patch added the bpc and format an HDMI connector needs to
> be set up with for a given connector state.
> 
> Let's add a few tests to make sure it works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 509 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 160 +++++++
>  2 files changed, 669 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
