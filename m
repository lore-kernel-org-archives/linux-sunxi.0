Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253FB3A6B83
	for <linux-sunxi@lists.linux.dev>; Sun,  3 May 2026 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777835934; cv=none; b=HhWYiFMjCtpUKYQtQW9HsrBCteX7Ilbb52iTXMcI9Yxw8rakDGy00wUyJZ0BCov508k475+f6+8NsWeBEBJWcITu6+TMU6WnHT5RgqzJH6cyipgqkLwJ5IGv7iX3mlQV6kSh71Oa6+asHlpiHGA4KVwAZdIwYRMRN1k4ukttRj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777835934; c=relaxed/simple;
	bh=QNTuy3sYtbPemCcedO2bHA/3aLKb/1xENJq0GVttcwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lX3QTU3BdsQhk06LFPpgGx6YzG82slBpwtS0Muv5p1FGaB59n+JtCLB4aJaV5Koj+fbSH5M30417eMMpmZCi8zzmV9Jd7WX0ydQ2bduTy3xk29GsVOMGc9yAovFkUNTDUj3nKPhdIfC58FaSJDtVy8EvLBcD/T55pVKtDilA0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+P04aQ/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+P04aQ/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b150559bso22594045e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 03 May 2026 12:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835931; x=1778440731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=E+P04aQ/lt9JQ4P2Lk5Q8JyBDmsCfpy8y5PP940VslpQskt9zmPLD73ixqNxjtUqux
         hr6P2Njx6sUo+IR6DdqE5pe3bSyxbjCdPzXU+YxPOl457jnrbcTWKgSN0iWnriKPtrhu
         6NeMN381KY7UDFY0KylsTf2WEOx42gw7XHGk3NkHEZuj6IeOrB8sjZcHvfIAdUDLG092
         BAzXft9ZZu2QkG06TpA3FxT7Sc2BPVKI3ZoUmYaM+STMFzyB5geBP+8dD3GGDlHYO4MS
         99zp4tSbTwRTTXFa0n9+BQncZBj8rRKWPTwQ/q2MKG5YlmA5Nzp+Yhfo3OFceX+KMbGc
         vXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835931; x=1778440731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1SosASH3rQJKIsKzCJp9R1mgi6n97UWq+kiDmoUUvHc=;
        b=aY95M78UwdaqzEEmkGp795TTpeOtWkncUQIqcpOMexBhQSQJQqY4GcnbAiU07XNU1M
         GNaSROI93CNf+UuPV2XGIdxBibn76qZTiqS4GBqoxLZUCIntrKcKeyrrrrgApA7QcLMo
         ZqQCoVKJseXvG0MzpjP1S+waDaUe2ioNyq2HRxOIDCxlE0z48hyU5ExQ3eERS05Ig09M
         +zFMHkkP1tcNu3kJ//bJFbP22d1YgfL2HCY+pw2kpV75J4WovMdnRCGoF4ugSF4YvmMP
         RtMgNYvWQ2w8LvIekKOY1IKrZuniNpyMYUJ2b6GqEPsE8+LAMHI61rrXdDtyUwfiEFIm
         DlyQ==
X-Gm-Message-State: AOJu0Yz3pflXdEsN6gG/b9n3VWaGpLpWENrXvxo7Rbo1wFrL/LtXgqbQ
	O47KLJdYL/FU85hoAOTEayL70PGafvvU32soansJ2CkWZpRwTgIHKiMyv0wqlw==
X-Gm-Gg: AeBDietAuXknC9mwagF1x/POk1X9S1kblL8XytazRr4asOqOw4Y6+1+0Hm0IRHUcHbD
	b3E/9K6W5KbXaZDKGq50Hd2oXx/cABVA1DX2kEu9dR7fWQgnz12Q79nSTMAHWK5EztMJ39J5oDM
	Fr7ZEmHiqNMqSFZnF+3yRKvtV6XANf+YoihMA7nERqo4ATFDlDo+6f+tug8nAOoHs/L6cOKjgEI
	WUraBXcmFXJeSTaOHpyaPGq2RmZcijUfuUo0powC7IMkZLNujI7u6GlUmFMf7pPfFQxLqwXY2Lq
	lIWNZRV0Ao5r240bMNhbdhUg3M7+kZO/U3Ue9vY+ENubah3lik2556aRMwD5+qWuZru/Hh66FN8
	OBt3K8H8G3J8D4ZaDI4LMsbNNzhwaYgAtuEEBpBwKrY/5Qfrq4xhWsIhcT7Gv2ZznF6oeguAGq8
	pv+bmSOY0Rt6GolNuS0QeOgqF69eRv8JuSLcEggsNtPBs1xBHsWq0bW4zN+irbIt42XUqq3YWk9
	g==
X-Received: by 2002:a05:600c:620d:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48a9852f254mr124948825e9.5.1777835931600;
        Sun, 03 May 2026 12:18:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Sun,  3 May 2026 21:18:36 +0200
Message-ID: <20260503191842.2736130-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.53.0

