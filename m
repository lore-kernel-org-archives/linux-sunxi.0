Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94767191493
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513397; cv=none; b=katUPgWCaG+riVRtbjjf7k6R2LBYT4u4uShMIThMRkxt0W/vEsiZROAtQMdUotVYisJdteX8l0m8UczNi2KCIlgG3QwK917KIc522K27BL6UM8csbOoGk4spt9zvVyNWVF4vWOcjih93uHLO6SF6u7mXdOc00LZUeMMOncC0wzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513397; c=relaxed/simple;
	bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNfnttL6usfTQtmJYY/eAj+/+uNwpg1xU7vRdDkJP17OWasK28yCGBuxTiIQrqecv0h2DF9H6m2hfMIQ8xczD/wZ5pUIkveKgHZMxlmm29LOqR6BYdk3QMKKXskxCQnIrDnQ2LUw+DpeafSN1QGE0naMBeaPt5jfV8B3ool7mPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOYgwC5T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOYgwC5T"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TNOUQL007731
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=; b=ZOYgwC5TrQ70qNtJ
	CBwSeTXLH9UxQ0I5/N8gmk5xlZGUknURoGkAZOHF0rQOsIShKBj5CgBbtNZmf3/T
	dQTkXPx6tVzO2LxWReTSyHfJ+KUdHkyQ0o3n7wBSuO0YF9lT2cCrxAgdRjS68k7j
	+4snMAB9R5JfHWAE+Q9s8E3hmK7DatYDCbWCIu6sM5JbGYbYj8Eio/kUhKjWKBvn
	uDbr3Pd7L3GyKSXCgJPKSosCd3+GkP94Ifrqme375twmU8ar6m3NVyRGD6u34ll0
	Q1p76xCrTJSoRc/aKpiTMSxg0UBwrTlzIo/82Ydm4gxqOJrwzTAPqP/rIWX7GIYi
	10ITvg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w35dt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b30fadc974so22720781cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513393; x=1757118193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80NStMTAnoFzXJOwtQHaY7xhRYT5mvFsRO93ITTF4OA=;
        b=tq25+SgG1q9mDvrmFx6hxgu0pjyIVTrD4eKKkYpxUAG02IwwYBHqxlKN2+Sdl9zdsv
         03pAER9U0yXtVwLYvL7cRoEy/f71R3xZb2KDxs+cy9xi8aIsROb2fRM+ti8dT/cVkSDg
         gxlnsBQm0aqCzZCg8gdihIFlrsKyoparoDqHY5RvHfGMZOpck5p3Wch5JKWSTngJiKNK
         0l3S9ZGVxGIEnmyUgkt8ljQSerIrR4+A4TC/6tAWLwW3aM29noiHCpo+YSmalUuMsdj2
         VJS9pcg/ms0xSm3OGgVN9405Ra8imFJoAluPGCB3hVG0kzrGb3FdlCrYHtFWpiqts8/K
         6fWA==
X-Forwarded-Encrypted: i=1; AJvYcCWsW/tLRCv7I4ip/ujlpG0HQXvuXRZdaFOzov5cEcOutUdcT3UmZNO+48mE4okDwH9aLu3jPsiFrWo9Dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNuc/SkX47gZdH496ztVXrf5tFs5KCqBK0NOwcpJzQlvwEz7iL
	W1oMgTsU5Y6lmg/wBRUs39zE6urK8MCVWnnbk9B131rR5im7JE1nmCdfeQCQN8V299JzGsB0+1b
	GEmdTkkhc4KogjENNHSFDntXmZ3nVoekcACMxgh3ZDu0fHBtK2lsK17Yivxpkmvw7Lw==
