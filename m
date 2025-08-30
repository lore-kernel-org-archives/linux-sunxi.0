Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9A335947
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513387; cv=none; b=UpdbiATec709jj0NbG/lqBZ8a23tFTlPazfQRmJeJaqYeYfuUUVh9DH6isUyLGMpHtvIA/DAJ0ef2qDqfE/Hg4h6SL3IcM+90jf6YI6g/YaIEkVMJOdZFB0IOrh1+nsUdE+wcKEmOm+UE2SSp5E7LXxqlv04ktyCQ0i15j+u+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513387; c=relaxed/simple;
	bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pMURuAHnzAuNrq2c3yK6waioBQLf7FngpRStqMOo7EJFAwnqEecyo0tLKje1DHdy4Lmx+xk3WlIWbN/mCL2PhDuXqT5ZlnsR/DGm6+BGIyV1jbRQQBAFynGENyJ4ztq37m/zjD0MC2aqyRxR8KkLAWS3cBtvPhmwp57Cjo5o6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o12dTTKN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o12dTTKN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFaejU001620
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IN6pTMVXIP/HlenGwHRNNU
	K4pAbKppfkJLc5GQ+V4dk=; b=o12dTTKNN6jLOc/Zc9GjC8QFtOr6OY4ayJtqWF
	61qJNUDD+dOZ47GtKiiRoD+XQgjX9sMYPTblN1Zf4TxXQPGKppJKHrOs6KB5DY4L
	fx6Ijclr9LavmQFUfv/1GFOE70+UWHBbODZ7SaRI74d1o/bo7XvlidvgiF/bXv8T
	9hxDjVEg1zj7O0Usu1c5UiOuwELRndortQVlB4HmuwKPFbVIjVt4zagVjBshNMLa
	4RKRTer1RKfWedqgaZ1QnifY5NpK/agukFqwcCeZxZy0TwZ2xvKdKS8IrUO9ZBMy
	Tf/gnj+b4515XWSkMIRArLIBJzhHhG3p0ZCfMdYfwT3dr2fA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wectft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b31bea5896so2536431cf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513383; x=1757118183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN6pTMVXIP/HlenGwHRNNUK4pAbKppfkJLc5GQ+V4dk=;
        b=Sl9Yf01H7sRSOjNK/O1lWrx+3xnaepTVpqEE+AARubT5TZvbSz+cOcjemGRgthcbN2
         GLVV1GpUIZmWfDRrpT0W2ak3cm9Tz8W3vdLS2ZgI65B11sNN/hfhvW4iWBoPYUj9h5zi
         NuiV6gNw7IfERn5tyJs1C0HPwi6LhjDHdtgTYL9ihDJVx9dG823YjaJyOd05RsDUAcCL
         DJQ9B8j0xxyV4tx/jhpdXgS9dLfemudTpz2m0J0k4koScqqTpKILWyHDEKbSj4mXS3li
         TTIoDFOjvd4SeuXPoy6otvCEubd0gUBrf7nI1D1wjctYeD2+vwTJ6OADmWB/TswuzAXx
         oxFA==
X-Forwarded-Encrypted: i=1; AJvYcCWQzVfYOZoPq9GWrNbxDrpbyMa/sQw13KV6KCgUrMYh2JpnL3LkjIGu8TweFIEzb1OgpAXF5p5CE0N8/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmMbl5ejlfGGeTbVHNYzmpYk7l4xIFg2HBNTMEOjRPurClrltN
	G7EzXzRv9NR15tazShVdgvVsoIOJ5YxOnEHjS4vUOt67JpKmnGscON7swG0fyKRVD5fTaeINodv
	dboa6qRSAKOhxEVqjzTCLzPX26yBfnAzBCULE5EETQYvsCmY+mRKXM84PC23BTxwRCg==
X-Gm-Gg: ASbGncvsgg1iXiGe9uvY8u0lY0kORtKIJtAKiW1h7DCWI0xj/46NdLtkWio9Bs6slKu
	z1sj17ci92/E1zDbQGBAR2sZexllJOfP9xLzJHJQRvCH6r6hu+B2RHIsvbwFIAEVB0hpikQgLrh
	G5QnzZtOJoiU2Pn5VQ89QVZcii22ZKTx7jk/kIjoQKjtd0vZEMU7GX9va/Jree/EEELya/r6tLV
	KQTSCdDd6J5Tyf2eSd747NMjlg+UekHaK3KCsQZelLiHY6/Z1RzxpakVjfJp7s40qPAoVMSjnqI
	6fEc7dc2Trw+TH1AAAtNmOe44S5hYYAvVoCfy1CbZEb01zXZAQ58Cc1LS2KC0ENgj34C6Px1pqP
	uv53S/Tm/Uwhq4b3Au463sTgVz5pE8p9lbkDXwAsmLr9QB+NIwBav
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340841cf.28.1756513383063;
        Fri, 29 Aug 2025 17:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9LDaqfPkXcTKRcfc1aA44E7iMFC4s0jpuyP6SEvxDgqx16wPnVQjbJmp4eKUiP/CaJNa52g==
