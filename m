Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1F31B833
	for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779202050; cv=none; b=ApBntfRibr1wIameAhFsKtVq5MbU1yzAI+CC3Kp7mjI6vbTk++N5IzPtuR/BoMSntR1+ppv+bXaW1FBveQNX3/C5YOaxMhXzlYJ8YSWKlK04h8UIFeVVBwSDHOjoH9UMf4A3diksp7gp1A/W7mNfimx8KiUAoBFrXDC17IjuBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779202050; c=relaxed/simple;
	bh=PORub1hmmDtALj9TsT0FLTOqyO3DlyPnRlea3Zn+bsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=FJDYIt/9Bxw2ctV3G08mGHSk/rW3Lju5vZk+R0n6wwMz7GFAI+fvsppU2L7q7od4L5SE0RWCkfgLJ4LU2T29BxYHw5aFwGyZ+RSlt2ykSuyNcBG3394B/CmxqEQqjigdlwrbaij5vITNAPfeGaHtr1VP1AxclPGCqCA8s8WLZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eO9TQPYS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eO9TQPYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
	b=eO9TQPYSl3Q+yIVMpiZ9uxIESgC0/cda8K9ZKeI2OOwYrLZbGXzCiWWg9hbxkdq9uA4xj0
	7qpoB0FvH8Hqi1DkX9TGZRQo5nv/XaovbfrZ2R/cxWN++pkFMTVIqI15SbFkBnFLGb6OX9
	NDrNFwkSaHLyF0FQGjlnM3/pzInCJII=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-zbDfqkAHNpiuU8CC870-kw-1; Tue, 19 May 2026 10:47:24 -0400
X-MC-Unique: zbDfqkAHNpiuU8CC870-kw-1
X-Mimecast-MFC-AGG-ID: zbDfqkAHNpiuU8CC870-kw_1779202044
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48d1bc85bb3so12767995e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 19 May 2026 07:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202043; x=1779806843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac46A5tx5N3WaVtwsY4RrFV9ou6PtDA5opWWhwSNYcE=;
        b=oqm7OkXm63RcdG5ho07hdy7ynhWyNoPbBWO0+9naj60uSgr11uumP+cFsbhpNmHK0I
         ic2j4z9bPeNJk/qUx9ifUoukUTcyMsKzPI/k2Qg4XgsUSYDzJnyys+feYrC3PjiiABdT
         X+u88zOG1u1AOATvGY5tZ2OBlq5HQ1/J37QUy9iaB/KuhTYBjk8/FB3JfdFDCQqjL8mG
         TPdflDCy8AP0HTCYT76LxhX4ibExLOQ/kxifFLzw3sdmDeNPPphne584nIITw6XIw3lQ
         4+wtNMX4ETw8CnjGMYeGHV6dr86n1ohfLeof7erDjdYQ5tNKsjK16JcN32ECnfPvWvKW
         aTWg==
X-Forwarded-Encrypted: i=1; AFNElJ+qX5AV5fQRxNoarWn2WijLlmaZbbilUVbM3g72BshBIF4vOvR9CseBes4xe3QCsgsoFA09B2k7xdU/2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6atjWBoKhj0I3aDd2jhDGZ4m+POtIUy31AKZe4F9qJg6eOApZ
	kDMTrMBhImThepnmx4mMbPzY0mpYp0+eRXrE2Ji21C7GeJGrCmCDKlwj9YjGxE6fvczYsEpUIVP
	dhVXA6QzNVGHJL9IKVN4Zcm8GV5JRCWi7P51r0mXD2PfkW/vKq4D8HECRWucHhkEl
X-Gm-Gg: Acq92OG1Jyd8Mkj8kIdR3Y2ER0yeALPfVBvOJRRcegp2GpzQoOspXg0vsJjdPdLJIs5
	F1uJ89iijvEyefAZdV4Gsf1aV06IF6y+KnjalSMKGVNpfMhaoqz2+KY/FLz143NwhwfbEdDP6SM
	HubCvYG+/Zl2WW39Mh4rrOkWeXTDV0QoHy+6PrwBnshD6nBdwNI5Luf68YuhFkz8tl8CYvab40E
	ilvEC8y6x/Wh33AAbCMcSdtKHV9/oKN41HP6OtMUwMbFM92DrUo+aC30Oj3UDmNj0Wk9vkZ/s8v
	G5WHFu+5MGdFkMMF74tSBdriziX5qUt98a2YIl1Ee/3bsVSSTnTGI3LJZj/NUKd9q5a/N4G2sst
	hw6YmLcC0AxO4uizwgJ4JN0vIGzzC+lTw9G2DqEV2GoSOvvzilkuRO2xvFA==
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260382005e9.10.1779202043367;
        Tue, 19 May 2026 07:47:23 -0700 (PDT)
X-Received: by 2002:a05:600d:8:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-48fe537fa84mr260381215e9.10.1779202042898;
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53767ecsm298800115e9.10.2026.05.19.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:47:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Stone <daniels@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jani Nikula <jani.nikula@intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] drm/display: hdmi: Add common TMDS character rate constants
Date: Tue, 19 May 2026 16:46:56 +0200
Message-ID: <20260519144712.1418302-1-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 860Rf5ouR34-jdu941Pr4f4r-HA3zaNgkHjwDNm_TjQ_1779202044
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Several DRM drivers define their own local macros or use magic numbers for
the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
instead these common rate constants could be included to a shared header.

This series introduces these constants to the <drm/display/drm_hdmi_helper.h>
header and replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.


Javier Martinez Canillas (8):
  drm/display: hdmi: Add common TMDS character rate constants
  drm/bridge: dw-hdmi: Use the common TMDS char rate constant
  drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
  drm/bridge: inno-hdmi: Use the common TMDS char rate constant
  drm/sti: hdmi: Use the common TMDS char rate constants
  drm/sun4i: hdmi: Use the common TMDS char rate constant
  drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
  drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY

 drivers/gpu/drm/bridge/inno-hdmi.c           |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c |  6 ++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c    | 10 ++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  9 +++++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  9 +++++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  5 +++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/drm/display/drm_hdmi_helper.h        |  6 ++++++
 8 files changed, 28 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: fa81649af168a4d6d5260ed0fa9bbb5f6db3f11c
branch: add-common-tmds-rates

