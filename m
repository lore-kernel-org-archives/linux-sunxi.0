Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6902BEC43
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047921; cv=none; b=jP5EpUugvvkIV7pTy7m/LO31aepjiqzPIVRwwE0GYtb1KHRWIx3NXJXkJF+kNKFkNBId2BzEXBMFVw7sjos081Ktnqfg3V/iY3D0LRh0RQvTZWiGlP8zvDrN18eA2CAfSVm5fAwnTLrLnFwQ0AFrM8oFDikjIQsIrxfSrFr1XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047921; c=relaxed/simple;
	bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQ2rV3IOZAaDdFfhJeWt2HM2TWVkKfnBvrJdB2U7Petqbr4BEHWW3FdFjcoE6bTe15agVRmqhFyVJ5UVqQhvnrrR1Ths2duxEm8HhQZdjFbt8TlIYaGvI5zF7kcH8UY8ZC7cbUCcjYHqtFn4CMkddsyIz/rhsMeilv5FBQbbNag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bi83zbQB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bi83zbQB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RLQRS6023515
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=bi83zbQB9R2tgYEF
	wirUexUwjhpFfFY0UQk2OKbg0pVMZFaIrb99grgYfcAzxPSvuS60r2S4jS79P6ew
	0R/VReOT7NbN0H3G1n3K7mpCYL+XKXrWwaN3rzMQOEU8IBcy8wn7MmFRFJX0prEd
	yS8hCBa6zwhUIsrUKBIL26uwcTuQNcTJPuPlXnjQUPd/nL12+gJjIvhchXBf4MfS
	qQ2r+8Pm/T+XAhF1qOHAjhPKHEz2xKzcVJ3sh1GJVFCkugr41iXG51LxFmyjQcOW
	lhG8pk855rGtpRkxEJgf7NhWlCLGoaMPr6nXyhD/uF/3yDLw725E7DkNHD0p5Ecu
	88fO4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e7gxjdq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de23c3b40aso49492251cf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047912; x=1759652712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
        b=Kw/8f+HxyfuRouNyyaL/YtFOSndJ3/80EfxG0o68wNHUzjklfCEu9l2oit0U5U+AJ8
         hEaAUydLr+Z7GY4UN7eeU0jnJbqcU8tgMDKq/modv623i3XL3w7OyOYobKzOJk7kJ6JC
         cL8oA/It3Yz7xgD3Faw5NB30ZYXCUzBR8r3ARIargawKQoocZC/zLGcRe4FtFOPC0CSX
         3N6MLAGK4iAWF2o2yUKubq2bQE9vDRwjqZWc7neTXDEvsVM/8kV4SteFpmavlahsOl2k
         OnmTF+a2aenrywbeNeEbJaLrJejnkeJH1cwHGIoa6UqsTOokHKSte6afqpzxrtViUMmE
         hcPg==
X-Forwarded-Encrypted: i=1; AJvYcCXwE0CTicgBXV+KFRV9INjmkZI2uOgdo0CmUvE0GmFnU5EGWIhLdUfEdLRMsfgOxfKZmmvUICG/pXQsyA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu0+QUSRUq14r4GCDMZ7+wEEJFl/ZwCaSmnYWwe92oXJfIvaR7
	75kcIgYZaqQMu48OV6WRWZdlnF/2D0nxKZ8xFTXQrO9bszAanna5QcQ5FkqSZe22fsesUXmPbfP
	RUKwii9L0BeBxSHYIItYeVxpsLX7FknxgvXy4hJIKwuFsM+MCZzMQQBEEwGq0T7ZKKA==
