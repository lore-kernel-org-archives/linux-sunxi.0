Received: from the.earth.li (the.earth.li [93.93.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DDC33C8
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=2COnVUhCv2957C7fTDHBsryoM8/YnEOqvfk39Jdftuc=; b=do7SGz9Cr3MmTzP8vLQF9sPuVI
	j+7XcWX/kSj9pRIYATqElntQDDE1iUCI7UzgczwG5/DKs6pLCyvf4hW7wMCsDvMHvrZMk9UVdLgyp
	U6sv1jykLAkW2GutPHciFLu2S8sNH1IURJnKhe9IBWlZPaU8gnbDfCGacVIj0YFoiPma/x8Wo3pk9
	6qU+Ze682mf9DJuSqKBZCeTctlFxAGVH5vI5M9aVb//ggV9Y9f7mavwdPkqaQsG1jCdDkEUvsRQQ+
	JTbA76JJLjCnUJEYrppuUTW8ZwDQuXFmfjGHNUhWcnQPXC+R7WGvHdv5KfppJI0qTG1HAWl5wlE/Z
	F243Qz6g==;
Received: from [2001:4d48:ad59:1403::16a3] (helo=earth.li)
	by the.earth.li with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <noodles@earth.li>)
	id 1pnjyT-00FJnr-7z; Sat, 15 Apr 2023 18:46:09 +0100
Date: Sat, 15 Apr 2023 18:46:03 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: sun5i: chip: Enable bluetooth
Message-ID: <f26d11e613df7bd55822ff3fb7689e36bf9e4f7a.1681580558.git.noodles@earth.li>
References: <cover.1681580558.git.noodles@earth.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681580558.git.noodles@earth.li>

The C.H.I.P has an rtl8723bs device with the bluetooth interface hooked
up on UART3. Support for this didn't exist in mainline when the DTS was
initially added, but it does now, so enable it.

Signed-off-by: Jonathan McDowell <noodles@earth.li>
---
 arch/arm/boot/dts/sun5i-r8-chip.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-r8-chip.dts b/arch/arm/boot/dts/sun5i-r8-chip.dts
index fd37bd1f3920..4d72a181d8aa 100644
--- a/arch/arm/boot/dts/sun5i-r8-chip.dts
+++ b/arch/arm/boot/dts/sun5i-r8-chip.dts
@@ -255,6 +255,10 @@ &uart3 {
 	pinctrl-0 = <&uart3_pg_pins>,
 		    <&uart3_cts_rts_pg_pins>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "realtek,rtl8723bs-bt";
+	}
 };
 
 &usb_otg {
-- 
2.39.2

