Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11C1E5714
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935094; cv=none; b=UXjIw4DPdoQnB4IBo/+VtlTAqtZcntMW7uM5DbQrBbH4V0PI90Lxo/ltFlDBPPtswtuHf/C8S6znUCpy/J15mJIB0VYP3A70Rd92JRyuWN/kbrb2P5e0drzADE2zjoNPM8CI6uLEChOt2Kz3aVPqU0oYuB0ghFo/mszjJYkHaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935094; c=relaxed/simple;
	bh=6wZNLqO8X0rRBnfpuMFvBzesvvV8mTr5AH0r8q+zW0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDIqXhqcX1mFAwuYtv6BDJidcTgCedAazUz1+FwaVS4Rz6H+qKanoglSSTwqh4tUQu/T2YzXUeCK9oMxHRakMrXXcZtgCSSRUNsii3Bum2Nu51klgNnAK07losw4hPvUBZyStf6pIjTAp9Z8fN7SzNY3cayEmyHA9a6O2I09vcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjikmTZi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjikmTZi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0isip015639
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1h6uYkRU8WeCjA3UtG+kTiDMnhzyUWryuidxMFQmEgU=; b=OjikmTZinC1bxTvY
	kl/UT/wbjuAVdi1UqckCvylVhh1eIhxX9LQyV2OHpLr1m4A0O4gnrNjnJhuvmXOx
	gGE6PXW8sZD/CH65sLfsFKcOdWg4OIxU+IpiT8dsg1JTqBVuOOWIlq5ZX1ZZFuRI
	61N3Q/rnyPO4ty/GGw9ry+5mxU71+Qk2PKRWfsJuublN5++8LcrzzNCLD0b3CtI7
	hLyRF+9zyky8GHiMrrO8cOr2tkLqsO+S6jfcMWhQ8VqMSyM6/1kNsJS9zN4O5Owr
	HLHi7ob9piLSOOwlbOw3Pce/ixBHPDB1brV+Wx2PZ7hSP5dtibY3A+uLHvuS6tBz
	uVDguw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d7f90350f3so58682361cf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935090; x=1759539890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h6uYkRU8WeCjA3UtG+kTiDMnhzyUWryuidxMFQmEgU=;
        b=As3qe6iWLlYhWfqZkjfEjZ36c5NTncfa2gP5JTTEdO9nLWbK394oLz8a87VDDd+vMO
         QWX+DCaLZuLhkWsteDc0A8Dznzi3q5goXl5Nho01C1/L03JFET8T6GltLWRFiWW/PNPM
         4c/eahIKsRCrnXeCZNAobx1RpB1J+BWIF5vtYQ1afjjsp/q/8H6qJGz4sH4DXS9DCBpW
         skLb5espmUF5TsocyGSv07mi2ZdS+vZD1p3wb/FNQ5nQyeYxdziW2LSs7lfpx3QXmo6f
         skoZPzSOtL00c511bLdQJpKwtZXYmiinRZa7dZPDpEPWlrkEN0pjnxXOSmmvIcqolws2
         XFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWKzb5Wlq/QsolF+57aYZLaL6b2roW1TlaAM0okfLm8oR4UfY93/ZV5a65RCe5u6m5BhYbqgxHd5GSY7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5EivLPCYQU6hbniBPRy1RMBhcRfb9HpCELn0VfhpJAPpz0iQs
	/wSU90We3JbvO4R9nkxM8Wmp3l3vmgqFJLDxeYwT3Ys8gbKFwTWSK9qOK2M/gKtUaPMhqtcMqsx
	ntbMXYcK3D3QMylfqYZkL/TzSKvs/+UXk8ilOENNTFYhl9Oz+RtEhDuYA8Aj0874k3g==
