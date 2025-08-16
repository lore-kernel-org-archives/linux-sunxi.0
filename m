Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8232E7F37
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348083; cv=none; b=tOTqvuOwfsTm4hxnHC4hCML26iJfx77ZJA08mRT988RltDEo+8tCl8L+0Nx2vKUgivvS92c3KbZZL2O2LOQtDeSg/N1904pTFiJWQr3MagqZ523G2kdXDvNwO834aZXYGI5HWOfF6elGtVoqQ0a8yRarreOvzJGDTbK7WXsPrQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348083; c=relaxed/simple;
	bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwWlwQXFBVXlFty+JRJ+mVABHlSRZvDNntQ4WSEl7L0fYduSr0Rg41IrhBlm4JZc5VtLkIg6rYhFvgd61LdrekR5GcpLm3K25LQmAwNqEM22DhBfaurMn/k4naQGWmNnggzurYFTudGtXYobW1/L/bQfmLeVVYwLDVx0yWdtPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgn1liOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgn1liOc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GBRCDZ001797
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=pgn1liOc6Kjt3D+7
	tK3LPtR0cFhpN/7UXzrPO256Xo+Iq6k0LLE03rje0GKKYeZBZKTxh2VG8xNXmaTy
	Sn6XScwZs6acyk1pWW/4zVXFg7zdAtJ5dEU37hrpZzIafYiunQNvSjgXkrkVR0JO
	eZwv7UYpWnkTTjrduGBf/1Ojg88LzHiOMisKsjjgNZDDoFulaDUm7BdzaQYF+EU5
	CT5DOv56rPRULdo8RuNx4I+p7pXc3RGffS8h0vgC+Hzh0JrcStyjuaY6kR7JubDY
	ExBTRhgfDiseTsXlx8X8n11pc5+A8GTh0u01mvJr9/k6xSwdd4jjxruWWUk4gGWX
	2tbqeA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj740mar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 12:41:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a92827a70so60796696d6.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Aug 2025 05:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348079; x=1755952879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
        b=sHb62A18qxaopuuWG7GkbdO5/FJELtXBw2Mt9fovdAFeE59rILBaviO/4QWuvYBCUI
         8PcPHjNlofouZkmEDq6judLmmH6BFrJg/J+FKfAvTQ1jXFT4F3oeNQjDcToKqKd0uMjG
         MgPRqbYAxaf5CerCkKYCGE9maBIDIIXFzaWo48pCTRfI6qYi67B8pGkK8EH4o36JxCTs
         FC9nHEV6aVRUBBxmdV7JLP3/7HjEGHHkyDxalmP5gHUuU8+TBru9J1+LZeUl6ku6x2+l
         1hTcSkQBsSwfX37BhIkaIjxOSKWi7ZieC5y0ZvYyr3SezgnNrPPResP1h9TV2N5YCBV9
         kSag==
X-Forwarded-Encrypted: i=1; AJvYcCU3XHGNIwFdNl8z51eXtvOXnTbGNCfuuKqsaerWScqHY9qvdLhvFImkOmrPxdOzLWSRc3seAIXKrU/j6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YySlN4h7VoB7GLQb70kYKym1HIifyOcS6c4xLV6z2iU5H2NQr18
	W7wZ5OrBF1UeXspuX+fCmFjVuKrJVr36GFrN5nT4Dhvcuu4HSvQ7WorQRcgoXQJyeU/dJZJO0QO
	t6EnrpOKthgw6Er6+W1Kokj/em5ZjulLyL1Oe8BQj/zeS3b9ew4m2KoSwgt6QzPiRCg==
X-Gm-Gg: ASbGncvObMJTbN3SddJRMlALSBouSWYWHjhZbBkZU67WJQ+QXHWDrca6763u/B7WfdP
	5T1khB6Smz3a7a56+QtgaO0La6z6af1tLto35SOyp57WggW+du7tlUxJCyq9h/SsWM6f/+RpW0U
	8xCA9UHmryrE5diShQ6f5wkjse8uvDFvGY/5hc2ZjPfw2IExRo47j8VMQDfTjieedP4XCKWcpqH
	JpiarYqtf2UHhinrky4AF608qszNc/mhFcDOlK4hluNl3OmpxV26EGk/PZF3mXfNuRxXDT/c3Sc
	1blmzkfxQZTnSXVuU/7qDvxz6AFaJCARkHlNJpLKfCyuvMGy5/BQGNGw2qL7fTcUrVfVyutWBMk
	rYYgwjUe4PohqfEuo73D0kS4KSXSu2TDp0JbXxC39N9gP10m4Grv4
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id 6a1803df08f44-70bb0618468mr24915106d6.32.1755348079218;
        Sat, 16 Aug 2025 05:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOQL6onlKjHcTQTSZYwcPj2qboHayn8rKRBdtJHr/kNyKMVVa+u6QH81eKHnsSjAYM+ZfZeA==
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id 6a1803df08f44-70bb0618468mr24914666d6.32.1755348078746;
        Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:07 +0300
Subject: [PATCH 7/7] drm/rockchip: rk3066: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-7-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxgMHi4qTkGU45yB+UntdRBVmKZr+x/UsM25
 LEGEgGfYbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8YAAKCRCLPIo+Aiko
 1djgB/4wOmA1OtnxVdCPZ8Z4di39PIjrPkMG0uQmJI/t0Zc1l8LN6lav06X+zI2KDVDqJtxF2NO
 g8QqOU8UNZeo/kURELWxqyJZzOrWgG4qXXEA/4nBe57GtgK/uBOASm5cvxECJmXXrAsl4xFlcdr
 84IRMNS5lpy+y6HeswpNMDsppcEqals/0nvB0xhbIFKM0VHF2eqBD3sWZiaR0h84BPiU6vcvvbD
 lBsE0lzCSfEp0EC2XQvwDi2OJBLUdr6oBSvcad90o7e6CMWks5r49JFQ3pSoeHlLXx9875g9neu
 Me/+6Idd77ROmdlT+vKnBkOG3AAYvWoynfGMjwl6WnS6TzXc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: amTkAXr_NQjKzXNWJ7BhZSFOk9GDlcvS
X-Proofpoint-ORIG-GUID: amTkAXr_NQjKzXNWJ7BhZSFOk9GDlcvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX/Uh6kxz761sm
 0FfylMyEebyeuMFdZ79ngqxvcaYnfnnNqVZLeNJ6ysUfdliAnIpPX7WVNE7Nm94OAz39kWHCt/Z
 DVde+iM8kPsxQM1j84r3/qFCOux2i9nnjzitV0YmwD8wshzktnTf9ZinklJIB56H5vWJvZIBikF
 5z0T4c5yo4nJzFCjhdK4Pd9mmccusrm5TfezfvMLptUDPJN2FFwE0NvAdsIoB0Fpeb9gZNga/A6
 5ItCWTNuQf9Un15igxWtutG5IoIfh+0/OuMXoKkh4EbfeHUl5pVHBsFK88Ie56r+b4c16nNjuIG
 FJjvMS6Qf5LswY+NsgizL1R1xtxhScBttMr5h7O8vopRQTsZ5mW59qiY0KolVd0W1kzLluXG5Yg
 ma+wFgCW
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a07c70 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..75bf9a13d8cde1471e8b7e8a8f5f4c0457dd0a14 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

