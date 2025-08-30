Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B8E1E98E6
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539280; cv=none; b=jbGBLPGWF4I68Tzhe+ImTeb9yR0FbzB5nDNHw6GapN5ngC8rw0cxKQQvHG56SAPMneqfjiGFZDwe8+1dBKDAEbrJ+DPU96o0yNmo5bEeTSwpbxsNmQkDYD4AN84aZjSfYe43e9M8ULGuO1ESjBEfhtfVJsU9H5FGWdee3lamK3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539280; c=relaxed/simple;
	bh=ddimCuuu8iN3xYZdmcMu0ICYLJHfknoay+NbdcrWIto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eExdz61DWn0XMVj/ZXtfSIwA4a5GM0faoFR18Dj5tzV4oeYfrdgp9Q2fuHQJk2mg73iAy2AXAyhMO/MCCpSBDMWbNz9kqh9HgqDno0RLn+c9OVQHfKU1ocTwyIvbYxhR+xjhx/TIZ83345fi+pHgtwTyEePWjS6hXth5p4IxiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=efxicU0Q; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="efxicU0Q"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b109c58e29so45890691cf.3
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539278; x=1757144078; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=efxicU0QvAMHiDditxhPzBwIEzN3pLqWi0Jz5xl+syb8IYSTswpbfrhytLHerrhv1E
         m+dNAKwoa2/M96q2KpfZycSKnbISMPB4Bw37YcW9H4/0S5ChxWNMWo9tka/qzCU3oVCE
         KNdCiAQVaGM7/qmCTFLdi/AZv1fuo6y3TJIxp5xcBLa7hOW2bRYBYuQLx33wPVjKPkY8
         wvdt2RCGy4hmd7UtH5EMrJae/C+XHUjlWcUiuuB/s7He5KYPJRRtg8I8BQ1vlHYwZSBb
         oqyD9Af1lvimkyKWWeld4/IoT8TGMtdL4ry+XEg+Guqn+63CBWrGh53O6ZkEzgJ0Is2W
         Tagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539278; x=1757144078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=nIdgPAkfFFcu6mV+7bUfVUNg1cESGyzUnZt8w0GxXed77S9L4LI5PPC2oAIBrwwlf4
         tDOrlairUzOcd395Y1dXTF9qOp+/BIVieqU/V8Aq+S2MsEDRKrxy/sI16OsaFWFJient
         rJNMAMzZhc3N+mO9volaCXh3TI2vOSOV7Rni4giE6XHe4xLHi8FFBeip33EpL1hQyH1u
         xdDsa+T4zTxxAWHw9BxLrXyiYs4KESF0GJCIS5QGBAMnBUPbCQLnTqJAIi38PJqatcBz
         z1WpgDNDHv6ZmoruYq951gIDZoE0v7+ArUYZxXBLdGBQhQACFXUhxZ/s255OjrM10Vea
         lYww==
X-Forwarded-Encrypted: i=1; AJvYcCUAa43jycHh3pnRLU2WyPKbEW9NwqIcp234DQYrSDhc2vYgiRJG59+E3AnmOMnhEkuMzvhbk/Ih50gaOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvXSrRJnW90VT5XhfD9YDu9MAiKap7Pnk/WL6V8lUSGdd13+Tk
	D2y8D5HkaNStT8JodMVMzGMRWjiaLq/p04H/YjVTSE9wjyF0x65fOw4uhdeouty5YloMXESO7K7
	evC9dJy2raHdVsNzI4/wR9LPWCi0URSupYg0awDDDTQ==
X-Gm-Gg: ASbGncseoZWhz5DVvq9VbBJpxf17PUvfM79wT58bxLNghmNOhKShfU16LD4TwDl6B59
	Ktg7sXca/d6/LImpOic/BLdiEgfXLuJLtlQje+nNboOedP4OVu0ZBQw/CRQse5vsUc3kP5UB3BH
	MVhhRp9ns1DCum0BchOQuE1estSKIyq40S4O0QdqjbQldhrvSDuagsjPhPw+RcXgbzSg0CLj71h
	ZttiQ==
X-Google-Smtp-Source: AGHT+IF+RtT0nHcRaStCokPpIqIxLujpZpjFFgu9P7ssG1Dbp9cdTPQGJvkbcXDD3qNhvrdS/Kj2NXgLvHLELse+VQw=
X-Received: by 2002:a05:622a:4116:b0:4b2:ec43:3de4 with SMTP id
 d75a77b69052e-4b31dcb27f5mr15037901cf.75.1756539278311; Sat, 30 Aug 2025
 00:34:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:34:26 +0200
X-Gm-Features: Ac12FXz1p7iZOdEEQR_vXRtXiF18jyko9t937NCSmf3jeVcnUDmrfFo9HX_W5zM
Message-ID: <CAPj87rNMr-2ZeZ2Pqb5qG4Z-xtUyOVxbY635pw_PDEjVpd5-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> +       if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +               drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");

'conneector'
