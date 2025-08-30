Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBEC7404E
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539047; cv=none; b=PPWuAiJpGO290bwcmnG4+WVb4uUDkKVJwQNdod6MFpXQLDTFId9pMTYBTc7EgByU4LG3+NZKq1P4EkHiHmVFoICczGtEG85Rb41br4DQqEU90PNmREmN7KWVIUOrbq6H+E5gl/LheyXuBtYFsu2LBF0195hJDcIWWhSr5OvI0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539047; c=relaxed/simple;
	bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBvbRK6fprtj1j4Y6q+MhjaO13krbCF+Kf9nwiuixiH0FUBjm4rVrk+a0U91eOJ9lPa74AIflVIIzR28x0aV/7B2wgqb/+X9NgUz4Rg3JXBOz63J6Pc0dVK3aoy7ALR7FWKA0lUHctn87FJ6VpRR1Aco2UILIE51w+kHKHzuG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=L1UIXNcA; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="L1UIXNcA"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b31201d331so16599011cf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539044; x=1757143844; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=L1UIXNcAgEQpUNKZSjl2k9f2mq7cZwC5E6ZdIpH2S//GO/B7PHOWWfVJMr25LRZJTE
         MbqOAuhpcpCkR3lkJv3GuEbaw+5Jg5sEspPjBqeWIMoRbGvAwPqOHJcTRffqYyCZuL8N
         ibK1BytNYJ1NCkoZbhR8Xn9/LM4u2cjTx+J53Jif+fgKx77W3VaOfl6NQB792x9F1Y9A
         nQy9FE3kYmLh2lZ3Mbf5sZmNMJImzADWKDQZUl+TgRTwfSIF+hteL9UwYtNZvX+MI5Ji
         w6LXFps8o0Use7DAc4q4prxkpwZBhLDQmNggobswSMANSLgS16j5FcnzsFkFa1cJ7Vx2
         lKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539044; x=1757143844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vk4uw/k5t/ngjT55OkWyZFL8hHut4oedMZiTZnhFuY=;
        b=GIhml7JuGsuOHXjqQ8wyOV6A90g7sCOyjQz5FLR9sRdTNtGygije67M5wG/2TuFGgk
         XxT5H8UheTsFibh8XdqQbqglQ/cwUdycZx8rLsJyGAZzDz8R8cR63AGsP5ZBooRu1YWn
         pEraXX1vKeGAllbcqiBfx0uCn0FaM/wJwdN2SAT84Uxy7nR+G7JNY1BWHy7o8Cn6GKof
         jLyllASYUx4HAS2kL1f7HgZ2PfHeKSf2+RCaIE5K+AgjB+HQ949z+qNkUsokdD/qwXhG
         bTmmcsEKQVtTM2fgNsVRjK/S7HfItqOJOxr4qzm2xjQ8nVlvJAvwyKB8KcECBY/IUbQL
         DqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCULB4Pw+bsV/fF3jbpVX9b9e38vTGqv6ULPj2ZRlDp1O08fG9KWaWCzq03qMys59PyjNzw72dhK304TWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZiSuwPGkQjEeYzCqY2NC4672i1/TpTUXYAcPrMpQ7oq+uRrZb
	rwK4B/zkBCJ+ODUXN0S3LPn0KFiBrOxWqxfgLNwitVtj3scLoPRt3NgQhkhFjKXPOp/4W0YIwhR
	LgLpO8XtZS5e69JrgDRfYP4KuVX7Sdrlsjk8bz3N5Nw==
X-Gm-Gg: ASbGncuyQwt0mwMChF63PBHrgTWQhvD8UWGqKzXfIpt8t7VRxoQAEtkadg+XenhWIK8
	4sjtFTEednSh8r0G0pD6iTNme09n5g4nIpxfIMm5OVY4zURJuFUTjgmkMUtxNon8EmqcGLZypt6
	pLoYNYmr7svWvyuFB+lXqLvfLCh4aeUSDd/WpX+exHNdoak0zOpUG73sF5zeyhq0cqZGRui/Poq
	irUBA==
X-Google-Smtp-Source: AGHT+IGOnM65THr0nrJ2LPLTiMMlk+HvsXaVUyczPlRtZjJ7WLdbodWtVaS7JfPnD9Na2PcQiHxYrYNu+VnO9BqbaFo=
X-Received: by 2002:a05:622a:1448:b0:4b1:103b:b67a with SMTP id
 d75a77b69052e-4b31b9c3777mr22814681cf.32.1756539044617; Sat, 30 Aug 2025
 00:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:33 +0200
X-Gm-Features: Ac12FXzpE91ILUTwZS_ZwZMq6UoPhvxeYv_akLo7dKmrA-yDSe19rsUZejc4hcM
Message-ID: <CAPj87rPSqJoJnUoP11qzWXuqvYPb_=vP-5-p7SEVA6JCfcYCuA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
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
> Declare which infoframes are supported via the .hdmi_write_infoframe()
> interface.

Reviewed-by: Daniel Stone <daniels@collabora.com>
