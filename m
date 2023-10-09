Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE2168CF
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Oct 2023 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="j4gKUN1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844678; x=1728380678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kiFiWXf0X7YTKnlUryjTPWfXBjavhZEL7/N/C8FSjM=;
  b=j4gKUN1se4Gs0HX8iERLUD1jsqfLcKALawB4jGEs9gMpKUY097IKfAYw
   peMbtRzFIOgzyJES+cgMFMe7mZc8z/tZl9DCfs8quiipqEQhbXpX2BwtN
   b9MVgeY0MI48p171/Z7ojetjDswBjv77vocsLY6f0nDdcXYJ9mNMDz2iy
   u9PH0latOLYfWAgX1iFzlwD9I/CSYtkCIgtmhRUylSFl0PXBUwI8qQzu3
   8YPuotOZ+97HJWsAEA2NeZ7i89VTnz/h9r9mTY5Ej6rFJiueMlE2XOeo0
   kHlQyxnnke11LZ5KECq44Nc6jBbgg0K0Juloi/Tulqrb6Ncn07V5HN7zO
   Q==;
X-CSE-ConnectionGUID: ExFLQ79KS3SJV7MWrGq2IQ==
X-CSE-MsgGUID: my6VmZ1KS9WOwm6ckdPIdw==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="239927170"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:40:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:40:06 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:40:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.indradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai
	<wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Daire McNamara <daire.mcnamara@microchip.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Chen Wang
	<unicorn_wang@outlook.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v3 5/6] riscv: dts: allwinner: convert isa detection to new properties
Date: Mon, 9 Oct 2023 10:37:49 +0100
Message-ID: <20231009-moonlight-gray-92debdc89f30@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=7kiFiWXf0X7YTKnlUryjTPWfXBjavhZEL7/N/C8FSjM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1/Fr8/WfiFqvXtltb7OSo9vh1wvG72dcC1uScmSyFn7 7O+FdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi1amMDAf5Zr48puEkVbn3lW7x9X MGX5d2nFg9x1tXOE/SueR9uAbD/6TXfJuN37w8UlCSuUPsYuqJXAdDxk9vj7+/9H+jCYfucnYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Convert the D1 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 0856f18dc3cf..64c3c2e6cbe0 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -25,6 +25,9 @@ cpu0: cpu@0 {
 			mmu-type = "riscv,sv39";
 			operating-points-v2 = <&opp_table_cpu>;
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.40.1

