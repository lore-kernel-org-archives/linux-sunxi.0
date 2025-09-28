Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1780C2BEC21
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047916; cv=none; b=VHpbtx4ZWtE5I0DBMI/YmSFXlpo2hb7cGo6dw4OJkjPDk1MtOujc8xrHj1ExXy0RDI9ELaDxMTnww4JVkPB1n7wzuVPAf+zZaplflK19XqIIe6aKDgoEb9qAPipdKghcTD40Tj/UhsLLdK4yZIXTDKPcnf7nfxEetrNfBHHQpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047916; c=relaxed/simple;
	bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iwSKVa170+5ItmHniupOQbEbxn+f5EQ1MyiEyN9dKq7oBglOD0fiFxzH0Lupywma+DYIAmtmRxFi/BRAFrs/DoIvCI4JCWfdGg2fGdomBNPSsqGh+k0E3dx3KjxRGjlS9R0pB5mRCNaWYUO/RheKx3vzXXf0BoVhR/41IUOBbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIz9ldXK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIz9ldXK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S4vNjo020379
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=; b=ZIz9ldXKvoza1vyG
	ANGsG35rbrWvSDEKBZx4T/x4TOfq6xaMBz23GKsPXm2lmhuonqnh8t9C3QEBtdi5
	Y5ehokjmfi0VWgmUS7ZGZsHiDt80n8wihAudBicKlSKLXgqSvtIq0eIDddewkvV1
	/oGw1x9XiikZ9SpykzOG7FBfsfT0ScdLYie1l0/YZDRMBIqATBGhXyNt7VxZR8VJ
	+GqUrM6iUCgAcTqlN5IwB6FUL6hamlb07036I7Z/jO+6eRmpCZrxfa7ntn1biLPG
	TsNjal6N2ANv5GbZHg8s7cDTDh36ltat/Lc1AmwgyX97gGMoiA8VfdT5UHCfak37
	wKCitA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tjcuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:25:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de4fb840abso50363141cf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047908; x=1759652708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duD+AZtcU7jXcfYcs9q78NTnBJdfETmQFkWPO1aJGZg=;
        b=wHkkscOCXIa1whvW82Typ7hDuMLww0vMsGcWVd4xQ9d68vUQpQBIHYta6IY4YVQFdj
         Fev25fTNWCj2g16f/cH5crU96Qkm+5BPRwlIdJYpuWn0RUr/UEAtTEzKWLIClIrOf3UC
         kI+Lk6hAP1oJnq398MLFU50Pu1oXJSrvFVUR8UKZR6+adaHn3eopQ7ecrRaJiQAHRl5N
         HZA/KOiaub1o3qneKKT55Ipy2XTKXpZ9j0SLkxRZ/FoR7X+MLMPiFIYrSdJ+KoGKwcRd
         7i+mRX+8xy5cRFV068r5aqovCt1OWvIrPZuBbOLyI0d6fS8jZGOZYT+9WgJiZZcWI+BT
         V1mg==
X-Forwarded-Encrypted: i=1; AJvYcCXaMkhqm9yYWgtSHQq619WvwpSHM6c9VXatepUS+t8zpIQA501QP2uBW7L13z+P3/GZAlTmqLeAohOV3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwXED4DfnG9SUr38uvRi/cuU4vfOAQKVBz7PGnb+bqeY850II1
	VDrzxfyBzTId+WdMCxvo/4AcqU7UnoC3NlhGvSydO+82RMRPP2ys0vmzytOpaH7k2nbXLvVFlDD
	2q9N5YFZ1ftUXqoFmANO1zHdG8zdqPn6NPnVYqQLVVNTIluImRiUiH6SyGrAYg6CkNA==
