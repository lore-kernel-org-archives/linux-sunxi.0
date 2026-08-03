Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC6395AC3
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734138; cv=none; b=IYqY4rU4pHiO/Opa1gJmDQVDm9voW9FUoqWz2Cq3ck9r7Co5FqnGoujqJlgncvkNiZHmzLC7ReoxqTvpIzkvYNZv3hEDn5XIp0fec5JWi2UnLpoMVqixJNrWdWPjDtY1xwInpYnbZjhCHlrs5wN0Fy6HSZr3UrIWASuAmaOQJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734138; c=relaxed/simple;
	bh=vV8lMZbs024nEM6mXjaIv6nOjnfVCGoiA5FCDI8jrNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJNCkMAb25KwJezoR6atcKZBxOa1ebRzqOwh7NhpJy/8GJbUEy1rUdTy/ZGve3Qj+u/FGdqXzmadqXpqRaQW8r1IZQPysKURPiNe1Rc2uMvYla4DDnmirB22xNDZFC4nbiTsLdHuLQ/6ySlTNauuiLg0bUaYNhR0NNR4556JnVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZX1rcUaU; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZX1rcUaU"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f18c0e03e3so1152273a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734130; x=1786338930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=ZX1rcUaUJq5VWQat+cIQ+ZBcFC8dLqzdm2sR0U2Y59uXmocQhaNWRHSZm/HzJuCACh
         sCYO/r0jcwhktLUiy27eoJJFy7ATqzwSNl3ct/JWJU2e7vINf9OnCpSN7WW92iAdy/0d
         c/So+aTbwScF7BKrXhE85fx2VljmHgRSGp83XCISpCJ9nmz45xw27b+uTVrVaQTNuiyp
         52ieDpD7yMgsQqeJMHEmrZMXCjyCK5ChPAGKZeP5c/tL/sts8IpRbgpMeUx8Jabocuf8
         7vzw9mIsWUJJxFEIdZ3nWGAQZLo94ve8yU4kG/KIt9HB3XqMPxoHJEHI8Ku36uB2CVIO
         KvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734130; x=1786338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufELgsZA/AuhdmDVFD2N+JzOSgNytpSBYv7TBEiLCKU=;
        b=Uj3N+PX49oxWTlCpwjGt4ivMSnwuygzo8ZGnaZWHIDcV6CdI+6Y8R9lxqvtlwoK91G
         3VsU2JK56FyR6jbrQh3S9cjJnuqgQNGA2r6ismX7d5/0OhPMaAPJCOvYchkMWP+TGiKn
         v7L1XKwBmDkkHfomQcvpXCfKoS7vvGxr6xsx03pdNYDxvkb+TBkrDM+9vEAekg3XqTSY
         7pbupaemjpilox8xnoGVPbpELck+Vt1w37voX5CwZUQ1yM/uMxWuWe5evh1a+CE+p02I
         4d9nQOtDaWfcmWPEIZP5zXAdTho4zR3fJ4YDxJTTqcZyJNyLGcIvcI2kjSiztpZef9vV
         cdSg==
X-Forwarded-Encrypted: i=1; AHgh+RrdIbTkzn/o9v9dKjvEsB6lhTDgJSCNIZDMv9RCt864WT248pj+f20E3CASP8T35EXIfJYcBtICCkwlBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YynRfI8uVFZzwzSTIi6CTm8kEj82zoLtrBLJ6gwSKxBjYtHPdHz
	WROG2BTAj1u2/TPZPrhsnp47E6qu7rFvtws0xVNhv9eArQ6oBB1cK3bK
X-Gm-Gg: AR+sD11BugNbDq7KQA8I0o4YXjz5sUPMWCZ7Io1Sp26KLiD0IavosMyRd6AXidBJWWK
	mtZz54pF76QtGi79YmJuw+CSEBZVHUA0iNeS+kJsnU8zv89UZIAn3rq6tRaPaM99XKtFk/mLn19
	SwPLsMdw6+gY9jg3vLZetpvA3Cxpugw+xkM5pj9gMylB5c704z0NLqAkRMtgrSSMafjkC3cbqG6
	osTX3okk73y/snQ2rqHPyJDlvTCK3K7eyPao6J/Wy/DJeyXIhFlWIr5rAUVCXnpUYz/6aANRTvA
	ZGAzm92GD3at4VxoRIhVwbe9n9/3kli0E/MJx+8TaRqFlE0/PlFC98bJtY9jeuYlQ+YotGsR5Ul
	GZn6pq6UfEnDQyt/SbGYelOra3HhFpcqkBZWUA2xh+4LGCWvPMwJHnDHG82ayCn8XFFXke7c+Rd
	3XWxIh50MZweY0XHDUQFZidiFom2e0r46LFmmICkAkkRNFD3ZUW++gaqUt8p0aNkqb5oi57xsJY
	lUXc5sf6aqIbuFbVf/8voigN20jvg1y+lZU8KDg1/76TvXCmo9Ooj2WhWQPhoQLBp1LhfRjBbvH
	9yEdedGsCMQGd5ulKBonb3uLm602YmAL9T8t3iHZ2IyX8yn041g5JDiPY32NDCIFIKGXbtzTdJO
	e7zYy/mUqY979BB//8GoIpRGlBWFN
X-Received: by 2002:a05:6830:81f0:b0:7e9:cad9:4bd0 with SMTP id 46e09a7af769-7f196b1550cmr14686937a34.3.1785734130353;
        Sun, 02 Aug 2026 22:15:30 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:17 -0600
Subject: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 companion IC contains a Fast Ethernet PHY controlled through
the parent AC200 I2C regmap.

Describe its control function, including the interface mode and optional
SoC SID calibration cell. The vendor sequence adds three to the calibration
value modulo 16 before writing the BPS_EFFUSE field. If the SID cell is
omitted, the driver can use the AC200's internal copy of the calibration
eFuse. The link-PHY driver supplies its Clause 22 address when enabling the
control function.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
new file mode 100644
index 000000000000..b3337c3aa62a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,ac200-ephy-ctl.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,ac200-ephy-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 Ethernet PHY control
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 Ethernet PHY control function configures and powers the Fast
+  Ethernet PHY in the AC200. Its registers are accessed through the parent
+  AC200 I2C regmap.
+
+properties:
+  compatible:
+    const: x-powers,ac200-ephy-ctl
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the Ethernet PHY calibration value
+      written to the AC200 BPS_EFFUSE field after adding 3 modulo 16, as
+      prescribed by the vendor initialization sequence. If omitted, the
+      driver reads the AC200's internal copy of the calibration eFuse.
+
+  nvmem-cell-names:
+    const: calibration
+
+  phy-mode:
+    enum:
+      - mii
+      - rmii
+
+required:
+  - compatible
+  - phy-mode
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+...

-- 
2.53.0

