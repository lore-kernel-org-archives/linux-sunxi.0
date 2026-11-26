Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718156;
	b=c7bm+uhUGCCsco/7wUN/XYZR30J7/2Q161h+h3naeF6NZgcnoN0GiLAAISUlNE2Bqckm
	 UmLLkE9ge3AE+PY1VFBiOWMdLc7R5mqTEXBChXuiqw0k2F78lJcMQJsFyIW08IYTDxOaf
	 ctViXBXTDyoPdBrAFbvkOLnD1IVP0gWMsNFQwwlcnJTcpyaBjL68y1YHpmWQZ3SQSOUeE
	 f5bcpyYpxrHqWGV6IjGn0+p6yHdF+0RBD2xZNXO7wTWYVPkPxF8bHZrmV4AYOgJb+6u/K
	 QcW+Qr8/sIq2ZfvSv9kaGE3DOThSyeW+SbrzfEVTS5yz3+NNA1vWRPQ7ay3pjmpM7nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718156;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pq5bAcrO++P5f64l99uGqZnQVC0rnd0ylJ73WUHXvSQ=;
	b=mYjazjKtBvutfCUzCMhlDA8wYpDXsREROppBqrXs9pvwfRb0oBFhDA7ezO1Nc/MII6CC
	 65WVHoe/lLVJD9fNe7fbU0zAeJf06EuVVeTSlRiaZXNBoy0ZkahbUD8C/x9qy1J+R5976
	 dDH1RsPYceu+j907VVZuY5jnMlwBODPW22jvkOPgPc4BWmjNTbFVbhU/6OSWEPByaKC8K
	 X6sr/t0e8bStnHnas0LjdaSyui+IRNQvF0rDERYsUbsGsJBOO+A8TqR/6KVPUPCGPc73W
	 ym1TFDMVRyhG4Il0pvPjtk3vWwKkEyN0Dnt0YVgTn7kFIGXHJq62HU+2Sn9viPSsBFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gwsn5qZi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496B1606A31C
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gwsn5qZi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7BB1F000CF;
	Thu, 26 Nov 2026 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718155;
	bh=Pq5bAcrO++P5f64l99uGqZnQVC0rnd0ylJ73WUHXvSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gwsn5qZi2KIuQskkZnED/hpla96isC2PaCTmuWrab+/gJUFYviwgTY6nID30I7Jh8
	 5MbQhqnfBlCDyw1pVqfWM1ER/yaOGwSR+bKxvFEEvDPC/QPSkUb0AvNCniMZ4bhH6S
	 1cKt1z2x5RPvdiimFCQok0Vj7DFZbZT/imR4nWswR+hgymmYJuH2Q0vAkwYaMHZWPB
	 ZXPj/j/0bwNrxhSJqpgtmXSJ54AZ9JXU/p1CG5LlcTkrAttPdODRVBum7d7nHPTKUX
	 vB9bFy/+AbLvjYJn8ZytZ/2eOZ8zjxd0k4jGc6jjOD1+f0PIIrnxhRtDIA14Uxnk1h
	 gpOkM4kPn24/w==
Message-ID: <sashiko-outbox-236027@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mmc: sunxi: Build IDMA descriptors from mapped
 SG list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261126182944.3136900-3-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
 <20261126182944.3136900-3-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:35:55 +0000
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mmc: sunxi: missing Fixes trailer for DMA mapping and descriptor
  fixes
--

commit b07dce4aab49723d2241431ba76eb43d418b71cd
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

> mmc: sunxi: Build IDMA descriptors from mapped SG list
>
> dma_map_sg() may merge scatterlist entries and returns the number of
> resulting DMA segments. The DMA API requires using only that many
> segments, with sg_dma_address() and sg_dma_len() (see
> Documentation/core-api/dma-api.rst).
>
> The driver instead builds one descriptor per original entry and uses
> its CPU side length. Build the descriptors from the mapped segments
> instead, and split segments longer than one descriptor can handle.
> This can't overflow the descriptor table, as each original entry fits
> into a single descriptor.
>
> Also check the alignment of the mapped segments, and unmap the
> scatterlist when it is misaligned instead of leaking the mapping.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

[Severity: Low]
Both the unmapped scatterlist usage in sunxi_mmc_init_idma_des() and the
DMA mapping leak on misaligned segments in sunxi_mmc_map_dma() date back
to the initial driver commit.  Should this include:

  Fixes: 3cbcb16095f9 ("mmc: sunxi: Add driver for SD/MMC hosts found on Al=
lwinner sunxi SoCs")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126182944.3136=
900-1-jernej.skrabec@gmail.com?part=3D2
