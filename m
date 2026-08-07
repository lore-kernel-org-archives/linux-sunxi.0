Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8294231328E
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111212; cv=none; b=Aayzyby6X8/x4RTnNUsDdBQjtwjdqtkSZCcAUxDZIKRWI8jyifVnJnlmkf7jHuIBlnlVGcENmv38QcxzkcSV35bWgZ8Aw5GKJuBPxGMjj/OpbxKwamP6g0I4QScGFCfiGWVFdcx4fxUON8gB5cXXO4NghM0aXLIpUlFMs2W8jF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111212; c=relaxed/simple;
	bh=7QtfUicSq0CJoH8LPBIKm+eEYQYxOwPdOAG9183BB8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hyo2QKu8RcNCZ1UHMIkXKSv6t0qQKhjaQdQGAOZKDw1ofl4FYgQmPeQ9uOnJSHvJ6uBLVsZaJSZfElGaV0p5fJeIkW6dmxT4whJHwUCBVaWOTLy12sVWEKjRoj/MXl6vpXL2yEtldgahbUciQEhsbHqJQPVNKq0OaZ1NJx8Ry0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=epXFGuAf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="epXFGuAf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B68CD1A14AF;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8416C603F0;
	Fri,  7 Aug 2026 14:00:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6099811C37961;
	Fri,  7 Aug 2026 16:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sB9VxuqALQwrBeXPwHmokBPdEY6c1fmoxnp6wovATlE=;
	b=epXFGuAfuU0GRB3UwM6B0HSdKC1jG/MpIUHuwmS511qPTiBwC5t+4XD/q6aDyEw9U/xxTw
	wJ4wN4QsECOaOC+u2ojQaQV8W2mPBpOwXVAwRKexYZKuOKxvwlcy5Y88vaI9vkzW8CH2J7
	RYcsnjbraQ2jQcaR9Xq8Fk7qblNEYxLBXdayPoasy3oupgYmqgUN1eK1yZtuc9hlvnPTlS
	4vdIQnNqTdYx3P1SljCfmgLrrY7OFL0tbf3cefSZNlOm/S9na4euFCs44oNCGB6GvPyeVK
	hr7SNHLFtzggk7tYOB1vbxM4jhaD/Zplhs3/00+xadU8Fw85WrZCkIiObqMcqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717164202.3099982-1-james.hilliard1@gmail.com>
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
Message-Id: <178611120394.758547.12981488112151990618.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 17 Jul 2026 10:41:58 -0600, James Hilliard wrote:
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
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: sunxi: add H616 MBUS DMA support
      commit: 5ee37db34637ca6e33ce01d7062cb31275484404

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

