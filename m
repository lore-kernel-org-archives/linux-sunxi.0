Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C871C84D0
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110951; cv=none; b=Ic6EOv0d7mKqv1WgwIh4TkBaqHC1baDDCjzcKqlE1A5oOjCC/CTmVOLbjUbvfE/5sA+zzMqLqfksbo7SntM+bzfsHwwnFUQExrKbzIuAGtWO8gHyG5EyVCHa0i41b4eEuT00toFqYAhEve+KhyRlfVvp0bH3aaT2f2wQ5FaN5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110951; c=relaxed/simple;
	bh=lKWRllofbX4RsVmArqp04XosqhHwxg3ePgxPypGQGJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=niuXLIAZlNPEWYcZ/0V08hW1cUFGpMa4QPW5APqFMu8Ocx69QbcFAio36HDk7eBiRVcAXidTIkE5snVYlYvdi+6kj+2wroXa9eYD02XUbm6G5hf85ILQ7vVqZKW1Mw2ZNTdY873isI3Ccf6PawG/40yL888S/obQCSinYBvEkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nlNd8SWw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nlNd8SWw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5468A1A14AF;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CDA8603F0;
	Fri,  7 Aug 2026 13:55:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B3411C37940;
	Fri,  7 Aug 2026 15:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786110944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z9zSxLfnk7YiVlIisYk8KT7P1MGEF3qpYsTg5YEnEk=;
	b=nlNd8SWwUAven5A2D+JdB964IEJxFekkIs00rvccp2m4ShINygrjg5jELkdc9PIe+RCin3
	+rLDGFD1GhyNRoREH/YpRbKPzDkwNoYQKUn86dwDU0L3k8TFZMY6rrcZIsSA328SOvOzOe
	9J7aE94wqutVPNpitsyqWtjmu/DaAe0U36u6qv1j3MdhgWRL9BOZGxkPZavVh0Pfak1IGT
	XQeSmRH4n+FjCIArWgHTQuM33N/0xevGlSPQxcaU6CgW78Mx8kW7CTYk091Lza3t+Vdq5S
	PLCGfpWbd+HBe05P6dqKYs95LC9YV+FD9J7wLObmBaZtgi0uaby42e+XoSWAuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com> (James
	Hilliard's message of "Fri, 17 Jul 2026 10:41:58 -0600")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:55:41 +0200
Message-ID: <87tsp6avc2.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi James,

On 17/07/2026 at 10:41:58 -06, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> The H616 NAND controller uses a descriptor-based internal MBUS DMA
> engine instead of the direct address and count registers used by the
> A23/A33 controller. Since the driver does not support these descriptors,
> it currently attempts to request an external rxtx DMA channel and falls
> back to PIO when none is provided.
>
> Add a single-descriptor backend to the existing ECC page DMA paths.
> Allocate the descriptor coherently, constrain data mappings to the
> controller's 32-bit address range, program the H6-style data block mask,
> and request an interrupt for both command and DMA completion. Keep the
> existing external DMA and legacy MBUS DMA paths unchanged, and fall back
> to PIO if the descriptor cannot be allocated.
>
> With identical kernels except for this patch, running
> flash_speed -d -b 1906 -c 100 /dev/mtd6 on an H616 board with 2 KiB-page
> SLC NAND reported:
>
>                          PIO          descriptor DMA
> eraseblock write        3365 KiB/s       4192 KiB/s
> eraseblock read         6454 KiB/s      16040 KiB/s
> page write              3254 KiB/s       4021 KiB/s
> page read               6419 KiB/s      15686 KiB/s
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

This patch does not apply (linux-mtd repository, nand/next branch). You
need to rebase and send a new iteration.

Thansk,
Miqu=C3=A8l
