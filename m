Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA236606A
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Aug 2026 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032499; cv=none; b=tRymu2yB5CM0eawDzUUxdEG4mT0sFTu+7sQE+TRRQ6ZHR5eBYOQpBSi5qmfxBnjXzI8TW/6jonCnDiDBU3SnwCWFYIBp0Mfj4y0CTNTZT6UpxV1d1cXj3Uo113SWC6m93qAJvtatjibujDrLvTqKC1teUrgn8rHJ1R6HHzBJEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032499; c=relaxed/simple;
	bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S1hz07LimmLN0iLLTxM48SBlbymZ8PMEVH/vzCflp5zAWlq6ZWcszFeAYVMiIBgmIu1ttHVMQY2chYHnxXCoMo8HAkvfZngVdhY5eK1OELoUMH5SO0FZqAzXfSz4ID3k/p1c3XPSJmu4gmkHUVqHLCCXdXo8nPU0qFJfgwLFxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1fHASae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmvS2k0K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1fHASae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmvS2k0K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGxOQa1742845
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Aug 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr
	0rRgOknU=; b=W1fHASaeVreLYR8e0aAhG+oZ4kbfH0cC/6kqLiOExVdlkiKN/tw
	5UW+9KESK1c7B+YpLNybQ6m4/pDM1ZWhNAw7WVBat6Ni1j6BcPzzroObh8NEPhMV
	UURUQYEW9ea1ktwz1ivYzU2LqzQyhIzCbu44lpuMtLANlBAQEJczODPggbdnz/pn
	J33EjK1vf3sV4IxnHPyNg7ZWNO9ilXN+rdafgTe/AMzVRFA8Ym3jrfbGyFFAp8Yp
	9+6EMCSVtdOcL+fCKZaqGxFmebX4iex6GU/1PXlR+7SIWYu6Bn+r9vbthlFdXRds
	OYnsQehtSl+fUFGCTq/WSoZC40nCr2otBfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq81g5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Aug 2026 19:41:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ff14b1c02so42826421cf.2
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Aug 2026 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032495; x=1788637295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=RmvS2k0KjaoMMh9MmylURdQ+wy7bMvYnYPTC22NM5wTHMyjcoWWkziQScGiiIl2GoE
         Tk+cbk/iAH9494JvmTFUJRX7uj8iEQNmTwR4UH5mFc+WlWrj0AYVe78fAqmtsMZjY5Rg
         70jjBTQ7FrhJrmH8zzgZ7LYVH6snltXh5jQhjnfgKxn890KtEJEuGzvBf4vrhN4p3jbt
         AIhL1IaqmvT/wnXOOMwNfjtvIBFhzy/i+61fkz8SvFa600jlJwn4Qv6/gb58YBFGBm3i
         8/muqWswuRAApOS3NRPdrmFj/RqgsCDncQZcqpTu3bU4dkb8dNDb+xn7laG75r72YEQt
         DKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032495; x=1788637295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvvVmWWmWkOAQN9Xye2DpALciJSXKEk3Wdr0rRgOknU=;
        b=V6Px4kjjToU4Ir9JZqRS6+/iNt9Bcp0u52hyLfsFr/SAHApwOKWQjoJxRP6+uyzzIW
         XeaHKT54haAyHP+y/WfMywv8fgYK+MrWsrdjIqflN1YZtzVcp1x9Bb69AT1Mb2YXT+pm
         HRZDVUm1NOzruUG/JmuSJfdfkNggnI5jx+3A9/AanPsA/ur1uGHKVa+mhn+WkA3qnPly
         5vzCuZxp0IrvXls2g9NO/lcEZrp0NaZGVTunmdh914ockeZ5H80AA+1/mQ3MlYX1lhEj
         cE+gpaUjfyTJ95pyc0vKgC1LWT/S+O4S44R+foianmhIUIajwlx9PX0yPJF+NRW62qQ6
         hDkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2km1B6RlAg0IslcOYEL+ewdyeJM32sy5WeNANsCdBiguduyrYn7HUpr/VTn2hRwCEkuIwXCjHvlgpuA==@lists.linux.dev
X-Gm-Message-State: AFuF++lhDr9gdFzljWw/bPdyf4wv+gB4s6urFQap1kFfHlJRcKrfYOr3
	EXXMAGgSPWzneKmQsjSj+WB7wF3ri4JOrqZGqp3iYnj/QiHmc/g68uNDe+kMhpRuSjtPX6lEg35
	SR9u+U2qxeRgC3YEwrShkK2s/ve30ypM8mcRnaBirep2v7c76RtdfaZBC5jZXYl37vA==
