Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8483568FD
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429558; cv=none; b=JJd0Td0xI9Wy+uxDQ9b0qB12SGd4AoAe2QBo3jn4msrwl1gEutYkNOFIK+PHtlZI+HrnKyQL4gkRTaW1q//aO5YJNrUgVpqEJ2P43Gmth4guoqmipDkgLiHJEXArblmWzx26ftRQcEIfHZxGRtXz1bSE9LXTAjgVzyMPRe8ywjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429558; c=relaxed/simple;
	bh=SH5p1NXLdtPpRbZHLxmXRUJRNEhWUgJZ/FZhGKys6U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IY4tmPruwAgspnJW51DZWJxCb8r0BWAigzHkesgBomrwrSkjyTpj9hH6EcmL5UydYtAPTZbzaM4W1hhQ/WWSS5VWgvbCn1+/c7AcYh6Z85PgTXDtt9CXTXWY3NaShiz8cYebDC3XZPXgHznx0Bl5V0XiQI+fA065hiMleG6M7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlhjBKE6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlhjBKE6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSeX031510
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=; b=DlhjBKE6vXrJs7eF
	/Ui+StvzdUKZ5fYxSLyNpcJxGo+zkaXklrif3Nr7+EgoHdEfNgbCcj3VRKDSBngm
	NwGtpxq1eUc5oJyMJcVnhydxdcWM9UCv01QJWRMHrAJnWGYd+tQ3KTqQoZlCv1KO
	L3HlGgYLVuvx5i/B62w6ulRsPYaK/4BxjsXISYjXwg0T/wwdC96XrP3jptrwWy2M
	aIBLZGVh7YhQ4mQeenJdK661KOiQ4sToqjxDOZy48fj/i1bpTZ/Tb94+xt+Psdss
	oYgcc+CsvngX7nnMSzqby8cYWdZahm3SUZ/vAccW19867zrbmO9G6Xtr+IRV9tiS
	MOoJ0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws8puu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5fb1f057fso40404941cf.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429554; x=1758034354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqxjcA7v9kQUHsW1dWHX4LPd+nTqAg1ssnBO5hXevIc=;
        b=SuhFZGjzDmjCvisja0O3Kmuhih6j6RWZvJpw54EHThYu7UUt+X6NMAW182Usp2207e
         hUfMoF8Pyzgt2sYHpGzk61eXgD4ol5j21IZsuHIl+ImMVsvoVSDJeQrZWRpns4MNRghY
         1QNM2IL8buQt1+OZOjeOLZ06MInmSovO1VQvsc1rqus5NNjLx2yUBYlk6BmM5RRnkijI
         5S1djoRZtDCo0LeyU+8xsO2110EDAvC5clzRC5PMWcSzhduawL6XbenH2tyrYnyw4Qm+
         W6LRitIfwDjeErlmLT4ivMR2BmGQsOPzD4AcluhhwDwA7vy++PUtmzm3o5argcJcrONf
         Ydew==
X-Forwarded-Encrypted: i=1; AJvYcCVFkYDVmmR7Qr7ZjFMRRHWLtKtrbi+ifJDE/nxH2bCGcC1zMRAfeiwJfVZk3BIuud1Y38jyFImYPLtS1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ee46X2llKinixGw6YWiae9i6t5LVGOj3cy5GD7gn2ILotxfy
	zv7T7Oy9utM7EDiOOlIfqEcfgxFf25kGGwumDNYkzyCQn6MZOx2rNlAS2tSUaGIko39SNiz+wiX
	CjipJ8atsbrC0lK6dun+0d7h6UtTi1WV7R8Xgw79NQLC68TK1DMilQeC3WdSpaV9Ghw==
