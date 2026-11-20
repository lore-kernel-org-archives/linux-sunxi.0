Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156209;
	b=kZKAkI8AO5tkraR4VFEYZQtZxGVfw3kORyu1IIMTT2JXzrURrH8MIn86A9UCmWg+cXgB
	 2MXseLAXBdxsJI3K1ooyTULwgQ2caXfHklmsC9J7gkIcTG6t9P54X0r+BfE9Pj57w15Gz
	 s7kP/Y5zetDUrmcYonZpqUahn4C6NDlkf7H38z+3yPGNzPYsqQcjLOgHzXRe8klr/Ax4O
	 uqMFRydXzKZLqIuVtAUXNYIn2Lx25FSuDfdjQChAK/UToleBTKzMyp1rffmhhJkziCpSu
	 MM6st7IhTOlJtJuiB2cFzV16PpvV8+/8WQmSkFiuNocGWF+DbyS/YeXKLTlffblM4Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156209;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=+YKEUIR17Ys1qiI9vqcZUQdQMdxe3ZpuES93oeUi848=;
	b=x3Wcamjey2VC3PsEY16RHhiWljXVkcu+4aPGR+9vuCYIQ3Q7I2f5NetjtOvz39a8CSy1
	 +z5ed3J1gpvn6oyrf8yF0AsNcloI1Xz/IhsqFPDSi9XzQyJ7DzHDjAyi+F1xqHz0alaTR
	 47eJNLUqOAyv/pu5RYx321vQlrJd0z1+Gs7PXdv2eD/LC1rbdRqQ2O7Vq3gctBWPuTlbJ
	 iHVpGUZkmAKAJYFPjIzzNee/Rm0xEG8tWAUhR4W63xEsMxXR425J71c5uBUvQKuCLRR2G
	 KAVmdomaLkeo/qT7/wGY51Uet7vtfEIpat35fmGvLZ6DmcGWI3smC3QHyrW5qnOAObg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSrohA7B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2A606A32A;
	Fri, 20 Nov 2026 06:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSrohA7B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795156208;
	b=SjrtBkaLQpjGM5exSIKr8AktAqQ1qyJTS51CbokUjwStvDlSrYDHnJlXyfukumITT0BW
	 mKLHemg86/xlVgYRasf67lnDxidM9AQ9ohhYe8KskFJId8Ow5+CkaYOuz2M/YNFzmt7Za
	 SdG7sZITLwtFcHJIj1DkLBNoQzVHY4ugL8yTN+1ojFPl3NxnJndp6AE4TfCuWk+UuKlG/
	 o8dYCIvCxmSIUjmOeY2qHxQ2QW3GVXnijTBZ8NIDstyusoDM0L0pJLnie2mZrSytaBmeh
	 ODtDzIx7Xv+cdCMhda/gv2aMYalOmKXQ8ZkOMmPPROkvvWXmZyRV1x4SgPkhx3QmPRw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795156208;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=+YKEUIR17Ys1qiI9vqcZUQdQMdxe3ZpuES93oeUi848=;
	b=LiwQ5vqS+GxbtaL9xu9ZneKWuNgf+EYXo6+xaOrWtL+6ZgwhZQK2jE7WFZOdi3aWqm6m
	 f8mzyBYmfCAt0RbKJBeKrLsR4XcM2t+uxJI56rjqMJEkZ01paKgDH1zKFMPAE61RodJMG
	 /zmJaEkMOhTOTnJHqY7a+JiiuG0WGu3mLtWYw+5dWUnkSqjvS778qeQg6RFBhBydduhoE
	 PTJaBG1wYsMvhDEnFP9U19q9K/zqGwWXuTSv64xMciMZ14tlA6RcWcX1NFAVaio2hnVuK
	 8VHFkviCbN5rq447feDp/mtx5/68HTZjVKiv4ssMEywFpJFDpgUIMmqPLacuTYYwIHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 391551F000C6;
	Fri, 20 Nov 2026 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795156208;
	bh=+YKEUIR17Ys1qiI9vqcZUQdQMdxe3ZpuES93oeUi848=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=DSrohA7BZ/otoqL7hjWAvxfbdSp3M0+AtXv5W1oODjIgup71PkFo8+rhK9ficQXVh
	 39L36mO20AV7lG60uJfT6vK/Epluo68OP7x70LCsCsCPQVTpNUyhcyL11kAYEQjkIn
	 cQ9l1qbIKkX7GcTctbVVxgeAqEqHt1ssH8fJX6y9LEnlWjnXZs+TIFqBcKlBURV1A2
	 dNFyi+84rHjzSWaMKyhgksCS1hkBDUbS9ezZzSwkRc6EBMAhFMeueeenb+IY4MUODU
	 BnL7Rec818rp9tn7jlXxtI5K7j2tkhC2mlIv/rF3ozB7VAer3Rp2i1p+xpSoiKyJEE
	 nMPFbjUAKJH5w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AC4784970D;
	Fri, 20 Nov 2026 06:30:07 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
