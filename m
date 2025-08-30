Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9216DC28
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513395; cv=none; b=s5fE407anEpfdc1Rbc9Jfcc8bfKvorDmpQxwLYdCp3oYVul78S+M7Tc9D2AbeZ7nadjEvsZeXFbztki77MqdmXw3iIYMhlhZWf5TEgE7y9PwqVuLJDGaNdo2dBW55Pu16nm8+nN5ahJ6rmmEhIL1Wv/TlHVIFn6qyE5WI1Tr7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513395; c=relaxed/simple;
	bh=4s8HKYSS0MgM6zvdVaXPrA7S2HD2NH/k39knkirGVZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kv/KGmgoEe++usf9x2S0x5NHpENnAAr2206GemavijAf0JStK5RAwHyjS4At2MlJo+zwpLts9oZDdesXeykDGRk3McN9KAPzPOl5B9QomVofgtFhHKxfkktApKNLLqiPXAfCles72DU9dtwDxbK29Fm/NLkgKsjcdPwwTmVkfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMrWNzqM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMrWNzqM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85TQk008060
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=; b=UMrWNzqMYMrZjeNx
	lYnPwFSM1DlBJnTfCbOVORANqwmE5ZANTNLbCQxA5h0Nihow7ScdskL6QJWkOmuA
	vnTrj/HyOKDAAoCio5lvtPu2sVEiE6uo+b2Oa+dSqVYs8/PdXmgfmnbY/2CVWKu7
	au00EnICgrvEGxh90n950pV+jSVJxRMi6paAXydM1QJMZxlHRArTP5rFcL+zkMET
	eCRlTP71YCJ9UQ/aErsHTmz9dI16r7nTObvARC+BLZ6KlbnzRfMcOsK6wEfqjWA1
	u+1Rhv4VrkJ3tnGz7xDgal9Bh7h+5oliTjISg7i5WV8VA7v91eEL/Jc5u68XCOZ9
	ClPVBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpf7e6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Aug 2025 00:23:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3081bcba4so39773151cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 29 Aug 2025 17:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513392; x=1757118192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ph9fpMKwyVh1QpkoJDUD9CEJnYrcgjdCLeyqaq6qOo=;
        b=wKNlOgg73tnpUoVwz6pwTmj1HcWH4VXm49QznhTmgXAKdr199yh352PTZDY+3aRIb3
         P+XnsX3x7EupPdkZgXiKev+OviOYya60mV4VCjMZ7J1aGFZ8w5kes/HOACrNph3kbZuj
         0K2tbDJZ+CFkgfNZS4jzRmIgmXxZCgKztiK700zFux3ocL/R5y3CbrZCVAjx600439yo
         F0ubrSsbNpod9BEaXEKWZ9SmwcsOrG7oGr5kUI8ZMlAjS/Ev9fj3XeKeLBs7Y7zpp25n
         9zbSWnB3qYQTgJg1N5iVTRZWkfDUdE8mDcWLj9TjREL0F0oh21fu9dvgNlBM01D1vKtv
         27qA==
X-Forwarded-Encrypted: i=1; AJvYcCVhpz/bY5y5CleJZWfi66EdxmAy3aJQ/Ym3rwWKuoiBc4953kjwCVCHCyBhmgw7v3TDv1spxr5lxzDfIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDJ9nxXsalN553IASBZIgijV3rtdSl4zbuDY2ZuWKUcV8B7iv5
	U3SRfCVwHf366CT1uvlVbNhWthcrjAfPowClHmEnQD8kzqQaIBhwjWZ89etVsKiVrv2OUIzhi+r
	EYQSCyyopy4LAVDVlfNTTMRgVX5kQqHwZ+xYvLLcJVRAjhCU0qrsIIUzmE2UTvg2zUw==
