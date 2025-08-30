Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81681A2547
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539015; cv=none; b=iupisXPCf/TGHKMIYurqnaA4g1KsrzH/uVQXYJAkZEEyaZqy4ttVPif63Hwq5MDzc6vdbjRb8o8toXncooyjZEW9oGASLlT6Y7nhwDiQMxXR7aysMNL/a7w8kcvKDU2bEW7VeaEhrAVWWdfqHDaMJ3/O7qApUsA5qDFEVZ5hs6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539015; c=relaxed/simple;
	bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXMiuSE3pTRjAzoXXym22/NvyO7AVlNG0BAUjKqYnaybU3ZKYZjiLrqWp0djuIOSti5VkvxoM+HX8ognJCmqIr45DcD+fmZZf/wX7WjEEoo77yBe4VXvIexmNjR706c6HdHMob5R+G4ihzk/X0qf/hQTSdfE163K55zUrTFsG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=TQcAp3Ff; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="TQcAp3Ff"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b2fa418ef3so27715871cf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539012; x=1757143812; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=TQcAp3FfQERHz/DmXq2IpNwf8VpmVAsEHkPbGCBOOyJwr4smamsVvtKCZuD2ZQauQE
         HYrCKVLKVO2hAa4wD5g+TsxN6+dREoXw6oJ3OvKPqLVCLzBUb1NpkDPMjjymOjBYbhnu
         A1M1c5qSBM2EuhEtdQUgs/d6EJp8BT/b/vYIBy6ZE0Q5e91wbcxPey/LOPhHv0ncdLWA
         ijadzikmEEdh57WNAUOLxzbomuXGuy9Dcvzr7lgFGV33HkbsAlQ2tSY3HBsxOVFZnHUC
         emxLHUgWx+9QJapq2c/k0DTM5EBDjg4mGfDdzc+coVomSGKJuN1tS10X5nSea+dEo/b7
         4Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539012; x=1757143812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=uLMeNIaAm8BYG/2FSPmFztMBhfsC8kkF6ZzBPPbWweaoKv1M7Gi40Gs2o5jM50KuZD
         XD2t9DAQRaRw4ZGmE3hpxAker71kgxi8bZhnre1xK7NP0dZRKR/0SccyHxq/QE1Xddk6
         JqZyYBQ2FQ17XkZKOxcH3KqaggFx7YZl9bsSuZcRPrjJYS4QGFZO9z8VKIMx9HumYido
         ulfFQ54iqqssWjrf2lGyjguz0yHlb60Cn0SI2cS378B896IUgYKOPdbqEhHEiG+aztgO
         ccsbokQ5MVymswfxvIwsafOjjry2ZdJltAxvd4MKs+XQsUj7L73gYpclBsamzlleW62K
         BXXA==
X-Forwarded-Encrypted: i=1; AJvYcCV12OrhT5Tzpk6riuNjDg+Uz9mEslcvZq9y+dKm3Tzpin8Ht0bWtJ0FL6ldSY8zhwghoUUvLWQulCs+pQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyBjdZnfddGf7cOzCzqH3yL4usFR/LXJVnZW/JVD8louc6Z5pN
	grujttrCmup3iF61ksz8NCvgt8gHCwXfQfmEdjh5jVh+e5ajK6NnYyb2y0bMLl0Qmb6YRPetLsp
	M0fNFg1ET0O2fcMA4uamiueWT7rKE3y2ad+T4xBJY2g==
X-Gm-Gg: ASbGnctIO8mNnHJ9iik3ZMzvNR90ZOV3yfZzn4dllWMZoehd7cVS2T4RDmLEsfqs9tU
	c6GmSxK+uxU7ORenBJ4g1/AL+OmNeAxV3sQpVjoizpP6/Pt8507JZ/c40NT+9s7YPgV6ftF2R+m
	altuBkGI7PBT4D0EHOWQBNvFNV6flr6JGlUoghMXwsUo2BfG4h9OnBnnutXexBbXpMo3cY3WBzy
	yyq8XWb3L4AuOnZ
X-Google-Smtp-Source: AGHT+IEoXuFZJwCV9cwGNvRYz37SGk7fTBsYXDUKkjm0VNio3cHCVlLucdjG7nkDJhE227CIqVsjn4jhHmK64RhHXes=
X-Received: by 2002:ac8:5a12:0:b0:4b2:d607:16cb with SMTP id
 d75a77b69052e-4b31d855a89mr14707801cf.22.1756539012519; Sat, 30 Aug 2025
 00:30:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:01 +0200
X-Gm-Features: Ac12FXwherP7pCCw1eIolUuD4CaoGI8lRnTYIDVTJZ8XE8BvqysFq5xqSgK9g3A
Message-ID: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
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

Hi Dmitry,

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> a model of ignoring the unsupported Infoframes, but it's a bigger
> problem for the userspace: we end up having files in debugfs which do
> mot match what is being sent on the wire.
>
> Sort that out, making sure that all interfaces are consistent.

Thanks for the series, it's a really good cleanup.

I know that dw-hdmi-qp can support _any_ infoframe, by manually
packing it into the two GHDMI banks. So the supported set there is
'all of the currently well-known ones, plus any two others, but only
two and not more'. I wonder if that has any effect on the interface
you were thinking about for userspace?

Cheers,
Daniel
