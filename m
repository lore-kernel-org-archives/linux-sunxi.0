Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FB2BEC3A
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047920; cv=none; b=EADLsmEYx3CV7ysOWip0pnidFI600tcEU9ZNPKTKEihEEsmN97z9DVFkBlU+cMgLPTHhc3W8smxHXWYAew9TXZviEAx8wGHmWY9i9F93vY84Txu5jdPbhmKfzIebr4ab0Q9h7acJQpAOUeCuev0zXdEFanUMuB1+wZHJZapv0ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047920; c=relaxed/simple;
	bh=1/mrVoFRRvpJKLVB9yIweMc38FlRgmbKvH5lbekmKJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvXDWIy9VZSsFBGjGt9t6MaevNxZ9ozBF96EMbwsjzo6z1RB8WhnxW7r1+6iENcQElpo7FJmJvMw4DDH0odk1y1H9TAzUCnXSE4NCUbWc9cnLPo+c/h1VgrhlqE0stZGWlmLFn13ltDFToN7gwGMJSrlYh0Bvi8VzAUq1ZboMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mp4uYkh3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mp4uYkh3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNVPSr028423
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=; b=mp4uYkh3my/rx1K6
	uqOwewezFIOGTfAWBC4LJiqXSiJqYkSyfHxq24uRT+mIf4ORRgXxNBO1vIH47rSy
	tykT0usK7356iAfJwZYeMFnpv/zxwfiN5BCYkgwenWnIQrDjUdM5DD9rwaYu+6Ch
	ZIDGImYyjvsPMV/ckGhwjS23Mfctwxrt9E/To+vfgSwYazOG6VG/JECbyWiP7v3n
	jwJIAGaAWGWZHrREK3bkxDZt2+JJWyueAGlml6EDioGbF4aiBkiFEP2jbhEKUTNU
	nQNFfiLxGlXw6ViWcpjGOMoK+m9MCrUa+ob3FPzOl4zoUkO9p3LJC285H4tXp7rQ
	Dtscqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dfe8dafd18so24758171cf.0
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047907; x=1759652707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7b0AYTyN594l8jjE7IU9Ox23Y6YfPpI2powo8DyoE=;
        b=k47/ML4FTMlnKx/romlvJvX+765j28g5JdLAy2WnqoJTg1kybY0/yWg4ZrgCx34O/0
         NFA+uMMyjoDZBG71/3GAxsyUmw66MozTp8YQM3PYjkoJHMu/ZiJnbMOzjdjAiv8kYjlU
         mvwylqhWJmCPdMTTvVBgfzizUJqNcE87L67qnvTHl4xEv8cQ2zm1Jk2XEhZv8NiVXJb1
         Rw4mqi62Lyo5UtOviVYowCF6pAlmu23hYYXcJKlRYrq9icTTACX3Y2X8E7QPW6PT6hf+
         sVkXdCK75eA6rQOc6i8f4gg7ptzoF25Vf+FpdzhIsYANNmoPkUpyRUCVvByW+3npLHdV
         7mVg==
X-Forwarded-Encrypted: i=1; AJvYcCUJjwQstVwf+w02VZ72wjCEz7pKA76WSpTpaA1pa+38CA7xApbPc5PkzVhJEAC5xKo2h9JWRLlPylqLtw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1IuK5LuKEaZYQrCG1rxoDio0mEUNoE+b1qCTZesmlKmSqlcqG
	FPJRd+wFYV2t6CAViqWd1aP/otxNL3gvBXmsCHnuVnM1RYdFItBahx9Hh4DgjKK6oRezCcjiRCS
	sRm1HNiJdEexB1WhbEQrZR1eAfWDDQGiWbjhbOTP85oAbUcWa2IIhSAIgl6z1hNgIsA==
