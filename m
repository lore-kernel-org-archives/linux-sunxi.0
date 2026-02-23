Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DC23B638
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853886; cv=none; b=oQILCRoX5A09uVX6ZeIPMFEcNmYRNswctNRiQOqqH5MhRzC24cjHujJ5FHIGwLgzZgZZFQwxR07oqhfPhdShcrhf60cV2LkMSIbgPy6Icu8xcHfDAe9M8aLjtmwbmvsU3aW5k+F1yjDjntV1Rf9sgX3UKYp1VURN6tjPsmW6Vgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853886; c=relaxed/simple;
	bh=1c1gquLfvSJ+JW0V9LV0gRBtqRjxxuGL6ryTeiQhipc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acSjqnBNL2HUWisFbNA0ZxTpjeMpbHGrL5ysq0tJzxk1W9fO0wtSHKcpZd3b4f87r7KIhl83lBxvzlHwh3UxqeRe77RabbvrgOMKr2a9HtS3TeUuspjZvsrNczsxQtmyMLh45cep4TNyRIOiRi+Pg59jQnVRw7dUgdQJdfysujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlxMz/CR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFuboHo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlxMz/CR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFuboHo/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWfnw3733550
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=; b=PlxMz/CRZi+cXbvz
	hmTnU9cezQpHsZ1BcWGZMSnsX9VVcbOyrAG2y3dXhwwbBUa4A3KqDiJWrSkNkuGl
	QKS/K/sHo7ZDjrP0Li77lnLvmPDrTPRP7rrYWxExqDwNrP35wWqRc8HK6AHXtnFx
	tModpZVK3yjPTfFfurVauIwIA1IPDzK90YsqjlHQd+c/IuVttP55nql3MIYaj+40
	5vmzmgQ8yCa8+ZQOLL0Bat+ytPGOayi5kJB1bp+5vyEf7ECaU5tzNMBnOpmbDnhh
	zM77SAHIBjufLAIZ8iI99y4vki0r1Nz7lONXStJsAruaQZh6ixYlXe+SFASGpw5I
	0sXFpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t8ffd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:38:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso610787685a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853883; x=1772458683; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=CFuboHo/CkPhN1WPG1Fy05gT0hCYe3AIEQkPezFWFFgA0ZXNa/YHuOZwD1yC9HxicE
         TOqKMkgbrqweXjs40q3DLBCYyrVBKh0uHFK3iDWbJocdIAJFeM6ZB3noc4JDkoZ7qbzg
         LVd8j2S+Ov8vsqbV51MBngi75RP6SG2Dbk5TH9NM6g6QlJwgsBpfB5lHyw8MBOBkDtIB
         WkhX5juljY9SCafDR8I1nx8L6gm/BApa/POdiGcRvnBKnhlg4m+irZrabhg39xpL8Du5
         tmJBVgP/962qRdm6ejqQT0wbbLYy0y0LOcbrwJtx5V39A8YpqkbVVLuwYJ8gTjFgknVw
         h4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853883; x=1772458683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nHxPv6I4Z6dO3Hj6uV42QIGX3GK7K4BGPsWpNavZvBk=;
        b=tegWaU6tauCafW/X/Hn4Ko0qeiuJUIs4FLp7rGJfgEI4Rj7zH8N/hbymJZOUoS8hZK
         ledZNCo54Ni7zdbxCHGs/MUWM+/Fs1MExBgLgy3XRsY5w235bvBMTzsqfmsclVBctDk6
         qKgAByg0sEkmsa1cgg2coQ9pBMSkPZAjZKwAEFnFCMuyFVvS0I1smvN5kIHxIBMv8FiV
         y3fmBZJkM4yd7oP9B+6l5nU2vLqWD/rNGL6ttR4cfYPjzDSqIxhT3ZAPeVfhy1+WP02R
         BAdvzgcN8BZUcB4m+109p74DS0EhDMcaAZdinOGsDPvYw882Y8wm5oFVs6qjqtDcw/bi
         Dm7w==
X-Forwarded-Encrypted: i=1; AJvYcCVlNJsjBt9HzQ7eI2x3RrS+vHqX2gNuaFhYtCnLxRuQicLTuEH9+Fs129DlyycRxbofgYMSOap1/dY7vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzABf2T5flIjxdyCGbDtfVXMloQK06YaWyJREyuVt6Upq9OlOB
	0cVENPcDN1xH36hEqMcvaPu+mgSGfiVpuKJUhepXwfiruy2zGyWH5gXH/vVXke9P4YnkfOQz4JT
	kcDGD7WiP7E+qFc4JBmyLAjZhNxCGe56eqzcfjR41brPn93rDED5iacgqiZAQrcxObw==
