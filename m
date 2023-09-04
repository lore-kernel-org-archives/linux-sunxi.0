Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC954C2F2
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 16:16:41 +0000 (UTC)
Received: from v0.lan (bband-dyn191.178-41-225.t-com.sk [178.41.225.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7DE5B1F963;
	Mon,  4 Sep 2023 17:57:05 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 04 Sep 2023 17:57:01 +0200
Subject: [PATCH 1/6] firmware: smccc: Export revision soc_id function
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230904-cpufreq-h616-v1-1-b8842e525c43@somainline.org>
References: <20230904-cpufreq-h616-v1-0-b8842e525c43@somainline.org>
In-Reply-To: <20230904-cpufreq-h616-v1-0-b8842e525c43@somainline.org>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Rogerio Goncalves <rogerlz@gmail.com>, Martin Botka <martin@biqu3d.com>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693843024; l=650;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=kr+kQu42jftnzRysfuRliIXntokD55LnjWm0KkOrQRY=;
 b=pAzHKAaWc3uxAZHLFKPmIIe/nbRnKh/YE++nWe15qMHVrrI0vNt1Ph6hE+aFzN+4S1wpRixuy
 C3B8nQmhvtKBDaa/gTX1xPTp4ZewRLtv2es7NWSHg0vT3FkLoNVVVaQ
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

arm_smccc_get_soc_id_revision need to be exported so it can be used
by sun50i cpufreq driver.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 drivers/firmware/smccc/smccc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index db818f9dcb8e..d670635914ec 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -69,6 +69,7 @@ s32 arm_smccc_get_soc_id_revision(void)
 {
 	return smccc_soc_id_revision;
 }
+EXPORT_SYMBOL_GPL(arm_smccc_get_soc_id_revision);
 
 static int __init smccc_devices_init(void)
 {

-- 
2.42.0

