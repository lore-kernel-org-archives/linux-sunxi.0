Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B4341C6E
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Nov 2024 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884704; cv=none; b=Ce10873YFL72Qeu3ZjhuLDuLEnJmdkhMr6Vr6+J1Sqhq3t8RTrPbD8bhz4RmCBtpseDO/bZyqaSuBXyYqRhGrzaSE5q8rIuCC9MN19UD/BocGbQPUjJjmj45V5se2PMUhxAPbLiOddZJrm813r1rM0JdGAM+IUNMfCmncn2KBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884704; c=relaxed/simple;
	bh=TwpR6YIbMorWG5x7v79mNfeTA32IiysTOtswnBi7EP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCc7NAPzGhEuxy+2wZMFJZkHv+L05XQ1xfyIVxxRRUy4R4xWvRSfz3utPiONtXZB6V/tr6aQvaIa08urCygOQu6f/on0lmN9X9oZiMyRGeDyBMx/RBepf1y/pT67Ffpxhxd2vhj8Bhbj/OcWV/Kz0prB+sxS56AU4aJhu4TfgLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sw49rPVt; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sw49rPVt"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea5b97e31cso27630607b3.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Nov 2024 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731884700; x=1732489500; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wDP6nXqV0MtINrrHnzk5JYR07FFy3dWX4G1E1aHVYAU=;
        b=sw49rPVtIdGuBy8yst/rlgYNLMy76/tZHID9AsSRyTG7QUzde1YdQTyofeZWnN86yf
         NLNM4xwJCnjH4iNlwZYya2/z0l64Jw36FkkOojKsZ8AXpRnTVqB+3waj1MxKeUdQjbwU
         LcNEHy6RrPuk0fq1oD29kJWtlxw0d2cq7DC6EqxNEx7KTcb+V2skE1bEFbfzrrwHQcCE
         s6ikWo0PEItBrLlZos+R+4tO+PpkA9E2J9pB8eKTReDYxIP5mZ0sNulD6fBkxNM2LDLC
         gv3dkU6gcnOpd6Cj31r/k/s1GmK5K4itBHanNcUKkzUk2nQdeHDMOZYm2cRHFbEUfZRW
         2RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731884700; x=1732489500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDP6nXqV0MtINrrHnzk5JYR07FFy3dWX4G1E1aHVYAU=;
        b=i0CQPx6jwaK/JxnF/31FTMvRBbGnTgEd7cE2RNByH2rmu8ObdzA6B/IfrXiAqH8Klg
         9UAG/XVLNfa9Gmhf4i5kno/DocPOpQd/Gcl/nKRbO5qX4O00TdAJ0HGtF6zicoaqLP6U
         0W1lcuaHhGAsKDGw8gVjxd+Ju1pLApIbhovAu1OX43/zcASK1eOZIX1oL29SpJLxMrIW
         gTU/agodkUPM5zeH5G5I3FtqEaXi4a/7Wx6+wRDCHgUg1Z7YXvIB2VxGVUwZtDnxITDH
         OWkuQl4GW7CBJqX+N4Mup1Q638WpVCa88WlQz/BvIBiQbfBcf7SUjYXYA99Isg22Wc8h
         YPOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP9mmOJqt17M+I3hZ32bG27gNy260A/N6BATKBMq1vLFv2SoxPebuBeqMVk7osZtdr6aJlzl0IzhAZpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCrkh4T0IEFr1Y8iuq+p9FJEhar9vTIflzI4/KEbdoP1XQfecn
	l7iro16g5W8Ai6dXLYxkIM2ZLb6VEktYD5OFN23yp9msWfKFJGsYA+CBCf6enBidNvkH9hCuXo1
	Hum/Wadl6N/bdGBOXiZZ53WfK5OH4gdPXlABP4w==
X-Google-Smtp-Source: AGHT+IGVsF/URQuiejSFS99+KP1AY+jCheh9Nd1ZQr7ln/8GfgdK5A5KGqyQAn7jrmLKuajvWL2ja0QoE8LpmQwfuqA=
X-Received: by 2002:a05:690c:4b81:b0:6e2:fcb5:52fa with SMTP id
 00721157ae682-6ee54ea2bffmr91201617b3.9.1731884700024; Sun, 17 Nov 2024
 15:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-5-b1b523156f71@linaro.org> <20241117212427.GI12409@pendragon.ideasonboard.com>
In-Reply-To: <20241117212427.GI12409@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Nov 2024 01:04:49 +0200
Message-ID: <CAA8EJpqCXPQD1qkdGCae+p6YtGB9rrFBKwt1VDSK__We8dAfVg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/connector: make mode_valid accept const struct drm_display_mode
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Dave Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 Nov 2024 at 23:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the patch.
>
> On Fri, Nov 15, 2024 at 11:09:30PM +0200, Dmitry Baryshkov wrote:
> > The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> > accept const struct drm_display_mode argument. Change the mode_valid
> > callback of drm_connector to also accept const argument.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Assuming you've compile-tested all this,

Yes, compile-tested x86, arm and arm64, this covers all the drivers
that had .mode_valid. The question is now what would be the best way
to merge this?

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>



-- 
With best wishes
Dmitry
