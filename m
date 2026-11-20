Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188742;
	b=NTscRK1A+WWxHUH0ba+XodnDEV4+nUXMNq5kZYyooRm888dUhSGd/dZjZspviZ4t8LWK
	 CtreFY7kJeA9wBlw/Z/2NpiJrDih70Vp5fTK4/jagNMiI9L/sm9Ge3K39fSDULfAXJUle
	 ByeX6k41r/tFRT9r/fQUkLylivljK3T9ynJseWfO58DBxtD6EYCzKfiKjtInb5bio7eCL
	 UCiu53wKJvRXMS0JrJnsqO07yq03qKYIouDPky1xqkPTuX89DAFXv/suxg5m0eWyHAUJv
	 sZ1WhPLaJKL/1rWCMaxggJ95CnHEtOgTQ7hhJdZqDNoTTGWrbLftWiBkuU4IzPKqZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
	b=NaTNM09RF0Z+Cq8A5ee7KHWLxsJRdudwhFrL+fPePSa7m47Cz1hVSJVpo7sahOcpjdIG
	 eh0t5SL4hf4Ux627D2YWBy1NT5z9lHkP/OngFOuLUL+vm3jgdpYI5kzO2vLFPr9OyEXjn
	 OUWUdWUOsxY6Fdb5lDSRRzwmcVoTAL6/eLM6LCoSxULDi77AacJYrzQhz3dsHfrTZWR1J
	 lUlTYXyuc9Tg1FdapK6dsKUdX5H6khYiiIg1d6Nwy9HIlm1/gHDxy+prFTg7q8TghbNuI
	 D7tK0xS/nHVbc7ZDTJfcGUVvUGGHHv/qTNnm5/anrQHUis9NoJaMG7F/AGNTNjrCedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcPVhEiP;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DBF606A32C
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 15:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DBF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TcPVhEiP
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702dedeb70dso672526eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 07:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188741; x=1795793541; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=TcPVhEiPgCZkTffIO5rgNHLohO5zfOpVCuPxi11xrKmy4LRDjfMxVU7ApaxpTaWgzs
         OUng8hdsBPWD5GK7+KtUBk4FfAxc7Rnl4sgf7fK6lx3rRRBid6cmJzhDL81EtYmXmwQh
         i1BhAPugcuNp1KFip/D2EuA0ZpIjYBdBXja2KFykK1p0CIO7DtcuNBptM/0s02BftbQo
         JFiT8hnK+no1hpz8pKAfCBfITbwwCsg2S8PfDmp1V1aPrgNJ9hlLgOVNfRPlkniX+XC7
         wDjGwReslQzZNC5gQ9hshqpk8UwjnBZNJOe/nGbz62syp/D+O44jY6ZHAkLEbYiBSGsv
         QN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188741; x=1795793541;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H1UxkeLQlmXTSBoY4Hag54M+vDnMqFCGtxj59kTEfoQ=;
        b=WFS0VzmEawtD7qJm+PwmaH1Ggsj3MOw9ugINfyTRBTFzcrCzNICXLJB9a8GFpXvmab
         31p+6pOAVOSTZy5rOX9J7f9LBEzYrmNYZzQMacvWY5v2zKmGBt3VqRduXdhVXZcuqvee
         b5E7ttqDrJGsNDDhRD/HWsxfqrr/7h1nT0wHoE0yQIuKdG1XWv586Iu5lDZ5IUQWvrYT
         0kQU3iQCU8NtftLJK+hEZg9n/BXXLCkw2fVi2gQhYy6mHmiRiceMcvV/rTU1I+zL/S2i
         6rO/7KbAPIQCGAcNRAjf7FTdx7Q4Q61kraZ0KSSrYqZHBeOvDTnuoq4JWLkVNDtYoZyO
         D+Sw==
X-Forwarded-Encrypted: i=1; AL+hErFpcwcKX3T2RK+A4Mj9Q2GCTxCB1CHWwd/aZAsPP2M70G/7EbI77VPLOiaVX0Dj0duSz5AF5u2SV+f3rw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9xXDrAzSEPJp58cr3Peu6Q+uPAL2OGu1Ag5YJJsS1tizuKhiPX
	hwXjomoJzcwES4OQujMDIeGZ6t5nV2+KfuPDPEXTRkSgpcv4AswqduiP
