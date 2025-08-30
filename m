Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69D23F413
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539550; cv=none; b=AqH1N27tCe5loOWiWj/RWNh66i+Asvc5ETQu3djir89dys/2UbchK1IIuFMyeM+j/jIgYqoSDUDTPJJnxxuSmV2D6X5zKmjj2g2Je5sjJgVgMvyXN/To5evQI7NPF/UzGTqN8IKlqOse+qgO1gPwNNuv5uXkwJVzUwKtgcyGJTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539550; c=relaxed/simple;
	bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzXd6dvM7u84CiaNQLY87WtNuY7/kiXraykDd2mj7kb74oSMtBUnglVLFN0uO8sEujmk/fHUKTymxdo+1ZWKAzjq0LAcYlVRYMz5ygMF38Jat2138w4nCkr8EWy5Hdu503cKG8fmab+MgwX6EWeN1Sl1a2dnFXUfN6kydMnnnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=bdf59L4h; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="bdf59L4h"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e8704cdc76so286302985a.1
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539547; x=1757144347; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=bdf59L4hWcnQ/PGfTnPpewUjkA91n3BC8EmeZfq0CodzGirCiQr2iM5fESsPcIhiyQ
         zXHHgBr6uOjw6ThRH6/F5xp7cgVrhV9+PI7Y3hPNHb7fPOhXPaCSS4a5J8Mk5aOn3AWZ
         xe93YkjzkjpYG96p6t9TSbNlua9uCgkFBbtTmRYD/Mgj0ZMSaNyx4zOZSnLJOogQlMOE
         uIsT7razpJm3zA1O3BnO1yIupr3h8ODjyrJDkXfDFzNxe0TKTtPWJJSA45v6DCfa41AR
         GjwB8lO9zQjMRTOL4T2FAylIetbtCiY7Ef4dtnwB93GYizXkxDGMgK2p2cSURX89aIoL
         mOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539547; x=1757144347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=qkZ0+rdnLtNHrfP5BhIiF1UtQkRdk+aOYv2x2wgEEZ/PEWl7a84uIbjce9n9kpDmjO
         EsqER01yp5nys1Wfd7OyI5ByF2BfcHwPEddmVGV5HX+7wtd6sVZVK1Yc1sa3g6CIjUFO
         Tpm84GYn9BAwPByqVgoX7PL7PMu4SRFflJzCSklRc1qdhWhGH2HbPZRG7onb/8K/buh3
         V3glQjSwwHbolEPgZRoReXPU5nwc6b0S+WrPSPDqYkkMYj7hMt9pZ18u1PB6E/i3U+Ek
         rdH2caAoSfk4HL+2A1KIsAihh/qJ2d7nUgZgMPaNbKfBc6LDs/2udnbzYNkxDwOktIPa
         3E7A==
X-Forwarded-Encrypted: i=1; AJvYcCWoMZgOsiqpqdM4Jr8hxNVuBiX1ldjUH9+WL1tMMj7v9DKJVcBwNyUftxvQqPwpj26DeBm8jWWOzu7UeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsfXiXbD8fAwW++HMHERMio2hZbwLIsunJqBI+q74L7Jx9Sfry
	O/xkHqrTt7qRh7rga31Ue9MjYaq8u06Fm6USdlYC+xUeyajzcJlYwEWSwtQ0CB0whGJtVgIr0WX
	AaFKlUffjc0Sk/mNH6wVrpnaJqxrJMFyduAC74jamdg==
X-Gm-Gg: ASbGncu481Egj32X//P6LtMMiKO6FlGVeIhxQM+wc9NSY0VKhFGgqm71SyDOWjEpFrR
	TCTP3jQGkMdnomZEQQ6lPYRCfWDscrSBZqHl4KfgQgg/k6d6r6eSKLudPj0//j43hXrUHrWwToz
	1s1iapp+EcAL63E0jPGs9x1lrtENXCMTxRhDFHddoemKfDRGt0nq5dthos+QDWUWv2xNnTghE53
	SXBAO9y6kL0U812
X-Google-Smtp-Source: AGHT+IGcdIb5Bh5zrCRPBVL3fLoDcfNzuR05JRese/yFeQ6WZnki9GRGlAQtC8Gf4B7czjKl7GD5FNu5efT2Tyeq4FE=
X-Received: by 2002:a05:620a:3194:b0:7e9:f820:2b72 with SMTP id
 af79cd13be357-7ff2c51b1dfmr138787485a.72.1756539547138; Sat, 30 Aug 2025
 00:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:38:55 +0200
X-Gm-Features: Ac12FXzM9U8oA3u3fX5rkC_Acspb1Bpg3nyPrRsz__oJ7apEVkNTDxD29-I5hyE
Message-ID: <CAPj87rNz7PPqZ7P4JSKdnizFaEoaBMf2VFBYbpVn3VNt1giU0w@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Aug 2025 at 09:30, Daniel Stone <daniel@fooishbar.org> wrote:
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
>
> Thanks for the series, it's a really good cleanup.

FWIW, the rest of the series is:
Acked-by: Daniel Stone <daniels@collabora.com>
