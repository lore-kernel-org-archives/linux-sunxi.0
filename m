Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324B308F1D
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772609685; cv=none; b=gcRTPYqyW7RBzA0vPEEZBXDmgoAOIsqhO6drFjhbssSY6ryn71C3zvaRt0iq4DiuPdjg8+/2plsyu856XvQt7/wmDGKl8YecmeGOexMacEv3XUyGaY5r8/ShAn+PZlgPoQ8SIw0vEISvK5Ha0gobHsAby/ChaifgyhJtMUYGKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772609685; c=relaxed/simple;
	bh=XdTfbdlFopslMwOZRNBOxZKx7xvKU+sQAg/JqNo3kh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fhcgPfGDoQmztRxaO3QARF2B0E8zYQQYZlWwZ71LUkH17ttAjjGUs6hGNX+vY+bTFJG/XWVusitxsEZhISr8axRHA/l5iwRp9NnuAZZHt05S+O+4nS0ss0zcXHtAtjNJ2yn56F9mmVoQSOlieNvkb2mUGsLz0gCGaa6GTkkOg3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/iLsetk; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/iLsetk"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bded9bf7a7so4783609eec.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 23:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609683; x=1773214483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=i/iLsetke3gqWrn9Cr1S61lk9hpUjemxKwwiYxsDR2uM1sxVBzay4cNwMVRd8gsNSE
         herev6ZE+sKflfkHkcYnZa47yEhcXZkZW51x7hoHthAbzY3SUpybR30VRNdw9zvCsjon
         UG8vvLOj6/6i2fP623RjaKhOtJ5pwe1PlDdcWHjwDAmJZU+QIdSlN03bBnp/P8y/b/bk
         lSvhC+0JZcCZTew+vWMWcm5T6FjmY1uM3oP2sJNCPhDzgW4QzupuKq+g2DBf0rkbMsqH
         1yeKkcVHAqHd6LmML8JWkPg63r1QmbzHxXch7xNjySBfqiXva0ijS2czrG5b7e2m9xe+
         QDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609683; x=1773214483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=ZYtvhBI0gqZxtiqEFeSph7QoEvj/UxehhjvndI8zgEudaQ/u6f7JdX5Xqen4pZ83Ll
         rwWnIFtlmtfRa3fj2pnQK64KhOc+EHdUwpxd30TWM2a8n4n1iiNxdZt8iDRftpz9WW5s
         ChA3/OKRCCKU6oOOX+vUbYGNvRpaxIOWGPa5OCRNqamNsomjTTDEd5eKQY2i1f8qCbND
         fpa7W7og1Bzmqzw9+uuX0cs8cvYFBLQjgxk8kOHqA3GYbPmbcDTkgcVMqZCujLNHxudy
         pYr+/4wetz1tq+ODyzEEN1IPBegact4TDx1EbrbfBLdK3Q7i88uQ5rGKzF1zNTTBijS7
         FFfg==
X-Forwarded-Encrypted: i=1; AJvYcCXGpRImRS6ey7ZTIJUVMKB9EAVG0ZDMBQCbedxznCOYXwUwnYs4RRuDAJ9qljW53rS8T4vLHWVITPKPRg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrbxiaVuPEy6PcuBDn6Crn4qX2lGG2WFHlDbzt0hfIKo/M3xol
	JxbPGUb1mNEL/JGLNp96doiVhQGP3FtJRccNCw2T45hKnVtSHtnbzcyU
X-Gm-Gg: ATEYQzzAc2IqeHW5xLDn8Gkw0dnxhMxH74FPgcdpRqZhi7AJFBVWbomeiWMuYx0w4d0
	Bjckq9qJxqdZzXHcdzl/UimmCAES8UA14PjFsTEFNfAVoKRng7Be7jHh4BSaGFNNrYB+jF8wf7M
	qJeGBsQjqesabSzjjRF2akX2Tiy3fKW26wqGzw5Bn+BW5YVNdUVc2FO2JQCBLD9XXpXAM73UWbP
	XBnmXsCeGGQPnmCCGIZ3tcpYP7XAdXlNzV1/I3gpehMiFmuemHv3ge4yM1zajt/vxk+z8dLk7zq
	8ddhngWIKgbNYZgOdvcuYl2rkYT7PBuW5WPq0dCRDzjuenT/JlGK+ppzo4QohArS51ulemEiW1+
	jyIfnvakIXuGEpH2uSnTDku+nNVQrToO6U+XpUP9TGctMK+NAj6iYqmcthwGCfbiBR1wwItjw3s
	PSnmdoX5eDZWxa3BZCe2CQ
X-Received: by 2002:a05:7300:ed13:b0:2be:2043:614b with SMTP id 5a478bee46e88-2be3105fe96mr348505eec.18.1772609683103;
        Tue, 03 Mar 2026 23:34:43 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:42 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Wed,  4 Mar 2026 15:34:28 +0800
Message-ID: <20260304073430.438835-2-jerrysteve1101@gmail.com>
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

Beijing Ultrapower Software Co., Ltd. is a company focusing on global
mobile games, ICT services, cloud computing, and artificial intelligence
solutions.

TaiqiCat A01 is a blockchain-based terminal product launched by UQSoft
(Beijing UQSoft Interactive Technology Co., Ltd.), a wholly-owned
subsidiary of Ultrapower. Its dedicated product homepage[1] was once
hosted on Ultrapower’s official website[2].

It should be noted that UQSoft's official website[3] is no longer
operational, and the company appears to have been discontinued.

[1] https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
[2] https://www.ultrapower.com.cn
[3] http://www.uqsoft.com

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..bb16ae90a4f6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1731,6 +1731,8 @@ patternProperties:
     description: Ufi Space Co., Ltd.
   "^ugoos,.*":
     description: Ugoos Industrial Co., Ltd.
+  "^ultrapower,.*":
+    description: Beijing Ultrapower Software Co., Ltd.
   "^uni-t,.*":
     description: Uni-Trend Technology (China) Co., Ltd.
   "^uniwest,.*":
-- 
2.53.0

