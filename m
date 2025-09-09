Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A5334F476
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429539; cv=none; b=iA6GCbhwoRCBgQzMcHwtyP1/Xul0yl+fj2AVXcIEevDdn4iEhM9Y6JZpVuWtvBVi63+4cAuBf+VlZLQGy9PfFD84zWkj2qw2jGyuoZDAaHZXqHh9DJeMUsXhw+qjfHNZ8EUiJOpKWuyHTXsRCFsPwwIn0+JdR6Z7j/xbzEFhnx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429539; c=relaxed/simple;
	bh=3c8NVkwVRlapMH0v8aRj8kfJ5eVQ+onRAjXCH8YoVds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trjiJdIsKUzLLK6wQtK/Lhlied+vPv54LddjOCiAEbKgV2wd6MYMYSCL0PbDRJglEgbxnR/9q0WMSqAnyp++VEthxE+2t5/YZ71p1jWjt0dH7wYSKzcArT1HbjpIgEuD4Ap3899IZylbmsyrSjWZ8RfEpoPTn4xGfNuID2HcMw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3l7oOO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3l7oOO/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQla009065
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lIJ3FalsCPPP/wHEG7TnMj
	bzvp8BSmctHZt4cp5c59A=; b=p3l7oOO/WU8ooT4nBhprIqQTv6O9TEsT/mZrxo
	KAoKAbD3FT0H6Qvd0GhqDezoY08V6577RYxh+q8dRmL5KMSvj/ajB4QH42f6ZCXc
	gYId8N9+NZL5Scwru34MEniosgzGB2U5KWmUw+lUNf1LpA6UsT2Z61FQW4tmiLJT
	ZjEbHJG3EZzHx4Y7Jmb2LWT96J0NCy3P2+ClMyVhJYNK8c8g9RwDIeB9wCxG7cgr
	jQG6Er505OOa98du7/kCTHYEKSeL1+IH0wwrZ3O8fLnVCLuXDfNjHSHicnAPMuY4
	OtaMtnRt5Jonw6hzLIGjSNGObfCVQcwzzU6RpJgYi7xLPbWQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwcd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72048b6e864so58394836d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429534; x=1758034334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIJ3FalsCPPP/wHEG7TnMjbzvp8BSmctHZt4cp5c59A=;
        b=cbgQwYXXz0sy1A72ozioRR0pAgbrv3KzT+HgNGcsq2aV5bKfu0LU+AaA9naYAFGXZV
         U87C8/OOjde77gvwTvIa1V1XC3GxgoJme/YlmYKNThoqQDneaSHSUqNKaIy4YwdrZxGS
         aMgM1zGIn0nGT2je7b7XmaTSIOsf4Y6P2kYvNXbCc7LSQoOLvK4ld6jjcLs8M8xVaUIV
         NRCTSaMqayd5EvYHpzSz7wksqgaokLgJGlZO3VpOh+Lm/GLkBLbe2zSQERbESq6Z+f29
         P4CjoH6IJnbifvWK2xk92BJ5CDjHL7rF6DHozbsySOgKkuPONwekB4CH+5474IkptteM
         J7rA==
X-Forwarded-Encrypted: i=1; AJvYcCX8zhQeccNbg4PcQl72SWPSzGrD9zf7VUR0WHbxeS4WvBzlf1PDJIBfweZD0X2GTk/leDFl2MNn9hn1RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4BMjogZqQM8ffbyhdPgjtq906ed3E8/sT7U7osDDQjgGuhF4C
	KIkW1bN3BA2bmFJySxxkpRzJsxw6Rwdv2GREWfsl1Ixk0CFDHIDitLk3+/prNklS1QI3UbVLcl5
	7fppESRvH8ZwHyA84A13dEtJFMIfTzgUeV2JbQP/kkmSnPSQKVvQHZ6HFzHYsXUeeyA==
X-Gm-Gg: ASbGncsWqjEn/ktQM6zUFvMWKz8SJgIliPAQ/uom+FUmCKEyWLuDUl34OI4XxSG7FTj
	JB86lyr3zl/PinmQh5pkbbIFlZrWPOz9EuK4sMMy69BSnx5lizUeuSTSVZHH03sfXBevQCTE6CY
	PpgC6cMuUurgpYbW54N9DKCZZq/xMmIhzUpwR77C6+zHCeZ0C6hL85OcUhf/ECYxrpgFLbXhwdt
	zrjEEG5/MU2XgiFKy19oxGmLKQya+FdX8Q4vFsC2YxPKjNQQ2Ulc4SPQvr+y0W+WvEXyesAXKb6
	P/7VDp9oiap225j+0SlELaQkym41dCP11R4/g1QXWGTmIb6Dx6/lR6VWwZLAol9Ef/e7O5enlX6
	Bvn4t98sttBUvaleNoahRbTgeC+APRiHOCHFy0BlvT9ZwagA+UtYh
X-Received: by 2002:a05:6214:2623:b0:743:d48b:1520 with SMTP id 6a1803df08f44-743d48b1ab8mr82526616d6.9.1757429534156;
        Tue, 09 Sep 2025 07:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo+iOfvjcgOTY/sSIw9LkaUSKJ3I2ARy89UHXaxaN7mcgdn0WwePfog4hFkU0PG3BnDx7HcQ==
X-Received: by 2002:a05:6214:2623:b0:743:d48b:1520 with SMTP id 6a1803df08f44-743d48b1ab8mr82526076d6.9.1757429533363;
        Tue, 09 Sep 2025 07:52:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Tue, 09 Sep 2025 17:51:58 +0300
