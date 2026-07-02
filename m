Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A98D3ABD80
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783028887; cv=none; b=QonTFb+jWBbBQ30IjEKi5KDK4Y5TqWETGjz928UV5b1T9/BM3mvP/17707zuLG3fGVHHeOpbiJHq1XXNAx55+9mIgS57jcmgkjxxE3/kumn5AKRU6vmGLc2MtXRSl3Q1o+7+pcyvX+b0TlWT0tmPuSAgEBc5utZ3P4rNlQqTyps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783028887; c=relaxed/simple;
	bh=GwobjMKNuoBExZjl/NvFuogoEu7HMJewkr2hte/pKZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7c97mEH1Tu+NVEwwc7Sw8AB6A/fG0iVxsO/I35x9lCyJPoVBsRZ8puO3xjcMtSDQ83J9Vf6pF1AC1wDssoD7R8/+8uRpndnchB/og1ir3pDYriwtulUrtd5cENsgJX4BPj+vAbwf/5128rqYLy8Gb6lIDdiHuDoeud0potlzDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8oHXT1H; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q8oHXT1H"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-664ee752958so3124195d50.1
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028885; x=1783633685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=q8oHXT1Hz/O1+pPsNruZI5a0MyAzZcpIylhHwveDm0XfRlncC8x7ljl9KVYn6kBch0
         VFPvcsvYSyLEKEbjXZEKmJBuZCHTBvWJqvXtyrZPMp+rJaDkKbtiVg5hvxwyKEee7BMN
         tfQ6JPoLv1cS1ERMLGqgSB4aP2A2RwWZaxzJHZzCy7AGrFGdsPEv5rS0eDavbE9ZnzcJ
         fFsql+qeNE/cXLSLUHM0FA40w2hm5q4PKEBt074ZiPaLE9snyxUm4/0tVQokliQhvfhG
         kaLr3Wg9Si558impsu2I6Rfum5/WO0GDhxR1HYoJwEOPGcQJU7XknTcOwBQKfCcVut9q
         LZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028885; x=1783633685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TChm7zMrIm1e2zF/qvsCr3qRkxhMbyISPQm5ZZUS90=;
        b=Y5sRiCOosPlKXcLyDM5QhPKefhKpVAjJFvo58cks0KDAoPCuGAX0xbZMRxjJGRbz05
         xSXH1MsHVTD71Jv5fDM2QxjnEjYQnvW6XU2h6/hsLnq6wwyrh/tb2OKyaTP5zAMGCcFt
         zEpBXqnG3z4Hd+ywHnhKaPzb1yu/lYrRwlfBDG3JXmaNM4iJP6Lb7yOeVDtBUYtH58uK
         rJ08aX6e79xE+UCtffvxYKdeUfPRXO45aY6yLvlw5PQ3ZrNuTs4/4toypZRMK/7QjG2f
         cLNfyZ09rOv+Gp8Ux2jvJli+3hzrsres7jDDpfK3s2ifOfR21E3m5JVjGbNYKMiKgx7r
         jJ6A==
X-Forwarded-Encrypted: i=1; AHgh+RoOmZd9WWXIEfifjfnrL3lfMLtau0eao/ez50Q81T6mGsuNmR631eIKjrmUO6ihquJXQmouyHCt2Hg0bw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdyjQyeFJ0IoEpJp43mcagFtxIs6sOBklQNAQU8fVC1txr0TTi
	NuyMydjhaIHHGJ3zLQklQBuOmA7SvsESdbq8/kGAo+/J4vZ3ilDuYEXB
X-Gm-Gg: AfdE7cln3LhTNcpBWiMk9Yj0CAuWA0TFERKFQyZEquBORKMHKHfwWIZYOQX30b4ncF1
	fzrjfaE9oY+Jut4LU6qBDD10w8OF1YeNlfH6VMV2OLwOdDclGjnHEET3pNuELZXuFhZr8uC3eE2
	O513aXQMTMoJRbJEym4impF/uqckdU/FVUwgumn6yklRjRqefzJQ021Cv41ymuKb/58qOAkjL0k
	zmH2tmsW2a3ps/LK9j19syD1zZg07nOAfjIY5dFRIGB17KNEgB5PVfy8umjpRAADj8beATcoQXN
	KFGRNjCSbu16tziD+MuZo/WiOC7LgH+262Vdb5sjHQFYyIlgACQjKKUDy1GKNrrpAwb3GRq9gOp
	17CdwW6JJETXR+7YZ21FZz0klkGIkN/p702ukJIV8fk8a6b4bd/tmIwA5/LrGZrOgqp0VGLX1tK
	clhoNbO4WESBoIzfNwhSEJL+Y2J6yOHd2ROPr0No/oz2z2DEw=
X-Received: by 2002:a53:ac96:0:b0:665:a0c:654a with SMTP id 956f58d0204a3-66521a0c7cdmr9753722d50.27.1783028884812;
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:04 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: a523: add IR receiver node
Date: Thu,  2 Jul 2026 17:47:49 -0400
Message-ID: <20260702214750.3428694-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 has a CIR receiver in the RTC power domain, clocked from the
R-CCU, with its RX signal available on PL11.

Clock the module directly from the 24 MHz host oscillator; the driver
selects a /256 sample divider on this SoC, giving a sample period
close to the legacy 8 MHz / 64 configuration of older SoCs.

Keep the node disabled by default; boards with an IR receiver can
enable it.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..5e46c4b1ee61 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -927,6 +927,25 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			clock-frequency = <24000000>;
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_ir_rx_pin>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

