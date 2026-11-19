Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795066175;
	b=Tx08UyI2SoBD5RNKS5GPHtBnFmBfaYLG1y+NhJi8txfPIvTjHwEttRrw+xpmI0p5muJ+
	 xLKRKCQW3wmSGP0vV7m59jH20xNhUXCRLw6IIa9m2GVzcp38Ojc1jano7MVml3l1JtR7S
	 Y5JPPn9i/ozVG7XmZDX3Wu8gXOjlF9If07EWcb9PnVPm0xQEWmy7iiJi73hz38wULByv6
	 zGeJjBYzwVDA0mmVQ6IojfhdfnaiSNCSjR4z/v/6MlZH1SfDEvOE5EFvc3iBctaFkY3qi
	 5eKjYeHC+1Q0YFFGBhfmZoOSBkz7LxCTQiPs0RXNsaNZFBotGTWKQOr0HVD2G0iTV2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066175;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=;
	b=Rye1PFbZ1dttm7ezcOBd+UCnmbbdMxv6RARmH8WLmKioC4rIqCqKTtnFkqkXYdS+rjYF
	 EdVCbSFhoHp6Rp/Qs1mbbW3ABpK0VLKrz0JdUKYNwuEva08oO4tHjV62c4x+Q9BKwvqHA
	 ZJhuF8o1Ya0d6hiz5q7zB8qQUk/P1qsjTYxQBmObpNzArZxYayem7PfoERXEk369170rt
	 LId77yweEBca6eg4RtIyZNrBwkdShCLElyzPSs9b97MyRsj7gl3wtriwvTBgVNG9Wb0vS
	 pedC5OBv7SfnRm+LS1o2xBPyD8ESVe9ZswBhm1ww51UtYeetEmvG3YA+E3ElQBrkdGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E39OKXP7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F9606A32F;
	Thu, 19 Nov 2026 05:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E39OKXP7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795066175;
	b=kjVJXWebTV+Y8a1oi36QW4slGXnMDVxhiLFJ7Beb8u0ih7DHsGm8BZHquZz0Y4H3b8PP
	 KTlu3VEIlrVBl07mnvfebeuHN2DvfmnGQcWcDPwy2NPRDpfVhMBKeEfjdgvCJP3tjU9ZA
	 3iS8rhKWgGDQGEC0SfS//1GHWxc/xGtvXE7XP3YowEIJsInZ5+LqMdLINTljR0zHpHl90
	 FmECrtEPEGPNXPxCByFqshiCKqilejSAGgurVWmt458MiX/t5Ko1EHaHLAL9fm6MI4FhZ
	 4OVndmyCsn2wcXYwaOI3bg2cRlhXYijysD4udl8bU4rxYs6QFJ3RRNHDVARzxO2H4JQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795066175;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=;
	b=DLujdHCTAZlYOKn9LTwkhcx4xDfHWpyCTa4Q4MN8kexhfihrw34B2DbvzKEVTH9R3jcp
	 mwRk8L6xjvdrQZfxTJTI51x4yGoRRIQi1Se4MIB9t8Ux9Ghd4zs5YIl9GKLNYfTPyQIDF
	 hJTeMnZZvnNYNOW0U5CpHXP9vUuH/UfDQgIvxF817WQRvX+VWDh1rqGzpYAm+qP+hzYGN
	 dsiB23bFKnvxrT5+0wPLBIs93GyTNjTl1uEz6j6gK8KqrYa11eWh8CrtsTAvgj0NfjNV9
	 vt+U7wMCmLJzS2y6sghkxjZcOgrlOqWPdxgcYDeklrl46fOkx4zqVsmzWT6tsESmH+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4A6F1F000C4;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795066175;
	bh=FdgDfWHn+CQINgL4Pcimx+RwFaofGoA3my9IfcCmuK4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=E39OKXP791VOkK8vo7vv7/q3AExhRKG1LmcDYCg9TV7jd0lSt7JiCy7kmKB+T1X5l
	 9bKGdpgQh2NTKxCJo0gqSfOtivsz+W6rW1PAtyv1mBmA14AKwQhi3Q3nxx3CcUhq9b
	 YmtqMcCgZWE6Z4J3e8HgSQTqxaL6JTivJxdui9O5an6EPZHqzdaRUGwfgWAzFPJuSf
	 IcsxJ2pXJntEMZQT5MGDbpscS/0IkNdnKc28ECIn7ysKeSWUu2Rqy5UummoFZiYPjV
	 YDUIGbeqpJ3CvhRfB4Z3MOJ/1BKXAwRiuPJrKO54k98DX8us7sBtmoOuycGyte1Gwh
	 zT3NHDYbwiI1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 118BB4B0F0;
	Thu, 19 Nov 2026 05:29:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: allwinner: orangepi-zero2/zero3: Read
 the SPI NOR over two lines
Date: Thu, 19 Nov 2026 05:29:33 +0000
Message-Id: <20261119-zero2-spi-nor-dual-read-v2-0-185c87065e39@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WPQW7CMBBFr4JmzVS2GycOK+5RsbA9E2IEcbCTq
 C3K3WsC2y6f9Of9Pw/InAJnOOwekHgJOcShgNrvwPd2ODMGKgxKqFpKqfGXU1SYx4BDTEizvWJ
 iS1hX2tbESrORUK7HxF343sxfpxfn2V3YT0/dO5H4PpfK6RWD0U6+L4Wl3zhZadE2JDqjW9aOV
 OO810IZEq3U3aezlSN4qvuQp5h+th8WuZnec82/cxeJEp0n77rGaMfieL7ZcP3w8QandV3/AFC
 vskkZAQAA
X-Change-ID: 20261115-zero2-spi-nor-dual-read-645a6de25e81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795066173; l=1665;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dSUlrtuj/XZo8LVxmrqcGVmatGiczTvRbXzsTOXBhPM=;
 b=p6DGgixcbBrVaXI7ubEA+MhLxvzD4Dcd9aRiJTYGBG7qLklgmmtb9PJolIxZuNYvkR4bst+X4
 fdvV+6DSPb4DvykJXBJKX7CCREZBaoG/ELg1mT5uhdZUjIAe9pTTaem
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

Tested on an Orange Pi Zero2 only, with [1]: 1-1-2 reads (opcode 0x3b),
two 2 MiB reads identical to an earlier dump.

[1] https://lore.kernel.org/r/20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com

Developed with Claude (Anthropic), which wrote the patches and commit
messages. I reviewed them.

---
Changes in v2:
- Label the flash node, no nested &spi0 override (Andre)
- spi-rx-bus-width moved to the shared dtsi, Zero3 included (Andre;
  he read 16 MB on a Zero3 in 1.8 s instead of 3.5 s)
- Dropped the driver dependency (Andre); the binding is still needed for dtbs_check
- Link to v1: https://patch.msgid.link/20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com

---
Arun Iyengar (2):
      arm64: dts: allwinner: orangepi-zero2: Reference the SPI NOR by label
      arm64: dts: allwinner: orangepi-zero2/zero3: Read the SPI NOR over two lines

 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi |  3 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 10 ++++------
 2 files changed, 6 insertions(+), 7 deletions(-)
---
base-commit: 90e0d3fd460ec365617982b56bd7ea5179b36197
change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