X-Gm-Gg: AYBFou0ZC5AYsul2/JN2sCft7O36SI3oS7bZWSqvt1/hxZ0q2mfCEw+SLp5c/Y+z6ZY
	FdUyYOYGBjV5nJU8XD3Y/6d8HMmFouqPb6dEfkVF3xOcWBt0uhohfdna1QFKVOZWeGB+zb2TZce
	sZllWV4PDKfT/t5K7OzLnPR/KLoHWqYaicjmQJBI3+nno/0tXtXdd9Hl7H1ir57SOUAfSRcRdcn
	yQuPAZKcRxQUW7h8W7CW4sZL0vkOxlcxZnzk6mg+TYcanITH8WtYWC1Gy9ns+StpIrDxnvIMUnV
	VDsgdp4BqaYiitpWJj02Jz1ZmVoY+aDPPRHdew0tRotFFEDCMe19ZgqAahGKA6Z/W2svyxqANjM
	S3dRulBNxI/l+a+euTujg5Zxbsf875bJK1I1Fgzu/0omO1T7CW+gKiFBghasd3V71i/wjXGYLpL
	6fGPyjXRJBiqczq+YnxEK4MZ267kImkXpNjnwbgnl9H5EIipeYQ8BH4g6VTJ38ZSl4xztV4l00E
	K8rEonuYnnoojLzXUC8tRmDmaBIxSUgAFoDEHEZpPEYmw6TijbzQg4lf8mLXKV1Fxfzqi44/3ro
	b7RyIUPTxlSr6Nw7dV1kRqDxi5FlRU6eqXs3bZ2U1ZU1+g59NAikz8olIBdyn4VXQdBLk7y3+nP
	5VxDQfsA1uM9XGkpjXfjXTouE/JwMXXVhpDz4yw/Xu8NsO+00OQrMyp5c6AkDe/xsO4922emQbi
	nrpVAh6vUcF4yNV6maISg8/nwrZPf+OH883g5KePsAFu4fHssDz1o=
X-Received: by 2002:a05:6820:709c:10b0:71a:fcbf:248f with SMTP id 006d021491bc7-71b39528b98mr2217708eaf.65.1795188741038;
        Fri, 20 Nov 2026 07:32:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380bdff9sm2159605eaf.11.2026.11.20.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:32:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
Date: Fri, 20 Nov 2026 08:32:04 -0700
Message-Id: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCMBCE4auUfXbBjdQmXkV8qO1UVzBKNi2B0
 rsb9Wn4GfhWMiSF0alZKWFR01esIbuGhnsfb2Ada5Pbu6OIBLb5+tRcJ3rlVHhCn+cE40U4SNf
 BH5xvg6cqvBMmLT/9TBGZI0qmy/+p0AND/uK0bR/+00/fiQAAAA==
X-Change-ID: 20261119-submit-sun8i-rx-features-v1-9177e8328598
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 LABBE Corentin <clabbe.montjoie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

The sun8i MAC has one DMA forwarding control for both IP checksum
failures and Ethernet errors. With forwarding disabled, packet sockets
cannot see bad transport checksums, and the stack cannot apply its own
checksum policy. Toggling the hardware checker instead leaves no way
to tell whether a queued IP frame was actually checked.

Jakub asked how the proposed bit-27 change [0] fits into the complete
fix [1]. This series replaces that change: the checker stays on whenever
the receiver is running. Both ethtool modes deliver checksum failures for
software validation; only with rx on can the driver mark a checked
packet as verified. Changing modes no longer needs a ring flush.

The first patch fixes ordinary reception while still dropping frames
with a bad FCS. The second adds rx-all support for capturing complete
frames with wire errors and runts that the MAC can forward.
On H616, a bad-FCS 64-byte frame reaches DMA, but a bad-FCS 63-byte
frame does not, even with both forwarding controls enabled.

[0] https://lore.kernel.org/r/20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      net: stmmac: dwmac-sun8i: deliver RX checksum errors to the stack
      net: stmmac: dwmac-sun8i: support ethtool rx-all

 drivers/net/ethernet/stmicro/stmmac/common.h      |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 167 ++++++++++++++++------
 drivers/net/ethernet/stmicro/stmmac/hwif.h        |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  59 +++++---
 4 files changed, 172 insertions(+), 61 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
change-id: 20261119-submit-sun8i-rx-features-v1-9177e8328598

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