X-Gm-Gg: AZuq6aIW6oRhHRrwmd8o592ZP7Lu1pdVu66NB5pMNwejmKOcsa5g2PUha54PG/yMYpm
	PjY0VgyBa362U/ZMR0KzUNhDFS3bKKAP/bIkfposbNPYGqYxVNlPIWMPPjgn72MEQYl7Y+jXdb2
	I4f7ZS4jiz0fQt52g9Ozu+c1a0ynTXHqHjL4DvOhk5Qrwm6SI2zDK13bU99DCn7QmePrqoy3jFF
	/9zWoJXYe0vjsWZuZhQLcQ0gos63sUr9hwpL0MiDz3YWkq40v6a9/PyGz4zEcTtfIfWG6PN11Su
	yfqL69ywZGh4fixzbr7zvttoX0Fbc9BqhVfKu8ZSfqBonyxenIPezIEWXrISvI8YOjSg3xoLKfj
	9zSN+d8A60P2fv2ufIQcRUzhrjjxztAIkQCl8kjmbb9I7H8j07dc=
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971549685a.61.1771853883022;
        Mon, 23 Feb 2026 05:38:03 -0800 (PST)
X-Received: by 2002:a05:620a:7082:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb8ca82021mr971544385a.61.1771853882505;
        Mon, 23 Feb 2026 05:38:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:24 +0100
Subject: [PATCH v2 9/9] soc: sunxi: mbus: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-9-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1c1gquLfvSJ+JW0V9LV0gRBtqRjxxuGL6ryTeiQhipc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgircAU+0jsrAZZ/Aj6LcHzqbHGAS/DFEYZi
 t34Eup2YjSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIgAKCRAFnS7L/zaE
 wxcPD/47w3hJqf6FKWPzlvr9S86ReIdYy2gUPFLRaYv1Orw7Hx4Mu5VCL3/KMAaPpiCzFahyo9Y
 S0OUQIgsb1kqb7HIj2+UxTES2J22WsLFYkRYulcQij6J/QljIy0cbcn0uAydjmdb6VuQOawjh10
 FnYXW4+Ib3q6Ce98AoC/U1sqR36/lA78aqRwfswkLIVIhwgq9ERvUXZ0F/h2y/8wkYrbfKG+WCN
 4VlGIAm20rPkLeDtPLAqp1Dcy68aNnI1OLqZ/KsYm9FnrOLtaNxduEseaaxwc8bhbyTtfmjYATL
 EoHz8ee2gD6S7XCtTw3SnuW4Ky64+giBafa0XfNBpPxKAawFQCKd8XByhDvXVlwRdQikXetq0ZA
 k1u8bp6vufJQXZLgmKBXQ6Y3zfD/vgMD5ptFcZr2yn1frat/EBwcg/JBtnoLQPB32Qbk3PmdGhA
 lNFBV7VYN/yATKm2UOsdZH6vEHm2PpcEsINOBkjcwQRrElzKw78vx2mCVTVyBZW8bTWsjBI7ezk
 7WQr8RJ7fsrPuYLcICCUuDTD3QnT4F+TLDnvFX5AAnnPuPJKX/o7ctAdnVJrTMS+wXIkI6pmqdx
 oNi1zzx0nOQy0/iZYV7/+R8P9uqzqXpWIofRAhYkeXQi3fatpIXd82aahNqjbXS4yNa4bMXD7br
 keRpg4pplWqyjpg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c583b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QZxxnI1hJslBKKXt_jwwfuvDNVpK9H_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX+Y/RN9dE7mya
 W4SHi70UpBG6i3zs7AM4TDvnjaSppm9ePVx4W40q7RAc0bo4TgES1NvTVbmMr2TyMWYAv3jVmth
 JTdeXbIQMTUatuHjNioozu7GkYMbqARxauFyMTkWibT3/uXYuxdd6lV2gYaFJuYoa93bmo5YBQJ
 Kqf44Rsi8ONRKwiNXWMWXvLDax552UEg2t25Gn4KMr99OKeiidAktAALnJO+ZAeEgG41JDZ8avc
 9z+uleZg6wNv1nwG/KwXqio+5aDt6VWFSHRaDIDRb2CWM6sEbJj89xv16m2x3+zHTDEMX9w4vyN
 x5fTulNdwM/kv8JtFoMTEpocRofYPKoVNG2e4oKzJLqOvkns5dDefdCGaP4NHz/0Bjh/ZlbUCmC
 PgGMrouD8nGIWtK0eKUYSkqvGfGBrriinjCYtmzNmOpRY7aJbxBsonaEvhVXLov8GxcC8CFBLiE
 ewToRunZjBVJPjCeYBA==
X-Proofpoint-ORIG-GUID: QZxxnI1hJslBKKXt_jwwfuvDNVpK9H_Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/sunxi/sunxi_mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbus.c
index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb84b60d1872b31c27 100644
--- a/drivers/soc/sunxi/sunxi_mbus.c
+++ b/drivers/soc/sunxi/sunxi_mbus.c
@@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __initconst = {
 
 static int __init sunxi_mbus_init(void)
 {
-	if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
+	if (!of_machine_compatible_match(sunxi_mbus_platforms))
 		return 0;
 
 	bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);

-- 
2.47.3

