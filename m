Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794974159;
	b=f/8nYfu7ot3NyQXrFKgjq/NqqoVv8PPEtis7ZXsN1FIisAeXQgj0yLudOrL4BrlY7iWN
	 HC4gciRYoln5A4C/aPpwqbObLXurhUqKyWJ8Noc6lo4SbwZclyYbFxDMIFsrwsb2T6XRg
	 QuegP50F8yWy0PT7NlXFxq0RKNkfiudA3cpXtgk9/jzrVaWvnLeA12/cw3CiojO9roxnN
	 zVKnXMwAeUTkRe6GSXtIo8anKfwDihtGbTKk+EackADJ0zo008FYV9P9bVd2xg90v58Hn
	 e8q5c43voNP6pZU6WrUyNpzW4JICnjC+JZ+hyZ7EwJp/iND5OzBI0ZFmgP1JHQvnf+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974159;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=;
	b=0wXENcYXqfGZYs3OIyRCYdnXWdCeh4+ZMYEeKn8GZQkZ5EAo8HAOKSxFQEr/b4sQvngG
	 2/sPPvrOzDkE7ahssGK+VLw4Duck7N3aYNE2akJEbk4xF7440a6O8N+K+BlHUiNzLFczi
	 MFRfqHwK9gLW3EUjtiacnuCQc/rTu++ual6EFexGZx3ly0vMK8a6+fLZYKvNj7kaawyh2
	 Zy8qiXYinpB8Rhp3iFthJcCy/oxdRpnDK6YPNHP5Sm2Uao5pv5ZXX5JGBiFRdfTIjdKMz
	 yEvf4o7lieXLO9W+MsxYeqO5T6dYpkpLwLE2nMYGsfLIev+HiOWtBNR4sWxbNFqLpFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAmuvRO0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F57606A31C;
	Wed, 18 Nov 2026 03:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAmuvRO0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794974159;
	b=e5/YsxtSAl3YhMrSk/wd+/C1calzNb6HU4kcdBTEw0T6fN/n6Ld05xcMYq4wsLlzsESQ
	 fOTAeCzDqbFxqKL9p65Ad7VQsuT+4elu/gQy3nmEwlIs0RBRpRoxBFIEVzqa5DMAb7PGe
	 +euaYePlHVNxsjzEAIS7Ot5W/f5bhGz253349hf8Mhqw1zL1AWic5Sc3FMPzSaHaqbcsl
	 GV4VMfnxDC3sdPIzU17iceN0bLFbm1IVvCp0rHDAbPQno/ExGwwvG3hlWXZj73f+Up21/
	 TRDs1PnDlpcDLfhmcfag3WZmuKAoqR8fbD7B1ECU2FScrSpTvOhJVgEguUopq3bkABQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794974159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=;
	b=dRWmT2hgPQ3Vdq4/sLXS97Zgelcdzfd6AWBy8PkL7fBuWEVf30PSylJ75sm7ZEfujPPj
	 LE46RleWXV9koiLe83LOCRU3JQUjYO9cKUM2QpA1KDqe6deMkYFCSm6v4dMfgRT4Ruc8b
	 1xCOAH21SWxO+1ZxpwxPk9C8UdGF/YpQdjDl4tA9sOnbjGoZ1jmyfnWv3oKAYpK8xb5b0
	 6g5C5Q/PLDn301hR41HXAEZlUddCzezZfmKayDcPhKjCAekDpt9Urfuka199owAwTcoN2
	 +v/QIjERjsg7llcKW+kdRv+d2/lAmbvGtbjUA4UVtLbqTa+vyb1aITrnv65X/BXB+2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B611E1F000C4;
	Wed, 18 Nov 2026 03:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794974159;
	bh=W1b/vpjXN8C9t9fKqB2jfvx8t9qyI65mD8KatIp/OZo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=aAmuvRO08r3U6fKqiJ7cc2J1yxMP1Ryniv4w1vBwYsCVeYL7yAqEcB23m5Vk8Qecy
	 XFom66Fk/Mf0oyW5CFUe2OrvUtLtnP3+Ukug2mcD2EDiMRAS2Viziw7YqToUndfoh+
	 QHBA6SyWSjUc8Xx5g1IadIEjoZA3uoY+bUavSsg0AyL6W1DRwyW6KgKa3n5RDimqEd
	 26Ixos3Fmln8nIhikMnQKxi6vyiTZrrtxcD13c4hAwGfClrQeOXpOhwqf5Xe4S6lVh
	 Wdya5obP77t9TSA138bZT7PPml9f+FmXIsyp0ZRuIYBHf7NFtE7Ui4X5+Fh4ao2IGd
	 5qsQswfw5Vgdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 154384ABC9;
	Wed, 18 Nov 2026 03:55:58 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 03:55:58 +0000
Subject: [PATCH] arm64: dts: allwinner: orangepi-zero2: Read the SPI NOR
 over two lines
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
Message-Id: <20261118-zero2-spi-nor-dual-read-v1-1-bcdcbf785be0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNUQuCMBRG/4rsuRvbyBUS0f8IH+Z20xvpbHMSi
 f+9pUKPB77vnIkF9ISBFdnEPI4UyHUJxC5jptFdjUA2MZNcKiFEDh/0TkLoCTrnwUb9BI/agjr
 kWlmUOZ4ES+/e453ei/lWrhxi9UAz/HTbwuMrpuSwzliLIeglWWTnraiWVoidImhUwn9ylMABu
 VEKq6NAya91q+m5N669sHKevwbesJbdAAAA
X-Change-ID: 20261115-zero2-spi-nor-dual-read-645a6de25e81
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794974157; l=1356;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=azsGory18NjrLZMbFK+fhx8bhUeiwb0w4jtTyXOp1s0=;
 b=m180m4A6WLT+kJyz23ClvGlYswZxgc9As93hAgp5fKtYXJeB/FchFqqzONmKShqEBxtX3Pvm7
 5EFnJiBr/UxAFBEGtfj77F7geCTkl7SG03XkW5QUEsvFcmgngCX6CKD
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

WP# and HOLD# are tied to VCC (schematic v1.3), so read over two lines.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Needs the spi-sun6i H616 dual read series v2 (prerequisite below).
Tested on an Orange Pi Zero2 with it: 1-1-2 reads (opcode 0x3b), 2 MiB in
0.28 s instead of 0.52 s, identical data.

Developed with Claude (Anthropic), which wrote the commit message. I
reviewed it.
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..fb117116002e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -150,6 +150,7 @@ &pio {
 
 &spi0 {
 	flash@0 {
+		spi-rx-bus-width = <2>;
 		vcc-supply = <&reg_aldo1>;
 	};
 };

---
base-commit: a203a4bac3316451a3036653657c8b250dea2055
change-id: 20261115-zero2-spi-nor-dual-read-645a6de25e81
prerequisite-message-id: <20261116-spi-sun6i-h616-dual-read-v2-0-e0c66eb71e20@gmail.com>
prerequisite-patch-id: 28b145097d0f859e5bd27bcc5028d0915f3ba4bd
prerequisite-patch-id: fb47570beb53613acb42c518fd1999e05e0c54fb

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