X-Gm-Gg: AR+sD134MEmiTi/t+odmPbw7RnX6rra99FSzRGQzCYTyhNbm93ga31dFwr3ERPuhRdx
	E1JD5jwijoNqoJzq42PdDsaAXPuTTODbdVQ65so1A0vntcIpPLl4WUoi3xkj+4GcEIUoPWhhrek
	wjTA9npbl7KPJvQKyAFawPU8Q5SibFqBqYF85BPMedVlfvkY3/jNzrdNJIhuK4EN7Xg9z74x25l
	bIRaY582eXYf9GKaEL1AoqW6xBKcFk29Bzg0fPJf+mh8hE3GNqyTVrqAcA1Z7SL4Uk60KfirOX3
	KhW6yTTJ/NRtVkqoETQTCLiBzOybdUSxKc3DQCoHLRsG6e0YSe2Hy737kbgk2oZ05oyvweHN6Zn
	VMi9mDlJ/Dmp6X7k=
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911431cf.23.1788032495577;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
X-Received: by 2002:ac8:5cc7:0:b0:528:3b83:3483 with SMTP id d75a77b69052e-52fb94d4677mr210911061cf.23.1788032495180;
        Sat, 29 Aug 2026 12:41:35 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm2499802f8f.29.2026.08.29.12.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun7i-a20: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:32 +0200
Message-ID: <20260829194131.108039-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k8n/bi2g8bb5SMtULjvD127VMpit1jAkK54KyWSdN6Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXr8Tf8bT7OCyOkAuUb/kCNtsQh7oAUs4V8i
 RtE3/I/EL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM16wAKCRDBN2bmhouD
 1wivEACM2xUyoCqIPlXoVuxlyn/QJ8FHgmm/6tDcsawf2Fro+zfY2Y5Y89LOQJgHY6a72n/xnjM
 GGoOYSZWlWJgFRa64oN8BwBfmy8BFSyB2USpUX9Sa88PGWwIBjH38PhTuge0fIfpCfL5k8k+SLD
 FuRz+nBWes8h7zDU0xpdV+QHLisd4U/ImjoJX4vUrY2UWNZnizuZMrJlhrrSsdL9zagFS7JnOuP
 57YB7SPsi6ECqgW0HIEWw7u7sH93bQsox8wp5BS+O/eQSAHMGclJ1iLiMgMAgC+hV7nehLSvJvW
 MTu1ZUWE+mjB98z+QiJveQef/Hk8it7QZvjALMURpOc8ynbF/Ye4VpVAHlWP6Uhy4FONU4E+P5u
 G0VZOkGNNdM6UqTwiajiMbmsD0twLMgPWmr/WzrWCtLAmUbXtCLtK1qWms8q+C94Wak+a0mBVRp
 f15zFI2CB1VY8zsABi94X3USYoMPKiTDfrTZ1mFNEXyLJNVecleBVFyCNhmYSSpSmlLiu6afEm8
 tA4r4umx2V0nG+RkO2Wz1yiivT8HdoSkMeQpfb4JZE+rUAD0Sm0FPaY8IFCFvjGQcNuxnPYCNXr
 L7wE/I0NO3OIXPODIWa5bvsIduxiwsrg2xzuOMTEJUWPDHusoc6fhOluRDpn4V8NKptOZVuGylb THyxiCiWRXx2t9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TJ-OrIM0qFiaxazzAefSfKnkXEPpXBTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXyj40JR/X028z
 hUcGjUK6PM2W0S98EHN4PeWh3iMzi6xqFYG9CgdfKu2ed3hohRUDYNLU9GjqlYFJZ3IzbeWg2e1
 moWQvPxtNqt3I5jC9JRHFO9qi4o8QME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX/GMS4RaAA6a2
 Vwzb9f7scn3aJfqz0nk8iIxLJrOQQcKy6jr/2JJl6cqtfYDE6sQsrnkIXZElEM6iAoHMO/KAw0u
 1d2q2h7eQ05OFdhVai12s2fmnrCIlpXrbRwga/hvpALLd2GFgjVPpoKMV7pjvZ92yDVdhWKBwRI
 iv8GbBl2RsSeisT1nEPvNhVjgfUaMLCaTq7Yyj3j6hcIg7neBcH5kb13qVUn1jshf5pI5vnqnkL
 Ap6Ogw4OsTW+469bSDwMPZrzrjQ7cIPywEiIKEIJ7AsEXlahQV0+yCIPPOJjuTbEBCQazqLgr8c
 Dumbon7SfDSxlCZGDnMWxkw1Tph9ej2wpW3uUFZiSmxuCNvKL4tCO1MBKoCktLrl85k6OTKH1Z4
 jnFV6Fn72U1rjnCS0yMr9dLPeMj2U8KPBO4AaVGynDCgfcZGOK+ga7gfZmK+Mbr7RsOg3FdFmOa
 dZKwO9zgk350z4VDcNw==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a9335f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: TJ-OrIM0qFiaxazzAefSfKnkXEPpXBTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/allwinner/sun7i-a20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
index 5f44f09c5545..adb9ee57ac11 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20.dtsi
@@ -873,7 +873,7 @@ gmac_mii_pins: gmac-mii-pins {
 			gmac_rgmii_pins: gmac-rgmii-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-				        "PA7", "PA8", "PA10",
+				       "PA7", "PA8", "PA10",
 				       "PA11", "PA12", "PA13",
 				       "PA15", "PA16";
 				function = "gmac";
-- 
2.53.0

