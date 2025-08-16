Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344732E54A0
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348079; cv=none; b=aYie/V2DsSCvCbeyjp43YSigzIpeMwrg/6TrjF+YIK9CTxdmV2zwzQIHbHQo9p12HrSpuaPDAUmCeqWWKn8FOkm7VKL0p8ZAp3avgJqQ1mvRETKUyThvKibY03WpQJIoxSCj04J0WiTk3n4w4r/iivpCphYqOCxTzXlIFuRcTGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348079; c=relaxed/simple;
	bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3T0xvDokV+AtsPU+7Rg7EGqWsuJ2fKVfIs5HxLorqSMeWcD5aJtA9cWxgathfOihi62VUF+tWjnFD4NlF1254aTwMKwqceMERjXijytAqg9+FGmnyZgjihE0juabhP5sRqYYGycN60sKlQMIEpT+uLO5hiQZxlt1NuSO3fh2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghy7ow3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghy7ow3I"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3FE0t016439
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=ghy7ow3IhXPGTqxh
	rU4w33RBBu9X2DhL/a3zk5EKlCbeZqSqXPiDZgI+ZOqS+s/MpP9WCKD7YeKnB+N/
	NbgE/2btK/ESkOEbf+ABvy2OU8zm4qLvgDMwh2Up6tJpZlgZPcpnP1slSbCv4zTF
	IL6OiD80boGZjmdAZ51B+0tpfRVdyJNyvRuFQZHD/2EOyHaWlodp7Z69InLwRg0C
	+I2jjjAoauJeGmyy3hmJI8vJjoqWoCw9RQOxrToalLnQlO3R00jW1Bd4SBd1lY2N
	gxc6uYuBbls3UEoMtXdNXhBIDmfwpHCLedeIVi2hE+nO4WlpVwP+LOkoWoDnnGZE
	MEt89w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf0udm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88dd1408so59617356d6.0
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348076; x=1755952876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
        b=gatabrN7K8QZm+iBWLK5I7ZnEQrRuZDaRVtes+p7WnPHzbzsjwWiIfs/End41/jsF5
         bi9YTGyLnU5q+ymrKfiQlxgkGl0bOqxG3XQHhexVdXTXschglue4dsfJcI6wcrM3LSuO
         IS0j294zut1i+KPOqGsJjwe2b70rwwkArdnMuyf8GWt4HTueEeB+TfcEtmq5WYycZVez
         prb4knsta1cie39cUw6VikKmyHJIFGfqMpe8ozdT0z5e/EgqXv4opy6cGUuLWillD90m
         UqL4SO7nHFSDFVJnuGf5+rZcMMtqR/1tMsorpK4qm8b+6DRZyOmwRDlD5Sx3FfAeUzLt
         tIyw==
X-Forwarded-Encrypted: i=1; AJvYcCVfjAQrodLzKkQfzn4jux9vGdywHn6zsu+UugulT4a+rwbgMSoX5rD/O+HzhKBc+Gry5iig7Eti7UmsqA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9oXENnknPeOEeFlwqpXI0GK+SvGG0xhghPD4MZxK+gC1oJwaV
	m2PXvBJQ+QVeUi8WpZ9i81AJkGtU+FQC69Xwdju8RGkl56Ev3RX4Yb3l/M6TBhIZDHpHEcGkUMn
	bJXV/nQ+QunVQHOytVeFUrinbsvu2J/5aWd+Amsl0TCbxf8t893yBfEkzgtMrAt+Hww==
X-Gm-Gg: ASbGncti5nHf3MUZDKOj9uI3Ceq0WXCzWyE4Ga2gK3sYRMDVDWQj6sArYRToiLYWfKY
	l7H4gQYI7Rhr0gPZhLK8jnsGBAEmBIYqD3VVNkmJymQZ9IsqjDKAc3xxkzVduTrBPjZ8yA1NR3D
	DeAg9fXh3hS4rcnLFJUeSvUxm77sQHVHW9tU++2vS980MEd9aNs5yiTHXMHzDsBEO0jlLpdb8uu
	HwTVD4kXD32zA2NZNnIpGpXXpUzI0wWm/gN2gdFjIb+YnyX9VWUf8kc2pOQf68cguAYiW0jbZpP
	52Y3u+FrbdclhKAwdkEfJrWI/bKN/vf3Pt/zDMH3zDxIXUs3aET4ftNP36Qw62VlwiWRx/7/uL1
	TXY864AJuwAKkKKfUsJi5f/FUHANpswLbr7hFI23Gn0i2O45DuFng
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id 6a1803df08f44-70ba7b0fb72mr68628316d6.20.1755348075999;
        Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3UdiNBmKcbNBSZ74rRqQydXtIbuAXtAkdOOj4dUPQcZFQgwFXOOSXEuXuI37B1EPLUu9GHg==
X-Received: by 2002:ad4:5fce:0:b0:702:b805:276b with SMTP id 6a1803df08f44-70ba7b0fb72mr68627786d6.20.1755348075573;
        Sat, 16 Aug 2025 05:41:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:05 +0300
Subject: [PATCH 5/7] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-5-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfF817cuWm0x9Ld7mSI9y3aEDv6yVOAaz6B
 PUV1yKfX8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1YeJCACinc5gTz7egfGIB6yk437KFDLl0hTcWhDnfZD9zWOokKCZsuwjgqgvP++oHdIB/be2QcT
 Zp52KAZ10Legd6GZihS8hapT4SrGoW7JbJeeaLydKZcWSQiqGGw8cj0ORAXsTvnFGhql41oNCAu
 AyHGwl+aAB38jVvd75yA/n7qZRM6iKDKeQMJbQm8Xo4EEXg0Vu66iCDPWSojU6TBTNeJPB8qk6+
 SUZJhUXTFUN48tRXFM7oHP/Rp/1AvxRedsNDY/trIp57DbbpxwgD7NVyWe+Y1LmlDm91m+TTX0/
 158PCZIFuFMCsoNY810tLXPPkT1IJScS1Xraf8Nuc82coAtx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qgL0q1BLKDdE2GMWTsyAtrllKFVJy1rn
X-Proofpoint-GUID: qgL0q1BLKDdE2GMWTsyAtrllKFVJy1rn
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a07c6d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX2FZY4dHyLWNC
 LKvOqk4YtsDXM6j6ik/litPCZ2Ha4Sn8b9VKPFR2EocGifvsXQeiaq4YJ78IAnQ0sEGX/1TV5M7
 beIgCeDsJ+iRbVSCwgP4Dw73VQsKZ2V3H48j39XMlekF4N8iTdL2Dwl1PNcMvy53uaQiuJPTluS
 8Ac5RZd3lFdRn/iFEX7+U97S5FlgdbXRbpsKKaQVA/LvWnQ0G+Vq9wwpfJUWnx3tB/5CSksGyNz
 9krrK5YdEluqmjXW/54zUr/CiXpHIaKWcQtMWCVT78M+57PrwgNSbUKQbxxl+GyQuMN+YzrnYyc
 4FpSVre01cWi9f//I6K2CfI9uUeTQ0VQtUQ6Hn1AVOrQMk/qitUv57Ls2ZXZLDFKA9umr+dE3Hd
 /cATLZux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

