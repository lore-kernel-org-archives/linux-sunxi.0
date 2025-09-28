Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58B2BEFE0
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047922; cv=none; b=bmlr4AMtC18X+izdwDH8H0wGgx6dam2uifRN9Xy31sSZE86ZRxJbrvrecD+HqdAamMLFu9K78HWyPQhjgA4/F3+p7vAbnHnhML15un5RmL8EDYyvx+q/3BNd0cwm+8rR9/krHOzXya6IxSIYfxrJY2RZo77JihodutSR+W6ifxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047922; c=relaxed/simple;
	bh=W9b6XDfq52rGNwLc4zsgRSvpebnOTLw260yRhrb4Lug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+oqjoiSNdmvVn9hykZCNFbOjO8Nxhtn31teo8HUKR+uX/Q1Pp97LSMX/kfll4aEhxIBykPOHgcBHFBnJ9WPqzu6ZQBwy8zfnjaIQko0g4+48bLeHsOsoU5CHUbqATp+Ac21DiR5k6P7c7jr+IcsLQ2wSD9rM1SkxIXbjMl4B8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buCADdXk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buCADdXk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S30UHq018957
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW6O36yvGMaCMJruxLgmHiMoRnZgXb8542oDwX0AOxE=; b=buCADdXklBonbx88
	yQXEnIVHCKmKKGaKlUd2DEna9Y8RP367YFy0zH5bX4/6GvXxeYZuDCOZ9cQvyZTG
	UPbG6PNp5jQB4ujsyn+/N+H04591MRydIEPB31U+6DGjQM0v31voqfaNdNW2qvpP
	ofWJZ79wt4+O46Zhbp8Gb/D/k38j5ECCMEProZH+zpFbVee99t3ephpV2+QfaWRH
	MUZ5IQfW0rP3W8KoYStNEqFK0G+/Usk9lfMk7zxGbR3THjLjJyAFrVaSEQeeb0fV
	NuCHxn0IWJLfaljOMJvo2jDq8ZYcUSwnyJXS3MeogmTYECHk1TpGaJXEZBVrne8S
	jppKtA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mtrdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dfe8dafd18so24761081cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047918; x=1759652718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW6O36yvGMaCMJruxLgmHiMoRnZgXb8542oDwX0AOxE=;
        b=aRMViPqtyBuofAmDOSXE3cplPuwueT9b8TXc7cM6zRR21lAl4TZomHwSzhmZ9du/St
         0CIJJ+bYjBUqilnHzdVpIMa0wQr8H4ywecVWf5Zm20/HzmnAyOx6DPGgy5WXClWehXR2
         dC3UILU/JQTNTQfSmqby5vivQnwQt+kULlbIkxRBXHTaY9Zbfm5k3vObWc8uOmdvEgyI
         Qm4lqKmknV/2i8aN4TtvfZlv28q2BKHglVN/iNaqCPfhBrZA8UzUFpdyyOr76spOiVDa
         LUIZO3e2NMAm1UwmG9/X2bR4ELt6zNiGORVRlfv/cWREUfJGucZ8onHX4IWNPTOCAvp0
         ofxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH+omymof9Pp1jf5HTvfrUfOH9ustuJO16qldenPY/Poz+aHM/s5xnM5Ccci+qB3RSi+Y7RY0d7ekQZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqFoaF1ZHu4hrFUQeXoSfVvo5o2/7FKm/VSdzs16GhYZdhmwgS
	nngKGk7NnJju09z3utKgADbNl3ZbEafjUbEaPsS2s15mqd0OG4rjcrkRA9Ql9Q/zqIEgeS2SqMl
	wCrDdZaGn4aoFvaTowncut9kgT8GR1JO3l1jPMWid76gwuCAZaS3Nq3WCxbU/wD6e4w==
