Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEAD3B29E
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jul 2025 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752206322; cv=none; b=KfBJ70tySwQnWfpNUdCi24lSN11C0ztY16xXJNoeCiGY4/uKNx/U09DId/V9r9j+auQOCPvzSQ0DFWT2v7f7z72sA1NegltRlsYCG04kYWWPNQZzsk4sUxWzanUUx95v1wc53IuXmxv1JAQyDkEa493SR72uNXJQf+7RLbOD/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752206322; c=relaxed/simple;
	bh=A+QzmpPP3U4NIbtnvFrbCu23PANHOG16S/Q/jyjnRWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrH4JILvY6Vn6IE70mhYD9wu3upSuinSP6+O1V8Iq2S+ZR3tkRt9B0brl3YK5jViwfSfOvviBB8ycKEBY4cP2aBrO6Uip36LWakO+tzU8L3TDqMOPcb0MwBFSVmAA9QFU2IhQ+PnLB08tO/ICNrCOdJI6AFv2Dov9rpONlo9gm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo25CSCh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo25CSCh"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1837218e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Jul 2025 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206318; x=1752811118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
        b=eo25CSChqBQl0J3gDa9YRLX0758irKygHGh9eNss5kP0zsfRaQjCPrbnyx6YpvHQut
         WHcCd7yMXrjMr7Yq+jbWr2IbFq1L6mZYkENlVpT+BFB1/S5rNMYlUitMZg+DXsw8k2im
         gaotrUrLsa4cVh08yu5BhKPzLZCG0MWPC3kHKyDMhlhGiUe+o822ND4StL2n2N1QSY1h
         aI46UfMv04W6eHcUMqcI5fRpWiGYPQdFLdCIZCcYycv+TpT7tLP7CGkJTZ5jo0e46dKB
         VRWDp4JRPQRqzn2KMHW46DuizH5MjNDHExIlXdMTgm87S7ueIu9ZEwuCwhX8lacWArsu
         IS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206318; x=1752811118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
        b=DFeAX0n1w7RqS9jJJURjTamTt8Pr6PZ/gk+C+qmRZY6V/+aqPvJ+77TvbsUOpOpTxx
         Bbf2T+l0Cqn05va8+XFatmvCRsMwhCyBJWASjovZoBXnXlwJtCgUDIeKI+LEil4jNt0H
         sxPNLRl3tliaMLLnj9eiURNvgdSKem8IHTbo4LlSQHK70WlNi01kEeL5p+U2sfnC+bz4
         bqhd7Eyi2ABA1mc9ViEh04N2OtRRu9u1673fG4KzGwzr+yMzEI9+i1PLpwkWwkQlzBHd
         LlUgzzENlbisekSOlYCIL5WvD2rjMkI2WK2bMjoWNLlcOyrVLqqN9c1PzulBFLVsHhOn
         J9fg==
X-Forwarded-Encrypted: i=1; AJvYcCUrlo/2H2Ov917Q/b4B60OnywNIEb6fqqnSxrM3410vNr8hvOU99EVHBOxtkYQpObxv0MfXKKDbHMcSmg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwxlPvbaf0MTyW2breQqzSMQvRcivMA4iD5qUovrj4+z1UdIwUJ
	J4CRuFr77e4t9IU53jxKZF+A7p8hQvL852IQE+3fFNjUXpxrZhswu2MY
X-Gm-Gg: ASbGnctiUuJt4eqMUEPP44Z3rXiYwKktW+OHm+rG+ab5/+aJ21LsYWOoYajRaqCmga+
	OUTWyyhE6ACLjMrCM5iET0pPk2WxZZV2tSZnhwnx+lyW1oceQNAagTlX/TI++mk5PlET/YDOIJX
	oDPgkMJ+t7ms9tyPxw/KfJukSLGr6h3b3BznEdluCciUZrz92WcGL116Y0WrWg0SGcQBDjMlWrw
	bjFP+S5NAyK0bS3Uv/QjlWCPSLKbkEg7oHOCxsdCT6o7pyVug92V6NUA7Yc/UAgvWbraB6rTC1l
	voUvVurK4XodTa5O4cuYNnfvkXzP0SZo29mKTwD2z6Hs9dNQG4qdZEtW1DRGCVz70nT8y+xo83X
	8zlpyOZuA+Oo=
X-Google-Smtp-Source: AGHT+IFtt4gy09VuR+9hOE1KziZmPtb3mGCWJrKa92kTcM9xUQYQNVoHoopk6977gNAOL2psPZEM7g==
X-Received: by 2002:a2e:a594:0:b0:32b:7284:7b with SMTP id 38308e7fff4ca-3305329b33emr5078191fa.6.1752206318153;
        Thu, 10 Jul 2025 20:58:38 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:37 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add Allwinner A523 compatible
Date: Fri, 11 Jul 2025 11:57:27 +0800
Message-ID: <20250711035730.17507-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a compatible for the Allwinner A523 SoC, with an integrated
ARM Mali G57 MC1 (Valhall-JM) GPU.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index b8d659d27..aa19f8819 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -40,6 +40,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - allwinner,sun55i-a523-mali
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
-- 
2.50.0