Date: Fri, 20 Nov 2026 06:30:07 +0000
Message-Id: <20261120-zero2-spi-nor-dual-read-v3-0-1cbb0caaed91@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XPTW6DMBAF4KsgrzuVbRiws+o9qi78MwRXCSY2o
 LYRd69DssgmyyfNfG/myjKlQJkdqitLtIYc4lhC/VYxN5jxSBB8yUxy2QohEP4oRQl5CjDGBH4
 xJ0hkPLQNmtaTRFKCle0pUR9+dvnz657zYr/JzTfuMZHospTK+T7GJjO7oRQeKqmsaJDrzvNeo
 Sa0XnbWOeRSea4F9rU1jfXsRg8hzzH97j+sYpce56qX564CBFjnne07hZb4x/FswundxfNurvL
 Z0a8dCRyEQqc63iLV+tnZtu0fJM5pAmEBAAA=
X-Change-ID: 20261115-zero2-spi-nor-dual-read-645a6de25e81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156207; l=2063;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=TbezzXnMhGFtPtXyzkhDKAuplra+gjD4n+VzAJSqXBY=;
 b=y4xQhOYT0fd7FkbqvjjxEuvNHMYfcJJYHOVEN9DSjUQzLlKWclQbSGmDywej7kWEbWNHUuEOT
 mYejXy/io01BbI1yB/kRaFxCJt9dabk3SOd7C3Mbdh1sH6mD3imFJ7J
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com

Andre Przywara reviewed v1 and suggested labelling the flash node (patch
1) and setting spi-rx-bus-width in the dtsi shared with the Zero3 (patch 2).

spi-rx-bus-width = <2> needs the binding patch of [1] (acked, not applied
yet) to pass dtbs_check.
Without the driver patch of [1] the driver ignores the setting.

Tested on an Orange Pi Zero2, with [1]: 1-1-2 reads (opcode 0x3b),
two 2 MiB reads identical to an earlier dump.

[1] https://lore.kernel.org/r/20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com

Developed with Claude (Anthropic), which wrote the patches and commit
messages. I reviewed them.

---
Changes in v3:
- Label renamed to spi_flash (Andre)
- Zero3 flash supply added (Andre): reg_dldo1, see the note in patch 1
- Zero2 &spi_flash moved after &pio (sorted)
- Dropped Suggested-by on patch 2, added Andre's tags
- Link to v2: https://patch.msgid.link/20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com

Changes in v2:
- Label the flash node, no nested &spi0 override (Andre)
- spi-rx-bus-width moved to the shared dtsi, Zero3 included (Andre;
  he read 16 MB on a Zero3 in 1.8 s instead of 3.5 s)
- Dropped the driver dependency (Andre); the binding is still needed for dtbs_check
- Link to v1: https://patch.msgid.link/20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com

---
Arun Iyengar (2):
      arm64: dts: allwinner: orangepi-zero2/zero3: Set the SPI NOR supply by label
      arm64: dts: allwinner: orangepi-zero2/zero3: Read the SPI NOR over two lines

 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi | 3 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++----
 arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)
---
base-commit: 90e0d3fd460ec365617982b56bd7ea5179b36197
change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


