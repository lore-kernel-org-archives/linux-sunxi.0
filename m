Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ABF35208A
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429546; cv=none; b=aeAmi/7kXGz2ZwxBwmrVGD1zJLoK2icrSGHUHDyaBbgqzgXi3FeEUO7LfZLmDLwWwbWHXbkP+FymkQpA9faB2ltB4MIWc9J0xhwWw13hCGDgcetE0xKXy30s1mlLb00i/H1M3fxW0NLBooGIEQJ6HlOFN5ZdH2uLNT6+5qxk4hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429546; c=relaxed/simple;
	bh=9B1/2qTsNC+xeCfao5KJMWH14J8iOYC+FCFWS/909HA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4Ys5Bt+KTkuZMtP2RftUI2tAgzsKa99To5m8JnnxpYPzdSxqpfaRJUv60w0SXs/pnX27bHBVXKVKvpZzKoa9f+7rIjWmnlZrkdlR6yriU3HaE2dOIKotjEb0dPGppuZ9vey72VetrXE9eC9ohWbR2f0QpDhx2omhqw+qijW+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gb8P3eE4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gb8P3eE4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LwPE010079
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34LbrOuc9PV8gpgeFWji3D+8fqmNkyUhv1A+EV+DDe0=; b=Gb8P3eE44KD5hhqK
	Pt7qz3acDht+w++2bwApYrOeR1zDzMzr4GbjemiUmx2GBg4v++SZ/m9IRzuWVOmv
	4Ru4VhP3y997kggPFSIEJn1ZYycaxRKce0Q+8EHh/POZSHSkCCzFdZo7gfD8KQxn
	KljKhF+sonsmGb0RCg/q56gfEOzetUb+Ao/KW2U0WU1mGewvL7Gc2TxF/nP4WW0W
	bVsz4NSkzexW5ncIgwUuAaXDTtLawaesIIIrk63fGhIOElMbKKosGAJ0neOEU8ih
	FBP2ZjzY4YzhrMFidHi1fUInXdEDmbS5DCf8xn6VZe5ypXhHNqLI2riT+ESkNX8f
	pWHu1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwce1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5fbf0388eso48016351cf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429542; x=1758034342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34LbrOuc9PV8gpgeFWji3D+8fqmNkyUhv1A+EV+DDe0=;
        b=hU9nLHJOr+FI8gjjHcytQuyzAgHxWxuXDQEJWaYn3YkP66wNzwZGcB0TKF4tUZPzV3
         nS2ct1UQx8KAbfX2D8PWvQEVa5ebWM9ARAGLTPuWgr7yVELBQ2E6XKND2eCEGrD20P7o
         QPefc55J3oKUMUlmQbwV5OssGzqBxN1KuxU4YAXAlgdyx7uqU4Npk5SuEEusvtB/k7IV
         6HNHUOHPQPpIjO/e61Ag1Iufq0wHdLHeZKWbedkxiKeMeedJhiytPQ8iBHEl7flWRxdB
         9DToecrFUMcEFQFlUS5BVhc8mxe7J0R6uzsIne3dK6ajFCvmtkVfBRttqVnApskLx61V
         kvxg==
X-Forwarded-Encrypted: i=1; AJvYcCXEkOc7jGuPoVkrxDFcCtXv5QJ6YTlYbGcK8PZxl5QFRYUb05m/XqAQOWs5Epf2BSu96zdzbsXBQcszOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+MvTAELy8NnvhEQlorvn9aXc454l9pADSmfdHx6D0H19cOX4V
	zCJ69vocsg8OsvtrB1der9VYut/OPZk9Fr53yksc1v9ESeD8ASoQbDEDvGNEuZkNYSpxrDoEqTQ
	jPj9DuXs7/b+SISHVgw+L8dD7w8I6aHK5BFmKE9qfSi934pKi2kHGMHzu6wNT22FpTw==
