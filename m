Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794790714;
	b=mfA3Ff6RhJc/NbYK10H23LAt05CU9Ex1z9loEFrs2T/8pM/0TQW+A/3Dv7JgTuEodY9k
	 UTrLFhkBOlJqRNgfh/ogTqAYO2IswcX2ra1RdxaHLb7p61xZC3pAygQMN/+WlzAnb3BdS
	 24N4YnrEVEy2rnCsxcM4gC+W0oeup8vX/5Q+Fewb76VhqfuRMg7mJXJB7XN28QsUk4Tgg
	 OXjwIItl9J93zE4nMmdxpb4PMYQDmEkjIzQQx/kw9//klKnFddK+Yx1/LWjouJODbM4ZB
	 5yPIsfONrT6u4ekxgz87kgdCQIyxKcbdDL3mvmYW4TmDktkGH180e7PZwHVMr6mGJ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794790714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
	b=ldoyOOr6/rmVuhexSMrwmll2eMnmHDRdWE7LZDM9kRBY36ahoneeWOVBF66e5cXg9bSt
	 e5En1JpqxtR20FL9jvezRwPgGztKcQ79AQkBhUM/A1XfzPQlyMb700e+MVaDFP/fEAJpr
	 +s83MsjqiNbdzH+fq8vL8Log4icgJlF74nlb4D4CHhRtrMwHvER6uNQEex16qs7Lo4tDx
	 EbfWxZ46/c55O0wuPRgTbqO3qsXJwqHh1EDOPymVzdGoC5BddCrZHAaYCAJQZr1tedD46
	 bZhFN6admyh6E5FoGqm6wKVO0Q+apkddoYJ7Z+QtZxDCpO8m7uURX7Ra1fhuU5WDcYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9U2NDLt;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B7606A32F
	for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 00:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9U2NDLt
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-845788309b4so1863616a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 16:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794790713; x=1795395513; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=U9U2NDLtnhNmdtLJAvZi4OqBnpYWP1FaxTiKOvN+gwLGc1uCRJl47AZdNbhSh0bglo
         nuGIsX9XabecUlxjJj/RxxFx8RLbCSey5cZz6vrKnlmIKBaBFCseV64OZEZ9o1PU1D42
         X9acJVSfdrJCZXFSy+bh3HEH/rlwvck+0MdCF9Qm4DEwyd6CtSA87kxRM/UU1g7q6s0n
         Q+mUSmdgSjk/N+RBVe8timR8sjF2CqtjlCiYsLlbIxrw6io1tWsFZCmwJDuIx/icmBUB
         Z/GU7V28yhZAaYXjuYXihm6JQ+50PUaNDo7dNkQGXKwP0dgMQOpdLJ03+BV4k0fgFBVc
         dvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794790713; x=1795395513;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lmDeE0t9mdZmydmmEQ++6Bol6tB283nojcABTDXVogk=;
        b=LePS/MXX+/V/QswgpJPyXcSBRxktxtLnlDMA+G+OM9e1UsCibxL1mb1QHIqfDGuRq4
         auG3ewYT/5DP6kG2fcC/5k1pqTNp8XwjWoGz+DUwAHYvuJ8liKTGRqnsMtnQaqgyTayj
         45nfkXIHINUewa0iCZp1igYgxAi29NZsc6Ym0i18qRJilmXZ1xKn0L6sWRIrI/i+F9LK
         mQdQfa9X596jtefGDPTjMhYgD2Au6xR816zoMnZCFYJ1SPckPg3xwL1SIM5zfalS/CZ3
         FhEuN1geElvxfnDjGBrG+BD/Z5y9F20+yomPRm/RqNt2pDCzsTdJNMM3LjoLV+pzG7dc
         lCnA==
X-Forwarded-Encrypted: i=1; AL+hErEpN2fuu93OOFsbJkKz/V7lFUwq8K561QPxx3ycDU+jqLIlUMHHoa4zRMfUNqm9TT3cY2TyznxDF4y3rg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/E0GFAJQqd8tvyCCteaR9CDUDbFdVM5AUWoAs+cUfVHX23wrUn
	b+4ZA1qD2qbQimKnEd6tVRAezZuZrzl7nLg4xMQSlGoBWjRBjBmj4/v/msL/5w==
