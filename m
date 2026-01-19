Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363030F7FB
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819254; cv=none; b=XWUAl2dwuqxR2CJuvHhYTXj+1d4Qm0RCBzmEJqvS/YSCb4Vbs+83xJ/d4hhBVk/1XYmN0wHxBHAfhN0AsK3JjJJQ+lxoFBitRK3EYRtvoG3zTmgQW5Zt0gcTyPx7H5k5AF/k6KS2uV76s74o3ss1Yd0OdWGKl6kj/lq06wXmqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819254; c=relaxed/simple;
	bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jZfs+7C7p33d615jlpyvv6nHkxXVSTqvpir3QXW9dBFWobRCFqKdMelCslBUvno/DZUjAQpDWhyfw32RB22R8cLPeSdGawuOKtM01FjGYVujHT60MZZWF5jB4K++z6Jk1UvRbD4h3jED7takROaFF9hQqGk2yyAfis3HgZfbG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBEHAtrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIbiKYXt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBEHAtrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIbiKYXt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90muI1904958
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=; b=OBEHAtrAlu8HDwbs
	RkoTd5c3ZdYVwQQf28rXKoUCGjoutZoyT5rSP5WNXNaIxk115uqtEcji2V9fT7D4
	rBbcQ121Fkpg44TcweaCVCJzPC6t1e/MFAe31hRY8tWAhM8qj/bpY6KRaVw+x2za
	GgJnbqbGSqfJOcOv5WWzSFVonvqlSBqu/nFUb3T/H68rhbsmYdhVlH2hiWhw4hzC
	h09m2f5LmaXuKfjIgCh6xicgSlxg6MbzJ9ZRpgXiX4KpJqBOvuigtUJpqKwm92kG
	UEeWM2N6oNGeQ7nX1dcmowJqXxAQF27TbAwZBdSdqSANxpuxhN8IYqhmcHV2m1fQ
	MiCLvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8k0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so1189147885a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819243; x=1769424043; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=NIbiKYXtYaANqfdKzunK0E+ePBnwNTwGCYXCqgJS+CFwS0dFFjcVi2u/2wnaKvzOAn
         rvXKTCsdVs+s5YhuM2ylX3+66uyLJJjh8b58Cr3aaBS3OfNZa7yI6N5WmBAxxd88TNxA
         XkbPf+6oIDC1pzY8fKgPjQueQzzidStsAL8np11PTKlqsYjoqhaxx9YbS09CX0Lv01aP
         asxCXG53MN/PPA364GoC0V3dSuZWKWw2AzPRVbi/EgBCAEn84KFbFsucd96n2BGNNqO5
         2CMjojcm5ehNhbM/f/TD4nzuUK5tAxkmdC3XAW+tvG2e9Fu4pzJJYc/6S8+kQAQX2FZj
         R4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819243; x=1769424043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnn973uC9+XdGiAchuDDhiZMFdYIiAWMeeEw03lA6J0=;
        b=biKzgeJaMA5bCeDXq1RQAGI920WDQX+vxUkemPARHnAsDyviC3ifdPnGGl7IbQbHNa
         J5E1HyDbWmVsjjlMCkoF2ZEWgdKsFfSrCf1DbvlgCQ+6ta+IZ20KhY0sC1mDQ6EI+3yw
         iTYudxURtbZVcSx8t9G3U5PhzIJ99760egj++/Wcza2a5ap3LfrPyelm6vs3dqguBqS9
         h8aF7ink/XW3Ao1QVpDJU+CjSSGosn0r3IeQTzi7UXlZF7xLPN5O9EhKV19rP/HwoYr2
         lwhBNbiS2KcI4w+gnSe9xx2xaJcCqWvSq9aJw2YHA4YfiaTrqiGZEE7biQBKVWo90k9J
         mmuA==
X-Forwarded-Encrypted: i=1; AJvYcCUkNouCeglPPYhKy4LVPfeCoHE3IFZnIL7tbpGbksM+KPALBzzSGXUpahToH9U9rIblkUlXWWGUMGsgtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyEVwG9HUljJ/KVdanhVjSVtFVS0ZuA2TtgKTvNyZlV49oCQqQ
	3FPkPzcE4JOmw2hfS74yreqK0W+M2zC5am662Iicfufv4tcj8BX2AYcGoC+Zk+qon2943bfDu7j
	Cv94Yvp41nUE/1Dm+sqdB6pP73UPzGkSNiU7GV5gRXKk45W07oHZOxJKX4eqLzvZYCw==