X-Gm-Gg: ASbGncuC0FWF7ERv5mXIs2sVyV5ax0F6JnjrlxoK5S6nJ7g/D5SBRxQ8laXwQdYlg3W
	Fcn+Lcm3AclsyqVgMZvoKVKZ1O6M1XACClGGYphW2vuqoP9dFeE2L3FVJD0dJfBISVU1sX/mMJn
	6GeINDTBGYT23xb8cpF5iY5A5S/SzfbmivLgwzgEiIPnvdyoLItBdMcY6lwyNUPOaw5M/hG+/K6
	X92reRdhAEE59jofnzqgyoXuG/kI1GgNS8u/m9S/8xF+rpZHqCZj7UnuEmPXXuoxlicSWDXKO0V
	nVPfJmzeTfuKAuVm2h+ieKjSGP1cLQS11utf1Ku9luDWAaTGCvOYSAWbEEOes4Ce4GXmBlw0EEy
	C3i1Rfal/R72z2OuXqhLN3yuC6vEDpP0ZZLyukP0/osaEPCyItNhz
X-Received: by 2002:a05:6214:f2d:b0:72a:f29e:72c5 with SMTP id 6a1803df08f44-739323029c7mr114734786d6.24.1757429542268;
        Tue, 09 Sep 2025 07:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh1k0uLi0ygOtqikFQVXs3ESyNR9ERK9bgM+N6UK8XiQgh0Uz27Q0AH3gIz+YQMk0Qw5PEvw==
X-Received: by 2002:a05:6214:f2d:b0:72a:f29e:72c5 with SMTP id 6a1803df08f44-739323029c7mr114734356d6.24.1757429541712;
        Tue, 09 Sep 2025 07:52:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:01 +0300
Subject: [PATCH v4 03/10] drm/bridge: ite-it6263: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-3-53fd0a65a4a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9B1/2qTsNC+xeCfao5KJMWH14J8iOYC+FCFWS/909HA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8a1S6w7PQRTBrbr0WKlt4RdgZG4QLR3D3nd
 Pc2+wIxe1qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GgAKCRCLPIo+Aiko
 1RFiB/9vPGLX4rCRjQOkWG3XFoRoxXAoe3goznIq2CFGqeijv1lUkS8knQervgfz0Mm0YJcdgjo
 B6079q8L+kL3ElAXr6Ik9sBD55c49g8MYAmAwSNSmXgmicEpVRkpmJm3YoQFopBBpGwtHMcQsz6
 awXfwfZAXcZy/DsHrOA8ScQ2OCT6UQazu3yZQxVKVAR6PQ6ca2XywVk6BgueG/RiNPX/ViYky2g
 VY5mlJSG20WmymvEwJLnpRUZUvAVhq7KdAfh0a6TCCwbD2fitVEjQmI2Yuez8ejW4e0Zx785+Zu
 2xEllX2NqZQx3EPNdpgno27vdf896pObSZfS/G2i9P9qiROT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: D5QbK3QO6nbxsy6iBOW6GJtFCloxVacn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwFoyf/Nrf31j
 iSQhLYQS8eqGuZOw+HPS8Gkv5SRcqI51nskRZbFpBNVYa5K1LkKRTIZEtN4MO10YLm8rIl6uSzd
 4DyellwwKNKXFIzFrecv9MtPHlVL3jszQyDMOTwb25LU9StxWK408IG7XLozfRIy3fgkHR0s3CM
 brv0bWCIABsj+SOr5/OhRSt4ZBw54NEqnOwAVMuLpIseipkv1eiSDjMocouUJimIJbjmX4uabMX
 b0imFU69SkirOy6FFZ4YyrkyB7kGd7l6AJldRLubUPVHLAPjQ2lAyUGVTNqobMZd2+JP0aGSUhR
 4QXAEitjyVh2Jp1yBlhKVBarQsOLllmCIfJR94gw7sUlKrdIxUPFbJ32BBgcpk36sf/Wnlr6974
 Hf/HoZKl
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c03f27 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=LFZCy68fuonoWmFi_RYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: D5QbK3QO6nbxsy6iBOW6GJtFCloxVacn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..691e2d8a721bdbf99ca2dd49a45ce508ee7d9591 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -773,6 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -813,6 +814,7 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
 		break;
 	default:
 		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -899,6 +901,9 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.3

