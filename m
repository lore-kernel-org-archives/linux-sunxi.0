Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764785;
	b=Bs32PoV54FTA26sXYSI/T8ZP2blRDqhyGu29KwttdpAqTa6+khKzsgt0C+XcHOBNwukP
	 5laECh37mJfUtu84TL0yFXSmSpxKUXxombMssGv4jmpB1huAeoKemI2kQN+4epgYa3FXX
	 laF7mQM8yVhh1bVDCpWAK5O71yqS93Tn7uA94V6xyhLL2ydIi1F3aldSJ1ukt1/9CDzPm
	 CYo0w4IXFC2NB6R4b4ZCKFcDu0ckoBpAq9VOCna/8qO304llI5Y+NlieYGvWkau4DJT5B
	 XjqUZMK+y1Z1XucJTlrn2QYvXXcdB+j4S26Dt3N9Go1RUOZkM8AnusjVcdze/J1UDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764785;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=;
	b=YM6hcMacEp1m3yBDToK6gjaDCemeFNYToePP5A6lEyTyCCrLH7vQxpnWuik7UPpeAL0T
	 T3GSUp3GtBydUfzhI8aEANTzcrLLLWhEX54aiiWsu7lYSaFmrm7qnI4gDS0xWAOsLWMHJ
	 50MUKnukFJvQapmU8mogDRLppS+pvwqTA6RQUMv9RFxZxdtn2v9QG2yL1IQ3S+xQ+IQmN
	 VPl5RQBSSJTbSB7WkhF+0IIFCZU4M6jo3M8qKptBbGyWHmfdKk+zHR0mXQzef5DrNJgEn
	 TAZ/cP9QPPY67BGooNXi2O0nIYzGL895wv7kTo0mqxld2e0C010vLj/D6bFflqLqcxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=BjMGwce9;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF6C606A334
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 07:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF6C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=BjMGwce9
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id BEEB44C966;
	Fri, 27 Nov 2026 18:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=;
	b=BjMGwce9c3BvKfzqymvhn5IZjfMvWIs0nrdnoDN0PEwrDh+iYxBSnqSygFsj5ZBs/RnyjA
	PimBAaSzQCc5mM9+Rp68anzdoDnw2QdRLR/+5MRfT9uAAgupa3jEzdB3416o6od4fPiLB6
	ESwvZPemGUx/21TwGIRwJpCGCBkNeVflB/ZPYCBS0noKJvWwtB3mNi/Xypp7TXbNYl36Vj
	Bkg72jrbW7pN3IkIY3Ibm0i3C+goi2tzP7Qs4ATSmhsGfu4CM7pfQfFI+RfXClylLlpd3G
	yHdSfO8ORCmUbxiRE0FOztwpb3Uy95VAQptJKGPkDDUFDzM5z9cUH1cq9Fcyqg==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/professional correspondence because
	the sender (alastair@d-silva.org) perfectly matches the intended
	recipient mailbox (alastair@d-silva.org). The content describes
	a technical patch for "dt-bindings: clock," which is consistent
	with a developer workflow, and there are no phishing indicators,
	urgent scare tactics, or suspicious links.
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
Subject: [PATCH 03/11] dt-bindings: clock: sun60i-a733: Add USB2 bus and sys clock IDs
Date: Fri, 27 Nov 2026 18:32:23 +1100
Message-ID: <20261127073231.1776847-4-alastair@d-silva.org>
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

Define CLK_BUS_USB2 and CLK_USB2_SYS for the A733 CCU.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
index 81924cba58ec..1e751cfd75e3 100644
--- a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
+++ b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
@@ -287,5 +287,7 @@
 #define CLK_FANOUT1		274
 #define CLK_FANOUT2		275
 #define CLK_FANOUT3		276
+#define CLK_BUS_USB2		277
+#define CLK_USB2_SYS		278
 
 #endif /* _DT_BINDINGS_CLK_ALLWINNER_SUN60I_A733_CCU_H_ */
-- 
2.53.0