X-Gm-Gg: AYBFou0eTjIVeyIW2Mdzot2QWomoelt5XfVqSXVwmGL+tVC3aGuR7ihuY17cNdmIzBE
	6pEuzb2D8W/qDo7BgBE4/3f6UDZ+LlQ0cFH2BOF39G+ySv14UCDhEid01xrAGp3tpsLvxzJKw+N
	J5KkzWGIcpgIvaGMNAM+mlULtYcvQZVnFv6ieA06pYZwohUDuznMyljFyJx2Sxx3F6OMeFbaRAV
	UACJbsfRPX/qBWtw2db1qJIQSiiqzZ/nc+hRJLiI3kPpDDC2zZ3sHPlajqhF+CehJ4KSwrO6mHc
	WFUSLu6wlRXqauSUgxglM9XOGjR+9zV/p9hnojSyoy8/Es1N26xY4+Adj0hRW+nYH/Bbhlrg1Bl
	2uuhSP84HvgpajyVc+zb+FStyhcpJedr/ZqiwXhTRchzASDFRgGHJeaE2HOT9gnMOjUuHJ6Xz62
	uesH21uxUC7x/IOxsVXNuH4PnHxdJFx/hD7kJ5TZkbNsI0OZBM9jizMLKnzDRn3uNgst5j3GCTy
	U/zizHJVTTs2CxTXmo8KskIm1wpkahQi3neP26sP2DPUieDRuviT+8Y90ZDE8CcjuoUJuRUZ7lS
	70VoxlODYkpJm0jfS1Upa8B5F5ViO/quubcX5tW6Nv/5pyP4uO1WtWC5XlAiFnhhcPB9HYBVdWG
	0xveMl+TarTKYBQa4owBf/tDo2ONoDKzYjXd/GWr7B3hEjkNFHzwP36ly54GsLAwH+QPtUtUbiu
	N/AxeAh3etVuT9A/N2pjrCQLO0fURtfafTiL59Ku8J7kIKLFhbNzc=
X-Received: by 2002:a05:6830:43ac:b0:862:af88:e9bc with SMTP id 46e09a7af769-862af891402mr4387234a34.7.1794790712901;
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e0fcsm9545673a34.2.2026.11.15.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:58:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 17:58:26 -0700
Subject: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrCMBBFr1Jm7UCmkla8irhIx6kdJVEyaSmU3
 t2oq8/7i/c2MMkqBudmgyyLmr5SBTo0wFNId0G9VYbWtR0RebR5iFrqpJOixMCYV+RJ+GlzxIW
 QR9/50B/Z9Q6q5p1l1PWXuECSAtf/WUUP4fKVw75/ALUwtB6JAAAA
X-Change-ID: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

stmmac_set_features() clears hw->rx_csum when RX checksum offload is
disabled, but sun8i_dwmac_rx_ipc_enable() unconditionally enables the
hardware checksum engine. The MAC therefore keeps dropping packets with
invalid IP or transport checksums before they reach the host, even after
ethtool reports RX checksumming as disabled.

Set or clear EMAC_RX_DO_CRC according to hw->rx_csum so that disabling
offload leaves checksum validation to the network stack. Preserve the
callback's existing success return value.

Fixes: 9f93ac8d4085 ("net-next: stmmac: Add dwmac-sun8i")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 2ece7ba9dd73..98cc7503bdde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -705,7 +705,10 @@ static int sun8i_dwmac_rx_ipc_enable(struct mac_device_info *hw)
 	u32 v;
 
 	v = readl(ioaddr + EMAC_RX_CTL0);
-	v |= EMAC_RX_DO_CRC;
+	if (hw->rx_csum)
+		v |= EMAC_RX_DO_CRC;
+	else
+		v &= ~EMAC_RX_DO_CRC;
 	writel(v, ioaddr + EMAC_RX_CTL0);
 
 	return 1;

---
base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
change-id: 20261115-submit-sun8i-emac-rx-checksum-v1-cf565a73c070

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

