Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9728352FCD
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429548; cv=none; b=Fc7lDPW+p9Re9x+EQskFpObXIfME0N0mOLCg8LeeE95eyGEhWspXcEklUK9pQiqUpTObudn6E53d6aeD3IMLvJFu92H/wPbulilxASChOsHKdb81fTV/oDDI9ltpU0t2bB3O4rkw/9KOZu1nE3ebju+zrSfpvclSOjQDjdKbBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429548; c=relaxed/simple;
	bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YL5zZc2D3IA+CtEW4A/03zorx9h/rMcChlUUvmAUcg7YuxSjeiTa8aKVLwEgR2iB1ElP78xYIJJGS2GhQuz6o54yzHZ0DwA6RLeNIgSNC2+wryO5MkgelVnQW0XlVwHG3/DHUoGhnIsKoaTIJrYptuCkld190/EObFrSzxu1VV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izj5++eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izj5++eI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LRZr032181
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=; b=izj5++eI83OeW3j+
	lV+SOwHzoLSPiRWmCo73yMg0KmZZPc8mkwAtdeiIcizeR8nnTYEd2RCNYsY/w0+G
	aAbUTV6DA0kcfHdnH2UDbpkG34PYV22/AuSu/mbo8coycZW4c7NUqKbRO/rnNACl
	CG7leAvrXzxEjqhBJpxcryG0hhQ6J0wl9UHv4aZxALseIugZuSuT/BFqk9fYy0/a
	DXFeOxIGBEunloPcgtLbqavURcRDcM9NqmXGDo54C1b+A+0XornFwhs3rZpw5cXN
	KbV+HL6lCeDkQjbBw4q7CNWJ65kO0fspWQdy/tUmfgh9OsDJrGKnA7mfFSoMJwAx
	elV0Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m0f5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70d7c7e972eso123820776d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429544; x=1758034344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XcVN4la18BIwaO+Gw7JIQ9/7PnLHljWUo62csPu7Ys=;
        b=a3dr/c7soG20DEBJGdgD3P2Z7x2MJ+rBIdyYYHM5QnKhQD4LSgsdRf7ytXfjFBY/2p
         FwMZhqDwdtyfnbKyz3+xC/TLKkCzhygsvRgsKjzYmGKv82PkajH9gi5zXjOWqhZnsvUV
         U+8xDFFduChTJdRHDfGCuoJ87slPmVHSiugAhxLuGsQ50EcETRhxitS6MUQUj5sXWQ/g
         P4Pmgz/pYwspRM7ZCpB7mhBAw77gf4VnjTiFTjQVaI5DfKrpmk+gpg8kdsdru1XRE+Up
         2ZxUphha+2ZxoouHJadZF6rJIkQjb+FfDGkLVUrNVc9ap5W6WYMA4ZkyP4kYiaTAKtXD
         aVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ANlCmV+rhsVh/JDosoM1rrR+sHqmq6432dltH00UYmL1+CfMYjHhcosreckujmnrb4y6SMdspL26pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxeyMOiyGulQ/1pQ8I9JuDCFFo0mo3sueDsom/aqJUEHzNPau1
	+CfN+U7v1vxfdwOE+iKW0QYWAMcE6MZeOCObHsrV+2VnFZBmfeRwAZpFTZYiyiC5vV+qKpGwVId
	aPtXEyjUcoio4+K0qOi9Z7oRSVP73jTUwUBDVCC3BNt8X6lnJ/Ceg+9LUV7UguCjNOA==
