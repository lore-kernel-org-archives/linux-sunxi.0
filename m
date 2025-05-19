Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C892777E0
	for <linux-sunxi@lists.linux.dev>; Mon, 19 May 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656940; cv=none; b=qpXLRdRCVQUuK5fILd26aPtXpIQPEoe8ScERDXYfk46wT5BpVIZ5r+MGfoC7tcyGSECAXDpUt1GdEIJL0FxBW+ZvQvboD1eeMh5PSpQAtvK9LabTfID6kJHQ35DJ3hYKg7Am7X6Uc5GUZaXVW8oXQLWs+tEX1SUp4GBJnH1iTnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656940; c=relaxed/simple;
	bh=YN8bSpkiGx4dLXHo1lqMhySq1wMcMv4ZuTPfou6B6xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOcVyjXRbSjFphgeDS3RkZIZlGdqAxld6OGmrGJ+wl/wnELdc9MpBWC4b1Z/evgs0DwgDLRG3MW5dvIEJvrYAa90Sjo7iUuxoJAdrnWN01EXjJC8kRLP69Cb1l+BwyfsrP93YwRT65ZoWRFv3KoAxgRxIn8YGqn24ThHXkgfQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Qh+mbnzF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Qh+mbnzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PmTUCqIdUyvmW7PWX4aAOOzNodfH1u1N7Kcy3QmzJPc=; b=Qh+mbn
	zFLY0hpDPfmflH6PF98+Q0hLr3jjcnPR81neRsOJDI2nmqdqQiLlT+0DiycM6MEN
	59sUq4vijLtpXh2WOzvaFF0aTCzpze0mpXc/gpuvjRy8Fq0qM8ehKyAPzU6UgFP+
	aRrns7f7b7vg5z8g+bDWGCL2+HDTrn1cxAQnpqEBvkgeJhld2CxrupL7GrpyS0tG
	l19dsTnUAHhK0NpBIeUatzSVCII7sIwMpVo3Pte78XNxTZuPpr4Ln2U90neHP9cx
	mje4qDk1WL3W2xY/QWgYGwZdXZgtjRce5fQ3sA64JWml3GQsEkpdMwcvNNWascyg
	gwlcSAKBLJP31Rfw==
Received: (qmail 2475372 invoked from network); 19 May 2025 14:15:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:33 +0200
X-UD-Smtp-Session: l3s3148p1@E1OzFnw1RLBZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 7/7] riscv: dts: allwinner: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:07 +0200
Message-ID: <20250519121512.5657-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
index bc5c84f22762..6d84efaf4b84 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
@@ -17,7 +17,7 @@ fan {
 		#cooling-cells = <2>;
 	};
 
-	i2c-gpio-0 {
+	i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 3 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD14/GPIO44 */
 		scl-gpios = <&pio 3 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD15/GPIO45 */
-- 
2.47.2

