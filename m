Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91B61DE4CE
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538219; cv=none; b=GQc5+zv/NHp7WBuxuqKj8Ab15GYmFo/kgz0iwRpS445DWo+K//Dgph5jJG7CoDvp6hqeENXNYH7VAzaUi8c6uJruYuUz5Yyy4djP2iuKuM00EjSd9hVcQb8yZxc0HRQY5rIKbDlKNeRP/S3HCXIfUk3DFyWuB+Vvbh6Zj25vrkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538219; c=relaxed/simple;
	bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BPvjuZrvokB72QZYZMKGWp1BktO+6eHcDuI+nEu2GUsy9d0ATszYZ+Cdm6lpphdnWDbpVDgbAsQ0JqhTv1H7U3HIil/DOlLAsk+IpPLDJLxCHVgO2mUIZrspH+Wze2kshFeIxOfDIsyq0z1gszYGo9unABEjATYXsz8IF0oC63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWR5Ojqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp6Axgqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWR5Ojqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp6Axgqg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNJrSnE721758
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=hWR5OjqmTENGCgZk
	I4zXeoe0FG7+9/6SD3mCvvxs8H3pccL8dmb/4n93hTOrhvZH9t3GbcV7sRBlbwqh
	j3vMtO15GjZ43NDH5xDBw1xydalP3nQJoi/cquWmGbTFSO0HIAKy7YEvhLkXqIlb
	dQJ62hwBdIBtDRmwviqI78iNNVhEH7JVIqEWs3P+GhpXvYZbEb2mskJsWiOFpo+9
	0w9HVSCBA6DhMLa9kwIXPMA7/MAnPT6hxcp69upX2RXhvAhyWGDr02JZGhZE7hrC
	/ZRv6AGGoy+yRGIjDtc/ZYrlLleHwBbYd2TR/74vUAOumKhok4evGO2QVUh5wiVI
	wbOeAw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b81mt8nka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Dec 2025 01:03:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so144736376d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538215; x=1767143015; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=Xp6AxgqgxuGFEX6+6msbODEPqJSOnoT0JBoC/4GISabLhyen8TF0kY+DKjUCMasBkP
         dq3a/l6INl9HhYNcfWjt2qqZDdQmGzbQKUkqh+Bv4nwj33pQ25HRaRdVx7l2XO4y9DVp
         tq75jrN5kP2Mq/SPTGgH7Jh1KBB57aFYziNYd0l0iib8eK6BVJGy6RjfMoAa9RHarTR8
         8G1izyOdy3NDbmQZgCN2LSUEoHZKa+6Cp97/mUbsvepziChQHJQY/S25np/6OMsgjkes
         LFmzszEs7m854AHBIjN/Npky3+1wI7ppoXa9hvPBMUbNqgrH75czS4vEU7PRL7n1Bp/H
         ms8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538215; x=1767143015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=dPXNvdFv421YFw3pQncPGyTKvjuA4zQpPAd2cvbLTN2WmaYumkgWL8ji9gM1xOH4e1
         wzHyoN1Qwm4lSs5qeibWZ8NiDfn/0KnzjP5bBbXz+Ar2XvT0eclEwWHRh4CS4CrGG8Cm
         bEtQR+b8/m1EIm7pCavZscZ8WiVl20wUdeDM+13O6DCQghhyD7pf7uX/qOvHJWyLsS8g
         qVK5PLGZA0fgUpsZLd0q/gw6S2oUsBI2Tuv+3uc9nDvhXOyX+ijY2LnmB3V4FWUVw4A4
         kH3xROli7vD1zDFrWFYoop1omrh4dF5WyBqqMGieLUogcvhQam2uV0swAbzxJ51/PsbF
         s9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnRh1qGn2OKd/tKcDKJO5kBINf2650IFihcS7WT6hvdRZVy1x6aRjbmYe56ycrqrucQZIadeuFIlqpFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzhhP6Xg7UP7AojlavMs/pqRrs+q1KG8L9oDmfXiRnj0pDomUS
	lbCaes/qobbLRkDv537GJMuKPlxc0wwoOywqyoGPueJypqAatAXZnBfzXOLhh5GTqF+NlszJ4Qj
	VpekkkKqzgoylA5+HP4dzbLEY8odkbA4pU82NoFC+43edeNsmz4D4rWrAFWmV5TRXcA==