X-Gm-Gg: ASbGncuPlxdGUbl5RXf6BMw5cMQTauzNgPXY83w7mUTI80AjoQHmD7RPWNCLPbR0yc8
	abY+TzlrlZ+aVqnZbRvRju1QuJLYnpd/CCIUMXyeO5vNjdMcCIm9Kj9EGN8Ic9UgV7vOQt0VunU
	i/zi7S50WZiqgY6pl5oFiPPy9mOhbO7aMai7Qax+9QYt+e5rRiMZdMHgNzObFh/VllLlNyxQll+
	TeRGxjTH+wWMFSgbRmwKS3tw8w3aBvQZMKIZM9eVk6u0EyETztekDF/meNGCRTck+HseY1N/2G2
	zzXcwWZ+hS1HG8j6pND1bQmO+eatkTQsxFTUQ8UaZoYU49hyFwWvIjg5v23nZdFpkd61FlgXIrV
	wkV++93QnzFZiPBLGXA2Nq/FWYuNDtG2jL3Vbj+fMjX/ZawXLZ46p
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114471316d6.43.1757429544069;
        Tue, 09 Sep 2025 07:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3qcUmc5HWgaItJBSMTFOPrjz9C1oV8lSQudH4aunMS3xSVXsDfkPrjvpJJ3ZzD90MSTY/GQ==
X-Received: by 2002:a05:6214:448d:b0:741:12df:785b with SMTP id 6a1803df08f44-74112df7c16mr114470966d6.43.1757429543548;
        Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:02 +0300
Subject: [PATCH v4 04/10] drm/bridge: lontium-lt9611: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-4-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UHf2bwt1HahWYSjc39yV+lZLDN/VOziYH17k6fxHegA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YBe6mOiGmmn935q5ct0cr/1pS1u83FZ5P13mkK/k89p
 azua//tZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEAuTZ/2fxTphaase6a52x
 1oaTii/vV/TfvytiaMfGldjbGWgZYH9IRNfivDu7klVbM69V5pWcToEHezsZP0/Ke8Hklx9XWGF
 U1DXfrp+78se8z+v/SU+zv7VzBWOSMmtrQ39OtLml+TUW0xclu5P0Rbnfbeq4Ulpy75r6FrNT//
 V2rdsewHFOepogxx6zj3PP9zLlhZXMUJPPvBa6tJz147wmyy5XQ0OHuEkCc+5a2om/3/Z4sXH5r
 pczrnzn1GcPfpmruPKrveGz0mcMv9qvrWzr/V4kzrPWtsBw+oHIu9LLN15OlGXwdD8mHFBWveqM
 UK1S4KQ6xZUsB/Y/zVnW88I622/h77iPW1/HpF8J5NsMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX6Aqehdz/WnCT
 rBF1WIvTQLqwzlg2KQtXgMr4iLfr1Fr6qhd6H6lbX1xn82o97In6qMwumopH56uLHVTg0+ujIwV
 VD5RxjBKbLuYvMo8nQMCY+DJ7pNA8IL12DFwpL/NE137j/Tk7xIKklDXtqD1dYV82KrIL2dYxIH
 eEUS4q4x7kpSCy4b6y24BGW58QfJFZ20IYPLqLCIqU3P8vy33jAezFkYu5j0WC3lZPANizJPiFb
 cMjymJrpgOuBrQ1kuBnkCTYjPOgtqvqaBj+p8NSs2gGb1g7jMmgj/ga7nEe+YbNyPZmNBiS9WOO
 z0LONGes2SSDKe0T30bNryJnnnpColbBqNo781tZgjv7WY3bNKgyuxCTrjepuo7byl5Tx70dch7
 BEzOK7ht
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c03f29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: AzOKof-DHa-tu1BYv99-mI3eR7GA7k0W
X-Proofpoint-ORIG-GUID: AzOKof-DHa-tu1BYv99-mI3eR7GA7k0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..019114eb343764dbc3da36ab02d53ece11f46adc 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -870,8 +870,7 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask)
@@ -911,8 +910,7 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(lt9611->bridge.dev, "Unsupported HDMI InfoFrame %x\n", type);
-		mask = 0;
-		break;
+		return -EOPNOTSUPP;
 	}
 
 	if (mask) {
@@ -1136,6 +1134,11 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.3

