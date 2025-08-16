Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73B2D3725
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348075; cv=none; b=TAS0rfobN42vRnFtAwDFolrumI4lc9FooTvc2QZVH0P4xAzIehRKaux5B9ur2pLR0r3SziDGaedBHeNdYWhT1UqfKSxvomgMihsvxUWzEl+KG9dagsTpqeV03X78ZK/Kyxip0wqETnFIhAH2mJbeMcS/KWHCD+ACxDOXsjqJdXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348075; c=relaxed/simple;
	bh=rdcPrfCA8M3yJ02gdAYNdSPeQnvEBJT/WVjtw9rGblA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OJbxHWezATqMKWT+ink+xIwr7Jjj8mzQYnXtlrLouhc/sQ7jOw5JN7VJgeTRBo4Q/YZEKiWYaCCpGGcpPxiuHv/SSxl3UxxEIQQOuOQnqMtkQR7KlwBSrFjVmU0d9Xylu/XJq507qOaSrOe8RVj3bmtkh9H4CmK8ZNdh6zf0l3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYAQaqdL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYAQaqdL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4e26O030638
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DJa7R2QHaJhhfx1abJv+FW
	4NHkh9fI+yxSQ5uteT5y0=; b=TYAQaqdLTrxEbLSRC85k4O+GgU0kii/k12kbpM
	j9Ad4msHSHl1HaZrZUmg4NdOwSx01AkfeA1ZEKnIgDJ1vLFiLAJoXdxSvJRFo2D1
	38C6IFsp72fjP8eGc0cBLoobWIXnCh+wZtNWCE+bQis+zrPco24nE9vO9faV6piP
	p+eNVcxzYTaEYUri7fu81LmZSbD/aLS1X1NtPAo9Q8bLG1COM9iGF069/5or2gEJ
	C6q8XG7Szu6XKREScdJ9MFSyb6cRyjKrvpMb2CDJVy0GFarIOk3U52SwuzVVH4Hy
	VysuPJ+0cri59lAwWdogBmH5S2gRO2KOPyPXY4fmdE5psMLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5m8hvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109bc103bso74046821cf.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 05:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348066; x=1755952866;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJa7R2QHaJhhfx1abJv+FW4NHkh9fI+yxSQ5uteT5y0=;
        b=lH8Y+I8xWs487AIBEJQL9nlIEgZsn4zu2Ba/xQ3K78g/9o5w040Ju0laGxiMRfykm4
         uxrdgoqcbJ4ZaiQ21034vE3V0wN8P7FCbt9LYCzzWleDwMa79I/hBnx4tPLDb5jNGAvc
         GEJJKMJdq46HHBFhVT6P6kdPLm4b0lC4mKNs/M46gRdwv36ifDjwOLQ442RKLQ/S/0m6
         51MX7oV1qRsM8l5ZPunVM4avUOqCVbYl+5eUAz9rWLMwRnxuzPo5aaApCznrXJafnYGp
         pO6v9Lc2uTyn1vLNm2xI84YXPe1XUNTCUQXOZn1HFnKW/5GmoSGrdVxCNqd6ZaZFEDUQ
         3SYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqa0007+Vq3e3THSOvP/uxZG2JswAxXs1zotO0BBw2mQzRbT9swsDJ6XCAPH7N5fdSbAs7SHF7I6WOsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXZvGC6q173lTmwiBw9rI26Um/BKh3YOphDjrflOOwrpTA3uQ/
	OuJhOE/UCXvuWVwRHlMkAzR0u/Bbid6PruihYVaifHRlzFJ3jbbFy4j0Ef1IHX0gLJO4uVqV4Hb
	x3SjbnOMp2nLzOBytTmzTw/6sE9+XgBycXR2F3RQT2pRZzLvBAMVtAOgdTvwPEKVQCg==