X-Gm-Gg: ASbGnctvyCLmsPuWWqOJNlIiV9Hcd2IYqTnkPQagfUs/0ruPs5OLCFtUzECiIqbPRJP
	ZdTqkvIR3QsrsGBz5RBt3NyO9Ie2UgAFn16q0zLhgWEs4PooBuqPZqEIQuo1tYQrd9MwiWzVOWd
	54cMps+K6G1AZBWky6p3iUnYzSXY1ezPdHlzS49h1245gLSEY7Uv/JgUkf1n+eBKxTb+6ddYRy9
	vsL5xh9tGoKprSMpDzhSo0xPAl8dACXTdUycHXaKIsQUEzL3vMHyyqAiPZ6WKKhuwpuQuM7U+X4
	fmstTS4JmLkyLCR2n6PHYDQ49DDLyMH90kG+/mcyhGU5nih/VVoHMdnhn2gHX6p/u78vshZ1XQe
	6DltZfzS+eINGh7VS+J+H+CyV7YQx68PES0UrUZY+lK2Am5bxqXSq
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id d75a77b69052e-4da4735507fmr196313851cf.12.1759047912060;
        Sun, 28 Sep 2025 01:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsNIqfoWB2H+g3E1uE7PflKn+OGU11bpC3EG4TSX+tOi58fQrR/+PvIxxQkzsDoINK0iC3A==
X-Received: by 2002:a05:622a:258c:b0:4b5:f7d4:39fa with SMTP id d75a77b69052e-4da4735507fmr196313521cf.12.1759047911446;
        Sun, 28 Sep 2025 01:25:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:50 +0300
Subject: [PATCH v2 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-5-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUEX9koGGtFlB4dr8wsaZ3M2TeNtH/F0ivG
 Ao7oOkToBCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1TBzB/9xRTCFLc/ONNr3oj8OOXRouw+QTYNOU5f3JvtCOChceyttupikcLtdeTwZUNnQ+LumCqT
 ile+f40xQ5vMYzvLlUmK/fUbPKvvn1ia9+k2z7R68rQDaok1yArO5t2M2U/Uf8yPEAqoHzA8EUz
 6YqzPUCnwBfY9zmldmLJfigddiCMVTu62ZV8uV2xtDXmlrDncAvjqgJb0swzc0biTVWhFqJVjmu
 oxMVUv5+94HI2TQnr6d/PdGBO0hh13mD/NANYX6ZDy6I0Mj3/W2mz2godBTL/jMTCBGzKQUI/62
 fzmbq0BI1/SRZVAezrileWo2gMjGLedsHYZbKl8m09Hph8sE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: DXcW6ZnocZCt9O5zW4L45kxzxLclF9O0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX43Q7Jc5w4FfZ
 2J3fPaX4DTv5pHCqhMHECXGiTFJ5xCLmbOAkp/8QY8vZZKNMEO9Ok0YZzvODfMzP8VSjWgRmKXN
 F60sFtAJmgdDG5AX88zflpIa4FTGOTM0mickg+82iOKugIXCWkKg8xXrDI+U+nJa7nU5KTnUIB3
 5cAcHQGzZNWCBAEo4BVHuZA7YouVr+Lcfcer4CxdMhT6Ctncr9Mc1Y5YODM+W8m6FbosdeIVnJd
 +heMWT11qV00Ckln257kHN5V5gZxFTxt9dWUu4CkFd1EtFJV+vEFOyjSz32B5iy9XlFLCYoeECB
 NxgDDCdvi4ou893URnZbQyA3JFJytaYP2Xbx10JS+DKq6UCX4TUtXJtAnNGeeRZ8q58NgTRWYim
 R128iWlw5qQDEM/f6JiD79vARK0P0g==
X-Proofpoint-GUID: DXcW6ZnocZCt9O5zW4L45kxzxLclF9O0
X-Authority-Analysis: v=2.4 cv=dP6rWeZb c=1 sm=1 tr=0 ts=68d8f0ee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270025

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a77e880b7f58403691338ee8c22d24af570acbf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -935,7 +935,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 			       PKTSCHED_PKT_EN);
 		break;
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -960,12 +960,26 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