X-Gm-Gg: ASbGncscUS6WKnetAw/eoacg15BjTUwTnTqGaya0POXbfcFnGKxL2xRooai7RutoKBU
	oKzjsBYyw4CKVhjFyC5VCJq35JGDYXEIai71tQd/6kDAhZy8k1qO9qMZa/x5PCGxu4YVNJep52q
	xNLHWXXNhjDLf1iEfLt1fnVvSwoJ2wFf9IotDjpDsZwRe5dhF0k3oGhr1Q47DwHbb8yGBnoRpeb
	7020nBpTIHvt4cIm5LhN+lYQDuDgRG9MTEbvjFM4+5+CSWlyxTZLOEVYHkQEFPvvOHNCEq4pF/7
	GnEQSQHlci9uubZe11yrwXubv8AjWhxkAxjpRY/vHIIg6FeNP9hsPdIS+26F8s27RmZeBVZVuA9
	rZxhQNsl6Gu758HqfW2yCPJ9YdCZMxHO682nSLZYi0LZ10egfb4ic
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b31dd21723mr4241591cf.58.1756513391692;
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHd0n8qaUqx1S4BeHPfs6IpVe24aic04/cEgU1Am0csv+xPy83xFNb93VjtGw3hJtcKfrI7A==
X-Received: by 2002:ac8:7d4e:0:b0:4b0:7989:13db with SMTP id d75a77b69052e-4b31dd21723mr4241371cf.58.1756513391171;
        Fri, 29 Aug 2025 17:23:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:00 +0300
Subject: [PATCH v3 04/11] drm/bridge: lontium-lt9611: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-4-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4s8HKYSS0MgM6zvdVaXPrA7S2HD2NH/k39knkirGVZc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml2SbZ896twlcmpFYdb3yiNI2XV4x9X7bfjcNlm3zv
 ms+vfKyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATOSfN/s+U70GO8d2+Db0p
 /pN1z9m/2y0T0DMvz+NpxuZFXmJBn23ZPKsfs4svW+bYZGf3LKdbWyZn2nKFlVejZz2vP7r9Z/E
 E00Bj9pPP38rLZN7Tvp3K2hfeFrhHkWnmKekpb8/mXYoVCMt1+Bztn71ONMRryfo44T1JLy72t2
 33iGl60Wy8bMEafuegeTlLzM3L0y9GWe6c+N9EwnKpp7bm3UdPVlnL3nDd+b/+WJjb1GCZ9u/p1
 y3s+bO9rkc2R5mJrn+TnqR/ZbLwAfuupdoV7uu8bBZYc1hFTWANWLtK7OHNXc0HrV/U/p8bupdz
 16WmTMsyI75JubpRa48wq2S455fpPNVdaKP4xvHWk+oNAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rlr3Z3d6AFivxseAsH3a9Gr2RgY_uCqf
X-Proofpoint-ORIG-GUID: rlr3Z3d6AFivxseAsH3a9Gr2RgY_uCqf
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68b24470 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=AMvF8s34Jxw15HKoVo4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX0OmW885zuQcS
 06q1rUB50UXxGoPcTOVjg3MpyL6PMYmv/kb0PEtcTTGiYChEaDaMmJD952YAAK/z4cFFQ8fXznT
 1Ar6FYvQb+U8lAsEiTQYUsRkjB11SdaY4Rrj1ptvVzd9tbNoV2NkuLHmz7FlqgFCXQ+B9k4MhCx
 U6qt/LLYxT1mGFcoz3FqMt6h6n7I+3R24ws4Gjh/Mbg/mlOMB7J7fOUyG9BiPWb6xUNYyt60jtF
 DNVpnxcqrjy8toOzMyfuib+B1Esy2dK1t4kP64CyK2X4CUrk0crxgscEcLB6WF2W25qLkvcCe7J
 y8xwDxj4ssmgyYKHgURzE+i1ucizHFpL40RdfLiZaEFcDdncSqXCJY8ux8BWHi4erbC7e83oLBV
 bOtkFhwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index a2d032ee4744715b88eb66883edf69bab4c274b0..271295e1549885ea054647b06cb95d483e352f4d 100644
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
+	lt9611->bridge.software_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;

-- 
2.47.2

