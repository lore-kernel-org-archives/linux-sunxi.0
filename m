Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F5B6AB3
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 11:33:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1683717336; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eiI2ai3RD/FSJjGz8noMOZ7eXEQg+QVNijYrHWTQJkiEQYC6gRYMiQI679TEEbTfKD
    ZPobRrMfWOZzLpPug3QBgtgPf52QSwRmELG6TAUj+qCHPn464HFngt2ra60ejkE399rv
    KLqb427Qld02YgIf8rWipzHN4XsNn2O/CxUxE5BSmQzxS5Brh4q7ymB8WGDcYRhQm3OR
    UevkwoD6c/Y3fy0Zxrh75f9pL1V48/yBPPDEgchuV2FGuPdJz0JOxyF97VfZZghQl5xN
    a0KPRUu93mHVgzM5W5LrwsOcscFHGr6CdvTyAf4Yh/IhxI+OgcSmTmGBVt0PFk+fGJyw
    aQFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683717336;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yWKXphPfAfqJ3U/7+p8M020DCOa3asr6Zk2okS7l2as=;
    b=V35v2g4DoUklEEEKfp0rglq/crLpLdlABxZbYPuAe3FinznUP1niBMAmWPwLQ62Xqf
    NZycIVAGKVKPL1ZGTA54hxpJ0aYnNSrCzSuCQtJR/Eq8tLju4Rwz93231NMj0S4RXdHN
    DlCiP1IBHnV0VtON5CqJTWqO2gLDLRW3RTuHYWrLjyZcPpE4c7Hv2LphHmcCBXa5Fw5C
    nSEAbfdb3Am8FbowMLaj3dFy03XeIz4dwemqgZcfdLA2GrKUUzBijW+/PCDA6/+2cLhw
    AicFHP6iQw1XNRRG7tDB573pXLkVtvqPuZHcSS4Vnbh+kIo6FQB7TYYHNx9MKWarHCb/
    56Fw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683717336;
    s=strato-dkim-0002; d=ict42.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yWKXphPfAfqJ3U/7+p8M020DCOa3asr6Zk2okS7l2as=;
    b=NgGJLfc03iCVAxP5BBk3jQMLmBlwEbYDj33G87FhlaFFHJ4YTMLGPRplcAuJy2uApO
    Y4LorBKCWirs5wW4XnBAettdjnp15n52aLuTlcW9bKqQ6uf+jkE61KWRzLlxylb5NMQp
    eXzCXBJX0jLJD0oFxUbBTK+HpJo4lep8fWBCviu5tDPJhaOyw9msCYzsNGn5vBlJ4WMJ
    uKrUcH2rjezXZQWfSA7T4kXf2uIC47Z00U3ocwJVmMDwWYqK7HTpoXk8YAix8CbGhkuY
    LEjWfZZnl4tpdoQQd8LC1uPPRKT/zf1ZDnA2GgWDHtvXwLDIpwCTnPb8TvsWlyk2DKbg
    DDtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683717336;
    s=strato-dkim-0003; d=ict42.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=yWKXphPfAfqJ3U/7+p8M020DCOa3asr6Zk2okS7l2as=;
    b=PtX9+Dz4V2uGb2Q4Nr7bzp/qH9Wy6+udlgwF6PvFbxXRbnQYPZM+2MR2K5/5iONlkZ
    jvzAnoJAC3a9zHkFtOAg==
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KglxDI1B7BeEcdPLARTmoNSwY8PK6ePqLwYCwAs="
Received: from debian-test.local.in-circuit.de
    by smtp.strato.de (RZmta 49.4.0 DYNA|AUTH)
    with ESMTPSA id R2b608z4ABFaJXw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 10 May 2023 13:15:36 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
Date: Wed, 10 May 2023 13:15:27 +0200
Message-Id: <20230510111528.2155582-2-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230510111528.2155582-1-ludwig.kormann@ict42.de>
References: <20230510111528.2155582-1-ludwig.kormann@ict42.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Document board compatible names for In-Circuit ICnova A20 ADB4006
development board.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 013821f4a7b8..ee8fdd2da869 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -305,6 +305,12 @@ properties:
           - const: allwinner,i12-tvbox
           - const: allwinner,sun7i-a20
 
+      - description: ICnova A20 ADB4006
+        items:
+          - const: incircuit,icnova-a20-adb4006
+          - const: incircuit,icnova-a20
+          - const: allwinner,sun7i-a20
+
       - description: ICNova A20 SWAC
         items:
           - const: incircuit,icnova-a20-swac
-- 
2.30.2

