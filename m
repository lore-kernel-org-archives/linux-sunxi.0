Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67A17A2E8
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 02:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206963; cv=none; b=nCPuDs/7L9TDC087fP1pFLzPePBGTPeG+Y2Rt5gcb2Iw6w2gOr7F7dBIvxxnUlc5gCh9pjd35eBxsfjFKG1qVcmxF2uQ3+avuc/RGNiBHh/VB8r2safRrjJ6rRaz0yEP2f8VoDnLc/0cKqerxBitTUUMofEorZ9NCtGSC9zFuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206963; c=relaxed/simple;
	bh=ecX7vvzvXUD/N+RKjcW5yLA/Y13cFZUMxRQHQDuG8VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0xXgCXx+Dh3LZweeadfWqLBcPSYn+NS6p339fl+N7LdKzp4oIgn6kNCEDGr9pjiEhqs7g3IzX3MPlcY9Ye3q7rQKzFcG/ikudx95yeDCUA6HL944F4O7pLLniHQC7fb8r3bu2pVnva054eIsWQJztQtr7hl5SaeyzGHBknwCWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0sP4/gq; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0sP4/gq"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ec29f1d07so40827477b3.1
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 19:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206960; x=1785811760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=I0sP4/gq/+ODz9fVx7CSHxhx6op1SKRZoDlHaWr/PGKAQmfeZOytSXZE8PmART9dC6
         LLJv2HVQjtK06Cv9fyAm0zq+qEtULeQlS2lLkOSeBo9mJuYaVcO+FGcVV0rsmcAMcCc3
         Ym+RJfazMhxBwToSis9R6sU+Lp3RokzdBDuW6uSd2CsB9Qcbzx18ZA/hHspFFmYhNTMh
         IhwNJ8Xa3RhCE2Z9TylnKHIEIG4mNbhElgHWiemTjxGOSTabiEaFzKIcXeIfybKpDOcw
         ajNsGzI0iV12oUyGPWZDLxLDDV3aLlFbMl1H1lYBQUDxiEcRrs8FMIacwBwLAcpugxI4
         MHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206960; x=1785811760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJiZXFpLnQ5pvNr1ABpUZxXJqDyWZjVowkdMMOv9maw=;
        b=jDmmfzC7A+RfLRXLBBW4XPZKZ3IpgxPx6uMTs4xmsocdbOhvKwO+QOnUj1rMRnqoky
         k7eNQKjJBT1YPV6Zv6u3KjxBxo+WCo5c7tav+eyNXg6AvomT9mox4VIj0a2ccsCjcQ90
         ibtxc34UL+I58yO4aKDxXUpjMmw3piQRVxsn7kTeYoK37g3HfiElnVGjjehlXp8pJarN
         6PXLBLY4FIe6HgCRnDU58rElJ0UVZGxdjeEugt+I7spHf/eWSNwPQehh9ZkMDTm2F2hE
         koBfKqstC22PuGsSZlk3Z9msDOKsk0PHWQOEQ2XchpIUpDsjdaASmMOSLUf/4J9kEif8
         Ok6Q==
X-Forwarded-Encrypted: i=1; AHgh+RpVAJwixvZgWLvg+2nEXbzZgL8hppqVnCAX1VGjnvh7/TYzrRqdmjlJmPp00SAwJN/ARECqEEaZHRuVEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YztCd4Svpx9GjPbazepoGY0MWBxO0vhnLkK0SrUu5ha5Ck7vKu9
	3eKT+Bt7wpzH7STAJGSMA9UTddr6fWlNabrQmO1FxroKKvNjrwhOSLUw
X-Gm-Gg: AR+sD13WrX+6EH6WKohfMQaIs+vnBWkpf6A4dxIvdR2xdJ2W9e3rE615Jkp1YuNKrYq
	hBP4EGflCNDab0zKfMXuhoNrsQIVoJaWIWtn+OIa8sdnS1AZZNtfMpU/e7GWOaV8ZZrhpPCddWf
	vWkBm3cxaJ2/5UEsJdnvb9HQLR/Vi0GumTzJlaTtSKLTifPxeRNh5ZCoFU8WRZ5iZVKpBKuSDST
	zXNQhlmpa9WjLWl3IVRRVH3OgWRP7riPOziu6HQNaCC0/WoGVVfCvdE0Q2ArAo05MuT4dpmp5sC
	cg05eKpxZVZuq5xEt0mTe0Mh/NGNvYt5CfErAJ9gMhwJT5HUTCBlKN0A24PNschObI8zyqWgFAY
	/bsu9BxiNRBIG+Ghu82W2okEdAqibeMp44y4ZUgrrA9r6oRiZlh/6aMnJC8aIFJ9prXkvBbcH8M
	epU3MfJ3ZSY51PRPZzbcEMbHHO5vISkzXDejJE
X-Received: by 2002:a05:690c:350a:b0:7ff:1a93:be35 with SMTP id 00721157ae682-81f99106fd3mr1842047b3.16.1785206960474;
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:20 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Mon, 27 Jul 2026 22:49:13 -0400
Message-ID: <20260728024916.993224-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0

