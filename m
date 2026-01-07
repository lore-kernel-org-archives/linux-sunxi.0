Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8133559F8
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jan 2026 18:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809710; cv=none; b=ISyfIRqEfX+D0IhxGC+VP86uZktn1NjmzICNlOlpTX5JlEvUvW9jp5c/KnWWUPGpQuxm+slfb7FWtG5WDy1PJq42EWVE8S/ffVogktuRZX7M7RrQlwNteAP1tHPoFpvabbbrE9YgwUWryP4NbrBul+U+B4KW9D5txZrdNqVbeMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809710; c=relaxed/simple;
	bh=YjRxdH2GhgCXavyWIwCH6N3bsC345EISvDP2gtesFFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AdMN0tOOKi49wvlDVV0GYmVddERDIsWyByRbLQ9Th7ovjiIbPDNCyms3zUB3jru1N97B5WKeSUHKVyp9eGy1Ju/hiWzPfeSh8SRvWDie4yX+5It6pxpmWh6LNfoe/m3nrbT2E00DzhSdsecyUtBx9+foBr3R3ymvrg2Ir/fPjFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcvKs90c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGiAYGyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcvKs90c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGiAYGyt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3qIu2593287
	for <linux-sunxi@lists.linux.dev>; Wed, 7 Jan 2026 18:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=; b=LcvKs90co5qyoc2Z
	d/DIjr6T4wp6peOapih1HLy3dVAbvLTC7P2Kndnry/iEomJs8OzmIVngr3ixTOg4
	tVc0xZ0DdmPlAIFS82JO8PKad+Hq37EPFHDDYa0GXy6zgBOnPD7vJ+6HgBeCQiT+
	G8XV72EZ8iahnPwLPnscVkw1z9E1UZMXnq1dgZHv7GYsWAjoLBiC4TN5mTDh6g/J
	6uEGqMsEJNdB6obsu3FYwEUHg8rQ/O4SdEcPEIwhJuQIkWpFmUB31BYP1mcGpKNr
	8ZksV4agCherUaArKSC/9gV6QqRKNRz+GmwyFyV4PyNrFAU9PP6VNmmcPKTYAFYo
	Lf4E3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn291n35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b234bae2a7so634334085a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809707; x=1768414507; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=dGiAYGytJU2x5e35mTWfDNvkI/ymhNDTYNFkPCynhnU95agOtJsbTMmda8d3Pc22G5
         Jf+gULosyftxZm7+MZ6F67sxF6eyj1+ZBKyPFbU/ucM2zU62AqiQd/3fr5p7svRBR/ox
         OgMYacoNqToBE+46iDWgA09TQxUPrNLFXjmPI5nmVqd/D4AAYzdj2v7LWSgjFD0bKKiI
         Ayk872ii3Ml8wwCDfy/OYaelkgc+tXJo1AQqUvGQfGFwDINrEPevx0yk/58LIZP1uc+N
         CPJ7QHIHGYe4e2RUTraZvwYeRicedUt7HpsAPMnqRmHc2cu5AEssZrxn7trA79SF0QDt
         LoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809707; x=1768414507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CvOBqRWntd3xVSUEtMwnv/Rm6Go596skSwj2MkU+rb8=;
        b=w+bTkgzUHXvu5VoLXaq1VyoZZKvF1TvB7cpslKSrdFZ0C+L8QeypplY11clR0ve1R/
         eqDHn1GbbPO1YGTw+9saxGM5SKrqtqkA4cSzCiZCu7bi/etoro0RfDigjMLYD+z1u4Iw
         GKlLbx0zFXSLAkIexI92JeB09AioCSUTLYD988Cm7NnHa7ts1Qtd48V+YRFQL4LG8o45
         Mu14hapfMks488fTabdnl/0BaDU7gfNv7DqszUlmiP5Z6ilqJMrQ+X57Xc/PRWnzpsV0
         JKaJOH6EseQD28slO+Z8UVzC21i/kBMjl9+hhjVqAS0v/3o7a0gxFtKdMpDW3MevWF41
         lWQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2IbbeqUN2eWH8025KvCVrOl+NecJDTm64k6QqGzTT+leCMvBbVZNkjimYKPtUfHTar3vAVB+gVU83QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXCFzTAVZkacIYAp1CwwGh9LGqqWJJkt3BcDIYQEL0+NbVYTLD
	7b0T15gEz3QPf3HYQwesoAytT9guzP/3smv+LnEE0bt51YrUJuERf3zB7DQ3xh8CGfImy/9I+LM
	i+ir0uKdbhC3FOhlvr2VIX57qmUEIyYSrPiwiBJUqblaPANQPmnTGcAOOEFh/lVE/gA==
