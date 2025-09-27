Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF621D3E2
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935104; cv=none; b=RGusjQPTAn7XZMn43NN3ADrSJpE4+QpVmhjhs40/j7ZF0zqQliKGU8BJlc+/SrLdzaU1mxBfJ0iPZmNeQZwVe3qiQW/0wgomiCUjlOWNN2/FOE++3ZRcvwPJfmDtEB3AbTci6Xhh/Y1H83TDnB9LQDf65t9GPRYZ7HN1geTM23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935104; c=relaxed/simple;
	bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTwwrGIU9oUSnWC28PhGZEvNr5gsqvHgwMXsdZxDMMmM/rSY5WlRDM3gt0fQ0DXZD/89Lu1Czngy/SP32qI60nzrtzH2QGseiN32NyJA8kGIj1nWy6vrul6SYd0lbLAiLDQ5UCfcYrxDiqrN3pLs9PejxntRpgdp5kIIWaXEyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdIx6sZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdIx6sZj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXCe0012904
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=; b=LdIx6sZj+ysPxWs+
	aN8ZqXfUmgPGSOE6GN5IzW+BuvaToG7k1rUG1kxVNaxMSak90s8eOIeyZRGALhtg
	NrXV44rRYOIrzabDeXmEOOplrponsj+F3ZOUZ/TYElX4db5Wv6PYlQbHpi/AuLXA
	wsXfGaIyOhwXJsJnazyCBiqHsIji3scs06UJlu1Pz1ahLz06N2EGBe17F7hf2HW0
	INHvVdGIi7/GolvWKG/FWC4QIFrR5TYDkt36LVIffpTPO4GHBJd6lDZT5xFyMF1R
	mR+E+DsZBd0DCZEL/1FcMlfOhiUHnzOJptbV7xVmO7rRnazUnBteLsSVhcJzEyI2
	C9hfdQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q4gqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso60478491cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935101; x=1759539901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFhUEfSaFwySRMaGJYEpZSOFWlmnLOv+5YWLz9EcBTE=;
        b=oWVCJomwoUj+DdDD4irSsidPqTICJx/H/m17CC5iUGnnOK8udqrEDGZX1dOzgK+huK
         y4zYb0jqtpmCrqHVP0YBhti7Hhl8u4B46Q/7hG8r3UwB6m+CaEgTrxS6jI7bCCKmjHRJ
         tDd+AAWP1IkbBUjbqjMt7Y83g+U1i9yKaLz9+C2s28AimsLDJRg2P0DraZwkwgy5qjuY
         KYystWWNc30wK7nOueQKPTw/97EKwkCd4+NRwPFf9Yh3s3afTJroaRHG5crqjdkmoplE
         e6K9Sxy/2MoZ5rqibHTz/3FQ84HiKu2asi3Zc/8Bckh7iw+nSwyQ2wb8FcxMuZxyBYpL
         I4JA==
X-Forwarded-Encrypted: i=1; AJvYcCX450+NaG72Sg624pgUG7vIeKMnU1RfPv46b35o6GpvGesFOIfSPAjsNxyIK99M2W//+QxPMnY6HNeB6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMy9GWbkERwBgBbPPEPmSOYiRNccMTdwUwZy6lLyM4L0YY6mLt
	+jwvXRCoiwCA8eOF7NWyO/XngzuhTGYzmif4cGw6GAtakPWtDO78WEkvg07/Iyi0li/yJNNJRoL
	dHfMZt41fcBDXj6yIrqyKdtPcw/eMX8dpmGDaNdIewkXLySD02qAGG+++g/WYA06TBA==