X-Gm-Gg: ASbGnct3rWYLe3hdQ4q1wPfKPizUXG3O/7WN8KNACDV1TrK7fJtmnPAgxYehuS9W3W2
	x6SGOr9UpaTPm72n6ny4JttqhHBXEEtY34CR02oD3zZgiwYcW8Qw5toDMgPvxN1mg80ARn0vxPf
	EVmdSstWmrIpXdSZbeji6b5tnYdzcz8Fv+UaWkROU1zuVpgkc8TMxphbYsej+W9npO80hSG8u8h
	Dx/eJAr6WlGQUc6NEH0BnOdoxH0JXNcxTN1N+0ndCD1DTJt12u0OHfiXtX0uR3zETNP+NPUMf46
	3n3RVkE60sUioETqXY6o/41pTzKvtJ+5dE9HQvXcZRvXSAy4Yx8Dd7ZtiSwilIDsLoDzMKVrO1C
	euCqoULD9Y2b68jclvETr+FSdqdJq2/YdQRw/pg8oRunRobd1NOrS
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664511cf.3.1756513393502;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+ECcTfEmyA0oDw/SDMAaP2b289wQGB6V4nJyogvFjeCA0Q82zJiolJtrAbz+rOP9mbXYTVw==
X-Received: by 2002:a05:622a:50b:b0:4b2:fdda:f7be with SMTP id d75a77b69052e-4b31d80cb39mr5664051cf.3.1756513393037;
        Fri, 29 Aug 2025 17:23:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:01 +0300
Subject: [PATCH v3 05/11] drm/bridge: synopsys/dw-hdmi-qp: declare
 supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-5-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HvKx0pHrlJPU20odLzHqAGtdiIb1kp87Z3cgJaG6Apo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoskRjn135tRCfVJNBGz8sCeDhP5tCOP7aR8o5A
 t4feOQqmQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLJEYwAKCRCLPIo+Aiko
 1cklB/9ld799npnBEVzpUVL6B/MsuL/WFKALm72JXuja0Df8R5L61ialziPIDOQhwqS7m/CUarR
 BbAyiqXzuPuzqlJe7l8x8oNPMkfoFKSUh6v1bzsao08IUfOpraVdo/cUzHZpRHD+e4Z8qQa+lZD
 wBf0Q4KqCCTPDQVK81CqKt2s49dUX1K3msOCLP+Q9qTWEUhYcipODy0q5i1LOOzeK3q+W79iNMm
 lnkrosjeoE9iQEOOniqNI0p9r7yqKeHQL8lZ+0xiGmqvPd0sbBDmohgkxJhwxe2chOX/N92hTH9
 wpH7XHyXSQPZRmESVQdN7E5BRH3RguYmbQ9At1pUFu6xJ3VQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b24473 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vfAEGMZ_7ZOHtlG3iVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwx2NCLbBVt0k
 tMXLLVfPCXWGbxlIn+hUsUTJ1o7t6B5zPyHtEA2YWp0W+LCkvCkXdcpUnUmVXWKAsPP4ZS/aDPf
 NUugbJsDyvOhDCw6ZhH79DLItCoClrcXThvD6m7lFUvlt/eJYtcRjM3CA4QKXzqPOz5OJIyz4xv
 /+iijMqkwtLPrVtr2/CcXk5Weg9O9DJSGxbf+MTzwXBxaIcSvfvKzhygzIPto75QESjvj7e4NLL
 PIN4Q52OkT5wf5Uj+vx9BU4VnR3dTOBlaVe2xrnjgQ3fjuMN2MwIS7vefqSnPvIvKlvLFgYUUTe
 XoJ38jZh+a5WkJyCO5HiDfgppxRXCB+KAiUxVsDQiA5w9XbnXohZvwQAgFRaM4vtyuGisAfwv8O
 GHAFPRlq
X-Proofpoint-GUID: RGBIuiBqqeYAJo60kczilAK-Lbfru7Vu
X-Proofpoint-ORIG-GUID: RGBIuiBqqeYAJo60kczilAK-Lbfru7Vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..5320641cb6907a98cbc311a80755f09b88a27ff6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -936,6 +936,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -961,7 +962,7 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -1084,6 +1085,10 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM;
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