Message-Id: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4/wGgC/3XQwY7CIBAG4FdpOC8uhVKsp32PzR4oDOskUpTBx
 o3x3ZdqTDzYC+EnzDfJf2UEGYHYrrmyDDMSpqmG7qNhbm+nX+Doa2ZSSC22reY+R37AiIXjFFL
 INgJxMFsZrAlK9YLV0WOGgJc7+/1T8x6ppPx33zK3y+sT7N+Dc8sF771rjddBGBi+EtHmdLYHl
 2Lc1IMt7ixfrWHFktUyetDeW9mF0a9Y6sVSYsVS1VIyuBFc16sO3li3RwEZTudaZ3m0wEZLwJd
 PWHbNYkck9/m88AkupY7e/gG5YhL7kQEAAA==
X-Change-ID: 20250815-drm-limit-infoframes-e782fa7f3360
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3c8NVkwVRlapMH0v8aRj8kfJ5eVQ+onRAjXCH8YoVds=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGjAPxqiOIvnrnKUyJWbNyvn5mjVjswC7KJTilJjppXDi3V1h
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJowD8aAAoJEIs8ij4CKSjVfYkH/0+3
 dGXIjakbBGP0zqW2Uarx+0fm31r76/TERcjrTY99UWODgm2krrTSDdOlHEsyUsdEzDEssWTLiy5
 y6hLAHGPWz4WzH53oJ5b8tZCfV7KTyjtpBvml5Hk+NXk6FdvApSQEPtjQE/2ZsnRjL7D59FZF0+
 KjQfwrENNhGuuVTQcOeBw8+nM6YIc+zUeEERBusURRrATcDBvsHSt7l2cXD0m4/tlyzjB5VH+HP
 2tfMvYLf7WMl+zTwQAJLBRpHuXtd6gBlXi5MQ2kGXj2urVrRXGl1R8PCbNp1tuTXBtXC1yh3TzF
 QALj6sDLYdSoHiE1M3bGLbEg9BTdxSzwhrR0NtU=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FDvO_0iFd-Qs3wrHhbl8Xcruv9naztiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX2u3ZCPCX1Ikr
 PJs/wTAoRwu+vKNs4ZXgxOn6FQZDnNmP3hvej91axberjLi/RDHRE5Yp2OMmt+JERMkAdijAuhq
 mZGfR9BHZDGvFetq5YNn4V0DcoVLptScB0AMn6xuJYZ979BujvYUuBZwOAAIM/8CXLOI+t91xRc
 sxOuuK+ASotxY51keD0bQ/oZX7Lebr1RCkWzkddURxmbu1oW5NSlgEgisVjZp+SRwSt8LbT3Bmx
 wyn7ErOji30pliik49pFh+vaevkdjM03SKY+RwGzxTt+zwOtN8etndzq0DzrQpH83EfaVUVokW8
 mwd6vgfrtioSYY66+JG8pSZZ9KaQGRiTTPIUiRyIyL95mhY67IP03YMlQj53vUFKOm8DHI2VVN+
 tv3VY2yB
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f1f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ABcA9MO_GZ1r9rVPDG8A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: FDvO_0iFd-Qs3wrHhbl8Xcruv9naztiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.
Likewise debugfs lists all InfoFrames with some contents even if it the
particular type is not being supported by the hardware.

Sort that out, making sure that all interfaces are consistent:
- Add a way for the driver to define which InfoFrames it supports
- Don't call callbacks for unsupported InfoFrames
- Don't register debugfs files for unsupported InfoFrame types

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Dropped software / autogenerated distinction, revert back to
  software_infoframes
- Dropped LT9611UXC patch, it doesn't fit anymore
- Don't warn in HDMI Audio helpers if the device doesn't support
  InfoFrames at all (this is useful for DP controllers).
- Rebased on a fresh drm-misc-next, picking up ADV7511 and IT6263
  InfoFrames changes.
- Link to v3: https://lore.kernel.org/r/20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com

Changes in v3:
- Fixed supported infoframes initialization (Liu Ying)
- Implemented separate flags for DRM-generated InfoFrames and
  hardware-generated ones
- Warn if required InfoFrames are not supported by the driver (Maxime)
- Changed drivers to error out if the DRM framework requires the
  unsupported InfoFrame (Maxime)
- Implemented DRM_BRIDGE_OP_HDMI and DRM_BRIDGE_OP_HDMI_AUDIO for
  Lontium lt9611uxc bridge.
- Link to v2: https://lore.kernel.org/r/20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com

Changes in v2:
- Corrected whitespace / newline issues & other small syntax fixes (Liu
  Ying)
- Added audio to the list of InfoFrames supported by the VC4 driver (Liu
  Ying)
- Changed drm_dbg_kms() to drm_warn_once() in the Audio InfoFrame update
  code (Liu Ying)
- Corrected subject for ITE IT6263 patch (Liu Ying)
- Added patch, dropping default list of InfoFrames in
  drm_bridge_connector.
- Link to v1: https://lore.kernel.org/r/20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com

---
Dmitry Baryshkov (10):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes
      drm/connector: verify that HDMI connectors support necessary InfoFrames
      drm/display: hdmi-audio: warn if HDMI connector doesn't support Audio IF

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  9 ++++-
 drivers/gpu/drm/bridge/ite-it6263.c                |  5 +++
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 11 ++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  7 +++-
 drivers/gpu/drm/display/drm_bridge_connector.c     |  1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    | 12 ++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++---
 drivers/gpu/drm/drm_connector.c                    | 11 ++++++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  8 +++-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  5 ++-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  6 ++-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  3 +-
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  5 +++
 include/drm/drm_bridge.h                           | 12 +++++-
 include/drm/drm_connector.h                        | 30 ++++++++++++++-
 18 files changed, 193 insertions(+), 27 deletions(-)
---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