X-Gm-Gg: ASbGncukf+hKzM7b58ELI1w5hFW4uEYC5jOepfv8+rKQdgAu2xNMb3rVpzayox8BvYx
	oGVjpLbieAp5rhlOAggjt0V3bFvVE3PO9W2KR20d0G/OYrl9Yvt6ndgQwRD+Lwq1XO/+FgpNXto
	hruehZOnZfwpX4/SjSk63OhSyftcF8GPZpfNo5GKTUEnOWMvQtoswQst1DuYClq7zxq3aVYunTf
	I/wlC1DeirEXUa9aiiR1+PuG5uKGceT48b1w7kVa2H8ua7EOaskfU3YBB24RGyOM8XXVBUlTIBi
	Iop5JQ+gy+7bC9uDDrqRR/XoUN07FgHDCyrRjTFKdKDoblyg2gAnI91LS/iZyxzI1Sa5GpEZr8x
	KEFIIS11zG2+pTW22ts1g5kLfWww96cxnq6/kZCACJN1WXIt7HIR1
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id d75a77b69052e-4b11e11fadcmr70445001cf.20.1755348066165;
        Sat, 16 Aug 2025 05:41:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDu/rhFRVUxM6MMA7J2l6dXYr4ZCedu/K1PSwVZjoSHNuoLvoUjgkhh/mHkUAxjnQKCA+q9A==
X-Received: by 2002:a05:622a:1445:b0:4a7:18aa:121b with SMTP id d75a77b69052e-4b11e11fadcmr70444611cf.20.1755348065731;
        Sat, 16 Aug 2025 05:41:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 16 Aug 2025 15:41:00 +0300
Message-Id: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF18oGgC/x3MSwqAMAwA0atI1gZqix+8irgommjAVklFBPHuF
 pdvMfNAIhVK0BcPKF2SZI8ZVVnAtPq4EMqcDdbY2nRVjbMG3CTIiRJ5Z/WBElLbWfYtO9cYyOm
 hxHL/22F83w++h3ZyZgAAAA==
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2224;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rdcPrfCA8M3yJ02gdAYNdSPeQnvEBJT/WVjtw9rGblA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxel4gzygfQobSNeCeCVgeypJ9lKzy5dsSVX
 uc9QkQAbKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XgAKCRCLPIo+Aiko
 1YxCCACOim4bCjHIWqX1M1bZiVMLzRI3Y8QTdbuiNgrmLKiOaXRYiFmSpaZRI5eGf0CarO1iNUi
 IQjq0N0dSpJFtGKIfadH9PJ8064ZG7NIpU68xmKG1OFzxevGRyfeNJZ7i4GhEi/tV6G96JOSs8H
 iwPRsqFRQrzhwp8qORn+7d2WO/i9IRJf/2vrpu6496ztu9HTv0ZNQjECzwcE8yDWeZttI0+4gR5
 LzTcTBEjoqQ/4IYz9y6hTrl+OeWEdnWvuOJ3FPXWNrBp/wJ3O5D8k/YbUSYRsDcSwrd/5CllFgA
 XVjiF+Q3Rz/QlzANj6UXQ7V7QH3pQwvw9ipP0T0b3jfjVNWw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a07c63 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=lTUuHy-DAZNZ5WD40gMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: KS6B3sOl4m2RyupSC01BSQG3S-ydAPCj
X-Proofpoint-GUID: KS6B3sOl4m2RyupSC01BSQG3S-ydAPCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX+ckxpE0/9FcA
 yoXdGJo2/jz57rAr2HLq0F9MVKm3La/NO1svpsefsSmybaS2ri0VRb87JR5osAJCxrMSq+y12bw
 cugJxz6i6nyDBY3dzw1bGAKN3UW3IvaOJBKy/r+ewiR6faNTl5qGZzI3arYuycBJstm2iBT0PFh
 MM4vife7WP8MwLVg2LgHFdshTZoLrAOEu1uQa1A5immIak8ycS7HWEkzYpB9E1ZurH3F14m4Iht
 bLcFNuIt9/Zw1swLzmw8Fi9HoFbninHemeTC8KmW2SjRcN0LK9Nwo5aEvmKyw3VLFPLoiOR0h5p
 mLnNbi4XoHxEklbZNYiifKI1uww2qnTDLPPVFi9N5LeK6g7uu2kXLspCFRAwnGOqYSm+cv83Tg+
 OiLY7R21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6232: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  3 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |  6 +++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++++-
 drivers/gpu/drm/drm_connector.c                    |  4 ++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  4 ++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 ++
 include/drm/drm_bridge.h                           |  7 ++++
 include/drm/drm_connector.h                        | 23 ++++++++++++
 17 files changed, 148 insertions(+), 7 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

