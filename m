Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC2E135416
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713114273; cv=none; b=tXIooDn86t9v8x+hxrhL7WLCgdblrgJhl++akKVHuGsJOtdhx+YZejhnp6/Gas+8yottvtFroeX6a/bU1u8r4qj4JTEtgVUCK9GgPJgLsbGYRZWxrTuJVOKI4YPQG8I7kS2gxglqxlvzd90tucO6hVOmDE8cb1IniPcFNtmEMxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713114273; c=relaxed/simple;
	bh=YXEhGNpa8oVZCHl0FfxNlp2mxTKh3u0+yGXfKdOS484=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SrcNfvsChDcsa/EcIHGBT43964JDKv0oYTQxNS1xQ2DWXibaFH6n87GRbAUAby/t9/Th8Ky6QZI+/lS0qI2acibuo+s1St5i88Zfxwpsjl0DCa6O1NfohvL35Vf0iZD6SxoOdMcaIRUGH8GYUVDItFwzAgMNIcH6b2H8QhbNdh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1p1s301; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1p1s301"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-23333ef4a02so1856090fac.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 10:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713114271; x=1713719071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObHT27lXyT21SeDfjBZd+Drh/cmeSjfTZH9a8XBTyDk=;
        b=i1p1s301HVmnRBZaR25TxqdtooCLHSFbiV6xUeQLqZ3tpHYcV9ozQqu0jQi19a7Tue
         uP3RZZGaK6XhhEW0H/HeMXmkJgbpyhHrsndRjGF5IKoQiimo2qyABHvglHfOc32X1fQY
         8ARrG0b/vLTQv5a9TRRT5Jfei5wClQ2lMMnwY7oOpZKr1TR0BJYoRDpV+YVcJWyZOAJb
         l1satr52Jm31CAYnGN3+QA/2q+zhS+beKKxAEw/+OtSBKY5k3XXzrC9nJ3yjBpWoo1nw
         TQw4EML6rYFPfbnISCOdrO/Uekpz60tQ0CaAlFqLh+mzhctAQ3iqYFqYCG/5o0ABV16g
         ne4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713114271; x=1713719071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObHT27lXyT21SeDfjBZd+Drh/cmeSjfTZH9a8XBTyDk=;
        b=vvudikSbN1qIxS3ppmxb2paRRWamzO89mBiK0K/+KuJswykYC4gxq8LR6kM6/8Y9k6
         zaKx4NQDs4L7F0OyKI0Rg0rv4zZ/yo2/f6GrpRXHL4Bf85kMC4GjdN2cVfozyBn/oiTj
         yG9QqoXl7ctJt+Edj5TcLshD0Ih2z8emAB5Ew0ccsDG9XGDZpmRu8K69xMAOtc0g83v7
         If75eTyF51ewjeprMOrcOFJAyWg2OGrIMS6OCDH7EUrmKWAZLjXkZ5u4Lfu7eLraWkRr
         vKoueAi/K6Xbl2IKJtmRSKusOagd6cQtChfLmWzMjdFh7qlxG680cnjzXU6XYi8AScjp
         SBKQ==
X-Gm-Message-State: AOJu0YxxYoZPtsGvXBHPropEJlaqD5Igp0G5LGjxR4QFmpyfzbMWn3vz
	oTWSrjjG0n0a28UOKs2oG7ypOkgRR0nb9XPwmWtk3qTa5kTxqu6LGMmsow==
X-Google-Smtp-Source: AGHT+IGulgtVmD+J6yZHBmrF/AJ2RUPz+S9JKsazKmLP1Xptfx5fMuizk6xi2AeTV6L247wkQ9k4ig==
X-Received: by 2002:a05:6871:c418:b0:22e:8868:af8a with SMTP id ch24-20020a056871c41800b0022e8868af8amr5348022oac.31.1713114271359;
        Sun, 14 Apr 2024 10:04:31 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id mv5-20020a056871d04500b002338e2146f8sm1585305oac.17.2024.04.14.10.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 10:04:30 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh@kernel.org,
	ryan@testtoast.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/2] dt-bindings: irq: sun7i-nmi: Add binding for the H616 NMI controller
Date: Sun, 14 Apr 2024 12:04:23 -0500
Message-Id: <20240414170424.614921-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414170424.614921-1-macroalpha82@gmail.com>
References: <20240414170424.614921-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding for the H616 NMI controller. This is necessary to handle
interrupts from devices such as the internal PMIC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 83603180d8d9..4fc8b0320a31 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: allwinner,sun50i-a100-nmi
           - const: allwinner,sun9i-a80-nmi
+      - items:
+          - const: allwinner,sun50i-h616-nmi
+          - const: allwinner,sun9i-a80-nmi
 
   reg:
     maxItems: 1
-- 
2.34.1

