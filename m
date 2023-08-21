Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836327483
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 14:03:58 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E86A63F30B;
	Mon, 21 Aug 2023 16:03:48 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Subject: [PATCH v2 0/3] Add support for H616 Thermal system
Date: Mon, 21 Aug 2023 16:03:45 +0200
Message-Id: <20230821-ths-h616-v2-0-cda60d556798@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMFu42QC/0XMQQrCMBCF4auUWTuSRNOkrryHdJG2YzOgSUlKU
 UrvbiyIy//x+FbIlJgyXKoVEi2cOYYS6lBB710YCXkoDUqok7BS4+wz+lrWaEynhk7XWp0bKPc
 p0Z1fO3VrS3vOc0zvXV7kd/0h9o8sEgUKkiS07ZreuGuOT8fhwYGOMY3Qbtv2AUEeW2WlAAAA
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
 Martin Botka <martin.botka@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692626628; l=1641;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=DJBh216VE8/GQJzrTvmlTLXla05Im/ECScvbd00nu20=;
 b=VRrVoI/qxDMBF10i+PzdqsGwvgJofvviGYIuaLgVX8dIN7c5iUIsRfC596/y9nIZD9cZVWlOF
 T2SjoM7M/DVBaxv4LM+Rg03wL2oOM79ptTMDxUfrx4TVwwtuZ9tXO5w
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
Changes in v2:
- Fix typos
- Remove h616 calc and init functions
- Use TEMP_CALIB_MASK insteaf of 0xffff
- Adjust calibration function to new offset and scale
- Add proper comment to bindings patch
- Split delta calculations to 2 lines
- Add parentheses around caldata[2|3] >> 12
- Negate bindings if for clocks
- Link to v1: https://lore.kernel.org/r/20230818-ths-h616-v1-0-0e1e058b9c7a@somainline.org

---
Martin Botka (3):
      dt-bindings: thermal: sun8i: Add binding for H616 THS controller
      thermal: sun8i: Add support for H616 THS controller
      arm64: dts: allwinner: h616: Add thermal sensor and thermal zones

 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml | 18 ++---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 87 ++++++++++++++++++++++
 drivers/thermal/sun8i_thermal.c                    | 74 ++++++++++++++++++
 3 files changed, 169 insertions(+), 10 deletions(-)
---
base-commit: df6283416a280d17609f5e55388601458241348c
change-id: 20230815-ths-h616-77b2db565249

Best regards,
-- 
Martin Botka <martin.botka@somainline.org>

