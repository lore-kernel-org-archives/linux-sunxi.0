Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC9344DAC;
	Wed, 22 Jul 2026 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741343; cv=none; b=YRPK8lKy8xzhK45cpsmPK2joKH3ehmszjaS/GPpoz3dpEMlcR8ih+3CX8Ou3yO6dmPxcLcsPw53WXvQ0tPK6uXgzN6gH2m0BBiNncGfZzZVzjJajAEbf+0SWXy7PQ6R9wAIRkCbIdAV5Hk9Rh5dyRp3M4+lMNDFUKC20e3SFcyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741343; c=relaxed/simple;
	bh=Rc7LMYJkes0O3HfSE+/1/YaTLUVzBZj6BmiSass1xM0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I/0VZaKDsJ6dIotqUUJTrDjdY8x6zvepgjOwH08JZsh0GwOidVWN5v3eppfJVwei5wSb3KoLRN3LHw061Hxi2+O8fhHlcURXLGVpDyMhbuKglIe8aahmOU5iV2InRl5m0G5FFPGB9w+r1/D3NtNwRX7FVlKcOhEDDtUuu2LxnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HenOrNzB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HenOrNzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E101F000E9;
	Wed, 22 Jul 2026 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741342;
	bh=R644bVMJpbI5wr8azKmQH+phgfEYQY/Mpi+UsoV/eo0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HenOrNzBlkGjNT2ZGgzTj9JkaN/Pg+ClQJYBrhh5tFYzSTNHJhzz9i2tElewFjnaM
	 VWIrU+KEoZDUzP93ZSRJwpFW9cXSX5UZCxPe1Z7uOjyLrDVrmeQNK3U7TMYxjM2r+g
	 TLRQBNeimdXHkmHgb5jS3RbnxaSYKV+xJ+/zuWM5nQh4tw3TxwDEc4hcGHiO52FM4r
	 vQ9x6eFir53ZzIfMOFPxYaiGCqx8MjGoYz65Baq/+URqcl2SWjc9NQ48EO01rV7mHg
	 liJw8iXTDYpIo3dpd1D65QjTDLmHYk0eoGbg/tigQCPj013DeYWDimv6AnVLUW0iKi
	 ba0ev+D7hXj+w==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260720215128.5761-1-andre.przywara@arm.com>
References: <20260720215128.5761-1-andre.przywara@arm.com>
Subject: Re: [PATCH] ARM: dts: allwinner: a10: Fix PMU interrupt
Message-Id: <178474134045.3407214.16203991079219097416.b4-ty@kernel.org>
Date: Thu, 23 Jul 2026 01:29:00 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 20 Jul 2026 23:51:28 +0200, Andre Przywara wrote:
> The Performance Monitoring Unit of the Cortex-A8 cores in the Allwinner
> A10 SoC is connected to interrupt line 66, not 3. This is shown in the
> manual (where interrupt 3 is assigned to UART2, also in our .dtsi), but
> has also been confirmed by triggering an PMU overflow interrupt and
> inspecting the IRQ controller status registers (from U-Boot).
> Please note that "perf stat" does not use interrupts, this might explain
> why this evaded the initial testing.
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/1] ARM: dts: allwinner: a10: Fix PMU interrupt
      https://git.kernel.org/sunxi/linux/c/eb7051f75646

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