X-Gm-Gg: ASbGncvk9G3EBEHI7lAD4OuQmtmfCQXrq4+ouAQdgz2A8HaRM+CMOAvZbBk/TtyxAFT
	meHjZusVVs1HMzNE537E2ME5j4wm71k346L21EnqLICurDcdZNCdQEK5mQ8SH3nVMwjuaMpMAqG
	cerTl5t7yhHxZ4qnEijivSVFUVVkgKwBI/mD1bSOFKad6+AP+x/gaLZgeCgvUA886i1w71+weAX
	9Duvm3UVnbVWP3zVzp6LWm5Hk+5pF2KgpzUP7V785GRBFLKKCggxthqn3/DAK12uff7Ykj27ZHS
	rKMei69s7TmSwN/ITqrSXokQdtd+hKUz36wuGnNg/OrbtkZIHRgIVmQUWjL0W2OgoBRs8ZaPFfp
	QNQ8gpWYzwZO9widAWkLLIIWnegaYsu86yRYlpuhc3ssXU702VUQ4
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147456241cf.27.1759047908222;
        Sun, 28 Sep 2025 01:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN9pzqLrHlVaT4nT/ykEhCfOzipwXQJ0cAoSSpI3n4X55LPnP5fq5+qWz4znjsC4wVWkA+zA==
X-Received: by 2002:a05:622a:5b05:b0:4cf:ce43:540e with SMTP id d75a77b69052e-4dacd52b2cbmr147455941cf.27.1759047907687;
        Sun, 28 Sep 2025 01:25:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:49 +0300
Subject: [PATCH v2 4/9] drm/bridge: lontium-lt9611: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-4-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vK8TFXgm/6X3TSi0UvfKUVov+3NPXXiYH1OJryZTxNE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUy9QW8cx8zEuP/1bnwMnUwSTpxSXwf562q
 iouLsqfJZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1eqkB/9KIeG/QwkAeQapUIoOZBz8PG1an8ZjgLawL5OLFmRHTAAt/28ma2YWfxkvVXFuHp2gFqB
 6H2nPhVwDQgUsa2WVpeglWwrkYP/1kvjunotI+ERAR+OCw+0OBi2bitZ1wXmSM0IWTuD7DO1Z66
 t5+tIsQQMthkTRVFZfg2Nd/U+zbzV+JEHdzi4IpALFD1O89IF3UwLMzDk+ZYuD4obZXJOW4SSTH
 uG0kMLdfzCJPei04ea9Sqfyotj1bxd2cklXPqxOutI50grHGHYzvKiZ7ak6MxVAojOSlxTtAN+5
 e315w88hSpwX0p8jBaoDtUUgKZyKmjn8DmAEKFJzzOY8eovY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXzAmnDL1ie2hG
 iYz8wlTyuR1iuBWAWWFBAYnkoInkowg6C0sBq+L8tGJrXpsNTppSjU+W6YAIWRQQr+q2hdwyuW1
 8tUoOblxUiRwKNQR+c9mhDsTCXjqoYfy7ZeEDI9VKmsOwXzVrMPurAT2TlUGnIcHuvVOJSwfEjB
 uJ34LXXymmra3FHbLGoLk+V03xZujWWDXKdTx9dVbls0Yn8CKajWKmAFcNMDFFUyHkR9RpZiTTe
 5YECwRdIsHr8JNBC3ihXS+z5uDYmNDawJaBfFQVcx+gLlTCRx9iBlwpaTOCWG1m5oHtHWYXI0FA
 DjFPEkWNXSze421Was/uAn8qaoyYxeo3yfF0qgL9IcShhAxtlGmyEqEYX5kDwaz4r2ThCd/x6qo
 1TtmPmTXjQwoyynKQvZ+lctKVhOZsw==
X-Proofpoint-GUID: dHWVrc87e_W0snTTeR-K6MzC95YqPRBO
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68d8f0e9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XNEcMcDYeHr5uxMbIEwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dHWVrc87e_W0snTTeR-K6MzC95YqPRBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..9c2c9887d2d66968eb1d50544a257d5999bbdded 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -869,9 +869,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -910,9 +908,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -925,6 +921,19 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int lt9611_bridge_atomic_check(struct drm_bridge *bridge,
+				      struct drm_bridge_state *bridge_state,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static enum drm_mode_status
 lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 				 const struct drm_display_mode *mode,
@@ -993,6 +1002,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
+	.atomic_check = lt9611_bridge_atomic_check,
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
 	.atomic_enable = lt9611_bridge_atomic_enable,
 	.atomic_disable = lt9611_bridge_atomic_disable,

-- 
2.47.3

