Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189066;
	b=3rgVPIxdcxAe59PqL4c1Q2n3NwKKxUUi3UzlWoMdH2POapK2DAi3d9MpKKIXofnsh3D3
	 zpEMsxp580Bhl06DQRRGN92DkjZjSJsbXMSsFXg07UQquuytC1vIeYNMk+0wELskqz9jF
	 bUqGZRz6Sz+3TcbEC6/S3H2IwgaPAycYBJK/Qmy8M7gelLByUT49bOUnRu3FwTVOrUfup
	 YLyCZd10leX0E4KJAzEsCSEh+SHo0SQaWE26giVx1GSJQLTLwnrz85vcq2Bi8217qQt6m
	 DYuj7DuBDa+OhB+jr02ODuQPrK3zgEY0BdicesC2c361h2Xfg41RBHCWuJWh5TGQvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189066;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	b=BXXn/b8k6113X0SUr2L/05kbsf7adS86avvhlIgh7tt+HS30+Kb3rhMfKnS6zfaPqBsk
	 DUl+Cj7ORgSisi19FNUJ7nTzsFyvac99f76D52R2c90fojadRFOVJEhtLSUMeNSFjJEvE
	 fqVv94JVNzvk6FAwG10RhD0Gi98YoICa+sKyVGGV7Txhw1TjxqeujeF//zfX65lfMjcw+
	 3pByEIQcYFN6raAdn6wN55pSXiSN0aFuctkJI60PpzlvdlK/20yezFEMiBRVzl+fC54A8
	 p7JxW52K5/nIt9k3diIHt8I7w6TGn0EY/A4qxlySH81iAyChZshs53iprKlJ7V4I+zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIpirNXJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FBF606A320;
	Fri, 20 Nov 2026 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iIpirNXJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E3D1F000C6;
	Fri, 20 Nov 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189065;
	bh=sS9FIrfW22SIhehTvpH3rdvmtslwIeEYozBr0OvaZe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iIpirNXJtQZkiCo/Wk/r2y9TuMHQo0NFCaoXmz8Y9G/yH6AqDiSX9pNOUjBCyE6LI
	 S1owu12Dg8N+DN49V3MjAYeqwWIAiiwgGzFbvEgDY4OkAplya2KOlVAUFOTUsVI7Xp
	 LpCoTr6aRLEcPoXSVWh4b/FePwFzL47SIDAgrUu9dUovpl8BgIjONL2BCg5DnKQ30N
	 8vIe608azmw74AxVUiwtuMnBa23rauZrkzEN0MBuO7unMJ0VdZoNHzmMO5QM5d5mgp
	 8hEb5V/9jVsqaxq6KuwbtT1/MjhZtKy+SV+Qmj1xvnBHC1h/iT9e2ZBPihRkdEh5Il
	 heypCanFDQ98w==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 LABBE Corentin <clabbe.montjoie@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
Date: Fri, 20 Nov 2026 15:37:43 +0000
Message-ID: <179518906382.3291.11090310469167736540@kernel.org>
In-Reply-To:
 <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