X-Gm-Gg: ASbGncsdf50I6zTF1yRYZDWSqbAgJVvFhfUaadn/WtgdSbv4jXMp5Ejdmu7Ksc1ISJQ
	H6CWmCWtEbO2SGexr3jaerkmyrPiJxVrcjcvylpSPuzD16gUXgfqepWVVcP4vD92U9IYayhC/P8
	P1Au5vGSm20dEJpU4lQGsCZZL7USFMGtrQAS8I8QV7VB6Z8cGyBXd3hE6AkW//wzUL1iPv7cif7
	zgrW6vbzlD/MqkJ3c+xzYlvcJ7l1yZRd8NzTJ8B/oy623+JFY5JAFzBBtR2Wq9+PhGV63SlASiH
	nqcPk4hbUAJdzCKLVUUCu/Uj7fkHB/sEfCWSLYfRSf/VjzY8VTkrqPyC/yVwyWwslU7LMw9Bazj
	cGtB2gJaqgFtbKF/AT1+acmWUhC8D6U8w91ddyTBEdrwfaVxJlxNd
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131513756d6.16.1757429554104;
        Tue, 09 Sep 2025 07:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELvHh+YLlPgh4Yd5dwaizGOKRDtwIRu4dOckQfLSj453ZKMPo3ZARJmUDs6l5WC0UTNyT2YA==
X-Received: by 2002:a05:6214:21e9:b0:709:cf54:2cb6 with SMTP id 6a1803df08f44-73924e24079mr131513396d6.16.1757429553493;
        Tue, 09 Sep 2025 07:52:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:06 +0300
Subject: [PATCH v4 08/10] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-8-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SH5p1NXLdtPpRbZHLxmXRUJRNEhWUgJZ/FZhGKys6U8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8blvrwI5L8dQHSUz/xZ6GHVeuDdbZGULZMV
 WuEhl8+3y6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1TrPB/4iqW/Wm2SYljGHlxILyUx1w3ArHNHCeDStNLT25ZG6XUwvH3rLYMRzQQCcX3XYeP9w7/n
 br7LaRGkE7OOakFZ28SR+/IG8O9407EpzXyWAjNajt3AwRuXMI1ceXUB70WoQYyiQ2p86sx2sD8
 rk96tIGNTj+Qk3LLtNOfFhhU2mKk8vZ+7IJmun34/LLVdMgr6WGEYUI0HHvcXsWauvVUd9QcMXW
 48EwXLxeCxs4iM+SI02SHlOAp3svBZc/AL4f0u89V/Pxi6cQuvVzavQ1SrBcuQHP8kYGG5WVMlS
 yLTVNPBw8cDByk+YH6FlumiErNCqzW648OHti/7E+XtKyrw6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 47vVa6exTEYFpzwmGaeQQvC_FhDQDgMg
X-Proofpoint-GUID: 47vVa6exTEYFpzwmGaeQQvC_FhDQDgMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwvCwnqgbXLar
 jY29fYGIbF74Lrg1NK7nj2eVsx5Uqxh4D7lOe/8FXKDd+fif5AaTjm+h0eLiWswdI3eSJNzgD7A
 INZHtl+xBO/9Pdx14OSQ7eKohQH25KKITYoGD0z7ozmUQicBqGoeSp/vxoF9htHncFv29vdRxVR
 tuwLXggrGDbEwCQlejXCNb/xiProz08nYLDndP7IRNODFLL0EXbWv9aSl3l8j+yAGmQm1HXUdYo
 zPjR3nO5urS4G4588P7bO15P3qJjQOedE0Ab5mqjxz1vhqVVaNbwySKvY+IxBZ7dL/r9h58HcFA
 Oc65q9SeljwByj5zoPHy2UI6y3ZFBrW20RtLkNO1MM0diVG+cUNxlmAQV052yjnU6tM9KXXPBjA
 3JuvheKT
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c03f33 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=uJ1-o3tuYwvhD5ZCdfEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 55bf5ac53739fda098be69a5c61e4934704ce046..05dc2b61643af5316df431a3cbf53b86139a63e9 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -783,12 +783,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->supported_infoframes ? |
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->supported_infoframes,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.47.3

