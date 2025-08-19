Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76A30C35E
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629858; cv=none; b=Igmo6mN+MQ06A21sjBhoZnUKKz4mi5Tbl1U8QY7Nk4WH/FpAMCNrwlgkYn/tn/AmorlDJ1Binf0Scm21EvJTTekpcHGg42RC/kxfs500QkYAaqWXvlcJ0a7Gkjti4N8VAwkV4gVsJNlrs63R0kVtV+hYtl7C/cLe5LYTmBLwlns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629858; c=relaxed/simple;
	bh=4snEPQfJfU4oBtKfJvvluAVI10o6iuDrs8O3eQOi2C8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n65QRXflyMYsuc3JFOmV48aKRqDbk70NlKXmfwz4Fb3yhV8Pc3D/839lq0IHKqfN/e/2IAHMuYB1sFZmUqtADzsigeFm/LupzZ0R49J7ywN1HTLQpBq3nLETgdzyM0ce6TVglLx4/T1ZYmoC4kWy6mDm5fZZjKTKyVqK6ra7ADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mSV4tk+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSV4tk+C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHpctn027019
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oqOjX77awAS/zrhT5FXwno
	4UdMuKMxJTGpgJwd+TfEc=; b=mSV4tk+CZ+IF6h3GcePTADtySr/5lOcA4Z0Vxg
	i88WmaFoiQfjhN+BqKpqtADYy8fmfQ8qF3Lh9npdQSi7PHPHh1e4z8jozFvEkIb2
	pA5qQ+HZfvSgq7T9uV1UVdWI9J0LIzaS1i2M666WcsPa1XHIFj+nkEh+pJBFPKME
	bkY5LvKayarB/Qn7UReaoyXqaCMGK0VgZIAre+nwNYrcGTfjDJt8hhZHXD5mtJeP
	I8uXyM5USpCbBXikoTxtkfpVrXHF9/kPPv/uJWDB+FO1+RoBcnV0y/p1Zr+V++pI
	tju3D3nWmAZU0GbqmXEtwj+ZyIWkw0fr1jbo0xlQ+AMsf2qw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhna3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70ba7aa13dbso106644746d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 11:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629855; x=1756234655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqOjX77awAS/zrhT5FXwno4UdMuKMxJTGpgJwd+TfEc=;
        b=MSVCJ6xYANThYpMlAe1mWN0FrgLRkkJ1cYGmJH7ViicoeEziQmJvniNJR31RgKVFFa
         LIhZl2+hBjoIzkbwXGvk1RFccXBZfTyoRpzJM1P6z1PMjqd6VzRB3xCXe8h//UcyqnG7
         C4X8uBtD3uFgOaaZ6fwLzbgJsvGbNf8iKoC7bhSwKLCl1nG09Ph7GwoJjCg1L9QiWkaX
         9/gpz6ZlPWfy8O7WQZwAmqiACPGD4J9v7ELFDrR2jM+7Ew5VCrtAC0ABcsN1KqLSjpUU
         CtEmXzfcWjXqB0XjDLgZj5HD6NSiAfzVGEuCxeSHo51p9KL7yX8E2sbZ5lVAWM3H6WAU
         8hPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvlSzJLEXyOSgkG8lsmWPDp7YsKx4p7h5E6dj3veEBWi4lDT5mD7LNSiAnhDejuniQ/CvqKY2HAHgpQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq2GSUOAQzDn8ZVadcp133bdbnah4XP2xULttsQYp5qT0fJWBf
	Jgq4exURu6a/LbmDB0IGyFw5LHXLlm4g1dxbEHGUfAUTj9NX996IxJxquwfJ2lvv7h0ewjBQfE8
	m+flaUwvc7xHGE5HTLgitsjEyK+q/Qy5laXS6lBBTykkO7vaYq/GOxmw1LiMlaXI8xQ==
X-Gm-Gg: ASbGncsZm4CIHGIHQ7OJZDNUvXxFDWPt5F+QS17feNwvlx4QFVqMWbNdT0oDTuYeg1F
	k+1+VEF7KsuROizJyBUA/tTynzxzUlbg0pCUkaszg0IoW5Gr8Pmf9aO3lGOgcosQDLaYw7AWTU/
	5zfh5bbhPY7bggy90Bf7eFfMiQTcP3EufsboaHC7lZ/vopYHkv2bOYqCUfyyMbxzH096RP6EuD4
	MvcvuqGbM7Yvl52y1C8z++U4p2WIhU7qIg8YGvx/MY4cxyZxdZcRTlxbt1RSo0tpSQwRN/zUJav
	t6z0dZO0sM3WvFR8ldqmPna6VPUmjfdKGnP//7t9p1yjBg4G9++vH58RasmIODtcYk+Efb3AqjC
	eT4o6zu9pt9umBmrgtaKRmGFV/++xfj4OlMeLC5mSP6dlJDk026wX
