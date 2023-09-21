Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCB59461;
	Thu, 21 Sep 2023 09:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9DFC32790;
	Thu, 21 Sep 2023 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290278;
	bh=bkP6W776X16wLbLmad7rMe1hUvjvPfczkQjmqh4ND0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AH1kjZSvppoXLQq5eXAhl5ExzNVFOiirzoGWCwMb866XLFvJM+1ObRGiHxqfaG0mm
	 faGRoqEuHfvlRHCuImY60lSsH66vKJquHytXe/1NAMl6S6EvU1t5ftlzCQEtwurHIx
	 t2B/9wz7t1URqo/YoIaxTEegOfbGoCbi42QT1pCoBvnRkmwnSW0LeOthvrG0QpoGi2
	 xj/WgvTsfSI0jApLbAFaO8OXWP7FLPja4AkzRHBt9kW0zjPoW+XZ6/zBAnFgI/gguc
	 dLm91SN/PrJVyuI08V3CWTXZrl20RNex9qmJb/9790h2HdLy9Sla3BLhcIztOC7OtV
	 TXLi0cAw+PnVg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v1 6/6] riscv: dts: thead: convert isa detection to new properties
Date: Thu, 21 Sep 2023 10:57:23 +0100
Message-ID: <20230921095723.26456-7-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921095723.26456-1-conor@kernel.org>
References: <20230921095723.26456-1-conor@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Convert the th1520 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..5deac796d1a1 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -20,6 +20,9 @@ c910_0: cpu@0 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -41,6 +44,9 @@ c910_1: cpu@1 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -62,6 +68,9 @@ c910_2: cpu@2 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -83,6 +92,9 @@ c910_3: cpu@3 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.41.0