X-Gm-Gg: ASbGncvfMUBkj04E1Qo78zSPDaYB7mYdCPWnl6/W9ZJih8jgqQMEA4k3qfFJeF1ffHY
	/KHwKx1tb4wdokLjG5lScHyDAOSCYGTqlywAkqfXH801mDAjW0e63yHNQjQLRoTpTkkEOHLBzP8
	V7pmE17R4OGgyewJeMZV+m3UJM6VkkBbBtcU5EdwZNn/0/5P4znveNncbG7fDbmgo6h4mmil9xQ
	gxADi4f7dLC32lenISYsAlWnuuwQF3NXQrnK0bCL4UVga/JOcuaWa0WG7XlIz8Wbeg1y5Z9vpMB
	UUs/yoYsXlvNjCbgbGxPtfROKnoemJzMfdaNEFu/eCwjOtDHOqWqyg4CnBO7i9A/9LKGxAks9vs
	+p8KhqzEDbgecvynjn9C1SUZ6l6EiPjb47jjgg5B9avC8aw6uh8qn
X-Received: by 2002:ac8:5902:0:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4ded345283amr20741831cf.12.1758935090286;
        Fri, 26 Sep 2025 18:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/5DU/0QdkNd+pBR0ra13vIQRrDSgTQ5XS1w2ffZ6W1gk3zIeIsUearoOIFjHzJrN0PYiLPQ==
X-Received: by 2002:ac8:5902:0:b0:4d5:eedd:6882 with SMTP id d75a77b69052e-4ded345283amr20741511cf.12.1758935089690;
        Fri, 26 Sep 2025 18:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:32 +0300
Subject: [PATCH 3/9] drm/bridge: ite-it6263: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-3-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6wZNLqO8X0rRBnfpuMFvBzesvvV8mTr5AH0r8q+zW0A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgg6ekeEVANunszOEPzosgM9q41mN5rMAyiM
 sKuwjfeMyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1RYrB/9NvDpIpnndk8/iwFBBsLioH37Zr2qZpkOdcBqGQFXpakstTEHsDq9kYmk1BhFrWzvOnSt
 Wz95HZugwxczRUr2xpV+CYq9mMKnRX5c/BTfHXqp1MXYSIz4V9nqS/u9/DY93Nw29BTgRsl/ADz
 k7ZQVsQthFAglDBsyn/v4QadarI4Zi04elOdMOkvemdmyPqiRWzjJK0RjhJ35Nuyd60XrC3wG+Q
 m1fG2fh1RbsPsFOJCMSg6OwochNbOsE6aVz66Ddn7z0SpGH4m99bXpVZiaTNTCUUdr2Auw7kA6P
 6lNNyC1Ru+1fsOHa7S4qi4AD2uvRRGtjsI8LYco9Ol/RYvUm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d73833 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yMgUBx0mNp5KM1AuerMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Wue7lpHhdohjmloZs27gpr4LjPXAO_s3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfXzC3zNK0/foN/
 kePwbbCWPewJo0wBiZ7toZcB5UcCK1yWT/bQdR66WQflmLVBlt2d4GFT/YjlXc2F8uVXXx3lRgN
 CHHY5WvJ6T+AFBnxWjNJ6vtknjfYYz0VdIiuE+iVwBwrcAAtAfSV0PZGnE5mUml/imIeOEi291J
 /zPHVEbibQagvMlNwCwHWuebV282rOicYg94zw9iJ2pY/svCeIRx09o0ijKKfMyY3036Wrj5RIv
 RAs7IS4CECC9dj4+4byGx1EQ/stjsRfyhjKEIesI0wQ9DWiQccP0JpJ26nn653j/hl211/nipZA
 HHY+hDclCV0vYPvzJoau6/FPFqqORl1OE1uLlfShO/CHa4eK6GM4xJpFY9CIR7FToKYeGDobVtH
 NLYb5SRi5S4rucTZGD+cqkDwwr89+g==
X-Proofpoint-GUID: Wue7lpHhdohjmloZs27gpr4LjPXAO_s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..ad331e8dd4e815fe51235e672798bb2732d5c7e0 100644
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
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
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

