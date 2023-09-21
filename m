Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9B9461;
	Thu, 21 Sep 2023 09:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2CAC3277F;
	Thu, 21 Sep 2023 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290273;
	bh=FSrPmOaSMx7Qkcei56gJBLc+xA1QXErHfQ4fZST4jRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFNT4OwWarwZ2PiwVpoDC3pBw05MsnkzPxAwOMKCzWiacPbcMBUf378pGIlu35Tpg
	 NJiaTDJWWXcF8YMb/Rn14yeTU7/lbrtDTVoyA7UK+2jTHbnAzK3J1X4GrLAXXzdqLY
	 it4DVEtTcw4miParWFmG7wKCMCse6xdW/87WfLznwWicKSAUmLw9DYxgInS98lz42A
	 DwKVzb59UCkho/r02fF9kESGSnjJjEdOgV+/N2ljSATpb5VAYbqufQFaOFR36gvTmB
	 CxEJK+MSypba7dfr1+Ev6GZ6qx7LChqhQBXAeSXxBbl4oZTr90lQ+rYPQBs4Uov5OQ
	 B1kwlUb39nQGQ==
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
Subject: [RFC v1 5/6] riscv: dts: allwinner: convert isa detection to new properties
Date: Thu, 21 Sep 2023 10:57:22 +0100
Message-ID: <20230921095723.26456-6-conor@kernel.org>
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

Convert the D1 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 8275630af977..6b721172390b 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -25,6 +25,9 @@ cpu0: cpu@0 {
 			mmu-type = "riscv,sv39";
 			operating-points-v2 = <&opp_table_cpu>;
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.41.0