X-Gm-Gg: ASbGnctHFE9lBUqHGw8mor54dhd0T//Pv+hohrpoHiOyYkdufwyDtBDBXWUNpM5HvPL
	kF+AGF1D/345l7rajao+/D3Fb29T1M7Da0Q8Wmrwx9Zuy/pw3sI6geFokwWw/SLuul12Z0mVlwc
	wv3JugpAPiOsH5ZOc3ra7v5DOBE52j/bqHrfVOsRd5zilW8m/cEqAQDUlxkwMGIGubtR9pPZCTY
	go2Jgbg9MtyjmqJvTVbjXDF/P6VvnmB2NsUwXWC+flL/5EccJxGQhtnriw4J3uMrLaAfXRDZCuQ
	Xu2hczRyZs8fqtxtp9KeU8i2B7Hd0PDzEu/He/QXEyhwVA6VufvBuUiqm6rRw3RF8FHCOrpdU2W
	4GH1L/B1+L7wKmM+cx3waRSCuUdNlM7mFFHqhtPEajjxECDNFE6BP
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id d75a77b69052e-4e03cdbd513mr20512951cf.61.1759047906710;
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4tHD6skIRR3PjbcrlwIurQ9DEwp1HfbyW5F+wYqRDoVlCeVHGTwgYk18z8akZBkWd0ey2Ew==
X-Received: by 2002:a05:622a:4113:b0:4e0:3cdb:d1df with SMTP id d75a77b69052e-4e03cdbd513mr20512631cf.61.1759047906284;
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:48 +0300
Subject: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1/mrVoFRRvpJKLVB9yIweMc38FlRgmbKvH5lbekmKJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTbRA2Db0kLZgBdJccCkRJyGWafvFK3UwlK
 Og2krTm2XmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1XK6B/92TZdiTuBfCGlRC4tos6HVjULlKxbSlGenYR7KxEuZIHS4Dk0YnbH092fpCdLBVwu+HPU
 ujJ62abOk2Im0tkGhv2TcH17QXLGxsVHTeyqEaTyUrXZ6CY6h0NkastGwiYHf7g8QlADuFs1GxS
 lW1oQ+pI4hic2KPX/aJrg1zgAtNlypZ9RCJ68akVjorGwphcyKNLVN+zLiaMTr2sw721zRXl6Ds
 +du/mKltWJZ2dFgc9hP/NUj79ScuZN5JP25DmLz0AaFvVGCMmY3VVDSzl16zxQo/N0sdcQr0wd1
 8zhPxNihWZjFB9JMpn9yvj1d4yupQZF+el6CWN1CghvEARSl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pEtVEnk2vaZHq_T9d5g1OETitwOnZmxB
X-Proofpoint-ORIG-GUID: pEtVEnk2vaZHq_T9d5g1OETitwOnZmxB
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+lDXuPWXc4O7
 /0RE+IIFxL3osg/TIwgsFLq3FBpJe9M0FgGywQuFYcRWaV77WuyW3tnY84MClwW2Ohfvk6ZkePs
 RgYldr6ksHoM4LPlj+oKhuMw1Scr4exjl0+8d6VrLLERf+fpbxH9mh/DnrFu8yg+HpyhTAgB0QC
 RXDrIfy8z90iZUDTB7dwUb3eOJBCYF0i3N++0MQyU3dMrZQX46k6xVgjMfkANl1aowU+dFSSkm8
 PdkyZt3fmwTv53lRtJfpfJ3aIWUNT47zzX6Xs6zJGKnaBNJeAJCYA6fZb/ukilg48gwdYxLijrr
 1o4TW0IUiRNGyDuRePDIQsHV2/QErUSAiEVyqXExLzppegX3zfSJ/ZyPBC+/sAgtUkP6GhItvrW
 kV518nmE9c6i1GIsE7YQFJoVAg2G4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /* -----------------------------------------------------------------------------
@@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 			     ENABLE_PKT | REPEAT_PKT);
 		break;
 	default:
-		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
 }
 
+static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
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
 static const struct drm_bridge_funcs it6263_bridge_funcs = {
+	.atomic_check = it6263_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

