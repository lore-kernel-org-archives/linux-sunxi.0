Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140ED20F88
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Jul 2023 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1086C433C8;
	Wed, 12 Jul 2023 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689182417;
	bh=3gPj2OLmTQiKQXAQaSmLuzHQbyixVTI9hSntm0pe89c=;
	h=From:Date:Subject:To:Cc:From;
	b=S/8oTBEQaVAolENbbe7Jf9UDWVskfQYIgG38pt/JjHUBsc5xLqN2jhbv2YJrJGuXL
	 zHII+fYTNpd5+9TSUEdAJqt132sxqFvOyLhwPfsg5NK0oEU+D9MGjIjqWLak7Bo7LO
	 +6/qU084uj6npi5eDboG6VpB214VFUxHHjQfkt0ZFfSZ0jprWmvFi22Zgk8vkxmSXJ
	 apghrB6KVousvQl/aAxNU4sWQH7U0BunuKUqchg5nOofTCBQR/mi83z0DweuG33Ip4
	 XUIcGBPV+HLTLzk+H+Cvxtvnm+JRHp1KEsAgK/M1hfFV/D9PCir67wEhCi02Sc6Bcj
	 27Gvi5xX71cnQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 18:19:59 +0100
Subject: [PATCH] pinctrl: sunxi: Add some defensiveness for regulators
 array
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-pinctrl-sunxi-boudns-v1-1-85f37de79b9f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL7grmQC/x3MMQqAMAxA0atIZgOtUopeRRzURg1IlEZFkN7d4
 viG/19QikwKbfFCpJuVd8mwZQHTOshCyCEbKlPVxluLB8t0xg31kodx3K8gio0bZxeGOhjvIKd
 HpJmff9v1KX06IFsyZgAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3gPj2OLmTQiKQXAQaSmLuzHQbyixVTI9hSntm0pe89c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkruDOruL4nOFfNlPL6CqLv3/eOKtVcuXRUpj+b72M
 ISUrRpuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7gzgAKCRAk1otyXVSH0L4jB/
 wMyfEW/O45XvRvUxKZxYqTo73x4AuL9rRWlESg7ixOG3fYoEUmsKI5eW3zmfmxl0w/dxt1Tf7LjcRm
 MJBOrT9UKa4Eqcgqt8muv27avkgpnx7ZOTAJHGAu4XQ78cx7xafEYrESk3AL4rRj0D397nVhUXkclQ
 YLPyvKUxjAeOOcSjZV8721BIdc9YbQmqVqXE8odc/Qx6n5rS2ill0LfVibKAliubIarNjTN3fQIN16
 ZNedeTo17S2IMEBEz40VAnfmqVlQtLrcYrdJcHfk6Of1Sk+zvrpCXzFNGqVDz6/Rc1yKUSLwx8Gd8l
 COLL69wcEODbn5HsDoh72IpGkaq6y4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The sunxi pinctrl has a fixed size array it uses to store regulators used
in the driver. There is currently nothing that ensures that the number of
elements in the array is large enough to map the regulators defined by the
individual SoCs. While this is currently the case having an explicit check
in there will make life easier for anyone debugging memory issues that
manifest in the driver so let's add one.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 1dc1882cbdd7..1d1cd3d6d379 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -848,6 +848,9 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	char supply[16];
 	int ret;
 
+	if (WARN_ON_ONCE(bank_offset >= ARRAY_SIZE(pctl->regulators)))
+		return -EINVAL;
+
 	if (reg) {
 		refcount_inc(&s_reg->refcount);
 		return 0;

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-pinctrl-sunxi-boudns-95bf5da3d075

Best regards,
-- 
Mark Brown <broonie@kernel.org>

