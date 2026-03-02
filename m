Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966CE27A476
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Mar 2026 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772417434; cv=none; b=dqCbk7MGyh7sD63vnK5OuIaSsu8gPOg7Drd3uk7I09kTjtZ+AOIFuMpLjqNrPyQvZZ+bhuOQkybkVQNoxoIpPZsp3xoE2KyfxgSl9W7mmWIMJqlb64ydwXNXQnDZ/LmOieMsykXa2WUjXrapqtoKuzeMDGVkgtWohWtQ3nAUf/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772417434; c=relaxed/simple;
	bh=XdTfbdlFopslMwOZRNBOxZKx7xvKU+sQAg/JqNo3kh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WivGl5OzR5QDKo4t/REGk5qgaPo/wR9xJWGUT1Pef/XkUQhhXQG/qeMmm6aZS193w5UlaGwukHZRmszCnd9SBE3C9IRRWw6Yd3I0zc/094I0xbdPb2PcYFJ+qdIOpNDQwjwN7HKRhe8tS3Z/8f6DefW2xZguq3g1mlr4XDHK3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYeBUtHT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYeBUtHT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483a2338616so24345305e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 01 Mar 2026 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417432; x=1773022232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=mYeBUtHTpiWE3oSijLrjG1x5vRrWoZk2tzs/UVahZAmKrVAff6nb1eHATb78M9x+xr
         r/g+xm2EUcdFcuhEXWhvhscDmzV/R84Mrpmot27ulbCOc4MmV4fLIGF/XaeCXSVmvezH
         vHDwQE2m6s4GttUwhQfSCNioDltB/QK0IJ3d4HEx31pBJLLfILG2quEq8CbJhCmPUdI9
         z9JGgliPlkGnFRr+ZwWx7BiSEHcNYYK2CwDiFO9WWkbe4yKtDyWd8rGY6L7eokopWOly
         SC4cZ+H+Bpvka1EbfCRqprKxv9zXrEP/WDsgxBvlVU69e8nREc4QEgxoXY7UQ4tG6iUE
         giPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417432; x=1773022232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uA7ZHCoOg+iN91Yh0fD8Ot2D5G2O/zSpqiwS7NE95K0=;
        b=qrpU5JpOsN9AFlYS6/uAybgmEgN/woTMflxAGcJTBZNHKsgnEayw6ohL++m1S7XaiQ
         df8lS0zhwvXffaQUc9DR8aS0x4N94wI+Pu2IJ+DjqbMsy1aIFhE+4Tk6oCSIex8oonFt
         UZ8u7AA5/n3+I4yysjwZEUdvzj5hrB9TtfRspgoYlcwl//dkqe7lMg8pTAA3YUlpWIIV
         DeUP0zxga6YA61wvVukrLuGBVSqk0JJx6eawC+d9fFSk3Nih+/PKlLWVg0ZvdRSYnp5W
         JU0Xq/fEZsi19LbgIYWUth1BME7ZeMWftBSYp6on8hCd9MYvhJnbiYrNMJWDnQ+S7HTA
         6wMg==
X-Forwarded-Encrypted: i=1; AJvYcCXWgALRTzyhJx86yoOe2TUUNLQbscpbJFOookhv8g5plK5XMyy9XKtGE3E5SxOy2jTPum2S4qtAxWqRTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfrRbcrGHftJqhPbHnF6XKCk2bHGHjbBhZMLEZDSDALAT3cBa7
	aoN4Xb58r3yh4t1p/flVv7u5sip6NZ3ILrna5vNXlpI7PJ14Jm5x4zeM
X-Gm-Gg: ATEYQzzJ3+pVXI0coAd8T47NZcRO33z4jAR/Pxdg703aLGppmJtMEaMZfAgWUeMnR8v
	qEXhOw6mw8+byxf4PO63i8aZW6GGIKv1uth9ML62tp7i11a6ro3FsHeiiKWv1vaXFSHeaDbQrYG
	I1pVmds7j1ABGe7lhTnKMjBtkjjCaSkbZ33TSExIUCG+Zn0c04AqlnMJwJw4c2+oQ2KCAiVz2AJ
	1zASGVwlDr7RoUxWb1PR3bb0RjbU2d6EtYxGFbE0VGKoSQtD81mU99z96rkYeqrHLqVSLnJtUdt
	Mv2QHxpG9bojJFhtM03vkbm7PtdwRyyzLeY5f4jZgs8Fl5H5brQPCQe7O86ARitOoDWFJ5QicX/
	kth0mDNUIao05MxAizKlJesgzc+KKUgFqpRJOEahqrCL6kTD9Qnp0cyHwNHAYtevtp73n5OGobJ
	BLC0RaPf25V5YDIbLMtAdm
X-Received: by 2002:a05:600c:190c:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-483c9ba7d51mr193315775e9.5.1772417431943;
        Sun, 01 Mar 2026 18:10:31 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:31 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
Date: Mon,  2 Mar 2026 10:09:54 +0800
Message-ID: <20260302020956.96424-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302020956.96424-1-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
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

