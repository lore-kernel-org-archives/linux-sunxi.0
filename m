Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795066175;
	b=YSpebn5jCvGPiCodGw3mvRujk+vlaOcqbaxY9LQ9dFWpn0pmLU/rMlbc3Df9ZoG++tL7
	 +FQr+0BTUCkjWJOSOqB9TZGdY0AzHxpIqr1J5nC3o1wpbsCnbhsRRg8TnMhxGnGZIImEN
	 m+xdQ8fTzY609Nq7LOrBaZrrXr5jDwVunr3yVJF1jMlu4Y7hQFyd0jjcZtdfpINbm5dIb
	 JIVuhj9967QCbT1gKz9K6Le4mKKuPBONDFK4qzBQT59FEPsnXWtTvGyO8JcDYodqVsg6v
	 UuzDJmBCk72V9jDRhLto7ecH2hbe9twngJCyxL+OXdYcHUTZAbzWJzUNCjd4KShrSAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NldOUlPPoxP8dDx4GjLq0MmuALDhkippG7whm70TPAg=;
	b=Rhb7o5UNl78WeQjw2ybsmFBJD61tSdUJsG3MqfUSYyKXOuEUDdF3EHnjnwlHr9OdQbWx
	 gxMnJO558SV7QrEw7qY4gIdEHW2VGVNjAFWcTP85Pnd0CevrJdF8F7HyYYnbqFCfSgLcq
	 w9MGemfs5Ui6okITUv15WDkcRXw5lrXn39QigLsNpT/VYKJ6BqqQCs/k/4cG4gOqF3dUA
	 2yQglatCnWfepeIqGnGR7B6rjRloTQ8Cjk08e2i1BzWz5WN4kW23aviAm/Yl/qNrixxnj
	 AoBxAuLfqjaUWkOYSOhaxbPlQCw2hfY7w074JXlDaHmw11lF7cTC1jDsodQx7vzZMBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk9o+8MJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043E606A325;
	Thu, 19 Nov 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dk9o+8MJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795066175;
	b=TlgXeqUvNb7Qg+PkvraTcYGINLgxXJDNmBZs7t9NQ0CSrVn1SFC7+kmd/DFPpx7w86Ny
	 kzSLYWXbyfXMOGWv9S3QqgRYw9KXIfPVEliMsgybelN6bLCGLUGouEY46141pKHCYc93U
	 gw2ME/oXmQ6s5tfOASFETNjlf0OgNZrnWUUq2trJQ4KjQxRKjRa+wpyyXeTzUzYsVh7Uy
	 uZsoEnVWy2Ah/tBVsB+g1bQGC3J/21hklTI8KQ/2q7xhsFyhLknSlXtCLGHiCbdWoncoO
	 4EAvrmU2YVmEhigBJEt2m8n1s8TnlTXzXpVr+2TUGbPxwP1mPL1GAT3BWnSrEAga6+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795066175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NldOUlPPoxP8dDx4GjLq0MmuALDhkippG7whm70TPAg=;
	b=bT07qzTdrAj8A/bZRGIKxuils/ypWxZ2qKl0+hVlEGjqiBGIRAaB/80LuuJClj+9IIgU
	 FN+dRelsjkzQqSD8qpbwT1dDrd7MskR90BkVC/7CIyxjQIIo579jomtws82um5NBaBdTD
	 F2biZMG6p4OCkGspCA7GyhvtwycoJQXgct3lTt9IMVsjtb2DloNxnzje3I5SUzhnRlxl2
	 PWBsIuA3RPd38L3nKsp6tnEoinxzSwCvkQStf+LnvSxyw/lSIkWtoNDC9Yzi46jtdoDW2
	 A9q4zpB/me47rreKgYOj/jf3MgJtzUelgxphUG1fI6d6RZrOLOcrHkDHz9CCxwuCVLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD4841F000C6;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795066175;
	bh=NldOUlPPoxP8dDx4GjLq0MmuALDhkippG7whm70TPAg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dk9o+8MJfKTKFge48cCUQQFiMfTpvAI+Ee6U3xaD59xBy09p6cbNBAcXvg1IyWWHy
	 0W7PZhIN38cjYANN5XWdEZ2nvmhD2eiksoWR1IEy+u465WR+xDPnIpUPp0BiQtkUZv
	 F+JxVmfb7uPr9Njwe5xM6DhwX8Hczx8rd7qaNzOBRdm9lZt8VI86qC2RMX05eOwLuG
	 rJV4yAbvdW6YRwEZUrdXNmw22TobWyzcE3udOix5/sq4TH0lRYTspvKkz4eTRiXwT1
	 JtcpWT7BHkam5bCQM5f12JzwQDNM9I3VmApJTmMBdA8oGohg4c3jao8el65ozHtIH9
	 X69TEi3KGVfQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 472B64B10D;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 05:29:35 +0000
Subject: [PATCH v2 2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
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
Message-Id: <20261119-zero2-spi-nor-dual-read-v2-2-185c87065e39@gmail.com>
References: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
In-Reply-To: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795066173; l=857;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Q+r4zEIs6OoXjgWsTg14JRKlUB5idFqb5Wum5OUoLAI=;
 b=64RjdNiTWEOyc/imWHPnWirAAmWbU5eG2Y2HriNa1MjneBj8xG8+WssVODkJpJVzzZ/htz6eg
 diuEy0yHbMeAazMYr0kuIZMx51+JrXQYOltsFaCRx679k3Ai5zDXIAY
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

WP# and HOLD# are tied to VCC on the Zero2 (schematic v1.3), so read over
two lines. Andre Przywara pointed out that the Zero3 is the same.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 646d92e0f724..4a588c44d029 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -110,6 +110,7 @@ flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 

-- 
2.55.0


