Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5B9A952
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 13:42:20 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn191.178-41-225.t-com.sk [178.41.225.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B79083E8D0;
	Tue, 12 Sep 2023 14:25:15 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Subject: [PATCH v3 0/2] Enable Security ID for H616
Date: Tue, 12 Sep 2023 14:25:11 +0200
Message-Id: <20230912-sid-h616-v3-0-ee18e1c5bbb5@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdYAGUC/22MwQ7CIBAFf6XhLIYF2hVP/ofx0BbabqJgwBBN0
 3+X9tREj/PyZmaWXCSX2LmaWXSZEgVfQB0q1k+tHx0nW5hJIZU4AfBElk8NNFxhh6hcbWoEVu7
 P6AZ6b6nrrfBE6RXiZytnWNc/kQxccAt26M2gsQNzSeHRkr+Td8cQR7aWstzbemfLYgvZIGrTa
 Y3wYy/L8gX1EPOG4wAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694521515; l=1292;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=Q9HjgDMsh7vGJ2uw4LwtOwmK0z2XVC6Zo5SjT4BsHUM=;
 b=ua942KJ1WpOC/r7v5x3PKT7CECoBAIxK7bH9aQVgI6j6iQAnA+vkNJy618Vcj4aqHy6Nn4ksF
 M/pnUOefIwYAC1veyAOVIig4fZPClIMrynj6JusyIfE63qjQmWcZeGd
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
Changes in v3:
- bindings: Make H616 compatible fallback for a64 using items and enum
- Link to v2: https://lore.kernel.org/r/20230814-sid-h616-v2-0-0267749b4471@somainline.org

Changes in v2:
- Drop driver changes
- Use fallback compatible in DT
- Link to v1: https://lore.kernel.org/r/20230811-sid-h616-v1-0-d1dfc9f47b19@somainline.org

---
Martin Botka (2):
      dt-bindings: nvmem: SID: Add binding for H616 SID controller
      arm64: dts: allwinner: h616: Add SID controller node

 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml         | 4 +++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi                     | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230811-sid-h616-37b773e59571

Best regards,
-- 
Martin Botka <martin.botka@somainline.org>

