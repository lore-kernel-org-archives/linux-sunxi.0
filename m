Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA3037FF61
	for <linux-sunxi@lists.linux.dev>; Thu, 21 May 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357590; cv=none; b=FtFEtQHP3mBmBaMHmiwwGjE0rXSHkeUbgV08UUeIl/pbOC71NJrtxVqJfwqO2DAwOwo8GPDSn8ZxvWnqNK+UTPk5O/sxHc9++93A39mDNp2n41Yv2c4PBjj+Ejuf4i4ReBB6tTBwiHVFB/sJMplN+1LGugKhPzaCg+APGru72M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357590; c=relaxed/simple;
	bh=LkSopfWII/lcGmM2n4IOlRw1uksN3kZC4Q8rc5fxC/Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f4Jl0MUR4VSPyJ8gLom7xmrEfw2Y5q6/QGhgxBSVCO8xBUEcmts7IaZ5cxrBvnlCS0FbopsMDDT3DXa5YAumIgC6Ypj83SJ/NhSkMNXCkc6rpivJ8KukBtTDVKspe8GtCburHP3ljKvis5DwMbsnv6Jmo/3hCvmksOI/pELmGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLp37pj+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLp37pj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779357587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
	b=hLp37pj+q4eIGrevCTezRIoiOfKdGJutoLbJZeBnibmzlNDEunB7sEA5fLvAQwK9QQGMe8
	Oz/XZs5ejXEKZi1JvrYzXj2EQbxdcs3BVg+60cZlGZzDeqe0skzKjt/kdM7pIc0pq9XQSg
	nEvwKbRdTCgcrvoP9tyREJv56/hQ2m4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-prPA86LGM82WnzWWBEaRaQ-1; Thu, 21 May 2026 05:59:44 -0400
X-MC-Unique: prPA86LGM82WnzWWBEaRaQ-1
X-Mimecast-MFC-AGG-ID: prPA86LGM82WnzWWBEaRaQ_1779357583
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d7a5b9678so3905277f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 21 May 2026 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357583; x=1779962383;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
        b=ovF8R8N1l075QDIYc3WHq1pmThEFE6V170UM10d9lIKrujeXra/w2xsYX5OUrdR3n+
         cJpmFd6i7zVW6xURe0xaFhP+tIR+kOBBCfHBxon4fcsIO5UOTf6NRMSD73iN4W0HWbCv
         lVfQhtRn7qToOG6bvu7wj1VZO3lMDqz+MTsLh8d/G98hMqpkAvl5zmwNQi840FGuNBXG
         wenDRwNlSbG4V9XUrbNwYf5lt2hFYOuDxz9yAEveTMgL0/Ls+Ta254NXUWUVpXCw4Dln
         mqxtAec0v3vDd8w8o2O62U6IVFzC6esOxpHwAKW20ZUvyL3pD5CE3NZWzxWU0MKCCRKt
         McIw==
X-Forwarded-Encrypted: i=1; AFNElJ8tb5JM6VLbqPPvsDH6I4wJdTOV3i9h6hLydjH8WQWD8TjbmJP/+8cODBFy76hoJqMqGzN2sx6QiHpd4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYPGiFVXFB5Gc713qydI6TnLciDSdP+jyGMg2BjcoUggGWdOxc
	vz1P7p8/Jet9TuWvIacCPvc0Q8gJtlYPO846W2tweGpBaBwaS4Woq7aY9L8uMMyGa7/ItIZwS0G
	QXHi/fSMnqcOievOjiRDsLqVOMfi9OU7px2dJ20nCoPzzrzZjtaKsBmLrrRLjwUiE
X-Gm-Gg: Acq92OE7P8boHM5zFX4IXwekAV8F640m3o6Cy4hPEWLLg3Mm4YD+5YTzTU9OnxVtKlA
	gttMT98AlG0B7/66zeAY0DQFVsEcnnmk3H2a8ubohCOynbrlaXAO6HVYNtqoMZD4NUKnlw+6a8U
	CAyKtw75QJSOGEPgBv5eaUrGSEso+UJwTxaae6DHER4toZ781j0xs24hrmr4JgbSOrJ83lECEVN
	LMjnB2Raq2iU6aeOAhzhU6f6v1gr60qa8E7hoeebDq61K4RfViHgeI6n61x01izaNiwP5aR98D4
	LGF080ftipkKmVVjIguej7YIfhbWvWtXdI+ovpUZshES6O9Es8xV6+NZvCEgsn7wBDF+5ArQMwC
	TLbTxiycY6RxD0zMLhfAGDXH3dmypi+9tsaMBbjJOQNWjEasvz19sDjIlIxWIVPfuVuPQ3mAQJm
	lz8tg3
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967850f8f.21.1779357582717;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967757f8f.21.1779357582159;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9e2bsm1634922f8f.10.2026.05.21.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:59:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Alain Volmat
 <alain.volmat@foss.st.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy
 Yan <andy.yan@rock-chips.com>, Brian Masney <bmasney@redhat.com>, Chen-Yu
 Tsai <wens@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Stone
 <daniels@collabora.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula
 <jani.nikula@intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Robert
 Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Sean Paul
 <sean@poorly.run>, Shengjiu Wang <shengjiu.wang@nxp.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Date: Thu, 21 May 2026 11:59:40 +0200
Message-ID: <87o6i913sj.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3vot6doXQgmNkXsFXcnMNeAKHRLaDlQiIb6ksdJKErU_1779357583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Several DRM drivers define their own local macros or use magic numbers for
> the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
> instead these common rate constants could be included to a shared header.
>
> This series introduces these constants to the <linux/hdmi.h> header and
> replaces the local defined constants or magic numbers in drivers.
>
> I split the changes as one patch per driver, so that these can be reviewed
> individually and merged at their own pace.
>
> This is a version 2 that addresses issues pointed out by Maxime Ripard and
> Dmitry Baryshkov.
>
> Changes in v2:
> - Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
> - Define the constants in <linux/hdmi.h> (Dmitry).
>
> Javier Martinez Canillas (8):
>   video/hdmi: Add common TMDS character rate constants
>   drm/bridge: dw-hdmi: Use the common TMDS char rate constant
>   drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
>   drm/bridge: inno-hdmi: Use the common TMDS char rate constant
>   drm/sti: hdmi: Use the common TMDS char rate constants
>   drm/sun4i: hdmi: Use the common TMDS char rate constant
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY
>

Pushed to drm-misc (drm-misc-next). Thanks everyone for the feedback and review!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

