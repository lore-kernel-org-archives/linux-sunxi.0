Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCF841F37D
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790535163; cv=none; b=JBJ+ThdYMsQsTTLggPhJmzkTIkEU3vEYU/shClPpfr3erV2vGMi5PnTPwacSO8tziLbuKYC1C2lI9DN3uXL79KHJk6+XVnJqaNQqqgi5KlMWGjiru414uupUmY9fFzChiwKWbAIdTXWblSQ4C7OonajcfBbluFerryhJZ0P6+No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790535163; c=relaxed/simple;
	bh=LZU2UEoJoqXa5uqbCSIGcGZQwGpaf5s9d0O/6M07Sus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lee+ZFTc4QlIs9toraTMRreziHE8fahbgODY5w62Vc1Ta3a0qJV4JuEL0s0MVEI5UjAzva9UZp5vNb+YktqUaRLOPx7t6zXfUezprX//e4bXouCpmIR9+/fuxFk07XnYPNGsJNjMQJfWobN891A0NfpBJcgqiAxeDpytvvZvnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIYiE8iF; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIYiE8iF"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-494ab4d6128so243379fac.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790535156; x=1791139956; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=bIYiE8iFbZu2zVRydOMNAeDcnWsAmosd5akeCP2rMve1bprVXD3GfDm0b3J0Wm8UFg
         r1zRYfpO4nfZfBUSlTcmV9riEQZjeihwc4MYdPi4UujAQgiCog6g5HC08yDVdvAGnEG7
         7iGpoqv2PqGBOraqxmf6lqI8gBbzG8WIpz8GchBZpD4ltDV+B7k4Mk9TSLISvpy8ChJK
         MBna11HGxEEMN77tyLnw19Yc7iLjyUMxus8+SxMDZlCocGbi11aUEYXp9t21HMdnAB9s
         1H71m1z6GieL00KhoCoa1S9bRLo4GhWTHXjE/RkkgF30O/FesXYjD+kvGMB5wuUwqnpg
         JqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790535156; x=1791139956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU4yKGQ6L9A+Mmj7ksqDUcZd7jKkYCDxeCg2XUTgNgQ=;
        b=wLyIm0rTeT8sTGHrHsMFC619XxnwcaMidCRIW5mnMLZinRBm9UofGB2H+Gyjdg238x
         BAfBmo7vQqQFUPhRlUe7naOz5Sq1lk2r/35YVNCWjd9cDiYN7jMKi1hJNmN/7Z70TSCc
         1Bl0+4Tdlx3ltX10ODOl6U0OiRqMfpxI3TtOSS7ac3VuW8EuViRaC1BMhVQ9aDVZHmE6
         unDfE2h/OzgFwUTHuocJ6qR3WSFxvyflp6hzjeuSA+J3AO9I175SoTmWZyfpSF2ohGco
         8rh1830tZ3OJSTprTp0yCx9BMSRHRC5m3MPvk0IJ9eFO44XZyiNwFyJrEVW1RvRdQFYp
         Kw1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCei+M9TJJ3fPUhf5Bnv4DUOmdmxm61Itu2gx7IosmpLzX1HYHK5/ZuS8pK4sc9k6h6HKcYmVnx+Hrww==@lists.linux.dev
X-Gm-Message-State: AFuF++kKMh0kYrvWgpFy00uLBQybk8vDFNLg9NOXWYGYhkiGZ8nIqSI8
	1d4g5hSjjqHGrAvsRbU8ieXWGkZ1YeBaiWvpyXxgx3wqJXLqNJA3xG2L
X-Gm-Gg: AYBFou3ISEkTs/tx8wsk2006mmoZTT3Q9+Ud2A+4Oa5B3CfflMtqV211wHgWfvOD2GG
	rVFYVFOLxA/lp3nU2f0VCeFvaCzsTHQ3RT1as/GtqrbkOru4SRljqyhyi+Oa+1ebvmOyfnO8T+N
	dOEFBdVXaYC+OMdJDI3tv9Z78Uozpf8FOuCOSG2TLOhJzO4NIC8EEIvsRhcJd7t12h0Bp4h6qCY
	f4rABD1Xi59dkKv8OJN9m7tcLfCRm8LgvyxOBHSnn51p75p5wJlBeghsxqCBZdhIDJHaHlyuq6o
	NvmTh8Lyn8U6JiDYDw+HgNZxwEfEVG9kAvUp50xr4cqmO1pygdm68cnRBzi5dJtTw+5EQpq+o4O
	ZOjySoGBNX74o8teKlszfZo28oAIlLzN5VTfPB8DBmGMDGnpaOB/wugHxGS1JMp8eqt6avB8s5X
	ajZeahYZFgm5GtfjCNTob/vlyjCV2fll4nu3H+rnDCnBV/rknY0SCP4unMWXDCg+R/LSbWMyv06
	3qn16u66KKBvgWHbt92wMAKpx9rGk7ganGg4t7IxZhSNboZHD2/lPDMLT0uzwBOzTHKL4aCc1fU
	HnvdINON6us6rFv/+/gJn7SsTsjQF/Zj9kGHDQzvgZOIWB7wERacN1gvHk/mfH/xbw+1nNXtVFO
	JilHVZ3NGO0ZGV3iKDAPC
X-Received: by 2002:a05:6871:1d2:b0:47b:dbb4:7cbb with SMTP id 586e51a60fabf-491e4f73b4bmr12418319fac.14.1790535156264;
        Sun, 27 Sep 2026 11:52:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-494877590e5sm4489452fac.13.2026.09.27.11.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 11:52:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 12:52:21 -0600
Subject: [PATCH net-next v6 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-h616-emac1-v1-v6-3-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-0-e64971f4e414@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: Alastair D'Silva <alastair@d-silva.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC uses a separate system-control clock register
and supports only RMII at 10/100 Mbps. It connects internally to the
co-packaged AC200 or AC300 EPHY and has no external PHY pins.

Add an EMAC1 variant using the dedicated register and enable only RMII.
Leave PHY initialization to the PHY driver instead of using the H3
internal-PHY controls. No RX or TX clock delays are configured for this
RMII-only variant.

Co-developed-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Alastair D'Silva <alastair@d-silva.org>
Tested-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 5691da796454..47954537b29e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC1 clock register @ 0x34 in the "system control" address range */
+static const struct reg_field sun8i_syscon_reg_field_emac1 = {
+	.reg = 0x34,
+	.lsb = 0,
+	.msb = 31,
+};
+
 /* EMAC clock register @ 0x164 in the CCU address range */
 static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
@@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_h616_emac1 = {
+	.syscon_field = &sun8i_syscon_reg_field_emac1,
+	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
+	.soc_has_internal_phy = false,
+	.support_rmii = true,
+};
+
 #define EMAC_BASIC_CTL0 0x00
 #define EMAC_BASIC_CTL1 0x04
 #define EMAC_INT_STA    0x08
@@ -1281,6 +1295,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_a64 },
 	{ .compatible = "allwinner,sun50i-h6-emac",
 		.data = &emac_variant_h6 },
+	{ .compatible = "allwinner,sun50i-h616-emac1",
+		.data = &emac_variant_h616_emac1 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
2.53.0

