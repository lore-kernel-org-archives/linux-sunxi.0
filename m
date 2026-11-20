Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156209;
	b=QJptxD7kTnnhDXO14zSoPYDnzdOVLW25xZEOWvwpNf9YBPXja0/39Qq8LyPe8HfpCwfA
	 +r/+RMLII4im+eH69JzqBGIugI1ckrd4zi8l4404MJewxEelYqvBWAkJmbqtc4Q4eSPlW
	 yq3INMoopfWiLXaNqkfTteUIfdxiGYZfOPrP8vAN58HnyAz1I6F+KeUebGqBLQGYodthd
	 KHHqTc4WbM2w/6peG3vJ4rgl6W+6x7EbC+JpXNb7SShY3joypAcx8g+cLGXolsvIuQaPW
	 7UGRJMZxx6y+22RU6HvsK7WqlwczsgL0dzrbFJdpbHo+oDeE8h9jqMIRzpJs+/IZDYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156209;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UPPB6eKs+nKRNCgR3sJ7bUEYoqJvPS4BWSVR+3TcBU0=;
	b=zBQT7HlTDEpGeo11OEEbJMle+QQZN2tVuan50Yu3CqtDt3/tQdRpRIpo43Q+La3/JZQE
	 6XpmIIcpMnTPTFqWw7akrJfhnUPXX3KMPTGohWOQnIUclyyf5203JMia3OHCjvuOBayFf
	 l18W0+yAtEah2OZmzRUsbYRIkHEGN24rR2SrhDen5O5sGBFsfsHKK6W06snHCmG3gYzPT
	 BkXOdJdXK4ENIoquUn44MC+8XURwZIKx93nM34HC8PAjvLiTYSnjx9GNUHIutDXEUbUdp
	 0xOsVFJbBY06jhhsQQ5+LPETcyFTTicFRyOQpZr6U3VEZeDYJGxQIA0rxL6V9QvI8lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFwaT6MO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C0606A33D;
	Fri, 20 Nov 2026 06:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFwaT6MO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795156209;
	b=CqOtxOAZ6EIYX2S3eNyL2GomDKqL2hGfW75S3RQVBxgv2CjZGekUeSr2Nvk5awzsKedc
	 6Cg8GJL1UdrZceCuGlZI2hkm5slrOFFhqUHZQnXMvIjt4S5bG//Ss9HUonY/obPhLE/Jt
	 yqoYquZII8XsDAuXv5d/pdp+PzdyQOGdbEKw+EOv6xtcAMxZ6Qy0Bic8JHSmTuKIZuyiZ
	 oHtVVwbaZnT3Tb2MBRmtcSzb7M3Yyh4L/VSO2yXNhUscDJCCqqeEvUy4pMLHztgS0PsNt
	 xTszhNKj85El/c3Zc0GnOaWdZsYw4AV/Xbz8e961X0BsdYstQArt9gKxZNP2DJNPyug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156209;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UPPB6eKs+nKRNCgR3sJ7bUEYoqJvPS4BWSVR+3TcBU0=;
	b=1MKKn/fGYRDW+sYshWehIpa5NNFLYaUsAcz5W5OgaqOXRL0shdbaMMiLTmg9cf/W2tj/
	 ulsq0YHs3YYSF+KzpjkJvosXd/Z1LFr32pF77bE53nCZ2GYKMtgXdb6I6g+BcpZw38wX6
	 LEBRG9Zr+oeq5WSZw99B7pKQAKJ767uXsq0H1ZvimWLE2Wk17k/EpqSVQLKQgHUcNkOSi
	 q8STbjANzGgzmULwN+o4/NgerRcZJfU0DkcujxzGo7xoVfh26bWeoVu9iuMNZI03vB8RG
	 8k+c3Nn97zKkqPXw1GKWakkxxhyRddTo8U3qCW62kr3W9I+Y9c4Xk6tqQiRaoMHYAcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 64E1D1F000C4;
	Fri, 20 Nov 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156209;
	bh=UPPB6eKs+nKRNCgR3sJ7bUEYoqJvPS4BWSVR+3TcBU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MFwaT6MO9zFkFsn40n8X7dkl8ArNiyj93aYUuhjTnOrp3gasfJK4nf7aUDTgjxnUY
	 XyCnvq0EJ2o+qGHx4I7iOpYvmaHIToKmBtHi0K21tusMITe1Ayv9kyr3nkXL3YiKXk
	 Pk5T9puHifVgRLQ615VjC7w/XJoPqsMxE2Eeyrmyx8fvRyCetPKkeOoBwl5QC77wEi
	 X3Mp52CLSYWERBl/KI/6SRgpsSWHADDhnBcF6cbYIKAIUMoO1zDvKHyBzBnzsEpgkH
	 6R5S+6zy6BeBHC76nREpoE+LzGYEFG8remQUtai2cnxBITiRGmMjZj9h+kmRVEJj8x
	 IBvWXYUenHd6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E53DB49712;
	Fri, 20 Nov 2026 06:30:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 06:30:09 +0000
Subject: [PATCH v3 2/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
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
Message-Id: <20261120-zero2-spi-nor-dual-read-v3-2-1cbb0caaed91@gmail.com>
References: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
In-Reply-To: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156207; l=912;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=OFC2RTSAEIuxlffHGnd62HFfopM0iDcm7zOUqP8Ye3s=;
 b=3TPkb/mogKB7+d2lLRxELbLqFT8QmXwfBqvA+b0x7Tq0Xvg1CXRsH6XCTUCfv/kctAr8msjod
 arVGTFtCRyhDJ8AgI00m7plFRPIFm4EMDFJLA4vttS1S5lNPVENED0H
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index cd1f67ad7c2b..de05cbbd2cae 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -110,6 +110,7 @@ spi_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 

-- 
2.55.0


