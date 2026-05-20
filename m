Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161C3A4505
	for <linux-sunxi@lists.linux.dev>; Wed, 20 May 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288276; cv=none; b=IAy47sNi3Gn4IeSodBCSMbDKBhoRUymlL9xCReWQiv0C/TklGd/UaBMfXO1y4tbkhuEwGJhl/A4NJKDyPMstb4PP7vyItENX+89pHPYojpNyNP9WcY7kUTLT8AdyKx/FHVuv7Ngd6TFqHe3lcnmI23yeZMEDrd10hqh5E+F5+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288276; c=relaxed/simple;
	bh=/keM7vjYSsPU5nag3X4BSRNwEW2W3vDx27MfrzaIiWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=D/XAiNixA62uWFIwWR8ffwwqEff3fe6pSpxK8WSvgK2Epo0pWCXicE8Qy1QzloM/PYtu5vk5QKi1/8MdUAmax9+4KoI5pPu3RP7yfVLNzbMQtTysMBAOXs6KeuAnbDYnRPBjazhFm6Eh1acdlHScRJmQ5AwuM8OaSzYhTd0kdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/7ffABi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/7ffABi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779288274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
	b=J/7ffABi1ahqwcLz9FF93HZJjVizrg2aXzU+P5zYnuK7AwWrfZ/oGXvKx+izVRsm3lDAGO
	DYXI4Pi9EqbzcWIFesW6T0Zgh8R6tUF6sO3Be1/FpLKeMu9aeCNMqEbA6B4qR3cNhxMPBa
	95fiNG5K+JIg1FQmp8DHgQE9THdnKXk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-UaT7CgUYMT6rwh666UWIGg-1; Wed, 20 May 2026 10:44:30 -0400
X-MC-Unique: UaT7CgUYMT6rwh666UWIGg-1
X-Mimecast-MFC-AGG-ID: UaT7CgUYMT6rwh666UWIGg_1779288269
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-44b186b715aso3138514f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 20 May 2026 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288269; x=1779893069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBONYP+S2lSO7lzzc2ExLTPJBMyi8jCEBbTq/shG5lA=;
        b=Y7cZWPmFX7g15buRWjIOvf7ji1YkKIR+ZkMO53qZ06lmw5uRW1IK9Ie+qU5TwtnZZh
         Sitn8YK9pHjhJxxPXkDchCmsfg2P6V4DVOKMgQ1YbhsabCAp5qAk0XYrrYQxDjACpCzp
         P6bcWzzVy3tHZnIDGbUaKXjpww2maBKekpJVj5W6kAbgRTryAev4966/ZkwHA423pjw4
         df9cqRljpL+FQe3GrGEiJhR1m4CxXrqe0IwycFcUIYDmMYndKACaFuXNzpKYhG177ZqR
         NJyiecpLEgThVZ8Eiapek414ro7DeCRk9XkioNutheQMg0sCIm1cX3B5VIzM5As3Zx66
         N3BQ==
X-Forwarded-Encrypted: i=1; AFNElJ8F3PWG2QkAz4xU/7NMEZ1ElC714tsR7re/iP4CsdvP12oUcAUUH5oB/48ZLwJWy1C0aiz7CpojX+/FvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBajLiinNPMOM31lS6HLXiSFnM4+2aTNkl+uWwHJdYWsVsYWkP
	jWarAaAy/BbxfEAIMAQLtrAFc0zyFUtgTKb8lm3Pp5qNLtupwTZlDcTHPHNm++f6hhZyprmKQrD
	VpDTQ6eCI5Ua/N7PeEkPxDhzo2TgUAsRjEPf4dFPFQelVjC30ieG69FOlprZA6Q0Z
X-Gm-Gg: Acq92OHgNyojqRZdf8vVTRSbp6AvD3Eff4CyZHXNrKavqjplnkdvtDi54HXQJg+YCxf
	EISQoa+SD2R5EFtwP2z374xiytStWgsvk9W7KaWHdcPLQH/jrRffTJp8xV04MzsunnNY2TghAk8
	8L/0nQx9/wK0V+aSFEhNqiWpiCG2oZvS0xPJWhVpeD0sXRv4E8TgLsEwDQ2noBfBUogHOxoqlPS
	cGdWVdudU4yvG1bDbizQKs8d/ivrk3e46AceR4JX2SC1mp0mjRDwO6BUK38FxNx4T7CRoM8RB9h
	lNVtwbVXVKTtpUue5d5++MVCtTrvtAwGfIZNfx2s9hbQ9pCbVXXfydaO1eYXTMQXlkZ368PvqGD
	FnRSJ7Z53EZKjTDplXLy1Qdpo+/h5C1sk+7fK0KlTj1IpQnpfoRxmQDAM3w==
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650606f8f.43.1779288269032;
        Wed, 20 May 2026 07:44:29 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:43e:b0f8:66f1 with SMTP id ffacd0b85a97d-45e5c5aebdcmr40650545f8f.43.1779288268562;
        Wed, 20 May 2026 07:44:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm55752127f8f.36.2026.05.20.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:44:27 -0700 (PDT)
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
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sean Paul <sean@poorly.run>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
Date: Wed, 20 May 2026 16:43:36 +0200
Message-ID: <20260520144424.1633354-1-javierm@redhat.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PIK8uVL3E-nvZchsE28w5VzOxsENoxlj9TgDl8ptUSI_1779288269
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Several DRM drivers define their own local macros or use magic numbers for
the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
instead these common rate constants could be included to a shared header.

This series introduces these constants to the <linux/hdmi.h> header and
replaces the local defined constants or magic numbers in drivers.

I split the changes as one patch per driver, so that these can be reviewed
individually and merged at their own pace.

This is a version 2 that addresses issues pointed out by Maxime Ripard and
Dmitry Baryshkov.

Changes in v2:
- Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
- Define the constants in <linux/hdmi.h> (Dmitry).

Javier Martinez Canillas (8):
  video/hdmi: Add common TMDS character rate constants
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
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c     |  6 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c     |  6 ++----
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c   |  6 ++++--
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       |  4 ++--
 include/linux/hdmi.h                         |  6 ++++++
 8 files changed, 23 insertions(+), 25 deletions(-)

-- 
2.54.0

base-commit: 88658ff0e4e7f46dbf8179af1280f2cb295fb0cb
branch: add-common-tmds-rates-v2

