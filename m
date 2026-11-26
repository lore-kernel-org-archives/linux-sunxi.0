Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=joeY3jfr7oD9Okm/0cubEv8q/amoy9ey9o2uL4+XNp3i1RE9nPNxqGNZP2irOqWOzXfF
	 f6zwkgjs5n01M1LvjbKyCcEILf6+M2XzilKo83j5EcgdlEas/fEyZOVcUOaNPm3q0BDir
	 oFpZlXCJ9r/H1MG59/ibcd77dvbsKA6E5hjnd1pqFscqkNDIQtjoTgKKVdZ9iLrkBz6Cp
	 PSg/j4ii2miTB+5GM/iW/HES8DwrV9vPDevP8FVzwbxYQx0VjLBjrQ9ho5VYLi0sdmHCB
	 WIy5mAKsji9n38k4A9zT1tFcrz9Ys/7sJoHEvwTXZgDNZeeZawqLFgYn4xP6GINdOkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
	b=qC184SfYbIPE6U1t+Em43gcPQyueUdIHxU5x5cTo0EtCQKsEMXPCrD0JHUYUHosRzET+
	 N4i5V8JLXPH++eKqPjaIDsoCP30mbuwKGzUW1RVELPsWGVeIO2TIhRi276VJttG6QJG7J
	 bQ68znYwvmwuJR4lBLt9hIdCdIstzmhYECLk+3k2ru+7jL/xPMDCd0k5ITztrq6SWJmcN
	 1zXsAI0U2l7D2iQ1CROP5UvzvNmVyXDEDf3NmURQ8MhCntcPorNqJATCSRfIn/IQf4MN1
	 3TDxSPbFSzeaDNzefCdM5gUv3+UbIcKhOTtcX2iBYTgdN3Uwe9SO3tMxqF/s23WvcgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPGodOOc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B9606A6A2
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27B9606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPGodOOc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso6585863f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729480; x=1796334280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=fPGodOOcmRxTS/t3OQYns76cKwL0c8gxS6+IYhnTrfvIa0dQdaQPkhWzp+mJ4J1yt4
         uImxPkmVdZclA6Ie2KIG7WK1CtQDL+ab6nQ6v8Z0nPiASs3UKxxrnGk0zoTdvVu9aK71
         tznkpp3/x8qQi44X2ivlxtt3sbZljtbzjf9fMUucnvmxZ5cKecFMsYeuBCUAmt7ddEJ2
         bpC4hE6ncxXnbg2eLbmWYhtCkdx8cw04acZkaUb2xH7ZkjG6U3SMnjzF6Ja5OW/jOYM4
         kC4MJGugS31BeVKzzgr2CLAIDaU1M/woXoN+LjzCiC/DOv1c4d8qGfxyCJQVI6bcCRv1
         Igrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729480; x=1796334280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUcRI6foYh8f1Ya5l8kqwU8EomhWJwqw637x4+2iJPc=;
        b=sErwMZeBlvLJA0aSg6GmGNTofwRTMfl6Iszy3WMQR58ktiHtucH3hbM+AoI4uOBmVo
         iAW2wDMfylTd974W6eRaH7d9zNd5QRi7sgrGZheD0zNzFBq9B4YmBc/v6rS4cSD9tbLX
         hUdJbmGFE/vNf29SctpMCNONGFGKadKVzz1tSwh+lxGQrLDNFpO4tbG8UrKVEs4tW/6l
         rvrV7r5Dm1W4xFaUOxXBp68Nk2bMDPG7lQXy6Hlry2QhxrpfeyTjhCRWDW/nnnoGh/TX
         9oNplEWsBTaCxxfiPzx3zFzscp3uGy1FQlFZN4qPcAj1uwbJnWOxyOOiJ7zS8/sfApL+
         7FZQ==
X-Forwarded-Encrypted: i=1; AL+hErGUQ9YmMWzgKfH03YFmsNrWhr/7FcS3/rpmnm7M0BpaPbz7cf01PM10pmp93Exbea6p6b/tjQBk4myVYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8WMdlWTJvi6x5l9xyyLauP9UEkq0fHtaHb4fMJAg13cUKccWso
	9SIaim729LOY22RiaEfagauqBWyRB3DUAlOzdyQu8pYr+pJaSWfE6VIU
X-Gm-Gg: AZFdTZecmlmO4/SlKYCfCBOZe91wSmYT2RwU2hKAvOHZ/tDxqljGLu4OK/k6HcbOJJa
	fjX5PaMVWlfP3yh3Fw9q+gHCVKg/WOHXwkcao03uYgSyhBvseE8rT6NjaDk96NX6eTNeTVC/cba
	nvJwgAAJYdOUEtzfBzkl/uj4uEewLAuOuMlyIvHIJqHhCnfHxkMzPrIbbyF6R7Mlba+biduJxyF
	QTGWkW8yAEl0Yo/qMQYsETwCwUsgGtpD1067kfqdK3FEAXQRiWJBONoWHucySarQZoFpAO5R1EY
	Ye6O1jx/6g0AmqcQvf4JUdgZZDx01IG0+qiU2DoIJedu0dvmsWeHYxv6OZ415jBtesJnDujx6Ud
	+pFvA1jNV7G8ZE0PESPKwo+bxsGhYiDmxuDQhdBzVgVaR3GgCAtt/LOhrUe19dXCx3MWVPe8o6/
	ZWVWOJ5xiNCZP092hpiZSbVVYCbggJ2U2rfBxTntJrG8rzSSUE54aGhdlsPfUJ8MBhADi1t7IMu
	kr1SAkGhRuhLJ97yv6RVYsPP+ljI9lxt5Px2REvAnmdSEZlhCqEfTEKQTRNwsisVT7/j2dQI7VI
	+R0w8fFih3dueK2BSJSnVHjcCgTgNXCPy1J9MwV4eNJObets6nf4q3+3vLwyYd/nxoYjSMab8WW
	ZU2IiwxP9LlpYNteqF9yCjTB1ZTQGcbPr0TuOHQbmrU3y0PC29IxZuVjDeJubu4Ulh4SP714X4R
	KkRKAIo0xQs/OYevIvS+Sm2/5nJ/8jbPIixariUR1pwgyVOQ5eonM+MZmj+vsTGE1w4ZfSF++NV
	h7rin+ForC6et/pG7Mm3+oEkmJHnyVh7sad5vXsfcE=
X-Received: by 2002:a05:6000:2997:20b0:4aa:d196:f325 with SMTP id ffacd0b85a97d-4abb7f2ee9dmr30913744f8f.40.1795729479959;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: display: sun4i-tcon: Add R40 TCON LCD
Date: Thu, 26 Nov 2026 22:44:23 +0100
Message-ID: <20261126214433.3562326-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R40 TCON LCD is similar to the A83T one: it has a TCON clock, which it
also provides as pixel clock, and separate LCD and LVDS resets.

Add a compatible for it. H616 TCON LCD is compatible with it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..05ed4ddcff3a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -231,6 +232,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +282,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +300,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0

