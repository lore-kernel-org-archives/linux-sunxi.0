Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C162C11DF
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 15:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207897; cv=none; b=qrjV5lEa0TGFdlZPEljXwsvdFAFmkoeUzJT2Cw2NxpGeMseJoKCDN0rPrfW+uhSXZyPNwHx8xQAhIePkvwFcLKxM4W56y7e+sRLE4w15b/qPglgK3kHSBU47r3JZwgO5+7Z5o2ato9RimngNdHPh8V1H34iIrPH1IhS3WCHERyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207897; c=relaxed/simple;
	bh=ta+x7MJ/ORf6d+tFhvpve4wJW3ThsyU1IorpoNuyOrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aczbEbQMgFk7zaK3ifXQaqZk1m8tRotB+jrhGcES7cehR38Hf+dTGunilBdtxpJgPjzIafKminHZ/MVcCY97YsfBtpA3bG5us+VVkr0Yu6r2tbvRsXu6AAVHcVZ0OWa0jPNeuUnSihC34pioMHcVBew4VFgBvf8Alg4bZDScoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiCFnG6/; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiCFnG6/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2bddf5091c0so2087798eec.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207895; x=1772812695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7vc13IY7ZLjB19K/DPnMAGdw1kS+zbTwHhwRJW3V8k=;
        b=CiCFnG6/Z3up/IqsUQI/XZJQVL0pyHXmfGIz+kfZtR8dbJHcFfcBeg76ipfZ/XVEsv
         p0lkC2GQUhMixyR7go7Wmi1dNCxlYDs2ncNPSXmtyUb8A60dlMPgOrg/YiD5T0ozs4/y
         GtW0z6e3iZr9PmWbvA6DDgw9108fVgljgDOLxxV+f72YvHhAUjmwW+y6wVj9N6OSG98Y
         r/Bt5/1ze2Fe8dPTQYH+pzZi+TZC5g3eYPauRx4W6Lne67fBa3sxSQ+HgvB8E2xfs24f
         xPLDuCys2XavVsVsY6AqHljVs1ESk5yHZXQ0GHa9dV/Arkd/oFE2mxxBXUUDN0YYIqSb
         Jbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207895; x=1772812695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7vc13IY7ZLjB19K/DPnMAGdw1kS+zbTwHhwRJW3V8k=;
        b=hq2iwtZ0ukU531gMswQM3FAQwlN7WgIDvAbdX2D77av8/e3TIguTWvZwnDev/6dQ0d
         eWrdCpun5+oA+jbv4RAzBXi8RZ0K2Kilr70i5USP7C94nlmfSmEOmHOznY95j1ZFeDIs
         z3TlC6iQ1smWvsPtG3QTXdv9zGrTWU767ppIRRLm69sNo0ofBUCKy0Z40OPtRYWDAyGV
         xrJc50r2IqmUkVCDFCXxAfZunmmqsA8OKddSxoCbt0iPcpm4jSQFDyqOs82ECpt8RN2h
         6fbF5IboAwjQXwyLE4iTx+6ie4qhn9kRyblwEhl9AYFA1shER83Ym23Dk4IukFZJsGhz
         6jEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPnmN/ChCQxJHLREEtY2IIYyBReL7leCz+ExD7NDjAE9nzmLUFzUmti4+6XqZOm7hv+y2TV0YJnjCpVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW9g7+bHofSQkiVIaQayZlTUZblgVAFNmesSp/LefjRFaO5xQF
	zduqaZkTrorXy00C4D/vOlc27/Vve32o82bZ3lVPRThwauWF0pFRzih8
X-Gm-Gg: ATEYQzw5ePkwm6uIYe+OgFpjDXQD96LSxtoXbetVJ7s9qAYmFadjWvVfNUn9eavhc9/
	X+7eA8SF8Q5c3bF9DFaDQV0AqgmLz34RH8x76MIp+hQasra10Pe+uTq/rvyz3ILR5g9Um4Z/IHR
	JgAqbf3ZAbY4FvX+HdJJ4AwekpJzRV2u/jDF0miaFUG1sl03ypoTnsi/wo7KvSyOwszpxFGqcci
	aJ0nI1pS0AaFmEbbmgyrhzdJsZDuPg6yk+SDbU2p426IUXJb2WO6y6bRt+u0fozajZeLKbcna65
	w+//CBzleSMat6EYOAcGyzd8wQLf7/STMBodLBUl36BQ+soGHmmI5s6qDTAZoRVJqtUbkTOJ3Xx
	ebPjaYcF5SVD/pbq+aXgi1j1LkLEyb4XHdAvgbDxc0KP7OoDtYqwNewLUdC+oJcmzvQNgLnD9oP
	6EOJMBpJ+19e27cO1Cu9RZmB5U+rCoroF3zJn7BBPR3eIfvP//qsBHTo3BGuhbgg==
X-Received: by 2002:a05:7300:730f:b0:2b7:f7f:6ad with SMTP id 5a478bee46e88-2bde1e842f0mr1484815eec.26.1772207895222;
        Fri, 27 Feb 2026 07:58:15 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:14 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:57:59 +0800
Message-ID: <20260227155801.211376-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 9e4627f97d7e..e6443c266fa1 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -901,6 +901,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: TaiqiCat A01
+        items:
+          - const: ultrapower,taiqicat-a01
+          - const: allwinner,sun50i-h6
+
       - description: Tanix TX1
         items:
           - const: oranth,tanix-tx1
-- 
2.53.0

