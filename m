Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D3540D59E
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 10:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333198; cv=none; b=TdYTSA4xydatVjVTHQPoQyLm59IyG5gjC/ECRAM6cQm0foTxeNxGZFA/VCAyWyr7uJBgkwoabf861sxMm+HSTWG0dMP/1dW287vKuS/bNaoqkXMwdRMvZTCSUXqXqC2h3sskIY5HZg6DWPOgsbXNxi9bOjxHpjV8RoCCIN3nTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333198; c=relaxed/simple;
	bh=axU3ClN7PPFa4DxjQxbfhMg1dVxjMj5qElsJKDqgZLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqgyd2YY7/LAxHR59SYX+QvQPkhEY/hEsVvJfV3lJAX8msemVZVj5PSWUMFS5LDxMbBADAYB3uCEi5w3WVgj1HHmLu3NKEjwSmj1HMXFO/37BmdrPDxxKTbCXU5nwVkqV6bb7zavQUWVZBpRKfKpHksYbEG+nUN3lGnuwmQpDek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/DYNYTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiJrR6lS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/DYNYTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiJrR6lS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693vg34172364
	for <linux-sunxi@lists.linux.dev>; Mon, 6 Jul 2026 10:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGu
	z4SfYOsk=; b=F/DYNYTs74zTC3R95rs1dc5KOkM1oJOTwurk4FEcz6WmI+EMoU+
	cm5zeDxyn8ImI4vY0nM9vFQ46ASIpEv6cu/qr6fRmTjKuzk/5gjckAUUCOL3nt6D
	3McHALQBfgr17RTTcSxX73TCL9DpNlkBVkRiLRPI1f8ezV0+s1g/722D6Qdb3nWQ
	qEdnRY2L19jc2FmfZMjGHMKyvpzp4TP0Y3qdMxRTxZukEF1HpBjjKH1LxjhxAGIk
	DCtjDRcPfZYLUvhJPjynlzPNn5D58BfmPTWNYvk+bAJjTUtkEE/D9My9U5brAjMF
	1LmEekxE8i10tN7GpwiHruJEMJUt4NfValg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88fd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 10:19:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so203346085a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333196; x=1783937996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=HiJrR6lSVIxm7l0mZUeAymFrNL6oVci8ouwtOyPfhx+7/drdIMYevkGcSPfFeDPjl1
         kB88pY+cTOusMrdB8tMCy0/ri4SeZC3B/ObIzhUoaaM6y73FHQ1P6NNf4GtlzWym3YsT
         QjBRqgDkseVSEgVt+UMKC6MYcQOTFb0UjAioeLz9fu68qg289eOgWAkr6Hsmaw2RLGXM
         oLsrBVBv4+F9pDpDGQNccXkiJrYvB8AXtMqMSIKBh3SiUwNxFjUrqWwpNhXs6Lhp5fQs
         m1Y6Fjl4uDI2IpKed9M/h5FGeoQtCwsgJbJLaOdszW++bed1JqYkt6MvTw8tYAgfRRfr
         QvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333196; x=1783937996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2LR6M9xnkRompACiDCG04L9cxx+pC2SGuz4SfYOsk=;
        b=XqGGIExCgA5RGkrx245j37gvhCsPFhSEf3/CUzC83xSMNEueoYD9mWYPVxbmJqWTHq
         vRyPXrSW2CnoGJWUKXWq/Qgn194d8qflq2gaSEQiVDwCeBxsKvuR4v1EoehLU9uxa/X0
         M53Gkeu+aSLBZfUm8wp8DE4rbYqrzEqAvtqdCB0AkWjxVele7kAU74N2lIKDHu91Xdls
         JynRtgt9YKBaZJ0JOZ+0bMXFXMgiuIJLY5t+R3avMvXSxWU/tZxvmI6OrLSvtsQCDzIr
         imcVzKmFQZl+MNeF9FalA56fgp3sH55rBB2nSQwbFaS7gtj747KfN4tS8vexYjS8l3J3
         cPBw==
X-Forwarded-Encrypted: i=1; AHgh+RpdqlGq6DhTaEAEWq54f0AuE/PX1NDjaMWF5G+H1zwRa+z2ydSt4+1LRWiv63gjqjQzAUpkHg3fUTJSFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz08V+vvJxNonjLbaLex27iGVf4ilZZBkm6qy5gHumzBU3z64ce
	5PQHXrKu3EWAM3hXHEe4AUU5D50EEwAwuVrhFE/DlRq/YO27332KEaAgp7HTs3EmZ2AmexYQ1JB
	BV4b3gCIXm6Ermd/Uz0xQSwfmGa7hXIsrpoWC1M6bWxIwn8bDUVbmdHcfR1YPdlRqcQ==
