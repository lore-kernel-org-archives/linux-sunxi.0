Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BD168D6
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Oct 2023 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BQ1FayhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696844678; x=1728380678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wwhojQUbiO2yCKXGlIk6MkgUnx1T4dUx6yrnvlKxZgQ=;
  b=BQ1FayhYPCYKh/CKFBXxXnpz8KldzSt0wc7OG0BtO6GPxGe6ocEsiraQ
   EsqAAEA3ekQbSaxYw9aKWOP/iE2sCeiPoDxlum6nFaCwoOn2r+1+BSvfr
   j9rz5d5XHQyRIGIRCn602+O391ZMaIq7RJ4G8dEvzKT9FViFO7YVAh9r2
   gONlH8Zn/wePkOth0xJopS0+LmzjYyS6IKg4MQ8dTwrGXn1upczxuoR7V
   3EJ8ARq51qmptMzwlRVTShJDDxDjtFAlXfheGZWg0npVBjsZqSnUY68Fn
   OqtDilwEsY7jNmwcEXoIPV4Z7j74MIaQ0fPhlSEg/zl6Dw/9M6toqhMYQ
   Q==;
X-CSE-ConnectionGUID: 6C+wEfReSDOSi5pQtrvDyg==
X-CSE-MsgGUID: oHjvTt4pTpOLnmqcgFgL9g==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="239927172"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 02:40:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 02:40:01 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 02:39:57 -0700
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
Subject: [PATCH v3 4/6] riscv: dts: renesas: convert isa detection to new properties
Date: Mon, 9 Oct 2023 10:37:48 +0100
Message-ID: <20231009-smog-gag-3ba67e68126b@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
References: <20231009-approve-verbalize-ce9324858e76@wendy>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wwhojQUbiO2yCKXGlIk6MkgUnx1T4dUx6yrnvlKxZgQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnKJ1/d3VReW7lwhcfHSidR9XfnNy0SuDvpwu4erxfGlf6c G15rdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAie+8yMhxZVZxof7RbRiKZd9GiG/ fmzffZMnf2a1ndu21XWGqu8a1h+Kd58vfCslefNX8Ulzb1386Z0Jg2l5l7lsN1y7KsuSqvkrgA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Convert the RZ/Five devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index b0796015e36b..eb301d8eb2b0 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -24,6 +24,9 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			status = "okay";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			mmu-type = "riscv,sv39";
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <0x40>;
-- 
2.40.1

