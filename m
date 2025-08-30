Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62781DB125
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513403; cv=none; b=PZduENhTL8oCRA+0PYWmk8kXD1ieJ1niv3lWEeEvdWIbRreKKDb0nYkzBjCk1ovJBhkdS0DxN6RedRTwaQChNXkU5tOCbkLzhJRvqrvQtAiG1WwHkvXMRp2YDtY2GpH2wmmA/OeJ3MDa0M8XAcgZnqBTmOyclFEZWfCnBTbVovQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513403; c=relaxed/simple;
	bh=cd27TNKmPZcfQJ3UKiBSlNuQpycc1+LIV7BQ0LEWwY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=deN173lOrcF/bbuZVCRpXof/p/FJXpILQmU6OQZQGBQU2ljsqOQNCJlZiRqIfC5juENpS38rlPyJLQLmqswksJCwKIGT4YiI2JxLr34EcWTNjF7+h4fXfRRzn1xTA6flQgXmCr2Ae4UzumxOtgL6UHDAmFmaNM9pid8T1l5uNRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXnoLFe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXnoLFe3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TFbU0t012957
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=; b=IXnoLFe3Mnw7FJ/3
	m28CaZTdvpwEbp6SY8hiWZu3PDM2KVfemXtqbZ9pWZ0QONyNOwQP7Pq8C9wXiQZ8
	9KIhHSY8UONnU8T2SV4IkXofTvDtgFwha/05lBNGensz56A4oTPBbThlXO61ZH36
	zQmiYcnMRsY6j2IdQPwmkTkiL8r6bV8SxKvm3ekrYrf/ic+4iIC/CSx4EzraZnq2
	oKpthEJcp8PA96vmPm4bg6c7H0nhhXoU08WUzfoFmzJOPDRlc4FFHhCcN5Iz8X55
	wpXXNiNNnB4P6lR8vn+bFUWx/k06lQaC7KuFDqtCT8Gtza4GSlMDew2tXRjX2R3t
	FkB7Ew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf7e76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b10990a1f0so59874651cf.0
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513399; x=1757118199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=;
        b=ceTtWhvTvSYGoAkMyeWINknyDOXNaqMxmup4f2dp9V0qQ85VxXuO9Ln8S0XXmroHId
         dpLFbuGoyPQIQGVmS2Lb3m0i4aA+pUdvTroMvnmxuNbBVWpclwZn3vT6GOLpsorvQ8ER
         NWJZ4Df8Quk3IPvw/Da2ZtO7R655f6JsI1UQ/ACHeieU7yM3Y+yx5TGa0CesrtQrbBr2
         UUsJCk9RX8r3UfC2ALVZZiKipf8MuXX7k+k+9vdplQM1VI8kysv8VvagZCwGKQpox/7Z
         AS0pJiIfJo+89UynwDsHB+AJknlqHW0PNce1yxDlqk7cLboLGevL6CZGRU6ZJ1bomWlL
         7odw==
X-Forwarded-Encrypted: i=1; AJvYcCU1kAYKOMUclqCsvsbjWr9DTiiEV0gbGX2XbpDCfHldtzNyCBQ4LMpL/JXqPV1l8Fq7GPyW4n5ICWV0jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8YcnAf04mAUhLdvzecVuynEd9hwHjgUAQPeg3Jvtl8xSyCIUK
	KzEiVuwS7qfCohTe66sM33xLmnIlFZwkARXoxwhdHYoZOVTBVD1ywX5MU8671Oq4YHcitNX+l39
	YCWXeVvUhUytlHXS+MBziM5MqD9vNGlXElsjq3KV9Z/C3iRKOvbdl2BgjFRuQFwCeUw==
