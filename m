Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F004826ACC
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 04:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746892; cv=none; b=rvXO1aO42qfNEyyzjezn+DWf5hKWTLP9G9sJbDWZhxKuc7n8UmxOHB8W1O62FeAmlbEfjBeoVHSZHxCXQiUXz8uLEeL29uCD2zOzNwpxhQrpXpOCgTHx+bIQvzvA2LHaYjdiFzwMz2zrUmClPt0ESsqTJ3yHmHXbHrmiUhODI3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746892; c=relaxed/simple;
	bh=HQ8gi3qkGDAytzDkMpwdgUvUWfOgiVivh5rYb7fjdrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CDrwlg98L2ZnL/Y7QTOhM2TgcoBfSNYxOUkRCDWMV6BqfBoApuLdFUNRrHXRhthU0RSoZg5N6VnF/Y0gC/qTvQzhD+Rm2976mD9Eopt6Xhl4IvfIBl2wyFYKvqcHZR2SCvYe9nISe/DWm7T1f1i7wmKkkaF2PtOEkSPuDHIP1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofovo.local (unknown [116.232.124.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E8773342020;
	Tue, 21 Apr 2026 04:48:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Apr 2026 04:47:50 +0000
Subject: [PATCH] spi: sunxi: wait for TX/RX fifo reset done
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-02-spi-fifo-reset-v1-1-e2cdd4bd474d@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAHUB52kC/x3MPQqAMAxA4auUzAba1B/wKuIgmmqWtjQignh3i
 +M3vPeAchFWGM0DhS9RSbHCNQbWY4k7o2zVQJZ6S2TREmoWDBISFlY+kTr2g/OuXX2A2uXCQe7
 /Oc3v+wH0nO7WYwAAAA==
X-Change-ID: 20260220-02-spi-fifo-reset-25e371314c3f
To: u-boot@lists.denx.de
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=HQ8gi3qkGDAytzDkMpwdgUvUWfOgiVivh5rYb7fjdrc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp5wGChkbAlN8OK0lV/mPLuSACAPd5BqFV5zmzk
 BGA+AoKQdaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaecBghsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1x0Q/9HaxhtYzaHKO+PAlwGgyrBOrOKnyX2nQ3WozR0ltqr125Hau+SRAPq
 9OCVmvKUpxbmx6IqB772GfabuVrr9F7GkRL1NHRCCB/gdj40B408YzYRc1vsK/4/xDlLEvEyZx4
 9yEuMHvlrJCqACl9zfGVFzCHxurbmxWhIvo2O25DqPt+zON0SLB1QHnmZDLSyVn46EOKSAIxI6g
 ltMAucSg6UUKg9AIMbmjg/nJ9EG5kRbRKZcpWvGOvX8hvllsQIOu5W9CYGsheQbrmHdSgOH87Qc
 1y1zp1MypRdmf14BKNYpyUxmpX0oDiw+uD2Y/W7UEiDtsSVueQsnofySASUwRn1ecFx+5Ex3QP/
 l8vjSDWpFxnUIVNKWFeA5tkmRRTdxQJyCXvRtbrJiYeaSPkWxnv9ICEHeoNTRt5DUYFRJydAfW5
 GlYQNOWt1NAQgu92ujg9Z772WNwq4x1ga6jSVwvD/TC+oa2yNk2MGPxCTfGNIhnFCzxHueIHUgh
 4DVMBYgdZmH7OqasNZi+QrUV16BuqFua3xLGW2np9sZOFvaV2djNTXr70fgHoOogKp0S3Pa4Gx0
 0j2gDBVX7c1GJeGh11e1D+t8b14nCxTcDiwzxpPeMRfPqD1A3PrxV45DoYixZgUxp7zD2hvzk+L
 piQzVEb2hRRBPeKLo4cu+1gkjeWoF0=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Once reset SPI TX or RX fifo, the underlying hardware need to take
some time to actually settle down, the two bits will automatically
clear to 0, so use a poll mechanism to check status bits to make sure
it's done correctly.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
On Cubie A7A board which using A733 SoC, we encoutered a SPI nor flash
timeout issue, it turns out that the SPI fifo reset take a few time to
settle down, Add a loop to poll the status.

This was the error message shows on A7A board once this issue happened.

=> sf probe
ERROR: sun4i_spi: Timeout transferring data
Failed to initialize SPI flash at 0:0 (error -2)
---
 drivers/spi/spi-sunxi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sunxi.c b/drivers/spi/spi-sunxi.c
index e00532a371b..cf41905c7b7 100644
--- a/drivers/spi/spi-sunxi.c
+++ b/drivers/spi/spi-sunxi.c
@@ -347,7 +347,7 @@ static int sun4i_spi_xfer(struct udevice *dev, unsigned int bitlen,
 	struct sun4i_spi_priv *priv = dev_get_priv(bus);
 	struct dm_spi_slave_plat *slave_plat = dev_get_parent_plat(dev);
 
-	u32 len = bitlen / 8;
+	u32 rst, val, len = bitlen / 8;
 	u8 nbytes;
 	int ret;
 
@@ -363,8 +363,11 @@ static int sun4i_spi_xfer(struct udevice *dev, unsigned int bitlen,
 		sun4i_spi_set_cs(bus, slave_plat->cs[0], true);
 
 	/* Reset FIFOs */
-	setbits_le32(SPI_REG(priv, SPI_FCR), SPI_BIT(priv, SPI_FCR_RF_RST) |
-		     SPI_BIT(priv, SPI_FCR_TF_RST));
+	rst = SPI_BIT(priv, SPI_FCR_RF_RST) | SPI_BIT(priv, SPI_FCR_TF_RST);
+	setbits_le32(SPI_REG(priv, SPI_FCR), rst);
+	ret = readl_poll_timeout(SPI_REG(priv, SPI_FCR), val, !(rst & val), 20);
+	if (ret)
+		return -EBUSY;
 
 	while (len) {
 		/* Setup the transfer now... */

---
base-commit: 88dc2788777babfd6322fa655df549a019aa1e69
change-id: 20260220-02-spi-fifo-reset-25e371314c3f

Best regards,
-- 
Yixun Lan <dlan@gentoo.org>

