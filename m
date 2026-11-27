Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774112;
	b=5WIHcpg79a9nDt/YTsN1I4fg4KS2znUGLESEtfdJOPlleRKRkpDmHdGTAmwLs45Sjwhl
	 uqK9OIFGIhSEN0fq2Pmxww7c5pmrvrLkZN4X+3uRf5ALR6ZcNRLnRM1XQUjGcuns+UOBV
	 uxOmkt+i3yiFYWAX3QOnFU805XRjPnTKPpegZ+yLY+8/9QVe/6TZOCUi/Az+5CbwgUW8l
	 UxgfHY++WJQPFnNtqnOn42PEWEVxL0K2Sb4Qf/rDDTKAm59N4h5nKQqCGOmEmU2NTPCkv
	 U7DL7V3fxg3nIt3vFHqHg0Y/+5sXgY0rmgrliC5+Q8mGbczyVdaLkrUm1i/YdWBh5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774112;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=;
	b=t/4AJTDrz7J2tUQ3hgXaEdnwCdj/dtB18e6t0LCserwvwzDyCzcStDpbKkAPvEzQ945K
	 KSORCKCe54nVdIy447DtUwAolVXNfDic64DkPZxKN8nhYgOMy7SzCWJoF/BJ/L1mwGP8j
	 v40rzXma00cZLZPNRxwtjmLP1Fcmoph/83iUW/RxA9DAluJB9DeGGa2xh8+qYVQLE5iTe
	 Rs/VTCxbWvlVQ3N46+44rN4Ijt6kCdAyLMHtGAnd//1amWNy7lRQSJcq38HvAh2rETD4E
	 6BoBaXGzLZYYxWZyUpKjeldlBcyWWYD9OrIZ1UufseWcfPt+F9ahOV6nITy3m1kQCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=R2lKm9Fv;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6B606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=R2lKm9Fv
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3BDAD4C97E;
	Fri, 27 Nov 2026 21:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=;
	b=R2lKm9Fv8PkvQg/ewGSztcOiQI4UZXZPmUC2YKQC6ywQMibApGivH/O45zacrC+KseXJsG
	P1NeO1jojdgD7mBvcl1ehd2PXosZciZzG/A29LMG2E4panA+OXsK6ZJQc5+vvWldQ36D1i
	gwPBBMtm3TRJRlETPaVY6RREKzgrT0La8VAsHnreLAGUik07+Tv8Kx2L4lSlXelrSRkgfo
	+CeU+RzTmfwCyAxD0eNtLXflcKRJa/yFU4hJNPdRkBy5PltCKJKLGFsC13Yt2nIYv0wHyj
	vQTDUnvuGPVWrRj3nPJkchLlVKYxVzuoPhu46KeyiasDvpK1KnWRGNKTRcSfbQ==
X-GPT-Reason: legitimate; the message is a technical software patch
	(Linux kernel style) that directly aligns with the personal/professional
	mailbox of the sender (alastair@d-silva.org); the From domain matches
	the recipient's domain, indicating a known entity; there are no
	phishing indicators, no URLs, and the content is strictly technical
	rather than marketing or scam-related.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/6] dt-bindings: usb: generic-{ehci,ohci}: Add Allwinner A733
Date: Fri, 27 Nov 2026 21:08:04 +1100
Message-ID: <20261127100808.2292229-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
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

Add the Allwinner A733 (sun60i-a733) EHCI and OHCI compatible strings.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e..a63dc0eea80f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ehci
               - allwinner,sun55i-a523-ehci
               - allwinner,sun5i-a13-ehci
+              - allwinner,sun60i-a733-ehci
               - allwinner,sun6i-a31-ehci
               - allwinner,sun7i-a20-ehci
               - allwinner,sun8i-a23-ehci
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 7a8c3c231815..565f41eb33f7 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ohci
               - allwinner,sun55i-a523-ohci
               - allwinner,sun5i-a13-ohci
+              - allwinner,sun60i-a733-ohci
               - allwinner,sun6i-a31-ohci
               - allwinner,sun7i-a20-ohci
               - allwinner,sun8i-a23-ohci
-- 
2.53.0