X-Gm-Gg: ASbGnctfJs3+TWs8MTlbF08flucNarlPQKPrREMRrMM4FkyfLFgKhkDH63y6k2ss4HT
	wlt7hJgznni3NSVcguz1Z2klVvUbu/H1cQRyTVMM1CXW2swT0LVzIrD7bppoolsTYP0qvXbj5FL
	XTx/fSTElAMU4CyJMGqTdb6npKI3tu4uED64Is7Cwzxftcp1wD4N+4vl8suhDDRmXWq0TPHIcsI
	IzX4dBx1u6tNMFxveymtyn8+p00vEzVBrzlz2A/FNgdf1n3kaJGhhbvN109Pvl7tvinOKiW4M6n
	C0K700IP5j/3XzZDI/ZdYQLfYRmgGZ/6E8OfE8B2htJ3RAQe7BevnJqx6iRrkixoTy/Sp3PGZLd
	9AMEslmYCjknkGZRdPzFutf1MKzxiOz0coPKXlIj3jtL1S/gwbmZ2
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4b31d80cadbmr5813451cf.9.1756513398541;
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVN1muIBwmw4hoq9Rahodlm2w2ewntFQnkQICLUImr1NmaPx8XUeu2IF08fUmhex3lGfMyjg==
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4b31d80cadbmr5813271cf.9.1756513398051;
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:04 +0300
Subject: [PATCH v3 08/11] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-8-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cd27TNKmPZcfQJ3UKiBSlNuQpycc1+LIV7BQ0LEWwY0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml5RgLv0905LPmzQqxvhe2nOH5VfAIu5qjh8VjHPOT
 zjoMtOpk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyTvD/lf0vs0N2VdxoewZ
 BlvKi1+Fpdx4oJ01g7fslfG8TE6f+kcbLJ81nku69W/mZz1rOe1Hpwyr3iWdED7Lo78x4ljX77t
 qdrbvpkZMmsBfof+pWKdBPm7n7qfFRk/ecfzsPf3tsOo3OxedX/aPmqNLTSbJlj7IE68q0jj3wj
 CxzjXZIePtS/dDOY+LF+rKV67NWGG73faf3I+mMv2ltctNV7jYC6ycModrTdPtj7IiBXlf9bZML
 bESv/3wA3NU0/3L6SLFdhPMn0xT8dBpkez0WVe51T+FcaO+g/iaSP24B4/aBMzOPihT/Sq7u8nv
 zDELdVPFCbyigqIpb1OvcIQxGLRbanuGOlkaZtyUK8oHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0uC3_ys9fBs8Zxjhhrtd7UgQkQUytPle
X-Proofpoint-ORIG-GUID: 0uC3_ys9fBs8Zxjhhrtd7UgQkQUytPle
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b24477 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=-zYrYaJvJPDGblfDOm8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfXyBz/jIBdHUXi
 tYH+PDRfJmPtts6a7QUAwGHhRY7rQzrRkmdvKa7PkDHtCSzGYG5zUwIbel+f9499TocDBBe52lt
 EBnnbFJ5Rs/OyUKT+95zZZWJjyhI34KqruGfPs7zNAAiVS0+erFxq/0rb+AGCC9RCfrD4Jw7d8q
 kWLZZFyrCTeJWODgPT43Xq1IPznI9PG4/vpy/0VVTSZAQ6/oWJbf5RNmpdKX4+MdHmGpNeBbsph
 E0RXYrA+z2t+Jt4+HvcQ/Zd52AjAzaS9pmaSdpGLfuWsped6QB7Bh64CUHj+78TclPk166U2l12
 WXrsNmBw7C7nWSEXwDpt+ZOy4CvKazpQyf6/2f1NZ9vxrNCxF8ZelyWspSsz8c/eKD9G+J4U5Tb
 Dnyds6Cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 944fb497ca339ddd63c132c2df0888011cc0487f..2eb7ab033cc84f8bf5816b5a608b2583226336c5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -786,12 +786,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->software_infoframes ? :
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->software_infoframes,
 					       bridge->autogenerated_infoframes,
 					       max_bpc);
 		if (ret)

-- 
2.47.2

