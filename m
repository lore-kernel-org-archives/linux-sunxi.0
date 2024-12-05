Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48472EB1F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733425840; cv=none; b=M7Ct20hJCkabg3yTh4Ik5tiaxE6VlDmt/SW42YwvEw9lEc9wQv/+Rj+CAlwekUsAgZzGzQR+Z+fbiqCOTpFf4ujZiAEZOCIAc8P8j6GrjZrBlnUKX7sgHUP+dIH/Eoq4OqpFeoFhYfUBt8m7TVFmKfBaWmaPXPeVQmVRPgD8pms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733425840; c=relaxed/simple;
	bh=0JOKcMjrSG6aj6AIJO2JxGS5M9AVOqmJUhLj4Yqo7Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvgCrI6wkJolA6vdrDULBqXUw26Qe69tttJYxBfAkU0In/VhjIEtY+ZoLOyKsUyTQuCUF97ZVd+kvhdGLZqTQgMRXvrp3JGbF1Q7QBqB0SGYwN91n0igWvemINFMfxPkyxQJe900OAvS82we1RFba+uheXtzA1J0CKEo2oBKLtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvLcA6Gh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvLcA6Gh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e0844ee50so1409734e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Dec 2024 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733425837; x=1734030637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
        b=XvLcA6GhVUbmcJUH2zhu+NnkgrF2jNFBNQNQXXSWsC8I7mQ15KfAr7ZXbAWdfY7A/z
         5WHk1+QEnj7Y4RN4ehPxw2vC8ymOd9F200kycFgOXG3oC0g0pDQYLUs1PamCgnytCLWS
         nG5nGbDZRqHBrmkUoCTUt2lBqc7XHcjNFhWUqwI1ma1Hid7dT9v6p8rtmYY2mLhF+nzi
         K/zJyK4cOG9cpzYmDWil8gOb0P5rgFt5KkUHCbde2U+myBPJsH9D27mOu6s1ytA+0IzH
         lOWCohOzH9l/BUDh62HJAt7EdugQ3eD8qAimswP+xnA44tEk+V+DrVrDVsfwTnuj+UDd
         7vKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733425837; x=1734030637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVG1tQuHt3SHcx2mPIxH4KYBUQ1F6QooRs+6KQiv2g=;
        b=LTkhLgm+MPmXh3Q+88xk4T2GMpg8djlzmHCL0PhwSOzo/aYYJwf10z+5xERyUB5wqx
         xn9rb+yxwQXHCFO4cGtVyNCbn13b76iy52vshcJC9yGYBcCwBOiIBmgh7fp+wAFnJGBf
         jJrQzahsCSOXWfBjbO+nGady/NgmqRvwci9C90xkRUo/ZBrfYokSH3ZCmnV/oX8y64Ft
         q5vtnq8AqtkC1vplCv2jEp2ge9kS/FOLKpJodVzakk1Lj3LskH/euqobthZL/S8jEkjf
         3jegyE3ZbjqP+Xm5iF5ckWoRxDNaAyjOS7UB56dguCw7IHV+0KI3RFbIzHjhg+81bqzU
         ioyA==
X-Forwarded-Encrypted: i=1; AJvYcCXAwPJDvzQi+IgRUgaMDq0NVOjzhG1AuBtLBWw1qKQG4DwGj7H3f4DPrgehNO1lq68TulpCaab5y26PyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGbixEZtS20uXsQ049xwubYUoGq/J/NYO0VoiL0QLQb3TGmnpo
	LLheSbvlAqhd43HqZgSDbnXNeS+3H/ft4uBobuv/Q37Mp4blJt3kNIONIHBIY38=
X-Gm-Gg: ASbGncvdNbDagVKrrEQ9628xzOuXjLOhejVdq1L26IiKKDsVf0ufscheZO2bQnjbL/g
	izg/m1smCoNW4tL6s8sgtIqFn+Fo+vTep/5JnghPtN1d6okwiQfq0XAPTKpFnYZIa4Rjfi4F5X2
	8EOqwnYvaX0E5+lJVTjGcfKKS3chyIP4VifuJHwluX4vniYci0bKfnZvIkGF1c9tN/4ApEqOxfP
	XKHM0SwzS+DRCPcqnzoNOSO91X0Yz1PQSFB5qu6nY1NO4gG0AIvRoQVA4mIwt271R5BXIsGNEiX
	CPmIjAS/vkj8wvYSXA==
X-Google-Smtp-Source: AGHT+IHUNLqaLQBuYan1ZGoMqkshI2yl9UY4KpKLMA9S8dD5jZebO/X3lWSvz99JLzTn4lGzisOwhw==
X-Received: by 2002:a05:6512:3c99:b0:53d:ab21:4e17 with SMTP id 2adb3069b0e04-53e2c2f0135mr21836e87.55.1733425836767;
        Thu, 05 Dec 2024 11:10:36 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm314252e87.52.2024.12.05.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 00/10] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
Date: Thu,  5 Dec 2024 21:10:31 +0200
Message-ID: <173342582161.2533869.11795486713615996638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-0-742644ec3b1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 30 Nov 2024 03:52:25 +0200, Dmitry Baryshkov wrote:
> Several HDMI drivers have common code pice in the .mode_valid function
> that validates RGB / 8bpc rate using the TMDS char rate callbacks.
> 
> Move this code piece to the common helper and remove the need to perform
> this check manually. In case of DRM_BRIDGE_OP_HDMI bridges, they can
> skip the check in favour of performing it in drm_bridge_connector.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: handle empty modes in find_preferred_mode()
        commit: d3314efd6ebf335a3682b1d6b1b81cdab3d8254a
[02/10] drm/tests: hdmi: rename connector creation function
        commit: 67d31cd02c8dfb3d006dba62a854e6758cf7a0e4
[03/10] drm/tests: hdmi: return meaningful value from set_connector_edid()
        commit: a8403be6eea91e4f5d8ad5dbc463dd08339eaece
[04/10] drm/display: hdmi: add generic mode_valid helper
        commit: 47368ab437fdd1b5118644659a97a6e5dab45248
[05/10] drm/sun4i: use drm_hdmi_connector_mode_valid()
        commit: ae048fc4f96d716a2ef326bd6e894694057c078c
[06/10] drm/vc4: use drm_hdmi_connector_mode_valid()
        commit: d4581ae8695863b21f9b739dddce8159f3068ca3
[07/10] drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
        commit: 54d7b7f9d637a53ba19d117eb9b01619bb1704ed
[08/10] drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
        commit: efda6551aa866b80dcb5a94158d805c560fc4f1c
[09/10] drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate
        commit: 2d7202c6f38d14260a3998a2aa249a53415a24f5
[10/10] drm/sun4i: use drm_atomic_helper_connector_hdmi_check()
        commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b

Best regards,
-- 
With best wishes
Dmitry

