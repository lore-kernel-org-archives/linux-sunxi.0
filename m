Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764779;
	b=rWml3+N5nCiu2fKK0XQCAePVHqoVAgImUF+i0Ov7YAHH67hnExOI2NvP6t6YYhCdv3Nb
	 cMa1Yi1i0Y/wPgF0qCYNVtaEXYBTO0mfHPEW1nrgpEpt1lR8XedPB6uS5loTfJg7sl604
	 MkyWT1XcfG1LBZHR44z1sYCjSNfOp3GmytDQqkJnVZ5y4sDzzU4gkqB8qk6PN8aN1lu6t
	 /Hw8dFOjPlZ/xmRr5trU3rZEd+8JfuZd9zt3i4KTFIEtUP75xdWFMtroM0r/iH3k3MjY+
	 fhBP/IMo9O03br1ZSw4tTJFoWKwjRi/6JLJEZOMaVvn2CfrRh1jq6L8EwIy/KhthfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764779;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rtQftuGGUMT19UNCIFYfUEwNelYK4ghR4wjdso4iJDk=;
	b=SNoZOW1ncAPx0pcP7LPDqM3tG86LaeFuifsmYpJqoU8hXhqEwMpATrsyPIp0kFPoawHF
	 tHeatgwmFxnGUR12vLI5OkL+uPGbbfw5oq/clo1Lw9tiBfD57FU4n32MxZTk8tJWk5dQ4
	 xODh0o8uYMo1+8pcqU/QQOW2XXM3uSv1mi5Z4hFs7NBGmomrB46Cr2R3THXKqlO3tKkox
	 RHWpiKMx4ajIvYQaLp1y+Vjob4+sTIKvZeBTbeVd5MNgZzzvdwo2kCgPtOSpPn5u3YwiC
	 KjlmxXYOrMzJNPoX0UovwflCvZ/KCNqyt5hCwyUcIeaLmIqnE2cVnfw1bYk8kqbQmvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=YgP9nS5X;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D1606A321
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 07:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=YgP9nS5X
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DE58E4C96A;
	Fri, 27 Nov 2026 18:32:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtQftuGGUMT19UNCIFYfUEwNelYK4ghR4wjdso4iJDk=;
	b=YgP9nS5Xw2PLHP/1izDsqXbid+9uysE2KYSPPCwxLYOfFIZXZ3sEr5M9HunbX/Gcl3D990
	MktbtxR4YPUzx4/0yN3PcCxVi+RWcVrM59W0Ig5OaFMnnI3PrVRxF7L3/XeEqMJQvxWOgt
	aOWHVFDeENodVrsJelo87a3Cg4Iqf9LgKY723oCDDiP4MTVZTuHbtPSBOi6SLGN6GkZB8W
	kKJbHGrc1Tt3NiZSaSdLWcQlCL0zItyFuTNi3t9FsET4itG/B12LUo0iQhQek9RtYgbKGo
	2IXpb/ZvTmHnlysg22dBES3EIAf+LCxOCc2GyyfcbJstbSg8DuDzXo5ijoiSEw==
X-GPT-Reason: legitimate_personal; The email is a technical patch
	submission (Linux kernel style) from a known personal mailbox
	(alastair@d-silva.org) to another mailbox within the same domain
	(celia@d-silva.org, sagan@d-silva.org, or alastair@d-silva.org)
	or a related role. The content is strictly technical code documentation
	regarding "dt-bindings: phy" and "combophy0 USB 3.0 support" with
	no marketing, phishing, or urgency tactics. The From domain matches
	the sender's identity and the subject line aligns perfectly with
	a professional/personal development workflow.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 02/11] dt-bindings: phy: allwinner,sun60i-a733-combophy: Add combophy0 USB 3.0 support
Date: Fri, 27 Nov 2026 18:32:22 +1100
Message-ID: <20261127073231.1776847-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
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

Add the combophy0 compatible string and clarify #phy-cells usage.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../bindings/phy/allwinner,sun60i-a733-combophy.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
index 5182884109f9..58e7a3348bd4 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - allwinner,sun60i-a733-combophy0
       - allwinner,sun60i-a733-combophy1
 
   reg:
@@ -39,6 +40,9 @@ properties:
 
   "#phy-cells":
     const: 1
+    description: |
+      PHY type from <dt-bindings/phy/phy.h> (e.g. PHY_TYPE_USB3 for
+      combophy0, PHY_TYPE_PCIE for combophy1).
 
   allwinner,serdes-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -79,4 +83,5 @@ examples:
         power-domains = <&pck600 PD_PCIE>;
         #phy-cells = <1>;
         allwinner,serdes-syscon = <&serdes_syscon>;
+        phy-supply = <&reg_serdes1v8>;
     };
-- 
2.53.0

