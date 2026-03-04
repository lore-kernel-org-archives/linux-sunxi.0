Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147E3101A0
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 07:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609689; cv=none; b=pWOZZz8E1xnRR0i2ymNljJH6/8ZpocdpcveyzWwUenSMbCi8DH6dN+PAYELODlImfCIq971oMUGXT0IxP4yTNQiKsdIbzhjOaeVVbOcGCssDVIrq/NLOt7lveCpoLz8ei6G6J+Aj2TgyVqrFPcOkRe7PlnQ0pMcON3EzUqktr5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609689; c=relaxed/simple;
	bh=ihWtm6BNeZIdHJPxSWdVbPBlhVDJEp9hB8t4Ho65JDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MA6HEDxPqi9YPko0o4NCBYmyh6aNis9iUJj7DS7Z0fkhvDvz1stDqIbJpBOEBXJ9y0Z+eIsAtKmsZwfu3NK6oAI4CT47MUc+nghkdvZNkWOzg9RBpn6CmaiY9t7v0wnqhtWF/L7B7bYYbdCZTtmZi67RNaGi1SrzrLr7NNdNhNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXmxk5Jt; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXmxk5Jt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5759492eec.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 23:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609688; x=1773214488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=aXmxk5JtYheKHAlWuQEK10b2qj+aViVuBZxi4/y2Teo3yFWstfEkaLvD9JQ4VMcRGv
         VGN25t+BdXX67KJrFWLsvVDljHYJ9E6doKHlTS0n4WKTIPGpSzjjR9ursKNACh/26oc9
         vOlXeKm/7m5o15tKWw7gceO9k4hkkr5Vgb9SOMdIg0r/2IckdLrLSfZiCrt7uZfrh/bz
         RYkZCjGSLsJQ+m6znb6eXm2c5f2q+OsxNi1FF7tMAWUccbxCeHePm4iDorqHggGiP+NT
         uUHx1HM9wicoC/eJaQNQGHLX6O1PChMDVz7a8uxCPvWwENG/W4yFOeeF/dHHJK3FL7Ip
         FEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609688; x=1773214488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5OSdZggynsJBsU/qtiL9Wji3B58q5QjoIHphGlxLwaA=;
        b=kYFNQPy3aoZDlEk1aHsKiPNyhYoYAHeqMuXUAHk2XS+jNLR59ArmgLwvc9lHQzb581
         gCKWe5Z1a7ePZxd2h9sW2nBfp40q0dgyBePFzPukPdWqIMf0IGW2Gyh5n+1DbSmcgc2Q
         Y0RfntL6C4hlszyyJB92GNDYcwrLEj55Zx7QUVsCr4GFFSNo4l7oN07TDUUmluPE6zSq
         JCh6sGCN2G4fh72bqniRwEaTjEIiZG34CgFZDuIX8QYU1sTLziSrxPJqZUniwBr2yJC2
         HgLOlILQiyXycgIexMqbO6oWYDPM+uoD8NktoFmz/kQwU6zWfcHNu2qWWXiHK+RfPx92
         ADhg==
X-Forwarded-Encrypted: i=1; AJvYcCX2B2/HT9j2uUPEHK+dEhs341P0lUKc++WQv659o/tC7v3T0KqD4ElaBZUhcXuepX00P/3K0xrKGpVo6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPNt1RY5B36mEbCB/p+1+LWnSl0PFnYbJCHwjLNGrqoPULkuRQ
	JlkiC1UxJCEjD6Z+bAKwii2sj2ceXo7xZPGByy5NxseZ3fFK/XCz6e3F
X-Gm-Gg: ATEYQzxWK3ynZvA22SlutNu+aeFe8umboKZo34iMc69tjPVzR5GrVGq4NZm7tbq4X9I
	QTbItGKol8Zh3rg/OPdgl4PFDrkXMYInEkOmPkL3kXSqKAuB2up09s7sutVzVeovfnXlkLpXHOi
	wGu48m3LCgOxcGmBSgEns7YS0dcgoQOeSLmDQ9H5IDFfsPLwj/YhnpYMTCQTs9WdZoSqTGxKcen
	tCyyT6Y+lbhtGHw+jwDwoReh7RC1hxXvsJm9JAugvZep3khuIPqXN+h2CA4v9G6ZExXLL0X3nzf
	snD+wrp1V+li6fc9qEoRCZuhBuuKMnx772vEfjRMRaXS8YEgi1f9dlnfcpsgPo4BJOKz6z5Pt/y
	MzMwKBERkbnLACvr0bOaoWpx3I3Jc6W4vcKWqxoRsF7vAQ9rJLN+QZaVqTGhkPno05B+8BYMXXF
	Jqaa9oyk0fyc0pJwIbKZB5
X-Received: by 2002:a05:7301:1004:b0:2bd:cfce:4c4b with SMTP id 5a478bee46e88-2be30fa615amr465643eec.2.1772609687731;
        Tue, 03 Mar 2026 23:34:47 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:46 -0800 (PST)
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
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
Date: Wed,  4 Mar 2026 15:34:29 +0800
Message-ID: <20260304073430.438835-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304073430.438835-1-jerrysteve1101@gmail.com>
References: <20260304073430.438835-1-jerrysteve1101@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

