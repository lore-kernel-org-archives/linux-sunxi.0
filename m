Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625A438033
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780489; cv=none; b=GY0trAyymvgnKj5mIryEKGBW2mvshUE61PM/oJ6FaoO0pmbSR+TuStzk28joAMN1VDJv2pP40XqwjyN59lju4KPjOcpiBv4qCC9Ev63NKjb45bbIP7QyrHDbu2ET8bMWhmQzITzJ0PXC45ibTUOxDkA0OUV0sKffzsHm9tr5dE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780489; c=relaxed/simple;
	bh=PVzzc9du/j/IIUtVI0EpD2qkwZbInKS9/yBMHMA5D4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U14aHZoArNkEoKLAM3qrTyl8d8FqbqPmo2gONqm0MOcSEfay4E51szO/vyzaMwqbNmpRdR0/kpv1rFcc9iojZtvtiYhyayxZ+LAkbndOhS2BH3rwNJiHnyzCFj0E06lrEhzFj++Px7IYgUc30bsEtUL5Suw0NlHFE95+im4ZiYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtJwR/Oe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtJwR/Oe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1871718f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 11:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780486; x=1786385286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=GtJwR/OeIQ9Y4K+/Gol+UU7qKHlQwjNb3zyWi/I4GF5ctQbmwdCKfdAoJ4Gxr20oYG
         bYo4yTmpE919XxKGkKoDKAY3d29nIUbgk8y0IzxnWA6J7/oS9r1uyctVGc5Gx/cFzhpu
         lGww94T637QkGzO/KTCGbST3gtj0r6f4WstsQ9R6SjBG4lsrTV9L50e/lVuVNOrcq8GH
         OhXDbRpROm4BDAo9ME7PYFaYf4DgvcN9seUYYdphlKddBozEP0VWMp0212o/UHz51JUD
         AOk4IHYHb0UywPcIZzr/chQaC0ym1ChrbL5G2njBeTabl5Nl4GtBVNT5P9LtAejdbxjt
         C4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780486; x=1786385286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6BWR8dmRaEKQHkFK66ev0gVEIwNsNYFwR9W/SfWvzP8=;
        b=gr39ZlulvsPNEPN3tMtIOw7Utq0GJGTRroJeWhUmweb/wOmiRCAaZMH1KCMvF/AKhY
         jdrYe7Yabj2NMRnVe+VYFxP4nplzE8n7Z/3hKiHxgxpX9WjxN9CmZxsPdYphss9rDwRf
         DGIIujlqKAVwb8S0MS5vkwt1O+6u6lfU/soh2FN9u0uL83R0ypFRoCA4oEo8ZYutRGrq
         BEzfehTJ6ryGFLTy+uUigo5dWchkOjGqDb6jCg/76m44LmNmwTqS1l1tH1d9cmREurJB
         3xLaN9hkfGIZfrjvGZTXAeiq+gvYAjxBijY1S2tg6ttLNpEXH/98cpfCYnHP3vVC+Hvx
         F51g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/oX3DO322I3t8AlnXuSRg/V7VQ5keGLkULfTgrG8rSkdMApnsaqnGhbFpp1vDngD5WcEvpMtCowBERQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw66IQFSvKtAKSeZj72M3H4nHPD71rHwG+J62D9UVyMoYtZaCRb
	PkNwgHXTRnr94QaQ9tjeVT2HTRrLlm9SqlEHwmJYF/1qITqCbNEN5cW1
X-Gm-Gg: AR+sD12ZEuMMKXX8ScimroV4BoxMGVBdHDo7gOaqOqdgsJTaT1zJ3C9/dPSlE0WcYmj
	QDM/QJhN0PyDuF+nMTVc9ECMQQorsU1VjFne843Gs7NYBiqQCm5ePl2noasXdno+Y0Qnr6b82qY
	zTRDAlboBkE8eoVo3jcPe5IQZNVHhlQSKtJF/RAcVEsAXufmlv3xmkdfnyj3GUwBzSMje917jlq
	Q1E/4vQkk/hbSaov7wlOdjaw7LLB/XXOPWeaDtyvi1mAmlSsIdKzzdZB9wRvF4bWxwrZuZqJycV
	JCmgEPjqkw4NltQpj3epnlM+8yZ1D5fKiq1Aq63zum5CaU8K/vjlqMhy7xBsGqDntmAB8rSYZI2
	wqZCOf+zE9HtVAhY3thlrto47ZyjyiG+BTd+hPGuF8fpWvLS4mFgXm2jSue1OtYF4Eb26VusAXB
	8pqN8HrvdgKkWPse6Bt2lIAKlhJn3CAKqxaKOASGM03UBx2pG9IqvfTL82Thh0kVxmWRBQFbXQh
	GYWeYNz3cifUboZaLhm7kNu
X-Received: by 2002:a5d:59c8:0:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd72c78ebmr26973780f8f.24.1785780485932;
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: add GPU OPP table
Date: Mon,  3 Aug 2026 20:07:55 +0200
Message-ID: <20260803180755.288793-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU instead
of running at the boot clock.

The table describes the SoC rather than any particular board, so it
lives in the .dtsi and is referenced from the GPU node there; every
A523/T527 board in tree already provides mali-supply.

The BSP universal table specifies 900 mV for all of these operating
points, so that is the target and minimum voltage.  The maximum is set
to 920 mV to also cover boards whose GPU rail is a fixed 920 mV supply
(the Orange Pi 4A drives it from AXP717 DCDC2, fixed at 920 mV), where
the voltage transitions are then no-ops.

The higher speed-bin points of the BSP (648-792 MHz) are not included:
they are gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix: the OPP rates are only
produced correctly with the cycle-masking divider model.  Validated on
hardware with the Mali cycle counter: 149/199/300/399/597 MHz measured
under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..a3164b5dd609 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -85,6 +85,35 @@ osc24M: osc24M-clk {
 		clock-output-names = "osc24M";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <900000 900000 920000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -121,6 +150,7 @@ gpu: gpu@1800000 {
 			interrupt-names = "job", "mmu", "gpu";
 			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
 			clock-names = "core", "bus";
+			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&pck600 PD_GPU>;
 			resets = <&ccu RST_BUS_GPU>;
 			status = "disabled";
-- 
2.47.3