X-Received: by 2002:a05:622a:3d0:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4b31d841b8bmr6340331cf.28.1756513382427;
        Fri, 29 Aug 2025 17:23:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver
 capabilities
Date: Sat, 30 Aug 2025 03:22:56 +0300
Message-Id: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBEsmgC/3XQwW7DIAwG4FeJOM8dISM0Oe09ph1oMK2lElZMo
 1RR372kVaUd2gvyj+wPi0UwJkIWfbWIhBMxxbGE5qMSw8GOewRyJQsllZbbWoNLAY4UKAONPvp
 kAzKg2SpvjW+aVooy+pfQ03xnf35LPhDnmC73V6Z6vX2C7WtwqkFC64baOO2lwe47Mm9OZ3scY
 gibcojVndR/q3tjqWIZ3WnnrPryO/fCuj6WTng6ly/Ij83FzjLC2kS5r1Y7EA+fzwJGnHMZvd4
 ASbw2h0UBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j2WFIoiYZY4mvy1n1cE7iNg5twCtSflR486EGLADOXY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjU90bIF/CWwFMn6YjwNwwP4vc6O+nHPJdM
 peW29wEpNmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1bynCACiJto6tHqy6NRaMI9XSFtJjDhGG9NxaK8XYGS50rbbkRizcc6WRtsCcNv0x4E8tURgw5d
 xD/LGzTuMjBl03KdrIc1pxIl9YB6IabYmi8V1oapcB9mFf6Z9cA6B/nRxe1rZEppabTUE5N3/Ln
 AQC0I6KKebn5PuPQtJLUovBxSXnu1nIugsl8CK4KZ7Fp+0IPpKcpLvGQgm/eGjdw8scPgD/i8tm
 FDGJHbs8XR1rv3RDvp4P5QgCynMvltkRCGGPQCspMHPNY+A8PoH05xLW86JnIQ4B6Rrb8wy9Yrk
 jKR550siSDIxvPLD7lP43sT32WfeM+BVoBY2Ceq2X/kh56h6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: yU86-fK2Py5rmwIIMSVUsA-SC4O-tAVb
X-Proofpoint-ORIG-GUID: yU86-fK2Py5rmwIIMSVUsA-SC4O-tAVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/o1E4PiA6lKP
 c3ME7E2LlOSfemNgqabZRYiKLOWrw0tCNVJoK0upgoAXh2VQepNWTJifbpp8wcpodeE0pTZLyL9
 1yJr/rXaJIPQBlHIcVs6nu5F3qxhhO23hG4JiVVP001hw6e3+/bj+M7+ac8A1D3uXHsGp+Y3Fh/
 2hkYBB94YpSh9UxkrSlOVsvWZTSkAL3qhJii7EqiyMeRNOPkf0t4dCYrgGdGf0F8xdl3pj32IQM
 JLhKmF8JrIVh7TnhQUc6w9pSXyeWKpURVkwpwgYM3ZaqU2gJWJov+ASoTCCjFHL6+nZAhIFxw/7
 J9ldwTHFVaWRHT739Y9s13z+RjTchLhoA3CmOV2dbAyboo//SCfI0ovA/Q2BGnU/1mf8QnRv2XU
 7lZjvLtS
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24468 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9umpI5-D6xKxpy0QfyMA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
a model of ignoring the unsupported Infoframes, but it's a bigger
problem for the userspace: we end up having files in debugfs which do
mot match what is being sent on the wire.

Sort that out, making sure that all interfaces are consistent.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
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
Dmitry Baryshkov (11):
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
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  10 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  11 +-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         | 130 +++++++++------------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   7 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    |  12 ++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  53 ++++++++-
 drivers/gpu/drm/drm_connector.c                    |  17 +++
 drivers/gpu/drm/drm_debugfs.c                      |  16 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   8 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c               |   6 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   5 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/tests/drm_connector_test.c         |  49 ++++++++
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |   9 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |   6 +
 include/drm/drm_bridge.h                           |  14 +++
 include/drm/drm_connector.h                        |  39 +++++++
 19 files changed, 306 insertions(+), 103 deletions(-)
---
base-commit: f4028ef65dc4fe9010bcc017597fe0fea6479097
change-id: 20250815-drm-limit-infoframes-e782fa7f3360

Best regards,
-- 
With best wishes
Dmitry