X-Gm-Gg: ASbGnct9UDv9axSfUz/lCCUrnKgwWxb4rotzontc/b8ZMScxuI9Kt1aIwmGUzHGR8BY
	d6W3vPnzGg5S9CpXkC33AjIJ8DMuNF3axdRe0az9++f2rhY5Wk3/3PqSwd//I1PMsaKKbx1r2T0
	o/1wJYvun/4bNEfBcKaV3a3RFG/AHaF8mBh8eiDGECqzvGe40J5xRsG0VOM1cR/bzykJWsfG7gn
	V5EFBnGO9/mSisxxKvrkl7b21Zdx5TPZalMDQI+KyJ+QzFE0xA4foBnPFBqnmc4CvOXdEXID6rp
	mxoT+eAsuMBlhvn+chaXUNYhbdQVTL4XebXg704RYfzCf8/iqCfvHjoguhT3Ozf9f4JT6pVZpp4
	5RukI5xJKSoi5OImJUI/T27KAMqnbEfJPE31HAo9J18j6ugW0dU/P
X-Received: by 2002:a05:622a:28b:b0:4dd:2d5a:4c81 with SMTP id d75a77b69052e-4dd2d5a5227mr115444361cf.80.1759047918142;
        Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF27D25nggKmxCQPuY2QEZ5kb5OMkUcGWSWenXBk1jMFSmot08OrVTyFKGy9g6C2KuS41KORQ==
X-Received: by 2002:a05:622a:28b:b0:4dd:2d5a:4c81 with SMTP id d75a77b69052e-4dd2d5a5227mr115444191cf.80.1759047917658;
        Sun, 28 Sep 2025 01:25:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:52 +0300
Subject: [PATCH v2 7/9] drm/rockchip: rk3066_hdmi: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-7-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W9b6XDfq52rGNwLc4zsgRSvpebnOTLw260yRhrb4Lug=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDU6HTPvF+Y88cTCEIA/XqAYSXsI17MJ/Kuo
 GBYAduGAauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1cq6CACwsfecD4+Y57wsVqifG4KmJ1uLXo3XecBdE9p/0GhGRaWV3arhyRyfKp0tlB35c8MzljK
 fDtPzmsDvrhP2urxzq1TpspnVu9IXcEypIW0sF87iXw+iFME67+Gyn9a9OkTsH2PnQMOFRkixVX
 mH/gIAf3P2S40lcubBSetxPYyllypeNFWjqzzKMd0KvjErmpePUInZnPTLBd8/Xh4pW3QuIhgrU
 Sm7Z56KIe4dVsOT6HH+7Kq4tyjrHZUh3tKF7qaQ9i4K1hx3kgg/RMruPZmNz9kpUP1zJyzFKYCZ
 ++CnvNdxchJd5yd4WAK1Hb1e0RR5mdzcMjyyN22Bu74kcYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2qknBbJKSTPsX9k5lCldjoPStVUEWSKZ
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68d8f0ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LTYPIh7T-TEeLale1FMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2qknBbJKSTPsX9k5lCldjoPStVUEWSKZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX5viCdXoMbS2D
 Ss6/xvj3d4BGzgs9Wt4KRgJQks6L+ZIGvVL61wFgdH021GInoH3l3T6woae2eFJp3u32783dhEQ
 fnlg4LGHWHqwy1c2fWS9iiYoJPL5Eeea2EYv9CKst9sCRQQ7Q/iWrwHMG+Q7Pqgt1yLXLxFSmDY
 /x5oYszS4pcTtZO9aF7rd3lA64HhARaBQKvHk7JWuDN0J66qAi/7zNHM/DuznUZPszS2v9+I40T
 b2v5JZ9uzwIsn8Rv5aTyar+cGPovA8ZiGm+RRdO3SKO9r9bR772GGw31HwXevyBr2UoblR4TpmK
 3Tq/4EHOToacysHRClNeKdQAeQni244FrT1Gd2i2B6CHp9Tjt2C3EzeALpVJC3Ig7D2mt1CMxZN
 rvU/PspIAg4GlSKTPthFBcgN77iibQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 39 +++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..33f52a83ca4597193de8c012b4cc598e82c3f09b 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -162,12 +162,11 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
+	// XXX: this doesn't seem to actually disable the infoframe.
 
 	return 0;
 }
@@ -180,10 +179,8 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
@@ -193,6 +190,31 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -485,6 +507,7 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_check = rk3066_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

