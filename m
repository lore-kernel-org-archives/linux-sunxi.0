Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174857;
	b=QDWfQNDvg1OtXgwrGbYUyIh3B7fwRTDfE60N2d2xPrhk4XuBgR5oUMcEVg9TugCWO5Wf
	 2jB7DTKwwvV49s8j20QdwvmDTpdXWbeJV1AfQDjuyqXUdEQFJ0fUanE6A93s+GBMzCviG
	 Zcb8UFSvXL2U7yCKeE3Jui9fX6LtnUACg7WNU5eVw+G1zRuLpwsddexcAlQopHcJ4eHZP
	 CKGDe2PIXTxrV0KZjWnQBFvsUra6lRk+tcAfYblMERYMkz1IAxfS/ZHCVhJnGdmMDgf5U
	 /c0huAvcK4fGKPFqpuhUeR4OYzIrfXh/ms5aahyxfmreTBESb2gYUIlPwfGEZ9RCOGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174857;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=;
	b=G6UcppGODkIAUfC4Ornx9JQk1mzmGBGS/kp7/F/tCVETcz95OiIf2QtFs3cj5yybsACD
	 U4gdv0pfWuA9m9ln/4cTiSNckF6+hvbhkesePJRvFfGHs0QF4kXA3tqJGeRryJ8uS+1Ne
	 tzuMTZCzfYKhGEGXcsXcD8IK+mDkPppswQMAiPiwncEr7yFCvT5yjsUWzGLw1rUzeOmUe
	 UMcUNDEhuJCcyOdwXwokMIU2Zua+rDryAQBf5cIqRzwNT6v5Af1gnH+rtCrNsjq1344aA
	 jBXMVd0C2tUJtQGyj/9UmSmlhC/C1pzByKt5MxxEbAj12SBp6lNN3fgG9aMlJs9lCWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AkX/FZmu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0F606A32C;
	Fri, 20 Nov 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkX/FZmu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174857;
	b=cVlhjlDUiXPArxlJjJgD4tLxoBLxV/zdP4fERqf5iZ8VjWWdx+beT5VQwmWlwz79H/sA
	 ecpmEEzQxSmAy6+kNJlkmYG7NYjorqwSUpN4csOM1tJX5bPQX/gA/qNfRRDBfbzWKSPB+
	 erCJ+fqWoIRBycZcik+n0qEDVzyZpa30gxRrFcWLI/FKGCXIyOGpcOSdq+9MFyPKHO/+R
	 UqfyntVaPpQEHg77QUKUACDV+tqoRhc1G+Osuks0PGxQR3LthJQg8a5FGvDdnXpXkOuKg
	 RwOAQusDayJ9zCgmfWKa24a1tvx7HzK9uQvLMWcegqhMW5oVGBcikBPvirap3FytXGA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174857;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=;
	b=F27dWuSDPSJgf0FjnV+6qktOtXQDapzHy5k0ELjHSjpPhQYRwpbRZbREcfw6soPAAUn9
	 81NNtDQOavomPosafW756ZyC4C7ETyER9FoHwFCzAjTIAYKFf8b4F5q2w1410c3wWmsrA
	 0XbqNRf5ZpEH88iapjPVMUY7vJA8dda6ZRvg8c4KwR3ZSJb2ynaQ4Z5yGIiVydCAWxozY
	 kRRsHrfyqM+AdSD7w1R/JQmFzS4ljRPVvdaxoIt9MDCYc+ZfJaKuOBnbBZmW8Tifu69Am
	 WaUmFM/hTajqPTvqEmnJFYXBrx7bSseJgiyZ6dVUS+tSZa5w0B49us7TWqvb686C0bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E03A1F000E0;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174857;
	bh=XCgMVtCDlxDzreExdU7WeSN8TnmsA03m5m2Y8AQaSmg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AkX/FZmuj6MbRWrYIrRjTYR+6/rthTCfjVyylnpmZWOKpqnQ3p/ymM8ZlgZWTKjPu
	 /hAza9gcF4SiQ2CuD8I5jyD0tsqy+m7qne9kDY+7dVuxuviNMWUu3U+qUevwt+g+xQ
	 fvoY+/xvC8HmN31Mi2SsJkRpc7SinZEDxV1jLZf2FD+wpp1IdA0knG4G4JVxW5t42f
	 Ii+E2SfTaZXKMTSCZXXM7pcI/ZL2WhAEJM2VwrP1XfD+4DNIXkFyxUUJGFL9n2Xg2g
	 nSlfi+SwNqee6bw9trZEQ4ORJ4Y7eqoFUArgOqIvY31NpNl2tcTIIN/IoZhnGOukev
	 wLjDGmchO2z0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D8A1C49873;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:48 +0100
Subject: [PATCH 4/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 MMC aliases
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=1496;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=9aWwwAzsx9U2iQUbLdf6klaNBeIN6Kxth853YqVu9o0=;
 b=8oBh1A0f4Jl18/rO4qnX4tVCjQH3AZVUPMYNPiUjNYReBhlAIRtNGVpHJ47ipRRd4WcRtZa/D
 j/DnSy61jIoBYnN+mht9zy/OcJhtwYXLYuVLWog2LE+kyyHdAotZk8L
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
Reply-To: ipfarher@gmail.com
Content-Transfer-Encoding: 7bit

From: Ivan Pfarher <ipfarher@gmail.com>

sunxi-mmc probes asynchronously, so without aliases the microSD card,
the SDIO WiFi and the eMMC get their mmc numbers in probe order. A boot
script using root=/dev/mmcblk0p2 for the microSD card can then end up
on the eMMC instead.

Add aliases so that the microSD card is always mmc0 and the eMMC mmc1,
matching the numbering U-Boot uses on this board, with the SDIO WiFi
as mmc2.

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: the microSD card is mmcblk0 and the eMMC mmcblk1,
booting from either. Build-tested only against current mainline.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 892723b46..4a26863e8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -13,6 +13,9 @@
 	compatible = "xunlong,orangepi-zero-plus2", "allwinner,sun50i-h5";
 
 	aliases {
+		mmc0 = &mmc0;
+		mmc1 = &mmc2;
+		mmc2 = &mmc1;
 		serial0 = &uart0;
 	};
 

-- 
2.43.0


