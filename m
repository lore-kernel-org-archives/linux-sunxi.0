Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD881F2C4E
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Dec 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734527407; cv=none; b=AH7/lxZSUu19kYNtEBvzGUTdvAolqNUQkxoGX/tQLpYE96ATYoSqakzq/EFiht59gHu3hTu9R13fXEkq+tOjGKb+VSI4wxhRMXvNO1wgLL0UWqOw9f429sdLilp/fmSzVwT/vmDtsF/brJIRpuprmBkZPwMjlHoHBUrp93T2zYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734527407; c=relaxed/simple;
	bh=Dq2nimBQQbcd6OFaZe7M6MOLGruvNOdRO+cLFAPPBVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o+tOuhn6YOMUzUO6QUSoaz+i/wLt9bLlHOQEoW+sBBC+elSOMJOvFakeVJhk4TedKRv3BdKe/58QSoQd3xuu/c3iJd4tQPrH0HUo4xZzdpSp3gGZCD9Es+9EB+GlUsirfw8FJUzP3yHAa3dhoUpTN5+bIrHsjh5QxQ0Na4E+vnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=UvH2ytPN; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="UvH2ytPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=Dq2nimBQQbcd6OFaZe7M6MOLGruvNOdRO+cLFAPPBVQ=;
	h=From:Subject:Date:To:Cc:From;
	b=UvH2ytPN0rorxwdHbREfFhMaAr0RhtHGWVcSkObMWxTFjCTn+37KJMcXBiGo4Ws43
	 yDUnexAOcAaw5dOqU5Oj/N3OlQLesh1a1mquvWHaPvFk5Yqzm99R3pMBvhuj0b+AiP
	 e+T4tvgV/GvzIwBNIJmh5TSqzHBPIn/GLUkU70ugEa3M4XGM2JKRxgZ1f7P3wl3+gm
	 h+Yag7hVamWtG2h63l8wuGwgGg0CjQ+9JG8xD8lPP/83msd7Ynib8QMOht2S+1z0g3
	 iS2ALv00TKj0l877H1HeCF/AbxdySwrBzSeBAyCAPzji9TF3JPMnfZtxO52Rm5yQnb
	 QSUOluozy6GvA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Subject: [PATCH v2 0/2] sunxi: Add A100 syscon nodes
Date: Wed, 18 Dec 2024 09:01:17 -0400
Message-Id: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3HYmcC/1WNwQrCMBBEf6Xs2UiyxlQ8+R/SQ0y3NiBJzdZgK
 fl3Yz15GXgD82YFpuSJ4dyskCh79jFUwF0DbrThTsL3lQElaqXQCKukFLywi0G0B2VuZA2SRqi
 LKdHg35vt2lUePc8xLZs8q2/789T482QlpDgZZ46oB9R9e6Ep1vvH/vkinqErpXwA+ST5BqoAA
 AA=
X-Change-ID: 20241126-a100-syscon-7316bea62e42
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Hello! Here is a V2 of
https://msgid.link/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest.
Only changes here are fixing missing newlines between child nodes and
rebasing on 6.13-rc3.

***

Here are some very small patches to add syscon nodes to the A100's
device tree. These had not been added yet, as they hadn't been needed up
to this point. However, Parthiban and I have been working on patch
series in parallel that require either the syscon or the SRAM nodes it
is responsible for; specifically my patches add support for the A100's
ethernet controller, while Parthiban has been working hard on bringing
up the Display Engine.

Thanks as always!
- Cody

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in v2:
- Add missing empty newlines between syscon child nodes
- Rebase on v6.13-rc3
- Link to v1: https://lore.kernel.org/r/20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest

---
Cody Eksal (2):
      dt-bindings: sram: sunxi-sram: Add A100 compatible
      arm64: dts: allwinner: a100: Add syscon nodes

 .../sram/allwinner,sun4i-a10-system-control.yaml   |  4 ++-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 33 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241126-a100-syscon-7316bea62e42

Best regards,
-- 
Cody Eksal <masterr3c0rd@epochal.quest>

