Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904963;
	b=aYZlIcFUk/5rFjTtCbWQsxq6+s19gk8sakt5Y8Nfp/3so90AkRgelgCLO/+wQoTzsuq8
	 4+B5IPD3BGtQAGkByeTAmCpVB8aT1B94pEbf2cpaUmsVdm7hyzoYVJ8b9X7slGdPinwa8
	 za7JDf1HdfUSBS1jo+ejaDsE49CHaBmuEHRHZTjl177y4JP/KDlzrAVJVPjKpxTBuKpC0
	 k+mP+cWOGB9qj4uMovSsw0qaXRilXitp/42A1C187OkgnCE49UzgYlq0MFWHA+UvtmT7k
	 tb9zWKcDgKvc7jsTU65iZa2XCum5Zomw3LVIhZ4brpObyLvttWxYablJRkU1ZT2Mngw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
	b=3pmYrMaI5Vt/hEeVmFS+G9KEGWKIA7A7fYYSmfcw61oj6LE29jFTo3zLfeCSGcMyo9fL
	 S1f3G0DJQZwTfJsEA3W87yBLbPavPTFhnkmkgXr3RSemvaEpz7UkfDtR/WSBxWlsdL+dS
	 Jj85jD693f4C4lWWxVcX1rSPllv4XA4/y40eRQ9+VP9IR9LEpN3NcXViAz83w/FVOzAmn
	 WoJ+gf4wLFt+sWC+VsasftWITKmvzQED2s1DlCWb9RUUe549fSLqI/FdyOuCTPKCP8NK7
	 u2Iz+vG+Ojh/V3q2nLqWw2w2dLjjI4U4P8UxyPuiCdjSQ5M4+ALlNikINMWlViyVghQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2EjzxmN;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908F606A339
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6908F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2EjzxmN
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f1fso2047578eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904962; x=1794509762; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=i2EjzxmNhmlyLorG7VwLdqDMz5uk2LAnTwkEQu514gNAH6I5/dyrXBOSCIpXROByIw
         s6NJCgB7zkDh0ntj0JvhQ03tv4R0zZRsxNg8tdvnO4dAL8NC8+VGKwy8NV1O2xGMwogR
         SRwFuE9v0i4ApPLNyWcrzsUmS6bai4MOfLVOn9xrLlzVU4QBTe27cXmiHOmG0as/3Dd1
         RH3Da5v2c83tELiKbO0zwHvwBiiNnD7OYuDf0sEtopvLZ8sSK1dQfGfnqgyJY0SoNvpM
         B+dve21J7/OtBTqooJIqWpqZ+mbApsXB5C3XPZPUD+8A434VF/z/b3jOKfeetlcUVg61
         b2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904962; x=1794509762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=w80VKhWf0Sowh793/ZU50F0NbAtYHAF0PZOF3YtYUEGm0suyWiJsQuo8ZFzl+wOknF
         9MZ5T5AoYCP8lgduymLfRFRpPiFWwQuHihuZ7tA6ihtCj4XzmRV3d2ewaFhapVsHhNvn
         bvNKj4PNxGgdFzetwgrkj+X9QjsoZH0WRrnR0iDzWlXlN++7mi3Xpk6ImLdHuGLmJ95t
         KM4XJMLw2F5/Ov4WPIwtVHSIEGiXz9VRencPXMXOSB92UYCVLX3WCi7q7/TmGyLlM2KL
         0LM3C/6TeCp/fG6HHelsjvzAwd3mp43lm1oP4orsGKc98wnVaY6fpv9K5+E/0F+kEJ8a
         YZVA==
X-Forwarded-Encrypted: i=1; AKwUvBx6jwZo/JOZKEQKovPR1NjHGYYqoKFC8kJQDEG2vTALSprtxyn91MTiS9ItkFXMk/OFdpPydtzjMLA0Yg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Qag3qT249PbcpxjP6FSmlauWqzaftL3mcUDDGadsAHu6YyVLM
	ALCN0YiVQnFKjBznTsTOtvXcuOvlaNCt3ZCcQjpph6TQtzqpXphFEun6
X-Gm-Gg: AYBFou1e5miZ6JEfL4zGXpqCz2Mm5CUeCjGLdyBiFbsWtZcY6botGJsn2vsGPQZ65D2
	CR94dQXNGrwMCEDpbjolWn3Q1MN/eptoKA79e77tMnQuUoxUf+ru454QIrJvdl9j9pH1lI+73CF
	EJEFNcQtRtuoM8SrvuUPV0RI+olOLH/raTE62Z4Bpx6BBOih7IfH4zpI2fjs/44EbW7LPEWGZ20
	D0BOHfKLX5XeXI28owViHEV8z+yNNPvxg4VprSN5n0FrfSV5aOl3GpyNkddDwbSAIhPTM+tM6/0
	k6fCai3X8RKvwWdTLxsFqZ39YCwVKn/Q9Mu04jP8Tec8TcrJyIWX3fNqmtDJfEp+hTMeNHoHUUD
	yyErc9QGxKLQco45fZ0q0MMa3BqD3Dv1L5DVDNCQvSqgN3Sb3UwKqi+r+6LPaKcCXGWrVywWk5x
	/Ox0rITi+eKD5JPDzYI0qCIx9SHla8Sj4sw+cPLtwHKHNtsR0yynuf7jZWgVHspQUvl+ejyjx76
	NL4DMNHMn0iuynhA54bkO0ROC2BlPKLToI6qvhaeYvJw2KGv1oSeaUBYGw63Q6/k1qjpYD3IpLN
	PGZHV5l0QB4DoygQzh9j4Qk8k3OnbkPtHudkLuqv4a0hSX3Z0nQO4J9S9RNkjFcinW2Lif1OCXo
	Ey+Q46sDakd1rrtj+RFSos1GYs6oW6qyMRyUkzJYt1AqilYdvhV6UPoxp0wKJl2Zh6KcJBkSQZe
	uru/ASIx7is4gdegg6CJJcrK3R5ELY7XpF9fND/PRyDRS5oZISlVcg
X-Received: by 2002:a05:6820:c91:b0:706:50ad:fd7f with SMTP id 006d021491bc7-716e7b33226mr291273eaf.87.1793904962431;
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:36 -0700
Subject: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The H616 NAND controller needs its AHB reset to stop internal DMA and
restore data ordering after an aborted transfer. The controller's soft
reset alone can leave the next read displaced.

Require resets and reset-names for the H616 compatible so the binding
describes the reset needed for recovery. The existing H616 SoC description
already provides the named AHB reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0

