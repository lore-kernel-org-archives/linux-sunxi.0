Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA3015E86
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858077; cv=none; b=NjFbpQRPQy0A3CrurMPN8xLhoYTXcYNIcNWn/sIg9O80ydPVRakjDVsoSoUxCy+PJxKC1FNzoBil7ZMCoXCza+Pzf1LH67Bn8BiiKPBfA7S2Wef6chbJfe1aog1SpP7Xe9SSY/GBBbaBpyE7XyJf4pCpwwiZO0J22snAcnxqCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858077; c=relaxed/simple;
	bh=CvD3137K3jv+Zp0e+0UTpl4U+m05RFshYujcKh12WAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0hLqYRdifXQV7g1AtMjhwS7fjiKuOF28xbIdco99IPyAUppf//3x7JrRMGYvO6CVNdrcW59E4EkQ+9xIHtdyfIWg1RV/HIhRiKZijL68Y95dCKBLxZqvgLhk19azQslnbcNzPljco218ogdeBGQZBaiG97hXJQpc2Y6O9UKBJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6Nq6f3I; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6Nq6f3I"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so2411221fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 May 2024 18:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858073; x=1717462873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=l6Nq6f3IFkrzjAvAhXKrMAnCWINuMKhX7pb4rtwG2kGuxHRTfncHHkbr9iNJwSJdO4
         HuKWxNmzouliWQsunNpfe0OCKEci7Xd3dl5758burjrWnMi08GceUAtnI5oAVZ58+/aC
         mg2KFA1hV9YXVVOLly2oWcob+S/E7t3aMAPnZQ70Ld2hLehrWZ6rr0iNW6dbaacVaZV5
         yjUM66qfXDv9NP8FkNdh1p6bm+TcXQL6OqYAKIrbtESSF8pyjlTjLuIR9UXpXrGXb4wE
         i0QA0g0pteJaWvuxbqtLq0KPbfFYDqbUlQ6v89NI+8eSwmNlrl4Wl6DjfnQFKDPz24y+
         90Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858073; x=1717462873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVWdPdkqG+FpK3oH/DlfMMYl8/VYifM6OkQGUd5A4Q8=;
        b=Lbb1Ir2RJkFndzdpZ4HVsd/bKCrbI6g6lcFEXYF+XImqaiOiuytISA+qZqkNmVl4Ui
         F4E2NTSlvHxdZsowazvUShFtBEOryQWf5UtezvWIu4Wxy3X7NHHWr2mHfWnSx1sqwQeD
         NSSN3i83gPPDk7rnB92ZnvJnePOWrnqk2/pJgbfcQeyvh1RXRMQ/X+So5l9DwaAm/tNw
         ecqGCVfbaUq60R1BQhVTr+aDCzFZPQPw9VfVrYCEwAHsgKJ+h08F/TryN8zhZfiwTNgD
         20izITU6W4FngLarapKArLgtBiElUk5kEfMDZzf2tPpOstSS/d/P1c02MFwSWmmp5nlr
         Z29A==
X-Forwarded-Encrypted: i=1; AJvYcCV7pdP3uj1Q2BxrgyrGNK7paVVq0pC1DZvRXyiZN3phhWwtyITZfBoeounJwglDvP4zviZxXT38F4COJ1oAYCOcgrepdm5gGumEHPw=
X-Gm-Message-State: AOJu0YxyPxS668LFyBoah1Y4zjj1LvIPDKeBBkWX2uqmbOkA+GB8zR4T
	hVx5Zdg3Iu5XlY18ZAZB2tx8LYFO7u966V+7AIsV03XyFKknnOTZNa1vctdBapQ=
X-Google-Smtp-Source: AGHT+IHJTgREWZz1ERTKguUSrfa2uSdH6MWQOiMMxr9ZzLrg0bQtJ+SkJaUNtX+UKWWdzgu2vkTWKA==
X-Received: by 2002:a2e:9f16:0:b0:2e9:8197:eca5 with SMTP id 38308e7fff4ca-2e98197ee2emr15410431fa.0.1716858073013;
        Mon, 27 May 2024 18:01:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bf23fc4sm21208521fa.134.2024.05.27.18.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:01:12 -0700 (PDT)
Date: Tue, 28 May 2024 04:01:11 +0300
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
Subject: Re: [PATCH v15 10/29] drm/tests: Add HDMI TDMS character rate tests
Message-ID: <duizmokcym456fn7mpsfwrwsgazwy4q5nhtfoi5ih6ntmd75th@7yxduxya6j6k>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-10-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:57:59PM +0200, Maxime Ripard wrote:
> The previous patch added an helper to compute the TMDS character rate on
> an HDMI connector. Let's add a few tests to make sure it works as
> expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c | 300 +++++++++++++++++++++++++++++
>  1 file changed, 300 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