X-Gm-Gg: AfdE7ck/ZiqvsW5wC5RGUNeiqpdEVF7cgRklbXYiOcjVXdPmd5a6iOmRMiWchgNi4C8
	aERBWGUUdc77Q574PflnQ+oWs49PurBkLreLImW8jEfXkNbV1KEXqk+FYGoGX8lYS4WvNd4Pco2
	4CXHYkltqg9dNvTUVTLzdoXlUq0A9duI0i5QZFEbFDmuapEhczZVw2JlunBsjSwsV/bpOGWnmbs
	IWC+VvItt0cpj3gaYyNNXkew0Plm3iLE/yH37sfKZdasfxhSchv/D5dj0mdcsuc56knAt3RVL83
	MMz4OHsGZF9jHOHsoIbB+uOJxnOGR7otUYYUauXmUqQD0NDUjKwIw3UCucFZ0lhuTLOAm7GXz3x
	4N/LvJRwWm8Tx5uIczoLtceJV8yY=
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386022385a.71.1783333195961;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:6533:26ce with SMTP id af79cd13be357-92e9a53a993mr1386019285a.71.1783333195486;
        Mon, 06 Jul 2026 03:19:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm24514134f8f.37.2026.07.06.03.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: allwinner: sun8i-h3: Correct indentation
Date: Mon,  6 Jul 2026 12:19:52 +0200
Message-ID: <20260706101951.341727-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=axU3ClN7PPFa4DxjQxbfhMg1dVxjMj5qElsJKDqgZLw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4FHiWJVYH/5XmTaaQuajA00KokkoFeKc3om/
 +8vVJI4F1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBRwAKCRDBN2bmhouD
 18n1EACRdxv9uvSocdbI1X13995UM8uwb+F5Mh5dFtuFlnFCv/RGo8u6QzYnxAwmnYOGsWRBzkM
 OrtCtZSrAb4WqUiOHl+0N5tQJdqPivLh4FUufU3vM93YKhMCIqrww+cGlgglF1D3TdDHYCCXFZP
 ploHT6KUOeaoYTNusoRQhJS2cmo5TJWZ4X7qRNLEzVclQe5xF5He3uDiWlw1WGUhy2wGhRj32MN
 Mr95NOH7mdPIT9jGOHaRd1IZQI8qEsWVGLh0gfua/OURBn8TkW/R3egK+4FF8TzX/mC1Yc58Or7
 iu7u8DIyRhL7phbD963L1+hs4aszpAljeqowojD999a8KogtVJ168MuM2wZXhq/fLKpqZlxsoMr
 nX6EMxbsrs4elOjH3vgsbxoLLHAMwu7hwZ40evoRREeXcNP/d0TTu/qu+kPx+WR1V41msSr4LYt
 Zwk/519wBzrAQFvrwo8Ew9xL+uk5TIHVkV5A4uj7I1NlXS6ovREyQ6cDec0UW2GqIshXT83zZc3
 IMPvI1ZOGuK/jBHpICb1JWz675G0xOyi+q3Nyu5VjCJL9PTT1Iokvko3E4AE19+Lf4Qw4w1sgES
 mBbh4q4vRf2D1T6DU0QrvCYce7FWczy/Lpec9bRZy7K82TokHrlLUQH2+IhWJ0QnGOUluEauod7 Sk48bjHXi249e/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX9e0C3H7CSHaI
 RdMWafNRLnLalnX/YQ/6sZ2ZkFg2vKgBqa7l1ixdzlOuXUrwxDNMtMwURrFHEwsSjKVSJF8bq/S
 eSY/n+1ZQohAkvXiTJh3PZiCymPTk+0=
X-Proofpoint-GUID: R9bs3wUJQJYvQKYYpiWeiCxYY4vF4utB
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b814d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=c6vaRMsCSfZZW2L0M5gA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: R9bs3wUJQJYvQKYYpiWeiCxYY4vF4utB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX3AKHU3RHByHr
 e0D+GVh1X9H3M5r6+idhhC2Q66rR6UJjJAE0Zczaom1FiTTnD0SXDsqZ80uaELlpkCpJsv5uOl4
 ejwjzZv1jaIMZ7ryF1fbqhLtG4c7ulfUtL4QotU8pL/GyKDVk+UBfjfWNIasJUQsrGLkFBsPe/k
 89H75lF3zd7OW5tP9lX6+e7OG+/psWqFJdHJHbSpQMWTNPBbZuD9VKu2XsNt5rPsLsKJhMinwak
 IPCVQSc+YFs133QpMkpYiWnfmE/d+94ROOYcaekZLzh7EEfB6km6MOks73rCbiomzDfS29iKt6v
 BpPTq59t1X5jVL/9FRCeBR59lAqCu1Tw7QPcwg09zAphsXaXfULeHhWP2XNw0PkK59He5Fkqay9
 zjs16TWATp2bjvAJKmkiSS4bABVJXnio8Ygy5ySGdt0l86AcxZDW8ID6kSwJpxYnkMN0KE23k4f
 aVlFUm49zl56XSqPG7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
index 2b0566d4b386..88550da5af62 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts
@@ -73,7 +73,7 @@ reg_vcc_dram: vcc-dram {
 		enable-active-high;
 		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	reg_vdd_sys: vdd-sys {
 		compatible = "regulator-fixed";
@@ -85,7 +85,7 @@ reg_vdd_sys: vdd-sys {
 		enable-active-high;
 		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
 		vin-supply = <&reg_vcc5v0>;
-        };
+	};
 
 	wifi_pwrseq: pwrseq {
 		compatible = "mmc-pwrseq-simple";
-- 
2.53.0