X-Gm-Gg: ASbGnctx9tHHKKztmBGMpqHPl9zIIYiKkA6mWcYxSUX9dl1pjy4cdJjpHsWRACHrOOW
	97Up7LtzCL5PxOz9fOvK0XDBAlhvQA58wKNaKxU0s+3FGSvCmh4agPI5mLS3e9bawcfxLvJDx0C
	38nuWTKW5++Px3GW1i2CHKbXV9bzUjmHaYalKC1xdeNxVzN3XrtbCImiIKiRyS0S0bVfSsBdsBu
	we7KtUur/OljqV1cGetLfDNQnEwo9TRaYAF/xwpl1DsNq4HQuOgM8Dv66705+UANaARnmYQfbCE
	Bq+MBYwHY8vnX196f4nhNCdVXj2gDEQC9+5anSDsC7/ZF12spwPyjzs51q/nwh5L5RNXG4jLKa9
	+a/aXuwq2Gpi4lKcnLdAmxuQDtrVfkb4rgAdcNKNqOXpN/8oKyg3b
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133233101cf.65.1758935100535;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLqabjcVMfWczs/hM1RvjoXYZ24c8DWutZ4s//N20by1dgwDTIo6bz/phU73Cx2EjElCUJg==
X-Received: by 2002:a05:622a:4b05:b0:4c7:35cb:4b8c with SMTP id d75a77b69052e-4da4c39b711mr133232651cf.65.1758935100057;
        Fri, 26 Sep 2025 18:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:35 +0300
Subject: [PATCH 6/9] drm/msm: hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-6-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
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
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vJ6MP4HtyLt5a75BuYCv3CbEFdh6+KuelPeaDQZ+OQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggmZpcbiYkQjpVkexHgZEXDSvw0DXxRboAe
 D0A9gHSrqSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1feTB/0YC+4rnr/Hho6lqvJBXm+BTduk/QVw+LVH6sijEBUHa8/pAnfAaeAOONR4ag7YUWkgqQX
 sgYuRV8cKAwLMlemd/JbVaBZrG/o9/asI/Htr0NYQ7+4VOs05tz6Dsn8KdQyvOYmQAkgK8Iqd4D
 ZcHUMCLjgTxgzcqwaBQ3dPdBKq9WyqgKY0F98RDFCXyVyrihsR8FbdCEv179gCtv1TrW+cUkfaj
 NtZdhMr+XUBpzAWVE7lE+r04YwywRVSUR8Kqq1/TkiOL8Ywc9Er7RyXwyYmKZiLzjDuNA7m6mfK
 lvktPPCBln5IT5K/Oqv+Aj1Qi29ArDZfpGZ0XxlheSJCAr5R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5ecqQyA/iV09
 fTPuJ62fEv/NtxBnHCWWbvBRhic8sXrVwwEBj+4QbV46KpWHrnAJXGvyVU8EqOZ+2M4CIF7otXG
 MGjMLnl2q65+v2C8HNS51wklpp0mxkosIOVegfun95WhvvFR+EvtXt6PmnZOSilA+k02zmnGT92
 TCmk9GNX/ICUXgtDBz4tFFdKWHDI9C3Z5lN+1L9jrRU7DRc/LBgRguFzgZcAun3MArGktE9ovoR
 9BPnxFTnVYrAJkwypN0hVzSlxwCUsduhG4QZhU+JxQSi/FvxE9uSjScuC3iozYL9izb7L7uVPr/
 JTyncYV5/Bqijw1MiPW3Y3S/aKxyNTtiP2zssluEX9UZH0MFJiJkNTQd13UW4FMKsqQ+1cOG85P
 dK784FnaIpc6WkC0mTxxVdUqYPLTWA==
X-Proofpoint-GUID: BtDR95UxzmzeixYNqwQj2RuLOd3WX3Rk
X-Proofpoint-ORIG-GUID: BtDR95UxzmzeixYNqwQj2RuLOd3WX3Rk
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d7383e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B-oVSsyST8MYkDpc_wEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..121239a01cea334c3e7c789ebfb54df71515db28 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -248,7 +248,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -273,11 +273,23 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_VENDOR:
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
-		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int msm_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void msm_hdmi_set_timings(struct hdmi *hdmi,
 				 const struct drm_display_mode *mode);
 
@@ -452,6 +464,7 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
+	.atomic_check = msm_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