X-Gm-Gg: AY/fxX4pUfo/IIoqr3UU7rELsriHLW6cUDOPlRA/Q56tWeJ44jN00UJPoZmDfGw4vI4
	dJ2M+m4SDyGxRRZ1YVhJhu6WQzfnIz5gOh/5vPnfElrPoapJZhX36F+dI3Ri3GyJzWlvgTrHYsM
	PVF3baHllqpve42ovXHDUsIaCKAM+wBWthVCinaeIUghaXPa9+gL/LRiWmCVlaW4WrNnj0fLrgP
	T3JVmNNGRnQmmmvOXLxeYCzW+6tP5wnnr0NqethvEAWDmbESfrMuH+s6O+pkL6PeD1usolCLn2a
	mhxZl2Wd1D1nBewLGJw4uwmDEthD793lchbMM+QmDY35xRXukW3cueaCvKKxl704VqxAlg2wHsR
	3RzoRgqjudVyb2u4LRD5S06z0WUqsFfvpxa8uuwRn
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427582685a.84.1768819242823;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
X-Received: by 2002:a05:620a:294b:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c6a6959020mr1427579785a.84.1768819242411;
        Mon, 19 Jan 2026 02:40:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:18 +0100
Subject: [PATCH 7/8] soc: renesas: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N8VSQLtaVd4SNUXyj3qVXPL+a8sCEU/CZusptF8ZaPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgobvncIAUeq9gHK6FXvIHO2lk7wpWwVIIRh/
 iA36+9fERmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGwAKCRAFnS7L/zaE
 w1hQD/9acgWHH3rnfakx6eDD26dTI6G9En6q2VSGmlbnwsl9tJ4nMDO2VLCusT5nxXCXG2YZ0+e
 2t7D68GFRWmhge+8Yo4En2R4ksA3WOpsvKOp8tGMji/3KiTjejFLsyF8yQaK21jsa2opCwRuwpy
 OrGdc+tFSsiIs2dFImSIcB3jwA2vGfOxY5RPVMDYtZJKmo3AU+FDDAQEEytNfoRhJ6gKDbMmWLy
 QMx2FZ4YK5TYSINwoxtiVMJScQQ5iqIYPWOo5QHZquIEdmXfClYw4BX7pB8uHTnpAT16yN3GPNY
 ryBK2rrRF9eTdtkmf+M4tRv4OoOL5EmJavIowcGDyHqHwE5FlCADIpYUSeaSwTnuxfW6X1LZr0+
 kDhGDEn5H+UaCrjAqMdrFE1RZ6scfc7WAwBw6LEbaA9Hg8EAkBqrvmJD6304Y78t4bYiF4WLTHM
 33vbth+dCB4S9vw/vX+/qelRibAzmjKOoAzJe4wuTUlmJ/Hq5opVf3rk/gtneFlw/l4bj2QkGax
 u0vlJhYKqneqCMl6QCd90ysN/QI4xNDatW5h3YoMEj+TU/eMdp2a1RJ4cTzEKUSvIkQtXNLFR6S
 gUtj6o/etpKnVJYXyD0IGul+1SDf9TfejO5yWonCratG4+iSt5OrlbTWx0DJ9IlvpgdzWNRuP5+
 tS0OA2oyaV47JIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX8wuTwJGJ3zB6
 vX+aPDOrLmnfpatLDWnMbhitl6ocEc7QVCCc6FV0O0c1Cwb9sJLD7yI86RfgiGaIrt08GoBL+oc
 NCKDm/3TqwnDb07z/cb7GHuOROY9EvEuWtBLkOS3BQIZOJDrkNXI3VN994a8W4ReMXAlVVQ3HdS
 CfjjnKRMbxuesZfHQM+g9dPx5GmtI4lBb2wc+sybkCDSrZvQrT59nJFUIrtb+UJkLOGzBvV3Y4R
 uhbX7OSoZON68Wxy2r7uzvXeRjghOq2VQ7/iJNS9728xRd7CDNa18f+xKsi1ov5JBtorqx2iZyN
 wO/AK25OnwFzCB+1ks1gPtBZ+yiiyu1MD8vCW++0WyGmZnjgRFceFzdZTtmxiUoZz/0IarLYBW4
 OwvSAZR1LZfErDP7Y9+2ZU7xtCG7XjNc20KPMdKVLZ/cH0NpuCXJoIiDkZLTGsaO9To2BqhZliQ
 SIzjDt2eW1QC9jm1yFw==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e0a2b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lspG_xb2HOCpoEzFx7W_sr_GyGJOfhD3
X-Proofpoint-GUID: lspG_xb2HOCpoEzFx7W_sr_GyGJOfhD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index ee4f17bb4db45db7b96c782b770e5bb4eb139e09..7c54b39b9cdc6b070a7cb6c1c03cc1356bbf0309 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3