X-Received: by 2002:a05:6214:5011:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70d76fb03ecmr1180446d6.18.1755629854737;
        Tue, 19 Aug 2025 11:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5UH/CsaY1tu+iFGGIuXK7C4OrWbOsLF5EbSr4M5CMsV+dCVwfAZTb8EJovJissA5wfj2R9A==
X-Received: by 2002:a05:6214:5011:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70d76fb03ecmr1179906d6.18.1755629854186;
        Tue, 19 Aug 2025 11:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Tue, 19 Aug 2025 21:57:29 +0300
Message-Id: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnJpGgC/22NwQqDMBBEf0Vy7koS0die+h/FQzCbumBMzVppE
 f+9qdBbLwNvYN5sgjERsrgUm0i4ElOcMuhTIfrBTncEcpmFlrqWrarBpQAjBVqAJh99sgEZ0LT
 aW+OrqpEiTx8JPb0O7a3LPBAvMb2Pl1V925+w+S9cFUhoXK+Mq700eL5G5nJ+2rGPIZQ5RLfv+
 wc4eO/LvwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4snEPQfJfU4oBtKfJvvluAVI10o6iuDrs8O3eQOi2C8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkb63HDxqJrxIQYe1NyexPzL9xIHdWdRrTXA
 Fyvk8wsxq6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1fF2CACeVmUe9+BfdVASI3ZBc7dYSjYTv32FsbJb0wBdBiQ33bgUKXg7CUEUY4lzQ/Ej6RXQR+6
 tW6bD53HFX14S9dmZ3NLffKRyDYjECDps2zvX33zgL6VRulVaQQVEBICIGjgPzFVtxOUONgWhfF
 TOuqp/AVZTNFF/ZAZ1dROMQctWzPTfMTh5LJ4MVzogwY7q8+pDks6SUFop4idL7K4Ueqvus+ZWd
 g/lyjbhqqYB2b6A91fUC86essJ+mg6xZ9ni9Yo/OMHcQwdPEVTai0WuNOJfEe78kI37R2uyLzn4
 JB+AND2NaG77Gfk8DRYzlNZRV5s5JXJemZXYvg31cNBuUQRM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wNUAvWZyPELfz9EJ-hpBFUBsezNipwM5
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4c91f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lTUuHy-DAZNZ5WD40gMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: wNUAvWZyPELfz9EJ-hpBFUBsezNipwM5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfXzjCxuDdm4QEd
 5OZgBEuVnxK+vgH6PELqe1qYH/uH5MdLaK3oa6q5dh2UljwDPJUQnWDUV5Xc4CzpIxz+w6Fo0uI
 7KTWRWuieRc3BAeaH9WflcrwFeluBs0wu2/n87EK8JsiN/lwbwT5Pv72ACoGuLvRXWm2PlcMZaP
 d3e4k+BxfkaOmeJMwKH4Na38hGhrV3CiXVJPPS87W/kosjCp2qJqmYzkzSC0iTAh6wOcK19v1eX
 o7Pff9l1tvUb0/fToIRlfhIlsUQcett3TDpDa9bULWpbnnJnsIudKcjoOywW0pngVPAT9BZtt9M
 fZMTHsCNfCaIttuIc8ifVwvr+hPOemtzlukpMMhdYpckr66J7vRrTBeVimXxZAdJ8pdosRz0SOr
 B+DoPhJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
Dmitry Baryshkov (8):
      drm/connector: let drivers declare infoframes as unsupported
      drm/bridge: adv7511: declare supported infoframes
      drm/bridge: ite-it6263: declare supported infoframes
      drm/bridge: lontium-lt9611: declare supported infoframes
      drm/bridge: synopsys/dw-hdmi-qp: declare supported infoframes
      drm/msm: hdmi: declare supported infoframes
      drm/rockchip: rk3066: declare supported infoframes
      drm/display: bridge_connector: drop default list for HDMI Infoframes

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c                |  1 +
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  4 +++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  3 ++
 drivers/gpu/drm/display/drm_bridge_connector.c     |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 37 ++++++++++++++++++++--
 drivers/gpu/drm/drm_connector.c                    |  4 +++
 drivers/gpu/drm/drm_debugfs.c                      | 16 +++++++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  4 +++
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
 drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 +++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  5 +++
 include/drm/drm_bridge.h                           |  7 ++++
 include/drm/drm_connector.h                        | 22 +++++++++++++
 17 files changed, 137 insertions(+), 7 deletions(-)
---
base-commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

