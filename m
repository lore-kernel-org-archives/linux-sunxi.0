Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064141850
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 11:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BBCC341C7;
	Fri,  1 Jul 2022 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656674538;
	bh=XxlRUcinEAqBch/oALflCn9OXLkwVg0GTBOpqUzfbaY=;
	h=From:To:Cc:Subject:Date:From;
	b=qlusTiyuI4OGV4DJKvom3hx20veQE6xGax034dQhRPsD2x2Uw0GYcJFJvTfWFhXVx
	 X4faYUamMmYgYJhoGvWd11t/66iJcMafoemkY+yHR6RS2AmseNM5HHkgXxHrZwxzT1
	 NY4EPHGcHQe5UE4xuLWYPunF+H9egOmRmDZ6NrXGMb4g1n2mkt6YS945irQRQs91gU
	 0aa2beKDkG8tIKyFQJDY+W0CxrXnYWljAViyjAOYrBD6tLVS9hf4Lxa3tZYD91E6Kc
	 VsvRyCSGK76NIggNKcTpexx8fLyYUqgcot5o38oTxoSN0ijlYWg6rr1/AqvMxD2ga8
	 LtbVAKDur2ReQ==
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	jernej.skrabec@gmail.com,
	wens@csie.org
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable Allwinner built in CODECs
Date: Fri,  1 Jul 2022 12:22:13 +0100
Message-Id: <20220701112213.1765599-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; h=from:subject; bh=XxlRUcinEAqBch/oALflCn9OXLkwVg0GTBOpqUzfbaY=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBivtehFeOUVerUdHj0Oj+0IAPFMyS5Mr+S0w84wcWj DL0TtUeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYr7XoQAKCRAk1otyXVSH0BXxB/ 9RjE+P5Osc3QwilTbQQ2MOI2+Xz5Y9BLrk+pjU0epPXS492+sB6pId21GOaKd2fuY2HbSulvyr1QDi 0+tqXqYMqwyMo/QAlJmK1gvjngsuyDT9vvcHbA37wON8z/36VNmm5DTgHNh1oWHndikp0gS7ywFhYc 9efJ80Bx+5qr6RrCRQZi4M01mbBfrfeEcNdC4oQ1Kj0urazizIOvzBsF10pLJGOSlLzxXkPwTAOLsO soKTsZGk1QOQF8j3qKfZLH4lkyvxTwnXhjdT0sDnbGdUeXk1AsnsgwtkVFGFY6QeoVLCp4dssZpqCu 0a9+wXhm6nYm3vNIrpJcD/Kjmh6rfD
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

Allwinner provide an audio CODEC as part of their SoCs which is used on a
number of designs, enable the driver as part of defconfig in order to
improve coverage of this in the various automated testing systems.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1a3954948b56..9d6ef3656e4e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -808,6 +808,9 @@ CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SUN4I_I2S=m
 CONFIG_SND_SUN4I_SPDIF=m
+CONFIG_SND_SUN50I_CODEC_ANALOG=m
+CONFIG_SND_SUN8I_CODEC=m
+CONFIG_SND_SUN8I_CODEC_ANALOG=m
 CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
 CONFIG_SND_SOC_TEGRA210_DMIC=m
-- 
2.30.2

