Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3ECA46
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 11:41:41 +0000 (UTC)
Received: from [127.0.0.1] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4168E1F554;
	Fri, 11 Aug 2023 13:02:51 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Subject: [PATCH 0/3] Enable Security ID for H616
Date: Fri, 11 Aug 2023 13:02:33 +0200
Message-Id: <20230811-sid-h616-v1-0-d1dfc9f47b19@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkV1mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0ND3eLMFN0MM0MzXWPzJHNz41RTS1NzQyWg8oKi1LTMCrBR0bG1tQB
 FWm5MWgAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691751771; l=1045;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=6xJkidVHp8SgP6L0h5BYyWYG+hDj5KF//REwfLnI3r0=;
 b=5jqqhjU/LGVi1nZGPfxt81TytjWNxhZABFvjXNfDFjo8ngJD4m7jdeye6PsNREejwOEY3tT0E
 uQ09mTTF3a7B1BfJIUZwY3ULYPuZAnPN1VJuYPrGcos4j4IEWYoDzbR
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

Hello,

This patch series enables Security ID (SID) support for AllWinner H616.

SID support is an requirement for few things:
    - Thermal sensors
    - CPU Binning ID (cpufreq will use this)
    - EPhy

This patch series doesn't add support for the consumers.
Those will come in the future via their own series.

Cheers,
Martin

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Martin Botka (3):
      dt-bindings: nvmem: SID: Add binding for H616 SID controller
      nvmem: sunxi_sid: Add support for H616 SID
      arm64: dts: allwinner: h616: Add SID controller node

 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml         | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi                     | 7 +++++++
 drivers/nvmem/sunxi_sid.c                                          | 1 +
 3 files changed, 9 insertions(+)
---
base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
change-id: 20230811-sid-h616-37b773e59571

Best regards,
-- 
Martin Botka <martin.botka@somainline.org>