X-Gm-Gg: AY/fxX4hkraHhysbw8hDGqC4Eb8qhHfNLtjsm9luq2yiLgmN0xW9GeTbIOvLSqaKlQy
	31Igvk48o6J+Pc/G4efsXAMQDqmgF59AuftLN0luwu2ouWqoHMK9cuQLOM/H4DaeUH7Y9grwEzu
	XY+DoC3S76H5r7pyDVWe25iWckuGBEdNu6+B9hYOdDAY8sbX3Pu48+ePs5mJTmWUrFqNQmP78mi
	fHE7dIZyHKjJ6/CvBOiRheW7Xv86cve5uE6KNeG2dTKmbyK27Hkz4TSRpgwNW+jEzVNCQ7Z/752
	HN1ejIsU8v6uERGHC0gc+/azpmBYCS8MltXNSE4iisajQcwO5k8zt+glfvC87paxfbA+X8agWzE
	WHdoyiMPkmYPmgevipLIZRThLN5GjKR9I0sfIEf8EhfIKL3DICn91/kqWyParaxZmBE3dlj7/fd
	jGSC++Q0qyhposJnwJl9DT1SM=
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251739006d6.29.1766538215194;
        Tue, 23 Dec 2025 17:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpKbGgnmym2Mtt5yWxfAHv9iuZOADyKontrek89W07BD34phYJfGyZ7WWcGGMKQLxabxO7ZQ==
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738596d6.29.1766538214801;
        Tue, 23 Dec 2025 17:03:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:51 +0200
Subject: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6a39fX0APvL2yu8D9Rc3hNQrCmR/DDaffohjZWMNm3TW
 qUDX0zvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEyqI4GNYH291ht/25OWpN
 +Vnmr+nWTHOc+k9sTsiarlmVcz3+bZnyG76iwxndrZ6Wj9f3RuYEOJzb6B3/blvX/q0ezEeTEnX
 Dnpb5/F56eOYGp4ml9wQ/ivtYRbm8EOP/EM/JY+69MHef7kne9Z5Zt1QKdvxjyT8+5acQa+C//A
 uiTqvfV1f8C7nQJzN7xfT91yIKVmyPb1rrFqV84Zy75YP+wD/rjPT4rZawrlHT9uq6uOhGaxCje
 WWdfpCJ7w9Z9vbZN8tfzJffEHu3lltStTXUXUTlbfaz0MQpGWsbFNULpWVswpb3nP91WtD11Kq4
 VOMQR0brUk6/yjc2PJFtDgf1l07Zor3rOPuy2bdnid8FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e/ILiKp/ c=1 sm=1 tr=0 ts=694b3be7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: vkAyP9PkOBZDo97IjEDu_hy2JL3H6rob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXzIRVU27qjirM
 2/v//wCPB6/JQ9dE15UD6JNBc/3T3rGxvxSXEjDi9oeSEdQwA1pmqW0rTA5jUBQpvWTKXNBjZO6
 BpjquUTLRe5EAl/t1IZeH8j+C/20QaQ0q0aCPAgQp/NRyf92JAx0BvXxJluiXGp74WjLJn+n7B5
 FJ6FFA5uHxZ2NVOCvrdxZoyk0K3OobfwjCk7gs9DLhjFUYnBdY+PGGoQg8DIr+bOUoOIyFr1ThQ
 0s/FWc5tgj1rhynx0YaAtxBMYLOPGXkRMa80JEwpHk7yu20zxiAoQp76VLMMLKxmZp5JKIHpLUj
 RIHMEkwlI99PyCXoK2msDRvUlNqqPnats7gAQnxZ7QG4YDKwS+Uv8bIakyeNGguZY70ad/iHwJY
 jD64TWn3AnOd7c5VFJCQihIMl70+mZCSYB1pNa0YLPfnDRvLIyy1Qeji1EVIEXGSp8po3J2lhP/
 jNvvUEjYFlITD0SUeCg==
X-Proofpoint-ORIG-GUID: vkAyP9PkOBZDo97IjEDu_hy2JL3H6rob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

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

