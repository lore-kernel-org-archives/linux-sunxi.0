Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093043D7F
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Aug 2023 08:43:38 +0000 (UTC)
Received: from v0.lan (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B0A2C3F434;
	Fri, 18 Aug 2023 10:43:30 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Subject: [PATCH 0/3] Add support for H616 Thermal system
Date: Fri, 18 Aug 2023 10:43:15 +0200
Message-Id: <20230818-ths-h616-v1-0-0e1e058b9c7a@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMv32QC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0NT3ZKMYt0MM0MzXXPzJKOUJFMzUyMTSyWg8oKi1LTMCrBR0bG1tQD
 4NbNwWgAAAA==
To: Vasily Khoruzhick <anarsoul@gmail.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin@biqu3d.com>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692348210; l=1200;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=oPf+y+X9G61ZiyJ0sWXCSR3pYFSNT3sI7CxnPTuVGUk=;
 b=CiPh4dzgiTuqa3g7g56zD4Z7eL8tPj0JiSuc5fl5HtJB6DB+t5+GrUBrD2B22CSKZoTyMO9H/
 nVu3pUsBIwgCNGIBjwFE6qv+d56vJ7GTum4m0uTkjeC3Cd/9FC4OWXy
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

Hello,

This patch series adds support to thermal system
found in H616 SoC.

There are 4 thermal sensors in this SoC.
One for GPU, CPU, DRAM and VE.

Trips while unused for now until cpufreq is implemented
(WIP) are required by dt-bindings and thus included here.

Cheers,
Martin

---------------

Hello,
Im very much not sure if the trips should be included or not.
Since they are not optional part I decided to add them but
please let me know.

Cheers,
Martin

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Martin Botka (3):
      dt-bindings: thermal: sun8i: Add binding for H616 THS controller
      thermal: sun8i: Add support for H616 THS controller
      arm64: dts: allwinner: h616: Add thermal sensor and thermal zones

 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml |   3 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  87 ++++++++++++++++
 drivers/thermal/sun8i_thermal.c                    | 115 +++++++++++++++++++++
 3 files changed, 205 insertions(+)
---
base-commit: a25793039a9cd5ac67d38a86dd2eb414abb93aa6
change-id: 20230815-ths-h616-77b2db565249

Best regards,
-- 
Martin Botka <martin.botka@somainline.org>