X-Gm-Gg: AY/fxX6CufBnVec/7Eejm/1X+k/KSKRtnWMnmK6ZCWwDmIt6x1Fwla7cACRnRv07WIG
	finrQT991Z0Vt2ONuzqatH9WIw4/LW7WLPvYMGo2Nb1BXv2plc8RHoOPu/brWC0U4E0Ja8shZT7
	vhnj0TM/O/iWD/0mxRsV+/85qZSW28/2mYx3fH0QleGh9GNrpl9V5T11Eda3I4P5pZantx2Sx+0
	nPoNiYn8Ssa2AyM8YKMTWFo2QayzYyDh+QvFPe64E6YH9OnIvSnx4YiYaS8BWz5L1pXjOv1WpCC
	+HxQoq57ZtpFEkLZp4iAqasZM9EUD/EAo8bkPMy9yVz9zfAS7PErgLCHh1N6pT8lqj+cphvqxYk
	OPZHyM1Lq39/9c6HrwJ66loZOobtVRcbUN5Gy+5pZzh7vjT/UFgtOgMsV0HAy6FpYPvqQEKa6G3
	SR9ifom9gKD+mvkhlS5Pjx77Y=
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451570585a.17.1767809706372;
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErco6iIlONdm8FoPmBoVGT4sMle7p6Daei/gbTGJZ8AsHe90PS3UuyAzSsRgYRNtmFv/UWZQ==
X-Received: by 2002:a05:620a:298c:b0:89f:5541:b5f5 with SMTP id af79cd13be357-8c3893751a1mr451564685a.17.1767809705824;
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:14:59 +0200
Subject: [PATCH v4 02/10] drm/vc4: hdmi: implement clear_infoframe
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-2-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjRxdH2GhgCXavyWIwCH6N3bsC345EISvDP2gtesFFg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKkcDiQpwhgi0U0jf8JGOrxJBwtl/l5GypPK
 coPxI4tELuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipAAKCRCLPIo+Aiko
 1fRWB/92FTnBMUcYj37wwL0tkj2+9WhnXCNr6YaqOXhJHzBvMN3Ric79sLxWIk6V2x3r2jYCRTc
 BkdlD9X0pnL+Hq2degXIglnJH2gA1p7PGCVq8s0gm0v1ELu41JL4luLf8f6sJieWu1QXoaJk5qP
 79zPwaA5N2vB9hfx5p+R6t4e8pTVe1kMeFaRCUvqmAe1Kovi1sIZ1KaVq04n6rv6Vhjro5yFiFn
 LyRakv9HjVWBfthh1kbm1YCWTU0Rh+rmb3pMmr07+I6SSf6xRRJ0Yq6B0EcopvIhZhVA3ayoLhz
 savBzIEyxFTHux8IDyABCGHnOtOfh5srllF0nQkfQKf8sNtQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aFto_l4lrzJaM2-bO35RtTrpMvd3_F6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX55Sg5B3Emjrl
 vMsSSV7bvs6wHMfzrRloXohr1jmQSSz9PFggFvoHWBTM9OtjmtLHM/RKNwIlT24H/90raPYHr2W
 a/BSJlHgK6Ns/1qEFl4EaPw4VlV2JGrplhJ1zzZfAqqTTh6/Nx3FpDZX1iPrJjaRFt0tUVsKuQm
 zH77vDhUptTtvqAUSkEcwNTKj3T03EpFkkbeBPpVbmzaXOhs0v0xFlb4CyZoyJ7SkazSj8fppVn
 BP5MiAImrJ4eqHCFFv6liF6HefMEHhDYTM1V8TZh4myDzgz+iCeDVQUfi1Yev1C8/kHj5DBHVaa
 s0LVjh7W4jaj8dq42m/Ql1X7+BfKxdPdt5vvyLn1gqCBntRjUl9bst6Em4UoxUuONUxQf2FMs8X
 0A0Es0/APCMZ/UVJPpu6Qpa2Lwt1LIC8e5WhSrcYpbNGl+5ayPRWdxvZ91BJCsYTGrUepcJ/CDr
 X3ili6N6Etek60NVldA==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: aFto_l4lrzJaM2-bO35RtTrpMvd3_F6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1798d1156d10..4cfb7ebc0c81 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 	return ret;
 }
 
+static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type)
+{
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
+
+	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+		    VC4_HDMI_RAM_PACKET_ENABLE),
+		  "Packet RAM has to be on to store the packet.");
+
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
+	if (ret)
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
 static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 				    enum hdmi_infoframe_type type,
 				    const u8 *infoframe, size_t len)
@@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.clear_infoframe	= vc4_hdmi_clear_infoframe,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
 };
 

-- 
2.47.3

