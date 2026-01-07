Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D33563CC
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809720; cv=none; b=lZgDDHX4yxJlYtRuvOvMULy851IRGb+k8oFbc/lZpx1AFq1AIRRlWU2Z7DOooNQD6EmPWSuFNOHkg6bp9cLmtxyCAmTo4K4+glJdVsEQYV1jSedH2HqOZ/sMxgKs5OUPoKtQx8YqjYCgzuoK9eoicA/+4hiIK8IpYSd1JWzIqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809720; c=relaxed/simple;
	bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNWM2eMA4JEQHY+XNYreCHA9FguyY/dJcSdf+anpzk7wh1REQyTtJAEPunYsSI75DczHLF5mnt4t2+1RfVDwRL0UtQuunZEovyzYGqayAnC4tVp1q4nTcj7O0lGftHXHHfvEkQclv2VTf6yXQ0qm8Y58tdmMs783F0MbGcanwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YT98JyW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4H9nTQp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YT98JyW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4H9nTQp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTTlx3751433
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=; b=YT98JyW5oGIce4yx
	t62vyUO8gfpzGSWjao8mBdPTYJjg9dpxi69OPT+flXHjY6zvvx9HgiN5VBgBBE3z
	aP7KS2Ai0vJ/lJpU1dpDd0Wxd3AfpuO+r5VqXRzqZpaUaKyoi0LPozqGRblpfFtK
	8FFeJxxsq+wpaKuwqGiSnUZWk/S1M+hmWmUCx+hBTMfSwr6J6aj2V5QFdUUVf0kj
	CHLH4uqz3dyg/R1Bh8EhaSUJI/DxjitNH/wMuHLMhRLagS+uW1jOa4CUCDBGeaVy
	RdCTC2bWeHtpXMzHIcJEE6pFwJOYIGnHu5DTmubFL5Kv1LjS0Qoq4BlhHH+zqmpU
	l0KWkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcr5dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so632013085a.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809716; x=1768414516; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=R4H9nTQpYH/MEIShcJmvEk0+JunevMAEWAxi2Vyj4wBgujDp4SNhKUju9qEw6+257l
         SPuhQHHG6/efpNOqbGAQ5vBicThFMo449zYFtSBaR8rbTrImkcn0dlNNgqjuxFSIGmFE
         a/D+GD67kF0wAFnnHPHwgacZyvDSDrAYgKxSeHghGjW2eFfvSgxVI0U4ps+ExX86FiFl
         L9ZglE3N8JvCCwhf0uVVAa1WgQalgk1ARX6RKWRkPsxNIFdewz1Az+/+vYpb4Mmz3vN6
         BvZ7/QCRMbXvgucw/9ZYicG8miPghPdUmRZmdutqYa6xUitM6hIbRdLS8ycWIPJ7/rwf
         lGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809716; x=1768414516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ayeKTjgf6jc54pfgcQupo3DnEV3KmeCjaAg9qNbh2E=;
        b=JbXamz9Czi5J9YESCSm3/sVYIxHjKiqZK1VuImQYEDOcWS7MFs1yMUvjlUYaTCx1tV
         AOUKBcwnNB6SS2d0c3uksEAaF1NnFpHnMJGzULny2O3rDQFNf6vDZ5NgrzQuld44+EMD
         ravDzriLe2N5rZzTfbbaAko1eVQAg6+1ttKtJ0h/TuX4zi7S754lyCGGBYm9ju+Wxr96
         6wKErAvd0AOzNAcSrbewWxGDB/d9OKtLmZe4YpvwULXBiLadoX8QPfxVM8DVYtzmNsLx
         bW4g9muFRLDCevq6UOYhOK/7E0UToBspkicsVKqbF+5/gv+V2L4KL+rI3gv6xQ4x2y2X
         ssCw==
X-Forwarded-Encrypted: i=1; AJvYcCWkMFz/V9y4XkOLWttLsAgnIZ5ZqV03ZvSniyLhSBkvob4Ihcm2vZF4eHHCHbtCj64qYjLRZ8dLGA4RMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb1vPSd7s8cfFvfMZqjRjW2394xlQmHleoJTCrkeoSlJVHacNd
	yApv/OjHjOYUXFmiV/9WtJmtb41W+/pp59xNcbybmi3ITuMpms+dkqLlRmcCip9dm/nFrbGEQSW
	IRCDBDTRAhh8ey+oM4NH9xFkLYiES3naExMahMVpsUPQPGHA7seMa4jGMvlHS+8m7Cw==
