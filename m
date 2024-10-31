Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933F1474CF
	for <linux-sunxi@lists.linux.dev>; Thu, 31 Oct 2024 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358212; cv=none; b=C75ids4X2ke3ndLx3JxKBBW+jgiZihepBIV0Nj1otu2q+0UzHjlMzWmcD16UVzJELHcIo5rHODU+Xo8tS+sM2h/eCn7p5YBwHncCF6Q0mvCyX1yQ8hEPIH27dkpfuUxjAx7SVul7VVUbCUrru0hh3EzVsJ6ch/5cx6s1JHf8iqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358212; c=relaxed/simple;
	bh=0LhzF1eZO0izMe91R4cLDD2hqekd2yJ78S0js9TCEkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbNtcI/2QhacqcnSxUCEQOBjnPSxmFY661LeP3Jm0UBuwvbB8eUFEwRHPXqqgxe5t2/SGP3sNUa/C23EGAIU1Hv7u05relNFN3LOfEV2fHskZpHaeuT7sfhzzUDeCDsjzRUlg9isIhnxDqKqTqi3HF3D2zqu28MPR1gjuMX9XqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=GSHrLcIQ; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="GSHrLcIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358203;
	bh=0LhzF1eZO0izMe91R4cLDD2hqekd2yJ78S0js9TCEkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSHrLcIQavfOu5jndVUyp3moeN2WNYQqwpv6lKrnz0BCVLQCf1F7FCCatCJEZ3RRW
	 qSeAFYcOuccXSwLFJYWeB7B6RzKPf0L1bbAULmlx1rTHpemWzpmF1dtz86hmpKua0h
	 ZOacpnND60l/ExC0WrTkeoTrrBuuBn1q8db0/4qqGI9C5/0I0tBu0vnXvGvbEUHWe3
	 RXpbCgrbniolgdQD09krx3sSfMLEsbohaswtDK4mqOjDSjDFCeqgvGCJ8aXrEPTuf3
	 yI28ILLij8e4jrBbjfQuy5nD92jwtpJ+Hn0Q+vat2z1cbtGgJ8YRCjXB70vjyKpeRl
	 Doh8eG5HYQBzg==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] dt-bindings: usb: sunxi-musb: Add A100 compatible string
Date: Thu, 31 Oct 2024 04:02:18 -0300
Message-ID: <20241031070232.1793078-6-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A100 MUSB peripheral has 10 endpoints, and thus is compatible with
the A33 version.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Fix ordering of compatibles

 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index f972ce976e86..bb5010dcefe1 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun8i-a83t-musb
               - allwinner,sun20i-d1-musb
+              - allwinner,sun50i-a100-musb
               - allwinner,sun50i-h6-musb
           - const: allwinner,sun8i-a33-musb
       - items:
-- 
2.47.0