X-Gm-Gg: AY/fxX5tnyQg1A4DbTA8b8hqYYTg+JVDhMg1orNLy7o9LvYb/OaM5YSAWyJPz/3wwYW
	8TfQltUFDAQPjz13ZOMsMwYY7oKCDdtOs1DVwuq6thg90ML0gbj/a1YtnUiWh+MClTxQ6nNj1iv
	+bupVO3Oof+ouUP/rfeqROltTADZwTXhUENT6hf7SwnyLV+FlZXAY9k/+hJRwuF6jHB5iofcIyk
	TAIa6leV8ejTIHEhZ6Ut7KL1e5FJJ2ubZYFBsK0k+O3oGTKYjWvKGHs4NQpc/TI0itCsdwv4l7H
	IO7quP4FjHngznS/btdvA48qHcCufDuJuweHk3Yk0QFGSHnH783h3BDVu6KFFfG4QLKVqdi0rTs
	5Nx4rMNGXSIsATrzPGO6tZClTuartzEHjSJdj8bCk/mM095qUHaryjP9DumafLa7TqMmyOPa5JD
	NqLDc7bVKSwmpW+MQPjc9ddoY=
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440815685a.78.1767809716513;
        Wed, 07 Jan 2026 10:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzR6/I/M+rb+0CfWg9B2pwtmy0BCZ0528ZAW/PtSMTyk3JvUKmiud8K1hEOQV156GKBDOZmQ==
X-Received: by 2002:a05:620a:2952:b0:89f:5a59:bf30 with SMTP id af79cd13be357-8c38940cc79mr440807085a.78.1767809715974;
        Wed, 07 Jan 2026 10:15:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:05 +0200
Subject: [PATCH v4 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-8-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/ZrVCxC2ORTh/25tcpqTF3QUmYMkLYWP2fYAuUO25LA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKlLQRVN1fiNfBhJSnlQQ8yf8TEYh+A8edCs
 YWTlH3Bcj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1QOVB/oDjydk2pqigYtLHtwvNWcAKXJbbdPGQ26WTURthKMHJhz9rPZZV04J2QY5hTtypEXd//d
 nw5Vbwc0So6ysL8Tv/jIxpWqiL+ciHmVHitK6qOCEBS+i8W0MtTLVx1YAdnQ2gp8v5gmqGooPIj
 URRZkW/XopRmGOqd8hftr59SVEpUvh5HH5NGGNoX/Wx2rngOV+KmUfwE0HXApJlGUvk5kZ/fwRb
 bGSKspZn9xiu+96xWnVTNQqum/Ct/2q61VCFkl/XqCm0lDpae50DBapNsWOPBMIWt03yTjsHslN
 UvAY1W9Roxw/F/vls4Ff8wqqmvewupBjJYfykiyeu5Y2vHLK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX0R2JckAfatah
 x2D36hOmqfkqW2kgmzMpPLH25tU/ya1gn1px3gUy1inzip6WTd8h5MQR3mckl2VDF97QrryTCMJ
 TiDoYjMZ5D4sotu31GzwrFiIZfINRJ95/g54+eqcfRe5+TDBEr9uSaieeOUV+6OmGGk8vmqpxcm
 rGsmVfDyfkYKwe0G3749iTdcOgK/I/+oUXNtxzQojJHHYMVrsn8xuLIugxhGGginB5u1pM6nTa6
 oWfl4Dw8BtqbOszzCpy+kms1uo7USYFV3Ae7V22kDNsQ8DHHyOPS9PDdsTUnbVcbAQpzGe3++nM
 CVrckLKPFpjGoH8MnFD5EkI2DDYARwqBcsoz1+NKvIWWMgW+jFvRB+F6MLsEmWowvCIwcGsKF0d
 TbbCr/jpMDZIb3qHUmc6UTFLkLowqwXZpvCQrYxFTPgSca6VORHcLbKiIOJo+qfmciUM6gCon8H
 wUZtuAQri39XwVWb0Ww==
X-Proofpoint-ORIG-GUID: fzCPmhGl-tEOUUPUS8aIeUN3qWO-iFVz
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ea2b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=58UsvUJqJn8fpqk6aeUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fzCPmhGl-tEOUUPUS8aIeUN3qWO-iFVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3

